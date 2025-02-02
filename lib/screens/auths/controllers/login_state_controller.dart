import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

import '../../../general/models/user_model.dart';
import '../../../general/widgets/app_toast_widget.dart';
import '../../../routes/api_routes/api_route_names.dart';
import '../../../routes/app_routes/app_route_names.dart';
import '../apis/auth_api.dart';

class LoginStateController extends GetxController {

  String _otp = "";
  String _email = "";
  String _password = "";
  String _confirmPassword = "";
  bool _hidePassword = true;
  bool _hideConfirmPassword = true;
  User _user = User();
  bool _showResetPassword = false;
  bool _isLoading = false;
  AutovalidateMode _autoValidateMode = AutovalidateMode.disabled;
  final FlutterSecureStorage _flutterSecureStorage = const FlutterSecureStorage();
  final AppToastWidget _appToastWidget = AppToastWidget();


  /*
  * GETTERS
  * */
  String get otp => _otp;
  String get email => _email;
  String get password => _password;
  String get confirmPassword => _confirmPassword;
  bool get hidePassword => _hidePassword;
  bool get hideConfirmPassword => _hideConfirmPassword;
  User get user => _user;
  bool get showResetPassword => _showResetPassword;
  bool get isLoading => _isLoading;
  AppToastWidget get appToastWidget => _appToastWidget;
  AutovalidateMode get autoValidateMode => _autoValidateMode;


  /*
  * SETTERS
  * */
  void setOTP(String value) {
    _otp = value;
    update();
  }
  void setEmail(String value) {
    _email = value;
    update();
  }
  void setPassword(String value) {
    _password = value;
    update();
  }
  void setConfirmPassword(String value) {
    _confirmPassword = value;
    update();
  }
  void setHidePassword() {
    _hidePassword = !_hidePassword;
    update();
  }
  void setHideConfirmPassword() {
    _hideConfirmPassword = !_hideConfirmPassword;
    update();
  }
  void setUser(User userValue) {
    _user = userValue;
    update();
  }
  void setShowResetPassword(bool value) {
    _showResetPassword = value;
    update();
  }
  void setIsLoading(bool value) {
    _isLoading = value;
    update();
  }
  void setAutoValidateMode() {
    _autoValidateMode = AutovalidateMode.onUserInteraction;
    update();
  }



  //  Login User.
  Future<void> loginUser() async {
    setIsLoading(true);

    // Prepare the request body
    Map<String, dynamic> loginData = {
      "email": _email,
      "password": _password,
    };

    var response = await AuthAPI.loginUserService(loginUserRoute, loginData);
    bool isSuccess = response!.data["success"];
    String message = response.data["message"];

    if (isSuccess) {
      setIsLoading(false);

      if (response.data["data"] == null) {
        _appToastWidget.notification("Note!", message, "Warning");
      }

      Map<String, dynamic> responseData = response.data["data"];
      Map<String, dynamic> userData = responseData["user"];
      String token = responseData["token"];
      String encodedUserData = jsonEncode(userData);
      String encodedToken = jsonEncode(token);

      //  Save to Flutter Secure Storage
      await logoutUser();
      await _flutterSecureStorage.write(key: "userData", value: encodedUserData);
      await _flutterSecureStorage.write(key: "token", value: encodedToken);

      _appToastWidget.notification("Success!", message, "Success");
      setUser(userFromJson(userData));
      Get.offAndToNamed(homeScreen);
      // debugPrint("USER::: ${user.wallet?.amount}");
    } else {
      setIsLoading(false);
      String errorMessage = response.data["message"];
      _appToastWidget.notification("Oooops!", errorMessage, "Error");
    }
  }


  //  Forgot Password.
  Future<void> forgotPassword() async {
    setIsLoading(true);

    // Prepare the request body
    Map<String, dynamic> forgotPasswordData = {
      "email": _email,
    };

    var response = await AuthAPI.forgotPasswordService(forgotPasswordRoute, forgotPasswordData);
    bool isSuccess = response!.data["success"];
    String message = response.data["message"];

    if (isSuccess) {
      setIsLoading(false);

      _appToastWidget.notification("Success!", message, "Success");
      setShowResetPassword(true);
      // debugPrint("USER::: ${user.wallet?.amount}");
    } else {
      setIsLoading(false);
      String errorMessage = response.data["message"];
      _appToastWidget.notification("Oooops!", errorMessage, "Error");
    }
  }


  //  Reset Password.
  Future<void> resetPassword() async {
    setIsLoading(true);

    // Prepare the request body
    Map<String, dynamic> resetPasswordData = {
      "otp": otp,
      "password": password,
      "confirm_password": confirmPassword,
    };

    var response = await AuthAPI.resetPasswordService(resetPasswordRoute, resetPasswordData);
    bool isSuccess = response!.data["success"];
    String message = response.data["message"];
    // debugPrint("RESPONSE::: $response");

    if (isSuccess) {
      setIsLoading(false);

      _appToastWidget.notification("Success!", message, "Success");
      setShowResetPassword(false);
      Get.offAllNamed(loginScreen);
      // debugPrint("USER::: ${user.wallet?.amount}");
    } else {
      setIsLoading(false);
      String errorMessage = response.data["message"];
      _appToastWidget.notification("Oooops!", errorMessage, "Error");
    }
  }


  //  Logout User.
  Future<void> logoutUser() async {
    bool isUserSaved = await _flutterSecureStorage.containsKey(key: "userData");
    bool isTokenSaved = await _flutterSecureStorage.containsKey(key: "token");

    if (isUserSaved) {
      await _flutterSecureStorage.delete(key: "userData");
      Get.offAllNamed(loginScreen);
    }
    if (isTokenSaved) {
      await _flutterSecureStorage.delete(key: "token");
      Get.offAllNamed(loginScreen);
    }
  }
}