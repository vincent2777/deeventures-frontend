import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../utils/colors.dart';
import '../../transactions/widgets/upload_image_bottom_sheet_widget.dart';
import '../controllers/wallet_state_controller.dart';


class DepositMoneyBottomSheetWidget {

  final WalletStateController walletStateController = Get.find<WalletStateController>();

  static void depositMoneyBottomSheetWidget() {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final formatter = NumberFormat("#,##0");

    Get.bottomSheet(
      enableDrag: false,
      isDismissible: false,
      isScrollControlled: true,
        GetBuilder<WalletStateController>(builder: (controller) {
          return (!controller.showDepositDetails) ? (
              ConstrainedBox(
                  constraints: BoxConstraints(
                      maxHeight: Get.height / 2.4
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
                                  "Deposit Money",
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
                                              controller.depositMoney()
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
                                              color: mainGreen,
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
                                            const SpinKitCircle(
                                              color: Colors.white,
                                              size: 40,
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
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(height: 10.0),

                          //  Close Button.
                          Align(
                              alignment: Alignment.centerRight,
                              child: IconButton(
                                onPressed: () {
                                  controller.setShowDepositDetails(false);
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
                                  const Icon(Icons.numbers, size: 18,),

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
                                "${controller.accountSettings.accountNumber}",
                                style: TextStyle(
                                  color: Colors.grey.shade700,
                                  fontSize: 13.5,
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 10.0),

                          const Divider(
                            endIndent: 0.0,
                            indent: 0.0,
                            color: Color(0xFFE8E8E8),
                          ),
                          const SizedBox(height: 10.0),

                          // Account Name
                          Row(
                            children: [
                              Row(
                                children: [
                                  const Icon(Icons.person, size: 18,),

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
                                controller.accountSettings.accountName!,
                                style: TextStyle(
                                  color: Colors.grey.shade700,
                                  fontSize: 13.5,
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 10.0),

                          const Divider(
                            endIndent: 0.0,
                            indent: 0.0,
                            color: Color(0xFFE8E8E8),
                          ),
                          const SizedBox(height: 10.0),

                          // Bank Name
                          Row(
                            children: [
                              Row(
                                children: [
                                  const Icon(Icons.place_outlined, size: 18,),

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
                                controller.accountSettings.accountBank!,
                                style: TextStyle(
                                  color: Colors.grey.shade700,
                                  fontSize: 13.5,
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 10.0),

                          const Divider(
                            endIndent: 0.0,
                            indent: 0.0,
                            color: Color(0xFFE8E8E8),
                          ),
                          const SizedBox(height: 10.0),

                          // Amount
                          Row(
                            children: [
                              Row(
                                children: [
                                  const Icon(Icons.money, size: 18,),

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
                          const SizedBox(height: 10.0),

                          const Divider(
                            endIndent: 0.0,
                            indent: 0.0,
                            color: Color(0xFFE8E8E8),
                          ),
                          const SizedBox(height: 10.0),

                          // Instruction
                          Row(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Icon(Icons.info_outline_rounded, size: 18,),

                                  const SizedBox(width: 10.0,),

                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Instruction",
                                        style: TextStyle(
                                          color: Colors.grey.shade500,
                                          fontSize: 13.0,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),

                                      SizedBox(
                                        width: Get.width - 90.0,
                                        child: Text(
                                          controller.accountSettings.depositInstructions!,
                                          style: TextStyle(
                                            color: Colors.grey.shade700,
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                          const Divider(
                            endIndent: 0.0,
                            indent: 0.0,
                            color: Color(0xFFE8E8E8),
                          ),
                          const SizedBox(height: 20.0),

                          //  Upload Proof Button.
                          TextButton(
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