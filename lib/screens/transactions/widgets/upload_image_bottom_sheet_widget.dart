import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';

import '../../../utils/colors.dart';
import '../../tradeGiftCard/controllers/trade_gift_card_state_controller.dart';
import '../controllers/transactions_state_controller.dart';

class UploadImageBottomSheetWidget {

  final TransactionsStateController transactionsStateController = Get.find<TransactionsStateController>();
  final TradeGiftCardStateController tradeGiftCardStateController = Get.find<TradeGiftCardStateController>();

  static void uploadImageBottomSheetWidget() {
    Get.bottomSheet(
      enableDrag: false,
      isDismissible: false,
      isScrollControlled: true,
        GetBuilder<TransactionsStateController>(builder: (controller) {
          return ConstrainedBox(
              constraints: BoxConstraints(
                  maxHeight: Get.height / 2.5
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
                              "Select Image From",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.grey.shade700,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            const SizedBox(height: 20.0,),

                            //  Camera Button.
                            IconButton(
                              onPressed: () {
                                controller.takeImage(ImageSource.camera);
                                Get.back();
                              },
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                              ),
                              icon: Container(
                                height: 50.0,
                                width: Get.width,
                                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7.0),
                                  color: mainGreen,
                                ),
                                child: Row(
                                  children: const [
                                    Icon(
                                      Iconsax.camera,
                                      color: Colors.white,
                                    ),
                                    SizedBox(width: 15.0),

                                    Text(
                                      "Camera",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w600
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 15.0),

                            //  Gallery Button.
                            IconButton(
                              onPressed: () {
                                controller.takeImage(ImageSource.gallery);
                                Get.back();
                              },
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                              ),
                              icon: Container(
                                height: 50.0,
                                width: Get.width,
                                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7.0),
                                  color: mainGreen.withOpacity(0.3),
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      Iconsax.gallery,
                                      color: Colors.green.shade800,
                                    ),
                                    const SizedBox(width: 15.0),

                                    Text(
                                      "Gallery",
                                      style: TextStyle(
                                          color: Colors.green.shade800,
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w600
                                      ),
                                    ),
                                  ],
                                ),
                              ),
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

  void uploadCardImageBottomSheetWidget() {
    Get.bottomSheet(
      enableDrag: false,
      isDismissible: false,
      isScrollControlled: true,
      GetBuilder<TransactionsStateController>(builder: (controller) {
        return ConstrainedBox(
            constraints: BoxConstraints(
                maxHeight: Get.height / 2.5
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
                            "Upload Cards Image(s)",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.grey.shade700,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          const SizedBox(height: 30.0,),

                          //  Camera Button.
                          IconButton(
                            onPressed: () {
                              tradeGiftCardStateController.takeImage(ImageSource.camera);
                              Get.back();
                            },
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                            ),
                            icon: Container(
                              height: 50.0,
                              width: Get.width,
                              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7.0),
                                color: mainGreen,
                              ),
                              child: Row(
                                children: const [
                                  Icon(
                                    Iconsax.camera,
                                    color: Colors.white,
                                  ),
                                  SizedBox(width: 15.0),

                                  Text(
                                    "From Camera",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w600
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 15.0),

                          //  Gallery Button.
                          IconButton(
                            onPressed: () {
                              tradeGiftCardStateController.takeImage(ImageSource.gallery);
                              Get.back();
                            },
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                            ),
                            icon: Container(
                              height: 50.0,
                              width: Get.width,
                              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7.0),
                                color: mainGreen.withOpacity(0.3),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Iconsax.gallery,
                                    color: Colors.green.shade800,
                                  ),
                                  const SizedBox(width: 15.0),

                                  Text(
                                    "From Gallery",
                                    style: TextStyle(
                                        color: Colors.green.shade800,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w600
                                    ),
                                  ),
                                ],
                              ),
                            ),
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