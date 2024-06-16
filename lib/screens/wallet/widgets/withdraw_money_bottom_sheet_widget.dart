
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/wallet_state_controller.dart';



class WithdrawMoneyBottomSheetWidget {

  final WalletStateController walletStateController = Get.find<WalletStateController>();

  static void withdrawMoneyBottomSheetWidget() {
    final formatter = NumberFormat("#,##0");

    Get.bottomSheet(
      enableDrag: false,
      isDismissible: false,
      isScrollControlled: true,
        GetBuilder<WalletStateController>(builder: (controller) {
          return ConstrainedBox(
              constraints: BoxConstraints(
                  maxHeight: Get.height / 1.4
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
                            Get.back();
                          },
                          icon: const Icon(
                            Icons.close,
                            size: 30.0,
                          ),
                        )
                    ),

                    /*Expanded(
                      flex: 20,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [

                            Text(
                              "Transaction Details",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.grey.shade700,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            const SizedBox(height: 20.0,),

                            // Transaction Type
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
                                      "Transaction Type",
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
                                  "${controller.transaction.trnxType}",
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

                            // Transaction Amount
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
                                      "Transaction Amount",
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
                                  "₦${formatter.format(controller.transaction.trnxAmount!)}",
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
                                      "Transaction Rate",
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
                                  "₦${formatter.format(controller.transaction.trnxRate!)}",
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

                            // Amount To Receive
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
                                      "Amount To Receive",
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
                                  formatter.format(controller.transaction.toReceive!),
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

                            // Date | Time
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                      "Date|Time",
                                      style: TextStyle(
                                          color: Colors.grey.shade500
                                      ),
                                    )
                                  ],
                                ),

                                Text(
                                  "${DateFormat("dd/MM/yyyy").format(controller.transaction.trnxDate!)} | ${DateFormat("hh:mm a").format(controller.transaction.trnxDate!)}",
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

                            // Transaction Reference
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                      "Transaction Ref",
                                      style: TextStyle(
                                        color: Colors.grey.shade500,
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),

                                Text(
                                  controller.transaction.trnxReference!,
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

                            (controller.transaction.trnxType == "Coin Sale" || controller.transaction.trnxType == "Coin Purchase") ? (
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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

                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Wallet Address:",
                                              style: TextStyle(
                                                color: Colors.grey.shade500,
                                                fontSize: 12.0,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),

                                            Text(
                                              controller.transaction.trnxAddress!,
                                              style: TextStyle(
                                                color: Colors.grey.shade700,
                                                fontSize: 12.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                            ) : (controller.transaction.trnxType == "Gift Card Sale") ? (
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                          "Gift Card ID:",
                                          style: TextStyle(
                                            color: Colors.grey.shade500,
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Spacer(),

                                    Text(
                                      controller.transaction.trnxAddress!,
                                      style: TextStyle(
                                        color: Colors.grey.shade700,
                                        fontSize: 13.5,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                )
                            ) : (controller.transaction.trnxType == "Bill Payment") ? (
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                          "Meter Number:",
                                          style: TextStyle(
                                            color: Colors.grey.shade500,
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Spacer(),

                                    Text(
                                      controller.transaction.trnxAddress!,
                                      style: TextStyle(
                                        color: Colors.grey.shade700,
                                        fontSize: 13.5,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                )
                            ) : (controller.transaction.trnxType == "Wallet Funding") ? (
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                          "Wallet ID:",
                                          style: TextStyle(
                                            color: Colors.grey.shade500,
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Spacer(),

                                    Text(
                                      controller.transaction.trnxAddress!,
                                      style: TextStyle(
                                        color: Colors.grey.shade700,
                                        fontSize: 13.5,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                )
                            ) : (
                                const SizedBox()
                            ),
                            const Divider(
                              endIndent: 0.0,
                              indent: 0.0,
                              color: Color(0xFFE8E8E8),
                            ),

                            // Transaction Status
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
                                      "Status",
                                      style: TextStyle(
                                        color: Colors.grey.shade500,
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    )
                                  ],
                                ),
                                const Spacer(),

                                Container(
                                  padding: const EdgeInsets.fromLTRB(10.0, 2.0, 10.0, 4.0),
                                  decoration: BoxDecoration(
                                      color: (controller.transaction.trnxStatus == 0)
                                          ? const Color(0xffE0E0E0)
                                          : (controller.transaction.trnxStatus == 1)
                                          ? const Color(0xffe9ffe7)
                                          : (const Color(0xffFFDCDC)),
                                      borderRadius: BorderRadius.circular(10.0)
                                  ),
                                  child: Text(
                                    (controller.transaction.trnxStatus == 0)
                                        ? "Pending"
                                        : (controller.transaction.trnxStatus == 1)
                                        ? "Approved"
                                        : "Declined",
                                    style: TextStyle(
                                      color: (controller.transaction.trnxStatus! == 0)
                                          ? const Color(0xff797979)
                                          : (controller.transaction.trnxStatus! == 1)
                                          ? const Color(0xff0CA100)
                                          : (const Color(0xffDD2E44)
                                      ),
                                      fontSize: 10.0,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 25.0),

                            //  Upload Proof Button.
                            Visibility(
                              visible: controller.transaction.trnxType == "Coin Sale" && controller.transaction.trnxStatus == 0 && controller.transaction.trnxImage!.isEmpty,
                              child: TextButton(
                                onPressed: () {
                                  Get.back();
                                  UploadImageBottomSheetWidget.uploadImageBottomSheetWidget();
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
                            ),
                            const SizedBox(height: 15.0),
                          ],
                        ),
                      ),
                    )*/
                  ],
                ),
              )
          );
        }
      ),
    );
  }
}