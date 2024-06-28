
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../transactions/widgets/upload_image_bottom_sheet_widget.dart';
import '../controllers/trade_cryptocurrency_state_controller.dart';

class SellCryptoBottomSheetWidget {

  final TradeCryptocurrencyStateController tradeCryptoCurrencyStateController = Get.find<TradeCryptocurrencyStateController>();

  static void tradeCryptocurrencyStateController() {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    Get.bottomSheet(
      enableDrag: false,
      isDismissible: false,
      isScrollControlled: true,
        GetBuilder<TradeCryptocurrencyStateController>(builder: (controller) {
          return (!controller.showQRCode) ? (
              ConstrainedBox(
                  constraints: BoxConstraints(
                      maxHeight: Get.height / 2.2
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
                                controller.setShowQRCode(false);
                                controller.setNewCurrencyBuyRate(0.0);
                                Get.back();
                              },
                              icon: const Icon(
                                Icons.close,
                                size: 30.0,
                              ),
                            )
                        ),
                        const SizedBox(height: 30.0),

                        Expanded(
                          flex: 20,
                          child: Form(
                            key: formKey,
                            child: GetBuilder<TradeCryptocurrencyStateController>(builder: (controller) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Enter Amount (\$)",
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
                                      controller.setCryptoAmount(value);
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
                                  const SizedBox(height: 15.0,),

                                  Row(
                                    children: [
                                      Text(
                                        "We buy at:",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.grey.shade700,
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'Roboto'
                                        ),
                                      ),
                                      const SizedBox(width: 10.0,),

                                      Text(
                                        "₦${controller.currency.currencyBuyRate} per dollar",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.grey.shade700,
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w600,
                                            fontFamily: 'Roboto'
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 5.0,),

                                  (controller.newCurrencyBuyRate != 0.0) ? (
                                      Row(
                                        children: [
                                          Text(
                                            "You will receive:",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.grey.shade700,
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.w600,
                                              fontFamily: 'Roboto'
                                            ),
                                          ),
                                          const SizedBox(width: 10.0,),

                                          Text(
                                            "₦${controller.newCurrencyBuyRate}",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.grey.shade700,
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.w600,
                                                fontFamily: 'Roboto'
                                            ),
                                          ),
                                        ],
                                      )
                                  ) : (
                                      const SizedBox()
                                  ),
                                  const SizedBox(height: 40.0),

                                  //  Submit Button.
                                  TextButton(
                                    onPressed: () {
                                      debugPrint("TOKEN:::");
                                      (formKey.currentState!.validate()) ? (
                                          controller.sellCrypto()
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
                                      child: (!controller.isSellCryptoLoading) ?
                                      const Text(
                                        "Continue",
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
                              );
                            }
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
              )
          ) : (
              ConstrainedBox(
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
                                controller.setNewCurrencyBuyRate(0.0);
                                controller.setShowQRCode(false);
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
                          child: ListView(
                            padding: EdgeInsets.zero,
                            children: [
                              Text(
                                "Transaction Details",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.grey.shade700,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              const SizedBox(height: 10.0),

                              Align(
                                alignment: Alignment.center,
                                child: QrImage(
                                  data: controller.currencyNetwork.networkAddress!,
                                  version: QrVersions.auto,
                                  size: 200.0,
                                ),
                              ),
                              const SizedBox(height: 10.0),

                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Wallet Address:",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          color: Colors.grey.shade600,
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                      SizedBox(
                                        width: Get.width - 90,
                                        child: Text(
                                          controller.currencyNetwork.networkAddress!,
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            color: Colors.green.shade700,
                                            fontSize: 12.5,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Spacer(),

                                  IconButton(
                                    onPressed: () {
                                      Clipboard.setData(ClipboardData(text: controller.currencyNetwork.networkAddress!));
                                      controller.appToastWidget.notification("Copied!", "Wallet address copied to clipboard.", "Info");
                                    },
                                    icon: Container(
                                      height: 30.0,
                                      width: 30.0,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5.0),
                                        color: const Color(0XFFEB876B),
                                      ),
                                      child: const Icon(
                                        Iconsax.copy5,
                                        color: Colors.white,
                                        size: 20.0,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(height: 10.0),

                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "Transfer Amount: \$${controller.cryptoAmount}",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                  // Text(
                                  //   ""
                                  //   // "${controller.currency.currencySymbol}",
                                  //   textAlign: TextAlign.center,
                                  //   style: TextStyle(
                                  //     color: Colors.grey.shade600,
                                  //     fontSize: 12.0,
                                  //     fontWeight: FontWeight.w800,
                                  //   ),
                                  // ),
                                ],
                              ),
                              const SizedBox(height: 20.0),

                              const Text(
                                "NOTE:",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: Color(0XFFEB876B),
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              Text(
                                "1. Send the exact amount you see above.\n2. Kindly upload a proof of payment after making the transfer.",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: Colors.grey.shade800,
                                  fontSize: 11.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 25.0),

                              // Text(
                              //   "I've transferred the coin;",
                              //   textAlign: TextAlign.start,
                              //   style: TextStyle(
                              //     color: Colors.grey.shade800,
                              //     fontSize: 14.0,
                              //     fontWeight: FontWeight.w600,
                              //   ),
                              // ),

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
                                    color: const Color(0XFF07B46B),
                                  ),
                                  child: const Text(
                                    "I Have Transferred the Coin",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w600
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
              )
          );
        }
      ),
    );
  }
}