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

  String _email = "";
  String _password = "";
  bool _hidePassword = true;
  User _user = User();
  bool _isLoading = false;
  AutovalidateMode _autoValidateMode = AutovalidateMode.disabled;
  final FlutterSecureStorage _flutterSecureStorage = const FlutterSecureStorage();
  final AppToastWidget _appToastWidget = AppToastWidget();


  /*
  * GETTERS
  * */
  String get email => _email;
  String get password => _password;
  bool get hidePassword => _hidePassword;
  User get user => _user;
  bool get isLoading => _isLoading;
  AppToastWidget get appToastWidget => _appToastWidget;
  AutovalidateMode get autoValidateMode => _autoValidateMode;


  /*
  * SETTERS
  * */
  void setEmail(String value) {
    _email = value;
    update();
  }
  void setPassword(String value) {
    _password = value;
    update();
  }
  void setHidePassword() {
    _hidePassword = !_hidePassword;
    update();
  }
  void setUser(User userValue) {
    _user = userValue;
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


  //  Logout User.
  Future<void> logoutUser() async {
    bool isUserSaved = await _flutterSecureStorage.containsKey(key: "userData");
    bool isTokenSaved = await _flutterSecureStorage.containsKey(key: "token");

    if (isUserSaved) {
      await _flutterSecureStorage.delete(key: "userData");
      Get.toNamed(loginScreen);
    }
    if (isTokenSaved) {
      await _flutterSecureStorage.delete(key: "token");
      Get.toNamed(loginScreen);
    }
  }
}