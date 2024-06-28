
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/wallet_state_controller.dart';



class WithdrawMoneyBottomSheetWidget {

  final WalletStateController walletStateController = Get.find<WalletStateController>();

  static void withdrawMoneyBottomSheetWidget() {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final formatter = NumberFormat("#,##0");

    Get.bottomSheet(
      enableDrag: false,
      isDismissible: false,
      isScrollControlled: true,
      GetBuilder<WalletStateController>(builder: (controller) {
        return (!controller.showWithdrawalDetails) ? (
            ConstrainedBox(
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

                      Expanded(
                        flex: 20,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Text(
                                "Withdraw Money",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.grey.shade700,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              const SizedBox(height: 30.0,),

                              GetBuilder<WalletStateController>(builder: (controller) {
                                return Form(
                                  key: formKey,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      // Account Number
                                      Text(
                                        "Account Number",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.grey.shade800,
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const SizedBox(height: 10.0,),
                                      TextFormField(
                                        onChanged: (value) {
                                          controller.setAccountNumber(value);
                                        },
                                        keyboardType: TextInputType.number,
                                        validator: ValidationBuilder().required().build(),
                                        autovalidateMode: controller.autoValidateMode,
                                        decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(8.0),
                                            borderSide: BorderSide(
                                              color: Colors.grey.shade300,
                                              width: 1,
                                            ),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(8.0),
                                            borderSide: const BorderSide(
                                              color: Color(0xFFFF9191),
                                              width: 1,
                                            ),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(8.0),
                                            borderSide: const BorderSide(
                                              color: Color(0XFF07B46B),
                                              width: 2.0,
                                            ),
                                          ),
                                          focusedErrorBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(5.0),
                                            borderSide: const BorderSide(
                                              color: Color(0xFFFF9191),
                                              width: 2.0,
                                            ),
                                          ),
                                          contentPadding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 0.0),
                                          filled: true,
                                          fillColor: Colors.white,
                                          hintText: "Enter account number",
                                          hintStyle: TextStyle(
                                            color: Colors.grey.shade400,
                                            fontSize: 14.0,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 20.0),

                                      // Account Name
                                      Text(
                                        "Account Name",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.grey.shade800,
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const SizedBox(height: 10.0,),
                                      TextFormField(
                                        onChanged: (value) {
                                          controller.setAccountName(value);
                                        },
                                        keyboardType: TextInputType.text,
                                        validator: ValidationBuilder().required().build(),
                                        autovalidateMode: controller.autoValidateMode,
                                        decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(8.0),
                                            borderSide: BorderSide(
                                              color: Colors.grey.shade300,
                                              width: 1,
                                            ),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(8.0),
                                            borderSide: const BorderSide(
                                              color: Color(0xFFFF9191),
                                              width: 1,
                                            ),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(8.0),
                                            borderSide: const BorderSide(
                                              color: Color(0XFF07B46B),
                                              width: 2.0,
                                            ),
                                          ),
                                          focusedErrorBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(5.0),
                                            borderSide: const BorderSide(
                                              color: Color(0xFFFF9191),
                                              width: 2.0,
                                            ),
                                          ),
                                          contentPadding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 0.0),
                                          filled: true,
                                          fillColor: Colors.white,
                                          hintText: "Enter account name",
                                          hintStyle: TextStyle(
                                            color: Colors.grey.shade400,
                                            fontSize: 14.0,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 20.0),

                                      // Bank Name
                                      Text(
                                        "Bank Name",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.grey.shade800,
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const SizedBox(height: 10.0,),
                                      TextFormField(
                                        onChanged: (value) {
                                          controller.setBankName(value);
                                        },
                                        keyboardType: TextInputType.text,
                                        validator: ValidationBuilder().required().build(),
                                        autovalidateMode: controller.autoValidateMode,
                                        decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(8.0),
                                            borderSide: BorderSide(
                                              color: Colors.grey.shade300,
                                              width: 1,
                                            ),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(8.0),
                                            borderSide: const BorderSide(
                                              color: Color(0xFFFF9191),
                                              width: 1,
                                            ),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(8.0),
                                            borderSide: const BorderSide(
                                              color: Color(0XFF07B46B),
                                              width: 2.0,
                                            ),
                                          ),
                                          focusedErrorBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(5.0),
                                            borderSide: const BorderSide(
                                              color: Color(0xFFFF9191),
                                              width: 2.0,
                                            ),
                                          ),
                                          contentPadding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 0.0),
                                          filled: true,
                                          fillColor: Colors.white,
                                          hintText: "Enter bank name",
                                          hintStyle: TextStyle(
                                            color: Colors.grey.shade400,
                                            fontSize: 14.0,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 20.0),

                                      // Amount
                                      Text(
                                        "Amount",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.grey.shade800,
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const SizedBox(height: 10.0,),
                                      TextFormField(
                                        onChanged: (value) {
                                          controller.setAmount(value);
                                        },
                                        keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                        validator: ValidationBuilder().required().build(),
                                        autovalidateMode: controller.autoValidateMode,
                                        decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(8.0),
                                            borderSide: BorderSide(
                                              color: Colors.grey.shade300,
                                              width: 1,
                                            ),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(8.0),
                                            borderSide: const BorderSide(
                                              color: Color(0xFFFF9191),
                                              width: 1,
                                            ),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(8.0),
                                            borderSide: const BorderSide(
                                              color: Color(0XFF07B46B),
                                              width: 2.0,
                                            ),
                                          ),
                                          focusedErrorBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(5.0),
                                            borderSide: const BorderSide(
                                              color: Color(0xFFFF9191),
                                              width: 2.0,
                                            ),
                                          ),
                                          contentPadding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 0.0),
                                          filled: true,
                                          fillColor: Colors.white,
                                          hintText: "100.0",
                                          hintStyle: TextStyle(
                                            color: Colors.grey.shade400,
                                            fontSize: 14.0,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 30.0),

                                      //  Submit Button.
                                      TextButton(
                                        onPressed: () {
                                          (formKey.currentState!.validate()) ? (
                                              // controller.sellCrypto()
                                              controller.setShowWithdrawalDetails(true)
                                          ) : ({
                                            controller.setAutoValidateMode(),
                                            controller.appToastWidget.notification("Note!", "Please fill all the required fields.", 'Warning'),
                                          });
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
                                          child: (!controller.isLoading) ?
                                          const Text(
                                            "Submit",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.w600
                                            ),
                                          ) :
                                          const SizedBox(
                                            height: 20.0,
                                            width: 20.0,
                                            child: CircularProgressIndicator(
                                              color: Colors.white,
                                              strokeWidth: 2.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )
            )
        ) : (
            ConstrainedBox(
                constraints: BoxConstraints(
                    maxHeight: Get.height / 1.8
                ),
                child: Container(
                  height: Get.height,
                  width: Get.width,
                  padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),
                    color: Colors.white,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 10.0),

                        //  Close Button.
                        Align(
                            alignment: Alignment.centerRight,
                            child: IconButton(
                              onPressed: () {
                                controller.setShowWithdrawalDetails(false);
                                Get.back();
                              },
                              icon: const Icon(
                                Icons.close,
                                size: 30.0,
                              ),
                            )
                        ),


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
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ],
                            ),
                            const Spacer(),

                            Text(
                              controller.accountNumber,
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
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ],
                            ),
                            const Spacer(),

                            Text(
                              controller.accountName,
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
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ],
                            ),
                            const Spacer(),

                            Text(
                              controller.bankName,
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
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ],
                            ),
                            const Spacer(),

                            Text(
                              "₦${formatter.format(double.parse(controller.amount))}",
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
                        const SizedBox(height: 20.0),

                        //  Submit Button.
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
                              "Submit",
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
            )
        );
      }
      ),
    );
  }
}