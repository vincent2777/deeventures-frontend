import 'package:get/get.dart';

import 'controller/bill_payment_state_controller.dart';
import 'package:flutter/material.dart';

import 'widgets/bills_details_bottom_sheet_widget.dart';

class BillPaymentScreen extends StatelessWidget {
  BillPaymentScreen({Key? key}) : super(key: key);

  final BillPaymentStateController billPaymentStateController = Get.put(BillPaymentStateController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,

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
                "Bill Payment",
                style: TextStyle(
                  color: Colors.grey.shade700,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              centerTitle: true,
            ),

            body: GetBuilder<BillPaymentStateController>(builder: (controller) {
              return SingleChildScrollView(
                child: Container(
                  height: Get.height,
                  width: Get.width,
                  color: Colors.grey.shade100,
                  padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20.0),
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1,
                      mainAxisSpacing: 20.0,
                      crossAxisSpacing: 20.0
                    ),
                    itemCount: controller.billCategories.length,

                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          (controller.billCategories[index].name == "Airtime") ? (
                              controller.getAirtimeServiceProviders()
                          ) : (controller.billCategories[index].name == "Internet") ? (
                              controller.getInternetServiceProviders()
                          ) : (controller.billCategories[index].name == "Electricity") ? (
                              controller.getElectricCompanies()
                          ) : (controller.billCategories[index].name == "Cable TV") ? (
                              controller.getCableTVs(),
                          ) : (
                              controller.getBettingCompanies()
                          );
                          controller.setSelectedBillCategory(controller.billCategories[index]);
                          BillDetailsBottomSheetWidget.billDetailsBottomSheetWidget();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade300,
                                blurRadius: 7.0,
                                offset: const Offset(0, 2),
                                spreadRadius: 0.3,
                              )
                            ]
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                controller.billCategories[index].image,
                                height: 60.0,
                              ),
                              const SizedBox(height: 10.0),

                              Text(
                                controller.billCategories[index].name,
                                style: TextStyle(
                                    color: Colors.grey.shade700,
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.w600
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              );
            }),
        ),
    );
  }
}
