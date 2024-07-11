import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

import '../../../general/widgets/app_toast_widget.dart';

class MakeMoneyStateController extends GetxController {

  String _username = "";
  final AppToastWidget _appToastWidget = AppToastWidget();

  final FlutterSecureStorage _flutterSecureStorage = const FlutterSecureStorage();

  /*
  * GETTERS
  * */
  String get username => _username;
  AppToastWidget get appToastWidget => _appToastWidget;


  /*
  * SETTERS
  * */
  void setUsername(String value) {
    _username = value;
    update();
  }

  void getUserDetails() async{
    String? data = await _flutterSecureStorage.read(key: "userData");
    if(data !=null){
      var decodeData =  jsonDecode(data);
      setUsername(decodeData["username"]);
      print("user data ooo $data");
    }
  }

}