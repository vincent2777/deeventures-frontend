import 'dart:convert';

import 'package:deeventures/screens/transactions/models/transaction_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

import '../../../general/models/setting_model.dart';
import '../../../general/widgets/app_toast_widget.dart';
import '../../../routes/api_routes/api_route_names.dart';
import '../../transactions/controllers/transactions_state_controller.dart';
import '../apis/wallet_api.dart';
import '../models/wallet_model.dart';

class WalletStateController extends GetxController {

  String _amount = "";
  String _accountNumber = "";
  String _accountName = "";
  String _bankName = "";
  String _otp = "";
  String _withdrawalChannel = "main_wallet";
  Wallet _wallet = Wallet(currencySymbol: "", amount: 0.0);
  Wallet _referralWallet = Wallet(currencySymbol: "", amount: 0.0);
  bool _showWalletBalance = true;
  bool _showReferralWalletBalance = true;
  int _bottomSheetStep = 1;
  bool _showDepositDetails = false;
  AccountSettings _accountSettings = AccountSettings();
  bool _isLoading = false;
  AutovalidateMode _autoValidateMode = AutovalidateMode.disabled;
  final AppToastWidget _appToastWidget = AppToastWidget();
  final FlutterSecureStorage _flutterSecureStorage = const FlutterSecureStorage();
  final TransactionsStateController _transactionsStateController = Get.find<TransactionsStateController>();



  /*
  * Getters
  **/
  String get amount => _amount;
  String get accountNumber => _accountNumber;
  String get accountName => _accountName;
  String get bankName => _bankName;
  String get otp => _otp;
  Wallet get wallet => _wallet;
  String get withdrawalChannel => _withdrawalChannel;
  Wallet get referralWallet => _referralWallet;
  bool get showWalletBalance => _showWalletBalance;
  bool get showReferralWalletBalance => _showReferralWalletBalance;
  int get bottomSheetStep => _bottomSheetStep;
  bool get showDepositDetails => _showDepositDetails;
  AccountSettings get accountSettings => _accountSettings;
  AutovalidateMode get autoValidateMode => _autoValidateMode;
  AppToastWidget get appToastWidget => _appToastWidget;
  bool get isLoading => _isLoading;


