import 'dart:convert';

import 'package:deeventures/general/apis/general_api.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

import '../../routes/api_routes/api_route_names.dart';
import '../models/setting_model.dart';
import '../models/user_model.dart';
import '../widgets/app_toast_widget.dart';

class GeneralStateController extends GetxController {

  User _user = User();
  AccountSettings _accountSettings = AccountSettings();
  bool _isLoading = false;
  final FlutterSecureStorage _flutterSecureStorage = const FlutterSecureStorage();
  final AppToastWidget _appToastWidget = AppToastWidget();

  /*
  * GETTERS
  * */
  User get user => _user;
  AccountSettings get accountSettings => _accountSettings;
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
}