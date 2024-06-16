import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class AppToastWidget {
  notification(String title, String message, String messageType) {
    return Get.snackbar(
      title,
      message,
      titleText: Text(
        title,
        style: TextStyle(
          color: (messageType == "Success")
              ? const Color.fromRGBO(1, 93, 8, 0.5)
              : (messageType == "Warning")
              ? const Color.fromRGBO(255, 90, 4, 0.5)
              : (messageType == "Error")
              ? const Color.fromRGBO(255, 22, 22, 0.5)
              : const Color.fromRGBO(0, 111, 255, 0.5),
          fontWeight: FontWeight.w600
        ),
      ),
      barBlur: 10.0,
      colorText: (messageType == "Success")
          ? const Color.fromRGBO(1, 93, 8, 1.0)
          : (messageType == "Warning")
          ? const Color.fromRGBO(255, 90, 4, 1.0)
          : (messageType == "Error")
          ? const Color.fromRGBO(255, 22, 22, 1.0)
          : const Color.fromRGBO(0, 111, 255, 1.0),
      borderRadius: 10.0,
      backgroundColor: (messageType == "Success")
          ? const Color.fromRGBO(1, 93, 8, 0.2)
          : (messageType == "Warning")
          ? const Color.fromRGBO(255, 145, 92, 0.2)
          : (messageType == "Error")
          ? const Color.fromRGBO(255, 91, 91, 0.2)
          : const Color.fromRGBO(0, 111, 255, 0.2),
      duration: const Duration(seconds: 8),
      forwardAnimationCurve: Curves.bounceInOut,
      icon: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Icon(
          (messageType == "Success")
              ? Iconsax.like
              : (messageType == "Warning")
              ? Iconsax.warning_2
              : (messageType == "Error")
              ? Iconsax.dislike //warning_2
              : Iconsax.info_circle,
          color: (messageType == "Success")
              ? const Color.fromRGBO(1, 93, 8, 0.5)
              : (messageType == "Warning")
              ? const Color.fromRGBO(255, 90, 4, 0.5)
              : (messageType == "Error")
              ? const Color.fromRGBO(255, 22, 22, 0.5)
              : const Color.fromRGBO(0, 111, 255, 0.5),
        ),
      ),
      leftBarIndicatorColor: (messageType == "Success")
          ? const Color.fromRGBO(1, 93, 8, 1.0)
          : (messageType == "Warning")
          ? const Color.fromRGBO(255, 90, 4, 1.0)
          : (messageType == "Error")
          ? const Color.fromRGBO(255, 22, 22, 1.0)
          : const Color.fromRGBO(0, 111, 255, 1.0),
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0),
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}