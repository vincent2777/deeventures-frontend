import 'package:get/get.dart';

import '../../../general/models/user_model.dart';

class DashboardStateController extends GetxController {

  bool _showWalletBalance = true;
  late User _user = User();


  /*
  * GETTERS
  * */
  bool get showWalletBalance => _showWalletBalance;
  User get user => _user;


  /*
  * SETTERS
  * */
  void setShowWalletBalance() {
    _showWalletBalance = !_showWalletBalance;
    update();
  }
  void setUser(User value) {
    _user = value;
    update();
  }
}