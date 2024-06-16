import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:interactive_chart/interactive_chart.dart';

import '../../../general/widgets/app_toast_widget.dart';
import '../../../routes/api_routes/api_route_names.dart';
import '../../transactions/controllers/transactions_state_controller.dart';
import '../../transactions/models/transaction_model.dart';
import '../apis/cryptocurrency_api.dart';
import '../models/currency_model.dart';

class TradeCryptocurrencyStateController extends GetxController {

  String _cryptoAmount = "";
  String _searchText = "";
  double _newCurrencyBuyRate = 0.0;
  List<String> _symbols = ["BTCUSDT", "LTCUSDT", "XRPUSDT", "BCHUSDT", "EOSUSDT", "BNBUSDT", "USDTUSDC"];
  List<String> _intervals = ['1m', '3m', '5m', '15m', '30m', '1h', '2h', '4h', '6h', '8h', '12h', '1d', '3d', '1w', '1M'];
  late Currency _currency = Currency();
  late List<Currency> _currencies = <Currency>[];
  late List<CurrencyNetwork> _currencyNetworks = <CurrencyNetwork>[];
  late CurrencyNetwork _currencyNetwork = CurrencyNetwork();
  final List<String> _chartImages = [
    "assets/images/chart_one.png",
    "assets/images/chart_two.png",
    "assets/images/chart_three.png",
    "assets/images/chart_four.png",
    "assets/images/chart_one.png",
    "assets/images/chart_two.png",
    "assets/images/chart_three.png",
    "assets/images/chart_four.png",
    "assets/images/chart_one.png",
    "assets/images/chart_two.png",
    "assets/images/chart_three.png",
    "assets/images/chart_four.png",
  ];
  Transaction _transaction = Transaction();
  late List<CandleData>? _candles;
  bool _showQRCode = false;
  bool _isLoading = false;
  bool _isSellCryptoLoading = false;
  AutovalidateMode _autoValidateMode = AutovalidateMode.disabled;
  final AppToastWidget _appToastWidget = AppToastWidget();
  final FlutterSecureStorage _flutterSecureStorage = const FlutterSecureStorage();
  final TransactionsStateController _transactionsStateController = Get.find<TransactionsStateController>();



  /*
  * GETTERS
  * */
  String get cryptoAmount => _cryptoAmount;
  String get searchText => _searchText;
  double get newCurrencyBuyRate => _newCurrencyBuyRate;
  List<String> get symbols => _symbols;
  List<String> get intervals => _intervals;
  Currency get currency => _currency;
  List<Currency> get currencies => _currencies;
  List<CurrencyNetwork> get currencyNetworks => _currencyNetworks;
  CurrencyNetwork get currencyNetwork => _currencyNetwork;
  List<String> get chartImages => _chartImages;
  Transaction get transaction => _transaction;
  List<CandleData>? get candles => _candles;
  bool get showQRCode => _showQRCode;
  bool get isLoading => _isLoading;
  bool get isSellCryptoLoading => _isSellCryptoLoading;
  AutovalidateMode get autoValidateMode => _autoValidateMode;
  AppToastWidget get appToastWidget => _appToastWidget;


  /*
  * SETTERS
  * */
  void setCryptoAmount(String value) {
    _cryptoAmount = value;
    if (value.isEmpty) {
      _newCurrencyBuyRate = _currency.currencyBuyRate!;
    } else {
      setNewCurrencyBuyRate(_currency.currencyBuyRate! * double.parse(value));
    }
    update();
  }
  void setNewCurrencyBuyRate(double value) {
    _newCurrencyBuyRate = value;
    update();
  }
  void setSearchText(String value) {
    _searchText = value;
    update();
    searchCryptocurrency();
  }
  void setSymbols(List<String> value) {
    _symbols = value;
    update();
  }
  void setIntervals(List<String> value) {
    _intervals = value;
    update();
  }
  void setCurrency(Currency value) {
    _currency = value;
    update();
  }
  void setCurrencies(List<Currency> value) {
    _currencies = value;
    update();
  }
  void setTransaction(Transaction value) {
    _transaction = value;
    update();
  }
  void setCurrencyNetworks(List<CurrencyNetwork> value) {
    _currencyNetworks = value;
    update();
  }
  void setCurrencyNetwork(CurrencyNetwork value) {
    _currencyNetwork = value;
    update();
  }
  void setCandleData(List<CandleData> value) {
    _candles = value;
    update();
  }
  void setAutoValidateMode() {
    _autoValidateMode = AutovalidateMode.onUserInteraction;
    update();
  }
  void setShowQRCode(bool value) {
    _showQRCode = value;
    update();
  }
  void setIsLoading(bool value) {
    _isLoading = value;
    update();
  }
  void setIsSellCryptoLoading(bool value) {
    _isSellCryptoLoading = value;
    update();
  }

