import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/customer_support_state_controller.dart';

class CustomerSupportScreen extends StatelessWidget {
  CustomerSupportScreen({super.key});

  final CustomerSupportStateController customerSupportStateController = Get.put(CustomerSupportStateController());

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
          "Customer Support",
          style: TextStyle(
            color: Colors.grey.shade700,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),

      body: GetBuilder<CustomerSupportStateController>(builder: (controller) {
        return Container(
          height: Get.height,
          width: Get.width,
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Available 24/7",
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600
                ),
              ),
              const SizedBox(height: 5.0),

              SizedBox(
                height: 80.0,
                width: Get.width,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 1
                  ),
                  itemCount: controller.contacts.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: Image.asset(
                            controller.contacts[index].icon,
                            height: 50.0,
                            width: 50.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Text(
                          controller.contacts[index].title,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              const SizedBox(height: 20.0),

              const Text(
                "Follow Deeventures",
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600
                ),
              ),
              const SizedBox(height: 5.0),

              SizedBox(
                height: 250.0,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1
                  ),
                  itemCount: controller.socialMedia.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: Image.asset(
                            controller.socialMedia[index].icon,
                            height: 50.0,
                            width: 50.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Text(
                          controller.socialMedia[index].title,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              const SizedBox(height: 20.0),
            ],
          ),
        );
      }),
    );
  }
}
