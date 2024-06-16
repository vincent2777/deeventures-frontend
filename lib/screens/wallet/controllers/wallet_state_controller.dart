import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

import '../../../general/widgets/app_toast_widget.dart';
import '../../../routes/api_routes/api_route_names.dart';
import '../apis/wallet_api.dart';
import '../models/wallet_model.dart';

class WalletStateController extends GetxController {

  Wallet _wallet = Wallet(currencySymbol: "", amount: 0.0);
  Wallet _referralWallet = Wallet(currencySymbol: "", amount: 0.0);
  bool _showWalletBalance = true;
  bool _showReferralWalletBalance = true;
  bool _isLoading = false;
  final AppToastWidget _appToastWidget = AppToastWidget();
  final FlutterSecureStorage _flutterSecureStorage = const FlutterSecureStorage();



  /*
  * Getters
  **/
  Wallet get wallet => _wallet;
  Wallet get referralWallet => _referralWallet;
  bool get showWalletBalance => _showWalletBalance;
  bool get showReferralWalletBalance => _showReferralWalletBalance;
  bool get isLoading => _isLoading;


  /*
  * Setters
  **/
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
}