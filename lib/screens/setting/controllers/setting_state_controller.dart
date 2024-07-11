import 'dart:convert';

import 'package:deeventures/general/controllers/general_state_controller.dart';
import 'package:deeventures/screens/auths/controllers/login_state_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

import '../../../general/widgets/app_toast_widget.dart';
import '../../../routes/api_routes/api_route_names.dart';
import '../../../routes/app_routes/app_route_names.dart';
import '../../auths/apis/auth_api.dart';

class SettingStateController extends GetxController {
  bool _isLoading = false;
  bool _hideOldPassword = true,
      _hideNewPassword = true,
      _hideCNewPassword = true;
  LoginStateController loginStateController = Get.put(LoginStateController());
  GeneralStateController generalStateController =
      Get.put(GeneralStateController());

  String? _currentPassword;
  String? _newPassword;
  String? _confirmNewPassword;
  String? _fullName;
  String? _country;
  String? _phoneNumber;

  TextEditingController fullNameTextController = TextEditingController();
  TextEditingController countryTextController = TextEditingController();
  TextEditingController phoneNumberTextController = TextEditingController();

  AutovalidateMode _autoValidateMode = AutovalidateMode.disabled;
  final AppToastWidget _appToastWidget = AppToastWidget();
  final FlutterSecureStorage _flutterSecureStorage =
      const FlutterSecureStorage();

  /*
  * Getters
  **/
  bool get isLoading => _isLoading;

  bool get hideOldPassword => _hideOldPassword;

  bool get hideNewPassword => _hideNewPassword;

  bool get hideCNewPassword => _hideCNewPassword;

  String? get currentPassword => _currentPassword;

  String? get newPassword => _newPassword;

  String? get phoneNumber => _phoneNumber;

  String? get fullName => _fullName;

  String? get country => _country;

  String? get confirmNewPassword => _confirmNewPassword;

  AppToastWidget get appToastWidget => _appToastWidget;

  AutovalidateMode get autoValidateMode => _autoValidateMode;

  /*
  * Setters
  **/
  void setIsLoading(bool value) {
    _isLoading = value;
    update();
  }

  void setCountry(String? value) {
    _country = value;
    update();
  }

  void setFullName(String? value) {
    _fullName = value;
    update();
  }

  void setPhoneNumber(String? value) {
    _phoneNumber = value;
    update();
  }

  void setCurrentPassword(String? value) {
    _currentPassword = value;
    update();
  }

  void setHideOldPassword() {
    _hideOldPassword = !_hideOldPassword;
    update();
  }

  void setHideNewPassword() {
    _hideNewPassword = !_hideNewPassword;
    update();
  }

  void setHideCNewPassword() {
    _hideCNewPassword = !_hideCNewPassword;
    update();
  }

  void setNewPassword(String? value) {
    _newPassword = value;
    update();
  }

  void setConfirmNewPassword(String? value) {
    _confirmNewPassword = value;
    update();
  }

  void setAutoValidateMode() {
    _autoValidateMode = AutovalidateMode.onUserInteraction;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    setProfileInformation();
  }

  Future<void> updatePassword() async {
    String userData = await _flutterSecureStorage.read(key: "userData") ?? "";
    Map<String, dynamic> decodedLoggedInUser = jsonDecode(userData);

    String? token = await _flutterSecureStorage.read(key: "token");
    String decodedToken = jsonDecode(token!);
    int userID = decodedLoggedInUser["id"];

    print("decodedLoggedInUser $decodedLoggedInUser");

    if (confirmNewPassword == newPassword) {
      setIsLoading(true);

      // Prepare the request body
      Map<String, dynamic> updatePasswordData = {
        "old_password": _currentPassword,
        "new_password": _newPassword
      };

      var response = await AuthAPI.updatePasswordService(
          updatePasswordRoute, updatePasswordData, decodedToken, userID);
      bool isSuccess = response!.data["success"];

      if (isSuccess) {
        setIsLoading(false);
        _appToastWidget.notification(
            "Password Changed!", response.data["message"], "Success");
        Future.delayed(const Duration(milliseconds: 500), () {
          loginStateController.logoutUser();
        });
      } else {
        setIsLoading(false);
        String errorMessage = response.data["message"];
        _appToastWidget.notification("Oooops!", errorMessage, "Error");
      }
    } else {
      _appToastWidget.notification(
          "Oooops!", "Password confirmation does not match", "Error");
    }
  }

