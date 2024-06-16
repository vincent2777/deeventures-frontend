import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'controllers/onboarding_state_controller.dart';
import 'onboarding_page.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});

  final OnboardingStateController onboardingStateController = Get.put(OnboardingStateController());

  final List<OnboardingPage> _pages = [
    const OnboardingPage(onboardingImage: "assets/images/boarding_01.png", onboardingTextOne: "Welcome to", onboardingTextTwo: "Deeventures"),
    const OnboardingPage(onboardingImage: "assets/images/boarding_02.png", onboardingTextOne: "Transaction", onboardingTextTwo: "Security"),
    const OnboardingPage(onboardingImage: "assets/images/boarding_03.png", onboardingTextOne: "Fast and Reliable", onboardingTextTwo: "")
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<OnboardingStateController>(builder: (controller) {
        return Scaffold(
          extendBody: true,
          extendBodyBehindAppBar: true,

          appBar: AppBar(
            elevation: 0,
            toolbarHeight: 50.0,
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 5.0),
                child: TextButton(
                  onPressed: () {
                    controller.handleSkip();
                  },
                  child: const Text(
                    "Skip",
                    style: TextStyle(
                      color: Color(0XFFFFFFFF),
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            ],
          ),

          body: Stack(
            children: [
              Container(
                height: Get.height,
                width: Get.width,
                padding: const EdgeInsets.only(top: 56.0),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment(0, 0.26),
                    end: Alignment(1, 0.07),
                    colors: [Color(0XFF0E6C44), Color(0XFF07B46B)],
                  ),
                ),
                child: _pages[controller.currentPage],
              ),


              // Onboarding Indicator and Next Button
              Positioned(
                left: 0.0,
                right: 0.0,
                bottom: 70.0,
                child: Container(
                  padding: const EdgeInsets.only(left: 30.0, right: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 5.0,
                            width: controller.currentPage == 0 ? 20.0 : 12.0,
                            decoration: BoxDecoration(
                                color: Color(controller.currentPage == 0 ? 0XFFF5C249 : 0XFFFFFFFF),
                                borderRadius: BorderRadius.circular(2.0)
                            ),
                          ),
                          const SizedBox(width: 5.0),

                          Container(
                            height: 5.0,
                            width: controller.currentPage == 1 ? 20.0 : 12.0,
                            decoration: BoxDecoration(
                                color: Color(controller.currentPage == 1 ? 0XFFF5C249 : 0XFFFFFFFF),
                                borderRadius: BorderRadius.circular(2.0)
                            ),
                          ),
                          const SizedBox(width: 5.0),

                          Container(
                            height: 5.0,
                            width: controller.currentPage == 2 ? 20.0 : 12.0,
                            decoration: BoxDecoration(
                                color: Color(controller.currentPage == 2 ? 0XFFF5C249 : 0XFFFFFFFF),
                                borderRadius: BorderRadius.circular(2.0)
                            ),
                          ),
                        ],
                      ),

                      IconButton(
                        onPressed: () {
                          controller.handleNextPage();
                        },
                        icon: controller.currentPage != 2 ? Container(
                          height: 45.0,
                          width: 45.0,
                          padding: EdgeInsets.zero,
                          decoration: BoxDecoration(
                            color: const Color(0XFFF5C249),
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          child: Icon(
                            Iconsax.arrow_circle_right,
                            color: Colors.green.shade900,
                            size: 27.0,
                          ),
                        ) : Container(
                            height: 45.0,
                            width: 140.0,
                            padding: EdgeInsets.zero,
                            decoration: BoxDecoration(
                              color: const Color(0XFFF5C249),
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Get Started",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500
                                  ),
                                ),
                                const SizedBox(width: 5.0),

                                Icon(
                                  Iconsax.arrow_circle_right,
                                  color: Colors.green.shade900,
                                  size: 27.0,
                                ),
                              ],
                            )
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