  /*
  * Setters
  **/
  void setAmount(String value) {
    _amount = value;
    update();
  }
  void setAccountNumber(String value) {
    _accountNumber = value;
    update();
  }
  void setWithdrawalChannel(String value) {
    _withdrawalChannel = value;
    update();
  }
  void setAccountName(String value) {
    _accountName = value;
    update();
  }
  void setBankName(String value) {
    _bankName = value;
    update();
  }
  void setOTP(String value) {
    _otp = value;
    update();
  }
  void setWallet(Wallet value) {
    _wallet = value;
    update();
  }
  void setReferralWallet(Wallet value) {
    _referralWallet = value;
    update();
  }
  void setShowWalletBalance() {
    _showWalletBalance = !_showWalletBalance;
    update();
  }
  void setShowReferralWalletBalance() {
    _showReferralWalletBalance = !_showReferralWalletBalance;
    update();
  }
  void setBottomSheetStep(int value) {
    _bottomSheetStep = value;
    update();
  }
  void setShowDepositDetails(bool value) {
    _showDepositDetails = value;
    update();
  }
  void setAccountSettings(AccountSettings value) {
    _accountSettings = value;
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


  @override
  void onInit() async {
    await getUserWallet();
    await getUserReferralWallet();
    super.onInit();
  }


  // Get User Wallet and Referral Wallet
  Future<void> getUserWallet() async {
    String userData = await _flutterSecureStorage.read(key: "userData") ?? "";
    Map<String, dynamic> decodedLoggedInUser = jsonDecode(userData);

    String? token = await _flutterSecureStorage.read(key: "token");
    String decodedToken = jsonDecode(token!);
    int userID = decodedLoggedInUser["id"];

    // debugPrint("decodedLoggedInUser $decodedLoggedInUser");

    var response = await WalletAPI.getUserWalletService(getUserWalletRoute, userID, decodedToken);
    bool isSuccess = response!.data["success"];
    String message = response.data["message"];

    if (isSuccess) {
      setIsLoading(false);

      if (response.data["data"] == null) {
        _appToastWidget.notification("Note!", message, "Warning");
      }

      Map<String, dynamic> responseData = response.data["data"];
      Map<String, dynamic> walletData = responseData["wallet"];
      // debugPrint("USER DATA:::: $walletData");

      setWallet(walletFromJson(walletData));
    } else {
      setIsLoading(false);
      String errorMessage = response.data["message"];
      _appToastWidget.notification("Oooops!", errorMessage, "Error");
    }
  }

  Future<void> getUserReferralWallet() async {
    String userData = await _flutterSecureStorage.read(key: "userData") ?? "";
    Map<String, dynamic> decodedLoggedInUser = jsonDecode(userData);

    String? token = await _flutterSecureStorage.read(key: "token");
    String decodedToken = jsonDecode(token!);
    int userID = decodedLoggedInUser["id"];

    var response = await WalletAPI.getUserReferralWalletService(getUserReferralWalletRoute, userID, decodedToken);
    bool isSuccess = response!.data["success"];
    String message = response.data["message"];

    if (isSuccess) {
      setIsLoading(false);

      if (response.data["data"] == null) {
        _appToastWidget.notification("Note!", message, "Warning");
      }

      Map<String, dynamic> responseData = response.data["data"];
      Map<String, dynamic> referralWalletData = responseData["referralWallet"];
      // debugPrint("USER DATA:::: $walletData");

      setReferralWallet(walletFromJson(referralWalletData));
    } else {
      setIsLoading(false);
      String errorMessage = response.data["message"];
      _appToastWidget.notification("Oooops!", errorMessage, "Error");
    }
  }

  Future<void> depositMoney() async {
    setIsLoading(true);
    String userData = await _flutterSecureStorage.read(key: "userData") ?? "";
    Map<String, dynamic> decodedLoggedInUser = jsonDecode(userData);

    // debugPrint("oboyyyyy");

    String? token = await _flutterSecureStorage.read(key: "token");
    String decodedToken = jsonDecode(token!);
    int userID = decodedLoggedInUser["id"];

    Map<String, dynamic> depositData = {
      "amount": _amount
    };

    var response = await WalletAPI.depositMoneyService(depositMoneyRoute, userID, depositData, decodedToken);
    bool isSuccess = response!.data["success"];
    String message = response.data["message"];
    // debugPrint("USER DATA:::: ${response.data["data"]}");

    if (isSuccess) {
      setIsLoading(false);

      if (response.data["data"] == null) {
        _appToastWidget.notification("Note!", message, "Warning");
      }

      Map<String, dynamic> responseData = response.data["data"];
      Map<String, dynamic> settingsData = responseData["settings"];
      Map<String, dynamic> transactionData = responseData["transaction"];
      setAccountSettings(settingFromJson(settingsData));
      // _transactionsStateController.setTransaction(transactionFromJson(transactionData));
      setShowDepositDetails(true);
      _appToastWidget.notification("Congratulations!", message, "Success");

      // debugPrint("SETTINGS DATA:::: $settingsData");
    } else {
      setIsLoading(false);
      String errorMessage = response.data["message"];
      _appToastWidget.notification("Oooops!", errorMessage, "Error");
    }
  }

  Future<void> withdrawMoney() async {
    setIsLoading(true);
    String userData = await _flutterSecureStorage.read(key: "userData") ?? "";
    Map<String, dynamic> decodedLoggedInUser = jsonDecode(userData);

    String? token = await _flutterSecureStorage.read(key: "token");
    String decodedToken = jsonDecode(token!);
    int userID = decodedLoggedInUser["id"];

    Map<String, dynamic> withdrawData = {
      "amount": _amount,
    };

    var response = await WalletAPI.withdrawMoneyService(withdrawMoneyRoute, userID, withdrawData, decodedToken);
    bool isSuccess = response!.data["success"];
    String message = response.data["message"];
    // debugPrint("USER DATA:::: ${response.data["data"]}");

    if (isSuccess) {
      setIsLoading(false);

      setBottomSheetStep(3);
      _appToastWidget.notification("Success!", message, "Success");
      // debugPrint("transactionData DATA:::: $transactionData");
    } else {
      setIsLoading(false);
      String errorMessage = response.data["message"];
      _appToastWidget.notification("Oooops!", errorMessage, "Error");
    }
  }

  Future<void> verifyWithdrawMoney() async {
    setIsLoading(true);
    String userData = await _flutterSecureStorage.read(key: "userData") ?? "";
    Map<String, dynamic> decodedLoggedInUser = jsonDecode(userData);

    String? token = await _flutterSecureStorage.read(key: "token");
    String decodedToken = jsonDecode(token!);
    int userID = decodedLoggedInUser["id"];

    Map<String, dynamic> withdrawData = {
      "amount": _amount,
      "withdrawalChannel": _withdrawalChannel,
      "account_number": _accountNumber,
      "account_name": _accountName,
      "bank_name": _bankName,
      "otp": _otp,
    };
    debugPrint("WITHDRAWAL DATA:::: $withdrawData");

    var response = await WalletAPI.verifyWithdrawMoneyService(verifyWithdrawMoneyRoute, userID, withdrawData, decodedToken);
    bool isSuccess = response!.data["success"];
    String message = response.data["message"];
    // debugPrint("USER DATA:::: ${response.data["data"]}");

    if (isSuccess) {
      setIsLoading(false);

      Map<String, dynamic> responseData = response.data["data"];
      Map<String, dynamic> transactionData = responseData["transaction"];
      _transactionsStateController.setTransaction(transactionFromJson(transactionData));

      setBottomSheetStep(3);
      await getUserWallet();
      await getUserReferralWallet();
      Get.back();
      Get.toNamed("/homeScreen");

      _appToastWidget.notification("Success!", message, "Success");
      // debugPrint("transactionData DATA:::: $transactionData");
    } else {
      setIsLoading(false);
      String errorMessage = response.data["message"];
      _appToastWidget.notification("Oooops!", errorMessage, "Error");
    }
  }

}