  Future<void> updateProfile() async {
    setIsLoading(true);

    String userData = await _flutterSecureStorage.read(key: "userData") ?? "";
    Map<String, dynamic> decodedLoggedInUser = jsonDecode(userData);

    String? token = await _flutterSecureStorage.read(key: "token");
    String decodedToken = jsonDecode(token!);
    int userID = decodedLoggedInUser["id"];

    // Prepare the request body
    Map<String, dynamic> userUpdateData = {
      "full_name": _fullName,
      "country": _country,
      "phone_number": _phoneNumber
    };

    debugPrint("userUpdateData :::: $userUpdateData");
    debugPrint("decodedToken :::: $decodedToken");

    var response = await AuthAPI.updateUserService(
        updateUserRoute, userUpdateData, decodedToken, userID);

    debugPrint("response :::: $response");

    bool isSuccess = response!.data["success"];

    if (isSuccess) {
      setIsLoading(false);
      _appToastWidget.notification(
          "Profile Updated!", response.data["message"], "Success");

      setUpdateLocalInfo(response.data["data"]);
    } else {
      setIsLoading(false);
      String errorMessage = response.data["message"];
      _appToastWidget.notification("Oooops!", errorMessage, "Error");
    }
  }

  Future<void> deleteUser() async {
    String userData = await _flutterSecureStorage.read(key: "userData") ?? "";
    Map<String, dynamic> decodedLoggedInUser = jsonDecode(userData);

    String? token = await _flutterSecureStorage.read(key: "token");
    String decodedToken = jsonDecode(token!);
    int userID = decodedLoggedInUser["id"];

    print("decodedLoggedInUser $decodedLoggedInUser");

    setIsLoading(true);

    var response = await AuthAPI.deleteUserService(
        deleteUserRoute, decodedToken, userID);
    bool isSuccess = response!.data["success"];

    if (isSuccess) {
      setIsLoading(false);
      _appToastWidget.notification("Account Deleted",
          response.data["message"], "Success");
      Future.delayed(const Duration(milliseconds: 500), () {
        loginStateController.logoutUser();
      });
    } else {
      setIsLoading(false);
      String errorMessage = response.data["message"];
      _appToastWidget.notification("Oooops!", errorMessage, "Error");
    }
  }

  setUpdateLocalInfo(data) async {
    Map<String, dynamic> responseData = data;
    Map<String, dynamic> userData = responseData["user"];
    String token = responseData["token"];
    String encodedUserData = jsonEncode(userData);
    String encodedToken = jsonEncode(token);

    //delete old info
    await _flutterSecureStorage.delete(key: "userData");
    await _flutterSecureStorage.delete(key: "token");

    //set new user info in local
    await _flutterSecureStorage.write(key: "userData", value: encodedUserData);
    await _flutterSecureStorage.write(key: "token", value: encodedToken);

    generalStateController.getCurrentUser();
    Get.offNamed('/homeScreen');
  }

  setProfileInformation() async {
    String userData = await _flutterSecureStorage.read(key: "userData") ?? "";
    Map<String, dynamic> decodedLoggedInUser = jsonDecode(userData);

    fullNameTextController.text = decodedLoggedInUser["full_name"];
    countryTextController.text = decodedLoggedInUser["country"];
    phoneNumberTextController.text = decodedLoggedInUser["phone_number"];

    setCountry(decodedLoggedInUser["country"]);
    setFullName(decodedLoggedInUser["full_name"]);
    setPhoneNumber(decodedLoggedInUser["phone_number"]);
  }
}