  @override
  void onInit() {
    super.onInit();

    getCryptocurrencies();
  }

  Future<void> getCryptocurrencies() async {
    setIsLoading(true);

    String? token = await _flutterSecureStorage.read(key: "token");
    String decodedToken = jsonDecode(token!);

    var response = await CryptocurrencyAPI.getCryptocurrenciesService(getCryptocurrenciesRoute, decodedToken);
    bool isSuccess = response!.data["success"];

    if (isSuccess) {
      setIsLoading(false);
      List<dynamic> currenciesData = response.data["data"]["currencies"];
      // debugPrint("RESPONSE DATA::: $currenciesData");
      
      List<Currency> currencies = currenciesData.map((eachCurrency) => Currency.fromJson(eachCurrency)).toList();
      setCurrencies(currencies);
    } else {
      setIsLoading(false);
      String errorMessage = response.data["message"];
      _appToastWidget.notification("Oooops!", errorMessage, "Error");
    }
  }

  void searchCryptocurrency() {
    List<Currency> filteredCurrency = _currencies.where((currency) {
      return currency.currencyName!.toLowerCase().contains(_searchText.toLowerCase());
    }).toList();

    setCurrencies(filteredCurrency);
  }

  Future<void> getCryptocurrencyChartData() async {
    setIsLoading(true);
    String product = "${currency.currencySymbol}-USD";
    String granularity = "3600";

    var response = await CryptocurrencyAPI.getCryptocurrencyService(getCryptocurrencyRoute, product, granularity);
    // debugPrint("STATUS CODE::: ${response?.statusCode}");

    if (response?.statusCode == 200) {
      setIsLoading(false);

      List<dynamic> candleList = response?.data;
      List<CandleData> candles = candleList.map((data) => CandleData(
        timestamp: data[0] * 1000,
        low: data[1]?.toDouble(),
        high: data[2]?.toDouble(),
        open: data[3]?.toDouble(),
        close: data[4]?.toDouble(),
        volume: data[5]?.toDouble(),
      )).toList().reversed.toList();

      setCandleData(candles);
    } else {
      setIsLoading(false);
      _appToastWidget.notification("Oooops!", "Unable to retrieve data", "Error");
    }
  }

  Future<void> sellCrypto() async {
    setIsSellCryptoLoading(true);

    String userData = await _flutterSecureStorage.read(key: "userData") ?? "";
    Map<String, dynamic> decodedUser = jsonDecode(userData);

    String? token = await _flutterSecureStorage.read(key: "token") ?? "";
    String decodedToken = jsonDecode(token);
    debugPrint("TOKEN::: $decodedToken");

    Map<String, dynamic> sellCryptoData = {
      "user_id": decodedUser["id"],
      "trnx_amount": _cryptoAmount,
      "trnx_type": "Coin Sell",
      "trnx_desc": "Selling of cryptocurrency",
      "trnx_status": 0,
      "trnx_rate": _currency.currencyBuyRate,
      "trnx_address": _currencyNetwork.networkAddress,
      "trnx_image": "",
      "to_receive": _newCurrencyBuyRate,
      "currency": _currency.currencySymbol,
    };
    debugPrint("TRANSACTION DATA::: $sellCryptoData");


    var response = await CryptocurrencyAPI.sellCryptoService(sellCryptocurrencyRoute, sellCryptoData, decodedToken);
    bool isSuccess = response!.data["success"];
    debugPrint("RESPONSE::: $response");

    if (isSuccess) {
      setIsSellCryptoLoading(false);
      Map<String, dynamic> transactionResponse = response.data["data"]["transaction"];
      Transaction transactionData = transactionFromJson(transactionResponse);
      setTransaction(transactionData);
      _transactionsStateController.setTransaction(transactionData);
      debugPrint("PROGRESS:::: $response");
      setShowQRCode(true);
    } else {
      setIsSellCryptoLoading(false);
      String errorMessage = response.data["message"];
      _appToastWidget.notification("Oooops!", errorMessage, "Error");
    }
  }
}