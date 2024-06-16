import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/transactions_state_controller.dart';


class ImagePreviewBottomSheetWidget {

  final TransactionsStateController transactionsStateController = Get.find<TransactionsStateController>();

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
                            Image.file(
                              controller.pickedFile!,
                              height: 100.0,
                              fit: BoxFit.contain,
                            ),
                            const SizedBox(height: 20.0,),

                            //  Gallery Button.
                            TextButton(
                              onPressed: () {
                                controller.uploadTransactionProof();
                              },
                              style: TextButton.styleFrom(
                                  backgroundColor: const Color(0XFF07B46B),
                                  minimumSize: const Size(double.infinity, 50.0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(7.0),
                                  )
                              ),
                              child: const Text(
                                "Submit",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w600
                                ),
                              ),
                              /*Container(
                                    height: 50.0,
                                    width: Get.width,
                                    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7.0),
                                      color: const Color(0XFF07B46B).withOpacity(0.3),
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
}