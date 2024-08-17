import 'dart:convert';

import 'package:deeventures/screens/billPayment/models/cableTV_model.dart';
import 'package:deeventures/screens/billPayment/models/electric_company_model.dart';
import 'package:deeventures/screens/billPayment/models/meterType_model.dart';
import 'package:deeventures/screens/wallet/controllers/wallet_state_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../general/widgets/app_toast_widget.dart';
import '../../../routes/api_routes/api_route_names.dart';
import '../apis/bill_payment_api.dart';
import '../models/airtime_model.dart';
import '../models/bill_category_model.dart';
import '../models/internet_service_provider_model.dart';

class BillPaymentStateController extends GetxController {

  String _airtimeCode = "";
  String _electricCompanyCode = "";
  String _meterTypeCode = "";
  String _meterNumber = "";
  String _meterOwnerName = "";
  double _amount = 0.0;
  double _totalPrice = 0.0;
  String _phoneNumber = "";
  String _internetServiceProvider = "";
  String _internetServiceProviderPackage = "";
  String _cableTV = "";
  String _cableTVPackage = "";
  String _smartCardNumber = "";
  double _commissionRate = 0.0;
  double _commissionPrice = 0.0;
  List<Airtime> _airTimes = [];
  List<InternetServiceProvider> _internetServiceProviders = [];
  List<InternetServiceProviderPackage> _internetServiceProviderPackages = [];
  List<ElectricCompany> _electricCompanies = [];
  List<MeterType> _meterTypes = [];
  List<CableTv> _cableTvs = [];
  List<CableTVPackage> _cableTVPackages = [];
  final List<int> _airtimeAmounts = [100, 200, 500, 1000, 2000, 5000];
  final List<BillCategory> _billCategories = [
    BillCategory(image: "assets/images/airtime.png", name: "Airtime"),
    BillCategory(image: "assets/images/internet.png", name: "Internet"),
    BillCategory(image: "assets/images/electricity.png", name: "Electricity"),
    BillCategory(image: "assets/images/cable_tv.png", name: "Cable TV"),
    // BillCategory(image: "assets/images/betting.png", name: "Betting"),
  ];
  late BillCategory _selectedBillCategory;
  bool _isLoading = false;
  final TextEditingController _amountTextEditingController = TextEditingController();
  final AppToastWidget _appToastWidget = AppToastWidget();
  final FlutterSecureStorage _flutterSecureStorage = const FlutterSecureStorage();
  AutovalidateMode _autoValidateMode = AutovalidateMode.disabled;
  final formatter = NumberFormat("#,##0");
  final FocusNode meterNoFocusNode = FocusNode();
  final WalletStateController walletStateController = Get.put(WalletStateController());

  @override
  void onInit() {
    super.onInit();
    meterNoFocusNode.addListener(() {
      if (!meterNoFocusNode.hasFocus) {
        validateMeterNumber();
      }
    });
  }

  @override
  void onClose() {
    meterNoFocusNode.dispose();
    super.onClose();
  }

  /*
  * Getters
  **/
  double get totalPrice => _totalPrice;
  double get commissionRate => _commissionRate;
  double get commissionPrice => _commissionPrice;
  bool get isLoading => _isLoading;
  String get meterOwnerName => _meterOwnerName;

  TextEditingController get amountTextEditingController => _amountTextEditingController;
  List<Airtime> get airTimes => _airTimes;
  List<InternetServiceProvider> get internetServiceProviders => _internetServiceProviders;
  List<InternetServiceProviderPackage> get internetServiceProviderPackages => _internetServiceProviderPackages;
  List<ElectricCompany> get electricCompanies => _electricCompanies;
  List<MeterType> get meterTypes => _meterTypes;
  List<CableTv> get cableTvs => _cableTvs;
  List<CableTVPackage> get cableTVPackages => _cableTVPackages;
  List<int> get airtimeAmounts => _airtimeAmounts;
  List<BillCategory> get billCategories => _billCategories;
  // List<DataBundle> get dataBundles => _dataBundles;
  BillCategory get selectedBillCategory => _selectedBillCategory;
  AppToastWidget get appToastWidget => _appToastWidget;
  AutovalidateMode get autoValidateMode => _autoValidateMode;



  /*
  * Setters
  **/
  void setAirtimeCode(String value) {
    _airtimeCode = value;
    update();
  }
  void setElectricCompanyCode(String value) {
    _electricCompanyCode = value;
    update();
  }
  void setMeterTypeCode(String value) {
    _meterTypeCode = value;
    update();
  }

