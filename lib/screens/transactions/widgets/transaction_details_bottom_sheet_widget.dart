
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../utils/colors.dart';
import '../controllers/transactions_state_controller.dart';
import 'upload_image_bottom_sheet_widget.dart';


class TransactionDetailsBottomSheetWidget {

  final TransactionsStateController transactionsStateController = Get.find<TransactionsStateController>();

  static void transactionDetailsBottomSheetWidget() {
    final formatter = NumberFormat("#,##0");

    Get.bottomSheet(
      enableDrag: false,
      isDismissible: false,
      isScrollControlled: true,
        GetBuilder<TransactionsStateController>(builder: (controller) {
          return ConstrainedBox(
              constraints: BoxConstraints(
                  maxHeight: Get.height / 1.4
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
                              "Transaction Details",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.grey.shade700,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            const SizedBox(height: 30.0,),

                            // Transaction Type
                            Row(
                              children: [
                                Row(
                                  children: [
                                    const Icon(Icons.bar_chart,size: 18,),
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
                            const SizedBox(height: 10,),

                            const Divider(
                              endIndent: 0.0,
                              indent: 0.0,
                              color: Color(0xFFE8E8E8),
                            ),
                            const SizedBox(height: 10,),

                            // Transaction Amount
                            Row(
                              children: [
                                Row(
                                  children: [
                                    const Icon(Icons.money,size: 18,),
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
                            const SizedBox(height: 10,),

                            const Divider(
                              endIndent: 0.0,
                              indent: 0.0,
                              color: Color(0xFFE8E8E8),
                            ),
                            const SizedBox(height: 10,),

                            // Transaction Rate
                            Row(
                              children: [
                                Row(
                                  children: [
                                    const Icon(Icons.percent,size: 18,),
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
                            const SizedBox(height: 10,),

                            const Divider(
                              endIndent: 0.0,
                              indent: 0.0,
                              color: Color(0xFFE8E8E8),
                            ),
                            const SizedBox(height: 10,),

                            // Amount To Receive
                            Row(
                              children: [
                                Row(
                                  children: [
                                    const Icon(Icons.arrow_circle_down_sharp,size: 18,),
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
                                  "₦${formatter.format(controller.transaction.toReceive!)}",
                                  style: TextStyle(
                                    color: Colors.grey.shade700,
                                    fontFamily: "Roboto",
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 10,),

                            const Divider(
                              endIndent: 0.0,
                              indent: 0.0,
                              color: Color(0xFFE8E8E8),
                            ),
                            const SizedBox(height: 10,),

                            // Date | Time
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    const Icon(Icons.calendar_month,size: 18,),
                                    const SizedBox(width: 10.0,),

                                    Text(
                                      "Date",
                                      style: TextStyle(
                                        color: Colors.grey.shade500,
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w400,
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
                            const SizedBox(height: 10,),

                            const Divider(
                              endIndent: 0.0,
                              indent: 0.0,
                              color: Color(0xFFE8E8E8),
                            ),
                            const SizedBox(height: 10,),


                            // Transaction Reference
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    const Icon(Icons.pin,size: 18,),
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
                            const SizedBox(height: 10,),

                            const Divider(
                              endIndent: 0.0,
                              indent: 0.0,
                              color: Color(0xFFE8E8E8),
                            ),
                            const SizedBox(height: 10,),


                            (controller.transaction.trnxType == "Coin Sell") ? (
                                Row(
                                  children: [
                                    const Icon(Icons.wallet,size: 18,),
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

                                        SizedBox(
                                          width: Get.width - 90.0,
                                          child: Text(
                                            controller.transaction.trnxAddress!,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              color: Colors.grey.shade700,
                                              fontSize: 11.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                )
                            ) : (controller.transaction.trnxType == "Gift Card Sell") ? (
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(Icons.wallet_giftcard,size: 18,),

                                        const SizedBox(width: 10.0,),

                                        Text(
                                          "Gift Card:",
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
                                        const Icon(Icons.numbers,size: 18,),
                                        const SizedBox(width: 10.0,),

                                        Text(
                                          "Number:",
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
                                        const Icon(Icons.wallet,size: 18,),

                                        const SizedBox(width: 10.0,),

                                        Text(
                                          "Wallet:",
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
                            const SizedBox(height: 10,),

                            const Divider(
                              endIndent: 0.0,
                              indent: 0.0,
                              color: Color(0xFFE8E8E8),
                            ),
                            const SizedBox(height: 10,),


                            // Transaction Status
                            Row(
                              children: [
                                Row(
                                  children: [
                                    const Icon(Icons.query_stats,size: 18,),
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
                              visible: controller.transaction.trnxType == "Coin Sell" && controller.transaction.trnxStatus == 0 && controller.transaction.trnxImage!.isEmpty,
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
                                    color: mainGreen,
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