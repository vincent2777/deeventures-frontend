
import 'package:get/get.dart';


class SettingStateController extends GetxController {

  bool _isLoading = false;


  /*
  * Getters
  **/
bool get isLoading => _isLoading;


  /*
  * Setters
  **/
  void setIsLoading(bool value) {
    _isLoading = value;
    update();
  }

}