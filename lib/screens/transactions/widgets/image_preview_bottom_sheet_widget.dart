import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../../../utils/colors.dart';
import '../../tradeGiftCard/controllers/trade_gift_card_state_controller.dart';
import '../controllers/transactions_state_controller.dart';


class ImagePreviewBottomSheetWidget {

  final TransactionsStateController transactionsStateController = Get.find<TransactionsStateController>();
  final TradeGiftCardStateController tradeGiftCardStateController = Get.find<TradeGiftCardStateController>();

  static void imagePreviewBottomSheetWidget() {

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
                              "Image Preview",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.grey.shade700,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            const SizedBox(height: 20.0,),

                            // Image Preview
                            /*Image.file(
                              controller.pickedFile!,
                              height: 100.0,
                              fit: BoxFit.contain,
                            ),*/
                            Container(
                              height: 100,
                              padding: const EdgeInsets.all(8.0),
                              child: GridView.builder(
                                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 4.0,
                                  mainAxisSpacing: 4.0,
                                ),
                                itemCount: controller.pickedFiles.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Image.file(
                                    controller.pickedFiles[index]!,
                                    height: 100.0,
                                    fit: BoxFit.cover,
                                  );
                                },
                              ),
                            ),
                            const SizedBox(height: 20.0,),

                            //  Gallery Button.
                            TextButton(
                              onPressed: () {
                                controller.uploadTransactionProof();
                              },
                              style: TextButton.styleFrom(
                                  backgroundColor: mainGreen,
                                  minimumSize: const Size(double.infinity, 50.0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(7.0),
                                  )
                              ),
                              child: !controller.isLoading ? (
                                  const Text(
                                    "Submit",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w600
                                    ),
                                  )) : const SpinKitCircle(
                                color: Colors.white,
                                size: 40,
                              ),
                              /*Container(
                                    height: 50.0,
                                    width: Get.width,
                                    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7.0),
                                      color: mainGreen.withOpacity(0.3),
                                    ),
                                    child: ,
                                  ),*/
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


  static void imagePreviewCardBottomSheetWidget() {

    Get.bottomSheet(
      enableDrag: false,
      isDismissible: false,
      isScrollControlled: true,
      GetBuilder<TradeGiftCardStateController>(builder: (controller) {
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
                            "Image Preview",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.grey.shade700,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          const SizedBox(height: 20.0,),

                      Container(
                        height: 100,
                        padding: const EdgeInsets.all(8.0),
                        child: GridView.builder(
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 4.0,
                            mainAxisSpacing: 4.0,
                          ),
                          itemCount: controller.pickedFile.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Image.file(
                              controller.pickedFile[index]!,
                              height: 100.0,
                              fit: BoxFit.cover,
                            );
                          },
                        ),
                      ),
                          const SizedBox(height: 20.0,),

                          //  Gallery Button.
                          TextButton(
                            onPressed: () {
                              controller.sellGiftCard();
                            },
                            style: TextButton.styleFrom(
                                backgroundColor: mainGreen,
                                minimumSize: const Size(double.infinity, 50.0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(7.0),
                                )
                            ),
                            child: !controller.isLoading ? (
                            const Text(
                              "Submit",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600
                              ),
                            )) : const SpinKitCircle(
                            color: Colors.white,
                            size: 40,
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