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
  File? _pickedFile;
  final ImagePicker _imagePicker = ImagePicker();
  bool _isLoading = false;
  Transaction _transaction = Transaction();
  List<Transaction> _transactions = [];
  final List<TransactionType> _transactionTypes = [
    TransactionType(label: "All", value: ""),
    TransactionType(label: "Coin Sell", value: "coin_sell"),
    TransactionType(label: "Gift Card Sell", value: "gift_card_sell"),
    TransactionType(label: "Bill Payment", value: "bill_payment"),
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
  File? get pickedFile => _pickedFile;
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
  void setPickedFile(File value) {
    _pickedFile = value;
    update();
  }
  void setIsLoading(bool value) {
    _isLoading = value;
    update();
  }
  void setTransactionType(value) {
    _transactionType = value;
    update();
    getTransactions(0);
  }
  void setTransactionStatus(String value) {
    _transactionStatus = value;
    update();
    getTransactions(0);
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
  void onInit() async {
    _pagingController.addPageRequestListener((pageKey) {
      getTransactions(pageKey);
    });

    _tabController = TabController(vsync: this, length: 4);
    _tabController.addListener(() {
      (_tabController.index == 0) ? (
          setTransactionStatus("")
      ) : (_tabController.index == 1) ? (
          setTransactionStatus("1")
      ) : (_tabController.index == 2) ? (
          setTransactionStatus("0")
      ) : (
          setTransactionStatus("2")
      );
    });

    super.onInit();
  }

  Future<void> getTransactions(int pageKey) async {
    // First clear the Transaction list before re-fetching.
    pagingController.itemList = [];

    String? token = await _flutterSecureStorage.read(key: "token");
    String decodedToken = jsonDecode(token!);
    pageKey = (pageKey > 0) ? pageKey : 1;
    String transactionPaginatedRoute = "$getTransactionsRoute?type=$_transactionType&status=$_transactionStatus&limit=$_pageSize&page=$pageKey";

    var response = await TransactionAPI.getTransactionsService(transactionPaginatedRoute, decodedToken);
    bool isSuccess = response!.data["success"];

    if (isSuccess) {
      List<dynamic> transactionData = response.data["data"]["transactions"] ?? [];
      List<Transaction> transactions = transactionData.map((eachTransaction) => Transaction.fromJson(eachTransaction)).toList();
      setTransactions(transactions);

      // Check for last page.
      final bool isLastPage = transactions.length < _pageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(transactions);
      } else {
        final nextPageKey = pageKey + 1;
        _pagingController.appendPage(transactions, nextPageKey);
      }
    } else {
      String errorMessage = response.data["message"];
      debugPrint("Oooops!!! $errorMessage");
      // _appToastWidget.notification("Oooops!", errorMessage, "Error");
    }
  }


  //  Pick an Image.
  Future<void> takeImage(ImageSource imageSource) async {
    try {
      final XFile? pickedImage = await _imagePicker.pickImage(
        source: imageSource,
        imageQuality: 80,
      );
      if (pickedImage != null) {
        // Note: The "pickedImage" is type "XFile" and need to be made type "File" as did below.
        File filePath = File(pickedImage.path);
        debugPrint("FILE PATH::: $filePath");
        ImagePreviewBottomSheetWidget.imagePreviewBottomSheetWidget();
        return setPickedFile(filePath);
      }
      return _appToastWidget.notification("Oooops!", "No image selected.", "Error");
    } on PlatformException catch (e) {
      throw Exception(e);
    }
  }

  // Upload Transaction Proof
  Future<void> uploadTransactionProof() async {
    setIsLoading(true);

    String? token = await _flutterSecureStorage.read(key: "token") ?? "";
    String decodedToken = jsonDecode(token);

    String imageFile = _pickedFile!.path;
    String trnxReference = _transaction.trnxReference!;

    debugPrint("PROGRESS:::: $trnxReference");
    debugPrint("FILE:::: $imageFile");
    var response = await TransactionAPI.uploadTransactionProofService(uploadTransactionProofRoute, trnxReference, imageFile ,decodedToken);
    bool isSuccess = response!.data["success"];
    debugPrint("PROGRESS:::: $response");

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
  }

  @override
  void dispose() {
    _tabController.dispose();
    _pagingController.dispose();
    super.dispose();
  }
}