  void setMeterOwnerName(String value) {
    _meterOwnerName = value;
    update();
  }
  void setMeterNumber(String value) {
    _meterNumber = value;
    update();
  }
  void setAirTimes(List<Airtime> value) {
    _airTimes = value;
    update();
  }
  void setInternetServiceProviders(List<InternetServiceProvider> value) {
    _internetServiceProviders = value;
    update();
  }
  void setInternetServiceProviderPackages(List<InternetServiceProviderPackage> value) {
    _internetServiceProviderPackages = value;
    update();
  }
  void setInternetServiceProvider(String value) {
    _internetServiceProvider = value;
    update();
  }
  void setInternetServiceProviderPackage(String value) {
    _internetServiceProviderPackage = value;
    update();
  }
  void setElectricCompanies(List<ElectricCompany> value) {
    _electricCompanies = value;
    update();
  }
  void setMeterTypes(List<MeterType> value) {
    _meterTypes = value;
    update();
  }
  void setCableTvs(List<CableTv> value) {
    _cableTvs = value;
    update();
  }
  void setCableTv(String value) {
    _cableTV = value;
    update();
  }
  void setCableTVPackage(String value) {
    _cableTVPackage = value;
    update();
  }
  void setCableTVPackages(List<CableTVPackage> value) {
    _cableTVPackages = value;
    update();
  }
  void setSmartCardNumber(String value) {
    _smartCardNumber = value;
    update();
  }
  void setAmount(double value) {
    // Limit the input to two decimal places
    String formattedValue = value.toStringAsFixed(2);

    // Parse the formatted value back to double
    _amount = double.parse(formattedValue);

    double totalAmount = calculateTotalPrice(_amount);
    _totalPrice = totalAmount;

    // Update the text editing controller with the formatted value
    _amountTextEditingController.text = formattedValue;

    // Find the position of the decimal point
    int decimalPosition = formattedValue.indexOf('.');

    // Move the cursor to just before the decimal point
    _amountTextEditingController.selection = TextSelection.fromPosition(
      TextPosition(offset: decimalPosition),
    );

    update();
  }
  void clearTotalPrice() {
    _totalPrice = 0.0;
    _amountTextEditingController.text = "";
    update();
  }
  void setPhoneNumber(String value) {
    _phoneNumber = value;
    update();
  }
  void setCommissionRate(double value) {
    _commissionRate = value;
    update();
  }
  void setCommissionPrice(double value) {
    _commissionPrice = value;
    update();
  }
  void setSelectedBillCategory(BillCategory value) {
    _selectedBillCategory = value;
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
  double calculateTotalPrice(double value) {
    double commissionPrice = _commissionRate;
    // double commissionPrice = (_commissionRate / 100) * value;
    double totalAmount = value + commissionPrice;
    setCommissionPrice(commissionPrice);
    return totalAmount;
  }


  // Airtime
  Future<void> getAirtimeServiceProviders() async {
    setIsLoading(true);

    String? token = await _flutterSecureStorage.read(key: "token");
    String decodedToken = jsonDecode(token!);

    var response = await BillPaymentAPI.getAirtelService(getAirtelRoute, decodedToken);
    bool isSuccess = response!.data["success"];

    if (isSuccess) {
      setIsLoading(false);
      getMeterType();

      // debugPrint("AIRTEL::: ${response.data["data"]}");
      List<dynamic> airtelData = response.data["data"]["airTimes"] ?? [];
      List<Airtime> allAirtime = airtelData.map((eachAirtel) => Airtime.fromJson(eachAirtel)).toList();
      setAirTimes(allAirtime);
    } else {
      setIsLoading(false);
      String errorMessage = response.data["message"];
      _appToastWidget.notification("Oooops!", errorMessage, "Error");
    }
  }
  Future<void> buyAirtime() async {
    setIsLoading(true);

    String? token = await _flutterSecureStorage.read(key: "token");
    String decodedToken = jsonDecode(token!);

    Map<String, dynamic> buyAirtimeData = {
      "mobileNetwork": _airtimeCode,
      "mobileNumber": _phoneNumber,
      "airtimeAmount": _amount,
    };

    // debugPrint("AIRTIME::: $buyAirtimeData");
    var response = await BillPaymentAPI.buyAirtimeService(buyAirtimeRoute, buyAirtimeData, decodedToken);
    bool isSuccess = response!.data["success"];
    String successMessage = response.data["message"];
    // debugPrint("ELECTRIC COMPANIES::: $response");

    if (isSuccess) {
      setIsLoading(false);
      walletStateController.getUserWallet();
      Get.toNamed("/homeScreen");

      _appToastWidget.notification("Success", successMessage, "Success");
    } else {
      setIsLoading(false);
      String errorMessage = response.data["message"];
      _appToastWidget.notification("Oooops!", errorMessage, "Error");
    }
  }

  // Internet
  Future<void> getInternetServiceProviders() async {
    setIsLoading(true);

    String? token = await _flutterSecureStorage.read(key: "token");
    String decodedToken = jsonDecode(token!);

    Map<String, dynamic> internetServiceProvidersData = {
      "dataBundleURL": "https://www.nellobytesystems.com/APIDatabundlePlansV2.asp",
    };

    var response = await BillPaymentAPI.getInternetServiceProvidersService(getInternetServiceProvidersRoute, internetServiceProvidersData, decodedToken);
    bool isSuccess = response!.data["success"];
    // debugPrint("RESPONSE ::: $isSuccess");

    if (isSuccess) {
      setIsLoading(false);

      List<dynamic> internetServiceProviderData = response.data["data"]["internetServiceProviders"];
      List<InternetServiceProvider> serviceProviders = internetServiceProviderData.map((eachServiceProvider) => InternetServiceProvider.fromJson(eachServiceProvider)).toList();
      setInternetServiceProviders(serviceProviders);
      // debugPrint("CABLE TV ::: $internetServiceProviderData");
    } else {
      setIsLoading(false);
      String errorMessage = response.data["message"];
      _appToastWidget.notification("Oooops!", errorMessage, "Error");
    }
  }

  // Internet
  Future<void> validateMeterNumber() async {
    setIsLoading(true);

    String? token = await _flutterSecureStorage.read(key: "token");
    String decodedToken = jsonDecode(token!);

    Map<String, dynamic> validateMeterNoBody = {
      "electric_company_code": _electricCompanyCode,
      "meter_no": _meterNumber
    };

    var response = await BillPaymentAPI.validateMeterNo(validateMeterNoRoute, validateMeterNoBody, decodedToken);
    bool isSuccess = response!.data["success"];
    // debugPrint("RESPONSE ::: $isSuccess");

    if (isSuccess) {
      setIsLoading(false);

      if(response.data["data"]["validatedData"] != null){
        String meterOwner = response.data["data"]["validatedData"]["customer_name"];
        setMeterOwnerName(meterOwner);
        // debugPrint("meterOwner::: $meterOwner");
      }
    } else {
      setIsLoading(false);
      String errorMessage = response.data["message"];
      _appToastWidget.notification("Oooops!", errorMessage, "Error");
    }
  }


  Future<void> getInternetServiceProvidersCommission(String code) async {

    String? token = await _flutterSecureStorage.read(key: "token");
    String decodedToken = jsonDecode(token!);

    var response = await BillPaymentAPI.getInternetServiceProvidersCommissionService(getInternetServiceProvidersCommissionRoute, code, decodedToken);
    bool isSuccess = response!.data["success"];
    // debugPrint("RESPONSE ::: $response");

    if (isSuccess) {
      Map<String, dynamic> dataPlanData = response.data["data"]["dataPlan"];
      double dataPlanCommission = dataPlanData["data_plans_commission"].toDouble();
      setCommissionRate(dataPlanCommission);
      // debugPrint("DATA PLAN COMMISSION ::: $dataPlanCommission");
    } else {
      setIsLoading(false);
      String errorMessage = response.data["message"];
      _appToastWidget.notification("Oooops!", errorMessage, "Error");
    }
  }
  Future<void> buyInternetData() async {
    setIsLoading(true);

    String? token = await _flutterSecureStorage.read(key: "token");
    String decodedToken = jsonDecode(token!);

    Map<String, dynamic> buyInternetData = {
      "mobileNetwork": _internetServiceProvider,
      "dataPlan": _internetServiceProviderPackage,
      "mobileNumber": _phoneNumber,
      "dataBundleAmount": _amountTextEditingController.text,
      "totalAmt": _totalPrice
    };

    // debugPrint("INTERNET::: $buyInternetData");
    var response = await BillPaymentAPI.buyInternetService(buyInternetRoute, buyInternetData, decodedToken);
    bool isSuccess = response!.data["success"];
    String successMessage = response.data["message"];
    // debugPrint("ELECTRIC COMPANIES::: $response");

    if (isSuccess) {
      setIsLoading(false);
      walletStateController.getUserWallet();
      Get.toNamed("/homeScreen");
      _appToastWidget.notification("Success", successMessage, "Success");

    } else {
      setIsLoading(false);
      String errorMessage = response.data["message"];
      _appToastWidget.notification("Oooops!", errorMessage, "Error");
    }
  }

  // Electricity
  Future<void> getElectricCompanies() async {
    setIsLoading(true);

    String? token = await _flutterSecureStorage.read(key: "token");
    String decodedToken = jsonDecode(token!);

    Map<String, dynamic> electricCompaniesData = {
      "electricCompaniesURL": "https://www.nellobytesystems.com/APIElectricityDiscosV1.asp",
    };

    var response = await BillPaymentAPI.getElectricityCompaniesService(getElectricityCompaniesRoute, electricCompaniesData, decodedToken);
    bool isSuccess = response!.data["success"];

    if (isSuccess) {
      setIsLoading(false);
      getMeterType();

      // debugPrint("ELECTRIC COMPANIES::: ${response.data["data"]}");

      List<dynamic> electricCompanyData = response.data["data"]["electricCompanies"] ?? [];
      List<ElectricCompany> electricCompanies = electricCompanyData.map((eachElectricCompany) => ElectricCompany.fromJson(eachElectricCompany)).toList();
      setElectricCompanies(electricCompanies);
    } else {
      setIsLoading(false);
      String errorMessage = response.data["message"];
      _appToastWidget.notification("Oooops!", errorMessage, "Error");
    }
  }
  Future<void> getMeterType() async {
    setIsLoading(true);

    String? token = await _flutterSecureStorage.read(key: "token");
    String decodedToken = jsonDecode(token!);

    var response = await BillPaymentAPI.getMeterTypesService(getMeterTypesRoute, decodedToken);
    bool isSuccess = response!.data["success"];

    if (isSuccess) {
      setIsLoading(false);

      // debugPrint("METER TYPES::: ${response.data["data"]}");
      List<dynamic> meterTypeData = response.data["data"]["meterTypes"] ?? [];
      List<MeterType> meterTypes = meterTypeData.map((eachMeterTypes) => MeterType.fromJson(eachMeterTypes)).toList();
      setMeterTypes(meterTypes);
    } else {
      setIsLoading(false);
      String errorMessage = response.data["message"];
      _appToastWidget.notification("Oooops!", errorMessage, "Error");
    }

  }
  Future<void> getElectricCompaniesCommission(String code) async {

    String? token = await _flutterSecureStorage.read(key: "token");
    String decodedToken = jsonDecode(token!);

    var response = await BillPaymentAPI.getElectricCompaniesCommissionService(getElectricityCompaniesCommissionRoute, code, decodedToken);
    bool isSuccess = response!.data["success"];
    // debugPrint("RESPONSE ::: $response");

    if (isSuccess) {
      Map<String, dynamic> electricCompaniesData = response.data["data"]["electricCompany"];
      double electricCompaniesCommission = electricCompaniesData["bill_commission"].toDouble();
      setCommissionRate(electricCompaniesCommission);
      // debugPrint("ELECTRICITY COMMISSION ::: $electricCompaniesCommission");
    } else {
      setIsLoading(false);
      String errorMessage = response.data["message"];
      _appToastWidget.notification("Oooops!", errorMessage, "Error");
    }
  }
  Future<void> buyElectricity() async {
    setIsLoading(true);

    String? token = await _flutterSecureStorage.read(key: "token");
    String decodedToken = jsonDecode(token!);

    Map<String, dynamic> buyElectricityData = {
      "electricCompanyCode": _electricCompanyCode,
      "meterType": _meterTypeCode,
      "meterNumber": _meterNumber,
      "amount": _amountTextEditingController.text,
      "totalAmt": _totalPrice,
      "mobileNumber": _phoneNumber,
    };

    // debugPrint("ELECTRIC buyElectricityData::: $buyElectricityData");
    var response = await BillPaymentAPI.buyElectricityService(buyElectricityRoute, buyElectricityData, decodedToken);
    bool isSuccess = response!.data["success"];
    // debugPrint("ELECTRIC buyElectricityData::: $response");

    if (isSuccess) {
      setIsLoading(false);
      setMeterOwnerName("");
      walletStateController.getUserWallet();
      Get.toNamed("/homeScreen");
    } else {
      setIsLoading(false);
      String errorMessage = response.data["message"];
      _appToastWidget.notification("Oooops!", errorMessage, "Error");
    }
  }

  // Cable TV
  Future<void> getCableTVs() async {
    setIsLoading(true);

    String? token = await _flutterSecureStorage.read(key: "token");
    String decodedToken = jsonDecode(token!);

    Map<String, dynamic> cableTVData = {
      "cableTvURL": "https://www.nellobytesystems.com/APICableTVPackagesV2.asp",
    };

    var response = await BillPaymentAPI.getCableTVService(getCableTVRoute, cableTVData, decodedToken);
    bool isSuccess = response!.data["success"];
    // debugPrint("RESPONSE ::: $isSuccess");

    if (isSuccess) {
      setIsLoading(false);

      List<dynamic> cableTVData = response.data["data"]["channels"];
      List<CableTv> cableTVs = cableTVData.map((eachCableTV) => CableTv.fromJson(eachCableTV)).toList();
      setCableTvs(cableTVs);
      // debugPrint("CABLE TV ::: $cableTVs");
    } else {
      setIsLoading(false);
      String errorMessage = response.data["message"];
      _appToastWidget.notification("Oooops!", errorMessage, "Error");
    }
  }
  Future<void> getCableTVCommission(String code) async {

    String? token = await _flutterSecureStorage.read(key: "token");
    String decodedToken = jsonDecode(token!);

    var response = await BillPaymentAPI.getCableTVCommissionService(getCableTVCommissionRoute, code, decodedToken);
    bool isSuccess = response!.data["success"];
    // debugPrint("RESPONSE ::: $response");

    if (isSuccess) {
      Map<String, dynamic> cableTVData = response.data["data"]["cableTV"];
      double cableTVCommission = cableTVData["cable_commission"].toDouble();
      setCommissionRate(cableTVCommission);
      // debugPrint("CABLE TV COMMISSION ::: $cableTVCommission");
    } else {
      setIsLoading(false);
      String errorMessage = response.data["message"];
      _appToastWidget.notification("Oooops!", errorMessage, "Error");
    }
  }
  Future<void> buyTVSubscription() async {
    setIsLoading(true);

    String? token = await _flutterSecureStorage.read(key: "token");
    String decodedToken = jsonDecode(token!);

    Map<String, dynamic> buyCableTVData = {
      "cableTV": _cableTV,
      "packageCode": _cableTVPackage,
      "smartCardNo": _smartCardNumber,
      "amount": _totalPrice,
      "mobileNumber": _phoneNumber
    };

    // debugPrint("CABLE TV DATA::: $buyCableTVData");
    var response = await BillPaymentAPI.buyCableTVService(buyCableTVRoute, buyCableTVData, decodedToken);
    bool isSuccess = response!.data["success"];

    if (isSuccess) {
      setIsLoading(false);
      walletStateController.getUserWallet();
      Get.toNamed("/homeScreen");
    } else {
      setIsLoading(false);
      String errorMessage = response.data["message"];
      _appToastWidget.notification("Oooops!", errorMessage, "Error");
    }
  }

  // Betting
  Future<void> getBettingCompanies() async {
    setIsLoading(true);

    String? token = await _flutterSecureStorage.read(key: "token");
    String decodedToken = jsonDecode(token!);

    // debugPrint("BETTING Betting Company");
  }
  Future<void> buyBettingSubscription() async {
    setIsLoading(true);

    String? token = await _flutterSecureStorage.read(key: "token");
    String decodedToken = jsonDecode(token!);

    Map<String, dynamic> buyAirtimeData = {
      "serviceProvider": _internetServiceProvider,
      "amount": _amount
    };

    var response = await BillPaymentAPI.buyAirtimeService(buyAirtimeRoute, buyAirtimeData, decodedToken);
    bool isSuccess = response!.data["success"];

    if (isSuccess) {
      setIsLoading(false);
    } else {
      setIsLoading(false);
      String errorMessage = response.data["message"];
      _appToastWidget.notification("Oooops!", errorMessage, "Error");
    }
  }

}
