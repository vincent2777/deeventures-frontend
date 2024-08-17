import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../general/controllers/general_state_controller.dart';
import '../../../general/widgets/app_toast_widget.dart';
import '../../../routes/api_routes/api_route_names.dart';
import '../apis/transaction_api.dart';
import '../models/transaction_model.dart';
import '../models/transaction_type_model.dart';
import '../widgets/image_preview_bottom_sheet_widget.dart';

class TransactionsStateController extends GetxController with GetSingleTickerProviderStateMixin {

  String _transactionType = "";
  String _transactionStatus = "";
  final int _pageSize = 20;
  List<File?> _pickedFiles = [];
  final ImagePicker _imagePicker = ImagePicker();
  bool _isLoading = false;
  Transaction _transaction = Transaction();
  List<Transaction> _transactions = [];
  final List<TransactionType> _transactionTypes = [
    TransactionType(label: "All", value: ""),
    TransactionType(label: "Coin Sell", value: "coin_sell"),
    TransactionType(label: "Gift Card Sell", value: "gift_card_sell"),
    TransactionType(label: "Bill Payment", value: "bill_payment"),
    TransactionType(label: "Fund Withdrawal", value: "fund_withdrawal"),
    TransactionType(label: "Wallet Funding", value: "wallet_funding"),
  ];
  late final TabController _tabController;
  final FlutterSecureStorage _flutterSecureStorage = const FlutterSecureStorage();
  final PagingController<int, Transaction> _pagingController = PagingController(firstPageKey: 0);
  final GeneralStateController _generalStateController = Get.find<GeneralStateController>();
  final AppToastWidget _appToastWidget = AppToastWidget();


  /*
  * GETTERS
  * */
  List<File?> get pickedFiles => _pickedFiles;
  bool get isLoading => _isLoading;
  Transaction get transaction => _transaction;
  List<Transaction> get transactions => _transactions;
  TabController get tabController => _tabController;
  List<TransactionType> get transactionTypes => _transactionTypes;
  PagingController<int, Transaction> get pagingController => _pagingController;
  GeneralStateController get generalStateController => _generalStateController;


  /*
  * SETTERS
  * */
  void setPickedFiles(List<File> value) {
    _pickedFiles = value;
    update();
  }
  void setIsLoading(bool value) {
    _isLoading = value;
    update();
  }
  void setTransactionType(value) {
    _transactionType = value;
    update();
    _pagingController.refresh();
  }
  void setTransactionStatus(String value) {
    _transactionStatus = value;
    update();
    _pagingController.refresh(); // This will trigger a new request starting from page 1

    // getTransactions(0);
  }
  void setTransaction(Transaction value) {
    _transaction = value;
    update();
  }
  void setTransactions(List<Transaction> value) {
    _transactions = value;
    update();
  }
  void clearTransactions() {
    _transactions = [];
    update();
  }


  @override
  void onInit() {
    _pagingController.addPageRequestListener((pageKey) {
      getTransactions(pageKey);
    });

    _tabController = TabController(vsync: this, length: 4);
    _tabController.addListener(() {
      String newStatus = "";
      switch (_tabController.index) {
        case 0: newStatus = ""; break;
        case 1: newStatus = "1"; break;
        case 2: newStatus = "0"; break;
        case 3: newStatus = "2"; break;
      }
      if (newStatus != _transactionStatus) {
        _transactionStatus = newStatus;
        _pagingController.refresh();
      }
    });

    super.onInit();
  }
  Future<void> getTransactions(int pageKey) async {
    // Convert pageKey to start from 1 if it's 0
    int page = (pageKey == 0) ? 1 : pageKey;

    String? token = await _flutterSecureStorage.read(key: "token");
    String decodedToken = jsonDecode(token!);
    String transactionPaginatedRoute = "$getTransactionsRoute?type=$_transactionType&status=$_transactionStatus&limit=$_pageSize&page=$page";

    var response = await TransactionAPI.getTransactionsService(transactionPaginatedRoute, decodedToken);
    bool isSuccess = response!.data["success"];

    if (isSuccess) {
      List<dynamic> transactionData = response.data["data"]["transactions"] ?? [];
      List<Transaction> newTransactions = transactionData.map((eachTransaction) => Transaction.fromJson(eachTransaction)).toList();

      // Check if it's the first page
      if (page == 1) {
        _transactions.clear();
        _pagingController.itemList?.clear();
      }

      _transactions.addAll(newTransactions);
      setTransactions(_transactions);

      final bool isLastPage = newTransactions.length < _pageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(newTransactions);
      } else {
        final nextPageKey = page + 1;
        _pagingController.appendPage(newTransactions, nextPageKey);
      }
    } else {
      String errorMessage = response.data["message"];
      debugPrint("Oooops!!! $errorMessage");
      _pagingController.error = errorMessage;
    }
  }

  //  Pick an Image.
  Future<void> takeImage(ImageSource imageSource) async {
    try {
      final List<XFile?> pickedImages = await _imagePicker.pickMultiImage(
        imageQuality: 80,
      );
      if (pickedImages.isNotEmpty) {
        // Note: The "pickedImage" is type "XFile" and need to be made type "File" as did below.
        List<File> files = pickedImages.map((pickedImage) => File(pickedImage!.path)).toList();
        // debugPrint("FILE PATH::: $filePath");
        ImagePreviewBottomSheetWidget.imagePreviewBottomSheetWidget();
        return setPickedFiles(files);
      }
      return _appToastWidget.notification("Oooops!", "No image selected.", "Error");
    } on PlatformException catch (e) {
      throw Exception(e);
    }
  }

  // Upload Transaction Proof
  Future<void> uploadTransactionProof() async {
    if(pickedFiles.isNotEmpty) {
      setIsLoading(true);

      String? token = await _flutterSecureStorage.read(key: "token") ?? "";
      String decodedToken = jsonDecode(token);

      String trnxReference = _transaction.trnxReference!;

      var response = await TransactionAPI.uploadTransactionProofService(uploadTransactionProofRoute, trnxReference, pickedFiles ,decodedToken);
      bool isSuccess = response!.data["success"];
      // debugPrint("PROGRESS:::: $response");

      if (isSuccess) {
        setIsLoading(false);

        String successMessage = response.data["message"];
        Get.back();
        getTransactions(0);
        _appToastWidget.notification("Congratulation!", successMessage, "Success");
      } else {
        setIsLoading(false);
        String errorMessage = response.data["message"];
        _appToastWidget.notification("Oooops!!!", errorMessage, "Error");
      }
    } else{
      _appToastWidget.notification("Oooops!", "Select at least one card image", "Error");
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    _pagingController.dispose();
    super.dispose();
  }
}