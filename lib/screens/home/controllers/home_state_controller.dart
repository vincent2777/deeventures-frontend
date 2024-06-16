import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

import '../../../general/models/user_model.dart';

class HomeStateController extends GetxController {

  int _selectedBottomBarIndex = 0;
  final double _walletBalance = 0.0;
  User _user = User();
  final FlutterSecureStorage _flutterSecureStorage = const FlutterSecureStorage();
  // final DashboardStateController _dashboardStateController = Get.put(DashboardStateController());


  /*
  * GETTERS
  * */
  int get selectedBottomBarIndex => _selectedBottomBarIndex;
  double get walletBalance => _walletBalance;
  User get user => _user;


  /*
  * SETTERS
  * */
  void setSelectedBottomBarIndex(int value) {
    _selectedBottomBarIndex = value;
    update();
  }
  void setUser(User value) {
    _user = value;
    update();
  }

  @override
  void onInit() async {
    // await getCurrentUser();
    super.onInit();
  }

  Future<void> getCurrentUser() async {
    String userData = await _flutterSecureStorage.read(key: "userData") ?? "";

    //  Decode userData
    if (userData.isNotEmpty) {
      Map<String, dynamic> decodedLoggedInUser = jsonDecode(userData);
      setUser(userFromJson(decodedLoggedInUser));
      // _dashboardStateController.setUser(userFromJson(decodedLoggedInUser));
      // debugPrint("USER::: $userData");
    }
  }
}