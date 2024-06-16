
import 'package:deeventures/screens/billPayment/widgets/tv_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/bill_payment_state_controller.dart';
import 'airtime_widget.dart';
import 'betting_widget.dart';
import 'electricity_widget.dart';
import 'internet_widget.dart';



class BillDetailsBottomSheetWidget {

  final BillPaymentStateController billPaymentStateController = Get.find<BillPaymentStateController>();

  static void billDetailsBottomSheetWidget() {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    Get.bottomSheet(
      enableDrag: false,
      isDismissible: false,
      isScrollControlled: true,
        GetBuilder<BillPaymentStateController>(builder: (controller) {
          return ConstrainedBox(
              constraints: BoxConstraints(
                  maxHeight: Get.height / 1.3
              ),
              child: Container(
                height: Get.height,
                width: Get.width,
                padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 25.0),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 10.0),

                    //  Close Button.
                    Align(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                          onPressed: () {
                            controller.setCommissionRate(0.0);
                            controller.clearTotalPrice();
                            Get.back();
                          },
                          icon: const Icon(
                            Icons.close,
                            size: 30.0,
                          ),
                        )
                    ),

                    Expanded(
                      flex: 20,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [

                            Text(
                              controller.selectedBillCategory.name.toUpperCase(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.grey.shade700,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            const SizedBox(height: 20.0,),

                            Column(
                              children: [
                                (controller.selectedBillCategory.name == "Airtime") ? (
                                    AirtimeWidget(controller, formKey)
                                ) : (controller.selectedBillCategory.name == "Internet") ? (
                                    InternetWidget(controller, formKey)
                                ) : (controller.selectedBillCategory.name == "Electricity") ? (
                                    ElectricityWidget(controller, formKey)
                                ) : (controller.selectedBillCategory.name == "Cable TV") ? (
                                    TVWidget(controller, formKey)
                                ) : (
                                  BettingWidget(controller, formKey)
                                )

                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
          );
        }
      ),
    );
  }
}