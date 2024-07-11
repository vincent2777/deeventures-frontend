
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../general/widgets/app_toast_widget.dart';
import '../../../routes/api_routes/api_route_names.dart';
import '../../transactions/apis/transaction_api.dart';
import '../../transactions/controllers/transactions_state_controller.dart';
import '../../transactions/models/transaction_model.dart';
import '../../transactions/widgets/image_preview_bottom_sheet_widget.dart';
import '../apis/gift_card_api.dart';
import '../models/gift_card_model.dart';
import '../models/gift_card_rate_model.dart';
import '../models/value_row.dart';

class TradeGiftCardStateController extends GetxController {

  Transaction _transaction = Transaction();
  String _searchText = "";
  late GiftCard _selectedGiftCard = GiftCard();
  late List<GiftCard> _giftCards = <GiftCard>[];
  late GiftCardRate _selectedGiftCardRate = GiftCardRate();
  late List<GiftCardRate> _giftCardRates = <GiftCardRate>[];
  bool _isLoading = false;
  bool _showCardProofModal = false;
  final AppToastWidget _appToastWidget = AppToastWidget();
  AutovalidateMode _autoValidateMode = AutovalidateMode.disabled;
  final FlutterSecureStorage _flutterSecureStorage = const FlutterSecureStorage();
  double _amountToReceive = 0;
  int _cardQuantity = 0;
  final TransactionsStateController _transactionsStateController = Get.find<TransactionsStateController>();
  List<File?> _pickedFile = [];
  final ImagePicker _imagePicker = ImagePicker();
  final List<ValueRow> _rows = [];
  String _addValueMessage = '';
  String _couponCode = '';
  double _totalRowValue = 0;

  /*
  * GETTERS
  * */
  List<File?> get pickedFile => _pickedFile;
  String get searchText => _searchText;
  String get couponCode => _couponCode;
  GiftCard get selectedGiftCard => _selectedGiftCard;
  List<GiftCard> get giftCards => _giftCards;
  GiftCardRate get selectedGiftCardRate => _selectedGiftCardRate;
  List<GiftCardRate> get giftCardRates => _giftCardRates;
  bool get isLoading => _isLoading;
  Transaction get transaction => _transaction;
  AutovalidateMode get autoValidateMode => _autoValidateMode;
  double get amountToReceive => _amountToReceive;
  int get cardQuantity => _cardQuantity;
  double get totalRowValue => _totalRowValue;
  bool get showCardProofModal => _showCardProofModal;

  //when user clicks on add other value
  List<ValueRow> get rows => _rows;
  String get addValueMessage => _addValueMessage;


  /*
  * SETTERS
  * */
  void setPickedFiles(List<File> value) {
    _pickedFile = value;
    update();
  }
  void setAmountToReceive(double value) {
    _amountToReceive = value;
    update();
  }

  void setTotalRowValue(double value) {
    _totalRowValue = value;
    update();
  }

  void setCardQuantity(int value) {
    _cardQuantity = value;
    update();
  }

  void setSearchText(String value) {
    _searchText = value;
    update();
  }

  void setCouponCode(String value) {
    _couponCode = value;
    update();
  }
  void setSelectedGiftCard(GiftCard value) {
    _selectedGiftCard = value;
    update();
  }

  void setSelectedGiftCardRate(GiftCardRate value) {
    _selectedGiftCardRate = value;
    update();
  }

  void setGiftCardRates(List<GiftCardRate> value) {
    _giftCardRates = value;
    update();
  }

  void setTransaction(Transaction value) {
    _transaction = value;
    update();
  }

  void setGiftCards(List<GiftCard> value) {
    _giftCards = value;
    update();
  }
  void setAutoValidateMode() {
    _autoValidateMode = AutovalidateMode.onUserInteraction;
    update();
  }
  void setIsLoading(bool value) {
    _isLoading = value;
    update();
  }

  void setShowCardProofModal(bool value) {
    _showCardProofModal = value;
    update();
  }

  void addNewRateRow() {
    _rows.add(ValueRow());
    update();
  }

  void removeRow(int index) {
    _rows.removeAt(index);
    updateTotalEstimatedValue();
    update();
  }

  void updateEstimatedValue(double? value, int index) {
    if (value != null) {
      _rows[index].estimatedValue = value * double.parse(selectedGiftCardRate.defaultNairaRate!);

      //set total value to buy
      _totalRowValue += rows[index].value!;
      setTotalRowValue(_totalRowValue);

      updateTotalEstimatedValue();
      updateAddValueMessage(value);
      update();
    }
  }

  void updateTotalEstimatedValue() {
    _amountToReceive = _rows.fold(0, (sum, row) => sum + (row.estimatedValue ?? 0));
    update();
  }

  double calculateTotalValue(List<ValueRow> rows) {
    double totalValue = 0.0;
    for (var row in rows) {
      totalValue += row.value!;
    }
    return totalValue;
  }


