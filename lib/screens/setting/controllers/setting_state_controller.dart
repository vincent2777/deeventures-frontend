import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

import '../../../general/widgets/app_toast_widget.dart';
import '../../../routes/api_routes/api_route_names.dart';
import '../apis/setting_api.dart';
import '../models/setting_model.dart';

class SettingStateController extends GetxController {

  Settings _settings = Settings();
  bool _isLoading = false;
  final FlutterSecureStorage _flutterSecureStorage = const FlutterSecureStorage();
  final AppToastWidget _appToastWidget = AppToastWidget();


  /*
  * Getters
  **/
Settings get settings => _settings;
bool get isLoading => _isLoading;


  /*
  * Setters
  **/
  void setSettings(Settings value) {
    _settings = value;
    update();
  }
  void setIsLoading(bool value) {
    _isLoading = value;
    update();
  }


  @override
  void onInit() {
    getSettings();
    super.onInit();
  }

  Future<void> getSettings() async {
    setIsLoading(true);

    String? token = await _flutterSecureStorage.read(key: "token");
    String decodedToken = jsonDecode(token!);

    var response = await SettingAPI.getSettingService(getSettingRoute, decodedToken);
    bool isSuccess = response!.data["success"];
    // String message = response.data["message"];

    if (isSuccess) {
      setIsLoading(false);

      Map<String, dynamic> settingsData = response.data["data"]["settings"];
      setSettings(settingFromJson(settingsData));
      debugPrint("SETTINGS DATA:::: $settingsData");
    } else {
      setIsLoading(false);
      String errorMessage = response.data["message"];
      _appToastWidget.notification("Oooops!", errorMessage, "Error");
    }
  }
}