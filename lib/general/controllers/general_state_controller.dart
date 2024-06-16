import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

import '../models/user_model.dart';

class GeneralStateController extends GetxController {

  User _user = User();
  bool _isLoading = false;
  final FlutterSecureStorage _flutterSecureStorage = const FlutterSecureStorage();


  /*
  * GETTERS
  * */
  User get user => _user;
  bool get isLoading => _isLoading;


  /*
  * SETTERS
  * */
  void setUser(User value) {
    _user = value;
    update();
  }
  void setIsLoading(bool value) {
    _isLoading = value;
    update();
  }


  @override
  void onInit() async {
    await getCurrentUser();
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
}