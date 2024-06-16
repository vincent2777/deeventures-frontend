import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/onboarding_state_controller.dart';

class OnboardingPage extends StatelessWidget {
  final String onboardingImage;
  final String onboardingTextOne;
  final String onboardingTextTwo;

  const OnboardingPage({
    super.key,
    required this.onboardingImage,
    required this.onboardingTextOne,
    required this.onboardingTextTwo,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnboardingStateController>(builder: (controller) {
        return Container(
          width: Get.width,
          padding: const EdgeInsets.symmetric(vertical: 40.0),
          child: Column(
            children: [
              Image.asset(
                onboardingImage,
                height: 400.0,
                width: 400.0,
              ),
              const SizedBox(height: 40.0),

              // Onboarding Text
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: Get.width,
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        onboardingTextOne,
                        style: const TextStyle(
                          color: Color(0XFFFFFFFF),
                          fontSize: 28.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      Text(
                          onboardingTextTwo,
                          style: TextStyle(
                            color: Color(controller.currentPage == 0 ? 0XFFF5C249 : 0XFFFFFFFF),
                            fontSize: 28.0,
                            fontWeight: FontWeight.w600,
                          )
                      ),
                    ],
                  )
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}
