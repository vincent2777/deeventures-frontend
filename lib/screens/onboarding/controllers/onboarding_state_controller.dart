import 'package:get/get.dart';

import '../../../routes/app_routes/app_route_names.dart';

class OnboardingStateController extends GetxController {
  int _currentPage = 0;

  /*
  * GETTERS
  * */
  int get currentPage => _currentPage;

  /*
  * SETTERS
  * */
  void setCurrentPage() {
    _currentPage ++;
    update();
  }

  void handleSkip() {
    Get.toNamed(loginScreen);
  }

  void handleNextPage() {
    if (_currentPage < 2) {
      setCurrentPage();
    } else {
      Get.toNamed(loginScreen);
    }
  }
}