import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../general/models/user_model.dart';
import '../../../general/widgets/app_toast_widget.dart';
import '../../../routes/api_routes/api_route_names.dart';
import '../../../routes/app_routes/app_route_names.dart';
import '../apis/auth_api.dart';
import '../models/country.dart';

class RegisterStateController extends GetxController {

  String _firstName = "";
  String _lastName = "";
  String _phoneNumber = "";
  String _userName = "";
  String _email = "";
  String _password = "";
  String _country = "";
  String _referral = "";
  bool _hidePassword = true;
  User _user = User();
  bool _isLoading = false;
  AutovalidateMode _autoValidateMode = AutovalidateMode.disabled;
  final AppToastWidget _appToastWidget = AppToastWidget();
  final Country placeholderCountry = Country(id: "Select Country", name: "Select Country");

  final List<Country> _countryList = [
    Country(id: "Select Country", name: "Select Country"),
    Country(id: "Nigeria", name: "Nigeria"),
    Country(id: "United States of America", name: "United States of America"),
    Country(id: "United Kingdom", name: "United Kingdom"),
    Country(id: "Ghana", name: "Ghana"),
    Country(id: "Kenya", name: "Kenya"),
    Country(id: "Others", name: "Others"),
  ];
  final TapGestureRecognizer _tapRecognizer = TapGestureRecognizer();


  /*
  * GETTERS
  * */
  List<Country> get countryList => _countryList;
  TapGestureRecognizer get tapRecognizer => _tapRecognizer;

  String get firstName => _firstName;
  String get lastName => _lastName;
  String get phoneNumber => _phoneNumber;
  String get userName => _userName;
  String get email => _email;
  String get password => _password;
  String get country => _country;
  String get referral => _referral;
  bool get hidePassword => _hidePassword;
  User get user => _user;
  bool get isLoading => _isLoading;
  AppToastWidget get appToastWidget => _appToastWidget;
  AutovalidateMode get autoValidateMode => _autoValidateMode;


  /*
  * SETTERS
  * */
  void setFirstName(String value) {
    _firstName = value;
    update();
  }
  void setLastName(String value) {
    _lastName = value;
    update();
  }
  void setPhoneNumber(String value) {
    _phoneNumber = value;
    update();
  }
  void setUserName(String value) {
    _userName = value;
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
  void setCountry(String value) {
    _country = value;
    update();
  }
  void setReferral(String value) {
    _referral = value;
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



  //  Register User.
  Future<void> registerUser() async {
    setIsLoading(true);

    // Prepare the request body
    Map<String, dynamic> registrationData = {
      "full_name": "$_firstName $_lastName",
      // "username": _userName,
      "email": _email,
      "phone_number": _phoneNumber,
      "password": _password,
      "country": _country,
      "referred_by": _referral,
      // "reg_date": DateTime.now().toIso8601String(),
    };

    var response = await AuthAPI.registerUserService(registerUserRoute, registrationData);
    bool isSuccess = response!.data["success"];
    // debugPrint("RESPONSE::: $response");

    if (isSuccess) {
      setIsLoading(false);

      Map<String, dynamic> userData = response.data["data"];
      // debugPrint("USER DATA:::: $userData");

      setUser(userFromJson(userData));
    _appToastWidget.notification("Welcome to Deeventures!", "Your Registration was successful. Start Trading now!", "Success");

    Get.offAndToNamed(loginScreen);
    } else {
      setIsLoading(false);
      String errorMessage = response.data["message"];
      _appToastWidget.notification("Oooops!", errorMessage, "Error");
    }
  }
}