  void updateAddValueMessage(double value) {
    if (value < double.parse(selectedGiftCardRate.minSell!)) {
      _addValueMessage = 'The minimum card value you can trade under this channel is \$${selectedGiftCardRate.minSell!}';
    } else {
      _addValueMessage = '';
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
    getGiftCards();
  }

  // Reset the state
  void resetState() {
    setSelectedGiftCard(GiftCard());
    setSelectedGiftCardRate(GiftCardRate());
    setAmountToReceive(0);
    setCardQuantity(0);
    _rows.clear();
    setCouponCode("");
  }

  @override
  void onClose() {
    resetState(); // Call reset state when the controller is closed
    super.onClose();
  }

  computeTotal(){
    double rate = double.parse(selectedGiftCardRate.nairaRate!);
    double minSell = double.parse(selectedGiftCardRate.minSell!);

    double total = cardQuantity * minSell * rate;
    setAmountToReceive(total);
  }

  Future<void> getGiftCards() async {
    setIsLoading(true);

    String? token = await _flutterSecureStorage.read(key: "token");
    String decodedToken = jsonDecode(token!);

    var response = await GiftCardAPI.getGiftCardsService(getGiftCardsRoute, decodedToken);
    bool isSuccess = response!.data["success"];

    if (isSuccess) {
      setIsLoading(false);
      List<dynamic> giftCardData = response.data["data"]["giftCards"];
      debugPrint("RESPONSE DATA::: $giftCardData");
      
      List<GiftCard> giftCards = giftCardData.map((eachGiftCard) => GiftCard.fromJson(eachGiftCard)).toList();
      setGiftCards(giftCards);
    } else {
      setIsLoading(false);
      String errorMessage = response.data["message"];
      _appToastWidget.notification("Oooops!", errorMessage, "Error");
    }
  }

  Future<void> getGiftCardRates() async {
    setIsLoading(true);

    String? token = await _flutterSecureStorage.read(key: "token");
    String decodedToken = jsonDecode(token!);

    var response = await GiftCardAPI.getGiftCardRatesService(getGiftCardRateRoute, decodedToken,selectedGiftCard.id!.toString());
    bool isSuccess = response!.data["success"];

    if (isSuccess) {
      setIsLoading(false);
      List<dynamic> giftCardRatesData = response.data["data"]["giftCardRates"];
      debugPrint("RESPONSE DATA::: $giftCardRatesData");

      List<GiftCardRate> rates = giftCardRatesData.map((eachGiftCardRate) => GiftCardRate.fromJson(eachGiftCardRate)).toList();
      setGiftCardRates(rates);
    } else {
      setIsLoading(false);
      String errorMessage = response.data["message"];
      _appToastWidget.notification("Oooops!", errorMessage, "Error");
    }
  }

  Future<void> sellGiftCard() async {

    if(pickedFile != null && pickedFile.isNotEmpty) {
      setIsLoading(true);

      String userData = await _flutterSecureStorage.read(key: "userData") ?? "";
      Map<String, dynamic> decodedUser = jsonDecode(userData);

      String? token = await _flutterSecureStorage.read(key: "token") ?? "";
      String decodedToken = jsonDecode(token);
      debugPrint("TOKEN::: $decodedToken");

      var calc = calculateTotalValue(rows);

      Map<String, dynamic> sellGiftCardData = {
        "user_id": decodedUser["id"],
        "trnx_amount": amountToReceive,
        "trnx_type": "Gift Card Sell",
        "trnx_desc": "Sell ${cardQuantity <= 0 ? calc : cardQuantity} ${selectedGiftCard
            .gCardName}. Giftcard:: Country - ${selectedGiftCardRate
            .gcardCurrencyName} (${selectedGiftCardRate
            .gcardCurrencySym})",
        "trnx_status": 0,
        "trnx_rate": selectedGiftCardRate.defaultNairaRate,
        "trnx_address": selectedGiftCard
            .gCardName,
        "to_receive": amountToReceive,
        "currency": "NGN",
      };

      debugPrint("sellGiftCardData::: $sellGiftCardData");


      var response = await GiftCardAPI.sellGiftCardService(
          sellGiftCardRoute, sellGiftCardData, decodedToken, pickedFile,rows);
      bool isSuccess = response!.data["success"];
      debugPrint("RESPONSE::: $response");

      if (isSuccess) {
        setIsLoading(false);
        Map<String, dynamic> transactionResponse = response
            .data["data"]["transaction"][0];
        Transaction transactionData = transactionFromJson(transactionResponse);
        setTransaction(transactionData);
        _transactionsStateController.setTransaction(transactionData);
        debugPrint("PROGRESS:::: $response");
        // setShowCardProofModal(true);
        resetState();
        Get.toNamed("/homeScreen");
        // getTransactions(0);
        _appToastWidget.notification("Success!", "'Giftcard Sell Transaction submitted", "Success");

      } else {
        setIsLoading(false);
        String errorMessage = response.data["message"];
        _appToastWidget.notification("Oooops!", errorMessage, "Error");
      }
    }else{
      _appToastWidget.notification("Oooops!", "Select at least one card image", "Error");
    }
  }


  //  Pick an Image.
  Future<void> takeImage(ImageSource imageSource) async {
    try {
      final List<XFile> pickedImages = await _imagePicker.pickMultiImage(
        imageQuality: 80,
      );
      if (pickedImages.isNotEmpty) {
        List<File> files = pickedImages.map((image) => File(image.path)).toList();

        debugPrint("FILES PATHS::: ${files.map((file) => file.path).join(", ")}");

        // Assuming you have a method to handle the list of picked files
        ImagePreviewBottomSheetWidget.imagePreviewCardBottomSheetWidget();

        return setPickedFiles(files); // Update this to handle a list of files
      }
      return _appToastWidget.notification("Oooops!", "No images selected.", "Error");
    } on PlatformException catch (e) {
      throw Exception(e);
    }
  }


}