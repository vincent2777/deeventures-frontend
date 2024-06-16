import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/promo_state_controller.dart';

class PromoScreen extends StatelessWidget {
  PromoScreen({super.key});

  final PromoStateController promoStateController = Get.put(PromoStateController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Image.asset(
            "assets/images/arrow_back.png",
            height: 17.0,
            width: 30.0,
            color: Colors.grey.shade700,
          ),
        ),

        title: Text(
          "Promo Codes",
          style: TextStyle(
            color: Colors.grey.shade700,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),

      body: GetBuilder<PromoStateController>(builder: (controller) {
          return Container(
            height: Get.height,
            width: Get.width,
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 25.0),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image.asset(
                    "assets/images/promo.png",
                    height: 420.0,
                    width: Get.width,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 20.0),

                Text(
                  "Coming soon...",
                  style: TextStyle(
                      color: Colors.grey.shade700,
                      fontWeight: FontWeight.w600
                  ),
                ),
              ],
            ),
          );
        }
      ),
    );
  }
}
