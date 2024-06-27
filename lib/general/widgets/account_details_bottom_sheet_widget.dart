import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/general_state_controller.dart';


class AccountDetailsBottomSheetWidget {

  final GeneralStateController generalStateController = Get.find<GeneralStateController>();

  static void accountDetailsBottomSheetWidget() {
    final formatter = NumberFormat("#,##0");

    Get.bottomSheet(
      enableDrag: false,
      isDismissible: false,
      isScrollControlled: true,
        GetBuilder<GeneralStateController>(builder: (controller) {
          return ConstrainedBox(
              constraints: BoxConstraints(
                  maxHeight: Get.height / 1.7
              ),
              child: Container(
                height: Get.height,
                width: Get.width,
                padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
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
                              "Account Details",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.grey.shade700,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            const SizedBox(height: 20.0,),

                            // Account Number
                            Row(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 35.0,
                                      width: 35.0,
                                      padding: const EdgeInsets.all(8.0),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(14.0),
                                          color: const Color(0xffbebebe)
                                      ),
                                      child: Image.asset(
                                        "assets/images/launcher_icon.png",
                                      ),
                                    ),
                                    const SizedBox(width: 10.0,),

                                    Text(
                                      "Account Number",
                                      style: TextStyle(
                                        color: Colors.grey.shade500,
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    )
                                  ],
                                ),
                                const Spacer(),

                                Text(
                                  "${controller.accountSettings.accountNumber}",
                                  style: TextStyle(
                                    color: Colors.grey.shade700,
                                    fontSize: 13.5,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                              ],
                            ),
                            const Divider(
                              endIndent: 0.0,
                              indent: 0.0,
                              color: Color(0xFFE8E8E8),
                            ),

                            // Account Name
                            Row(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 35.0,
                                      width: 35.0,
                                      padding: const EdgeInsets.all(8.0),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(14.0),
                                          color: const Color(0xffbebebe)
                                      ),
                                      child: Image.asset(
                                        "assets/images/launcher_icon.png",
                                      ),
                                    ),
                                    const SizedBox(width: 10.0,),

                                    Text(
                                      "Account Name",
                                      style: TextStyle(
                                        color: Colors.grey.shade500,
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    )
                                  ],
                                ),
                                const Spacer(),

                                Text(
                                  "Deeventures Nig LTD",
                                  style: TextStyle(
                                    color: Colors.grey.shade700,
                                    fontSize: 13.5,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                              ],
                            ),
                            const Divider(
                              endIndent: 0.0,
                              indent: 0.0,
                              color: Color(0xFFE8E8E8),
                            ),

                            // Bank Name
                            Row(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 35.0,
                                      width: 35.0,
                                      padding: const EdgeInsets.all(8.0),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(14.0),
                                          color: const Color(0xffbebebe)
                                      ),
                                      child: Image.asset(
                                        "assets/images/launcher_icon.png",
                                      ),
                                    ),
                                    const SizedBox(width: 10.0,),

                                    Text(
                                      "Bank",
                                      style: TextStyle(
                                        color: Colors.grey.shade500,
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    )
                                  ],
                                ),
                                const Spacer(),

                                Text(
                                  "${controller.accountSettings.accountBank}",
                                  style: TextStyle(
                                    color: Colors.grey.shade700,
                                    fontSize: 13.5,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                              ],
                            ),
                            const Divider(
                              endIndent: 0.0,
                              indent: 0.0,
                              color: Color(0xFFE8E8E8),
                            ),

                            // Amount
                            Row(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 35.0,
                                      width: 35.0,
                                      padding: const EdgeInsets.all(8.0),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(14.0),
                                          color: const Color(0xffbebebe)
                                      ),
                                      child: Image.asset(
                                        "assets/images/launcher_icon.png",
                                      ),
                                    ),
                                    const SizedBox(width: 10.0,),

                                    Text(
                                      "Amount",
                                      style: TextStyle(
                                        color: Colors.grey.shade500,
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    )
                                  ],
                                ),
                                const Spacer(),

                                Text(
                                  // "₦${formatter.format(controller.amount)}",
                                  "2000",
                                  style: TextStyle(
                                    color: Colors.grey.shade700,
                                    fontFamily: "Roboto",
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                              ],
                            ),
                            const Divider(
                              endIndent: 0.0,
                              indent: 0.0,
                              color: Color(0xFFE8E8E8),
                            ),

                            // Transaction Rate
                            Row(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 35.0,
                                      width: 35.0,
                                      padding: const EdgeInsets.all(8.0),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(14.0),
                                          color: const Color(0xffbebebe)
                                      ),
                                      child: Image.asset(
                                        "assets/images/launcher_icon.png",
                                      ),
                                    ),
                                    const SizedBox(width: 10.0,),

                                    Text(
                                      "Instructions",
                                      style: TextStyle(
                                        color: Colors.grey.shade500,
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    )
                                  ],
                                ),
                                const Spacer(),

                                Text(
                                  "₦${formatter.format(controller.accountSettings.depositInstructions)}",
                                  style: TextStyle(
                                    color: Colors.grey.shade700,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                              ],
                            ),
                            const Divider(
                              endIndent: 0.0,
                              indent: 0.0,
                              color: Color(0xFFE8E8E8),
                            ),

                            //  Upload Proof Button.
                            TextButton(
                              onPressed: () {
                                Get.back();
                              },
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                              ),
                              child: Container(
                                height: 50.0,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7.0),
                                  color: const Color(0XFF07B46B),
                                ),
                                child: const Text(
                                  "Upload Proof",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w600
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 15.0),
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