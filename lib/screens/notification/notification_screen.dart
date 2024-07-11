import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/notification_state_controller.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({super.key});

  final NotificationStateController notificationStateController = Get.put(NotificationStateController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.chevron_left_outlined),
        ),

        title: Text(
          "Notifications",
          style: TextStyle(
            color: Colors.grey.shade700,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),

      body: GetBuilder<NotificationStateController>(builder: (controller) {
        return Container(
          height: Get.height,
          width: Get.width,
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 25.0),
        );
      }),
    );
  }
}
