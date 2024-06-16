
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_routes/app_route_names.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 2),
      () => Get.offNamed(onboardingScreen),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
      decoration: const BoxDecoration(
        color: Color(0XFF0E6C44),
      ),
      child: Center(
        child: Image.asset(
          "assets/images/img_logo.png",
          alignment: Alignment.bottomCenter,
          scale: 1.2,
        ),
      ),
    );
  }
}


/*

AnimatedSplashScreen.withScreenFunction(
  splash: 'images/splash.png',
  screenFunction: () async{
    return MainScreen();
  },
  splashTransition: SplashTransition.rotationTransition,
  pageTransitionType: PageTransitionType.scale,
)

AnimatedSplashScreen(
  splash: Image.asset("assets/images/app_logo.png"),
  nextScreen: const LoginScreen(),
  splashTransition: SplashTransition.scaleTransition,
  backgroundColor: const Color.fromRGBO(254,117,23, 1),
  splashIconSize: 150.0,
  animationDuration: const Duration(seconds: 1),
  duration: 50000,
),






* */