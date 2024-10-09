import 'dart:convert';
import 'dart:io';

import 'package:deeventures/general/apis/general_api.dart';
import 'package:deeventures/screens/auths/apis/auth_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../routes/api_routes/api_route_names.dart';
import '../../routes/app_routes/app_route_names.dart';
import '../models/setting_model.dart';
import '../models/user_model.dart';
import '../widgets/app_toast_widget.dart';

class GeneralStateController extends GetxController {

  User _user = User();
  AccountSettings _accountSettings = AccountSettings();
  File? _pickedFile;
  bool _isLoading = false;
  final ImagePicker _imagePicker = ImagePicker();
  final FlutterSecureStorage _flutterSecureStorage = const FlutterSecureStorage();
  final AppToastWidget _appToastWidget = AppToastWidget();

  /*
  * GETTERS
  * */
  User get user => _user;
  AccountSettings get accountSettings => _accountSettings;
  File? get pickedFile => _pickedFile;
  bool get isLoading => _isLoading;


  /*
  * SETTERS
  * */
  void setUser(User value) {
    _user = value;
    update();
  }
  void setAccountSettings(AccountSettings value) {
    _accountSettings = value;
    update();
  }
  void setIsLoading(bool value) {
    _isLoading = value;
    update();
  }


  @override
  void onInit() async {
    await getCurrentUser();
    await getAccountSettings();
    super.onInit();
  }

  Future<void> getCurrentUser() async {
    String userData = await _flutterSecureStorage.read(key: "userData") ?? "";

    //  Decode userData
    if (userData.isNotEmpty) {
      Map<String, dynamic> decodedLoggedInUser = jsonDecode(userData);
      setUser(userFromJson(decodedLoggedInUser));
    }
  }

  Future<void> getAccountSettings() async {
    setIsLoading(true);

    String? token = await _flutterSecureStorage.read(key: "token");
    String decodedToken = jsonDecode(token!);

    var response = await GeneralAPI.getAccountSettingService(getAccountSettingRoute, decodedToken);
    bool isSuccess = response!.data["success"];
    // String message = response.data["message"];

    if (isSuccess) {
      setIsLoading(false);

      Map<String, dynamic> accountSettingsData = response.data["data"]["settings"];
      setAccountSettings(settingFromJson(accountSettingsData));
      // debugPrint("SETTINGS DATA:::: $accountSettingsData");
    } else {
      setIsLoading(false);
      String errorMessage = response.data["message"];
      _appToastWidget.notification("Oooops!", errorMessage, "Error");
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
        // debugPrint("FILE PATH::: $filePath");
        return uploadUserProfileImage(filePath);
      }
      return _appToastWidget.notification("Oooops!", "No image selected.", "Error");
    } on PlatformException catch (e) {
      throw Exception(e);
    }
  }

  // Upload Transaction Proof
  Future<void> uploadUserProfileImage(File filePath) async {
    setIsLoading(true);

    String userData = await _flutterSecureStorage.read(key: "userData") ?? "";
    Map<String, dynamic> decodedLoggedInUser = jsonDecode(userData);

    String? token = await _flutterSecureStorage.read(key: "token");
    String decodedToken = jsonDecode(token!);
    String userID = decodedLoggedInUser["id"].toString();
    String imageFile = filePath.path;

    var response = await AuthAPI.uploadUserProfileImageService(uploadProfileImageRoute, userID, imageFile ,decodedToken);
    bool isSuccess = response!.data["success"];
    String message = response.data["message"];

    if (isSuccess) {
      setIsLoading(false);

      if (response.data["data"] == null) {
        _appToastWidget.notification("Note!", message, "Warning");
        return;
      }

      Map<String, dynamic> responseData = response.data["data"];
      Map<String, dynamic> userData = responseData["user"];
      String encodedUserData = jsonEncode(userData);

      // Save updated user data to Flutter Secure Storage
      await _flutterSecureStorage.write(key: "userData", value: encodedUserData);
      setUser(userFromJson(userData));

      _appToastWidget.notification("Congratulation!", message, "Success");
      Get.back();
    } else {
      setIsLoading(false);
      String errorMessage = response.data["message"];
      _appToastWidget.notification("Oooops!!!", errorMessage, "Error");
    }
  }


  //  Logout User.
  Future<void> logoutUser() async {
    bool isUserSaved = await _flutterSecureStorage.containsKey(key: "userData");
    bool isTokenSaved = await _flutterSecureStorage.containsKey(key: "token");

    if (isUserSaved) {
      await _flutterSecureStorage.delete(key: "userData");
      Get.offAllNamed("/loginScreen");
    }
    if (isTokenSaved) {
      await _flutterSecureStorage.delete(key: "token");
      Get.offAllNamed("/loginScreen");
    }
  }
}
