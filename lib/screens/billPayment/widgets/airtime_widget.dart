import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/colors.dart';
import '../controller/bill_payment_state_controller.dart';
import '../models/airtime_model.dart';


class AirtimeWidget extends StatelessWidget {
  const AirtimeWidget(this.controller, this.formKey, {super.key});

  final GlobalKey<FormState> formKey;
  final BillPaymentStateController controller;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          const Text(
            "Network",
          ),
          const SizedBox(height: 5.0),
          DropdownButtonFormField<Airtime>(
            onChanged: (value) {
              if (value != null) {
                controller.setAirtimeCode(value.code!);
              }
            },
            focusNode: FocusNode(),
            icon: const Icon(Iconsax.arrow_down_1),
            items: controller.airTimes.map((airtime) {
              return DropdownMenuItem<Airtime>(
                value: airtime,
                child: Row(
                  children: [
                   /* CircleAvatar(
                      backgroundColor: Colors.green.withOpacity(0.3),
                      radius: 16.0,
                      child: Container(
                        height: 22.0,
                        width: 22.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(11.0),
                            image: DecorationImage(
                                image: AssetImage(
                                  airtime.airtimeImage!,
                                ),
                                fit: BoxFit.cover
                            )
                        ),
                      ),
                    ),
                    const SizedBox(width: 20.0),*/

                    Text(
                      airtime.airtimeIsp!,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              );
            }).toList(),
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
              contentPadding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
              filled: true,
              fillColor: Colors.white,
              hintText: "Choose Network",
              hintStyle: TextStyle(
                color: Colors.grey.shade400,
                fontSize: 15.0,
              ),
            ),
            validator: (value) {
              if (value == null) {
                return 'Please select a network';
              }
              return ValidationBuilder().required().build()(value.airtimeIsp);
            },
          ),
          const SizedBox(height: 20.0),

          const Text(
            "Select an amount",
          ),
          const SizedBox(height: 5.0),
          SizedBox(
            height: 120.0,
            width: Get.width,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 5/2,
                mainAxisSpacing: 15.0,
                crossAxisSpacing: 15.0
              ),
              itemCount: controller.airtimeAmounts.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    controller.setAmount(controller.airtimeAmounts[index].toDouble());
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: (controller.airtimeAmounts[index].toDouble() == double.tryParse(controller.amountTextEditingController.text)) ? (
                          Border.all(color: Colors.green.shade200)
                      ) : (
                          Border.all(color: Colors.grey.shade100)
                      ),
                      borderRadius: BorderRadius.circular(5.0),
                      color: (controller.airtimeAmounts[index].toDouble() == double.tryParse(controller.amountTextEditingController.text)) ? (
                          Colors.green.shade50
                      ) : (
                          Colors.grey.shade100
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "${ controller.airtimeAmounts[index] }"
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          const Text(
            "Amount",
          ),
          const SizedBox(height: 5.0),
          TextFormField(
            onChanged: (value) {
              controller.setAmount(double.parse(value));
            },
            controller: controller.amountTextEditingController,
            keyboardType: TextInputType.number,
            validator: ValidationBuilder().minLength(2).required().build(),
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
              prefix: const Text(
                "NGN  ",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 14.0,
                  fontFamily: "Manrope"
                ),
              ),
            ),
          ),
          const SizedBox(height: 20.0),

          const Text(
            "Phone Number",
          ),
          const SizedBox(height: 5.0),
          TextFormField(
            onChanged: (value) {
              controller.setPhoneNumber(value);
            },
            keyboardType: TextInputType.phone,
            validator: ValidationBuilder().phone().required().build(),
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
              hintText: "0800000000",
              hintStyle: TextStyle(
                color: Colors.grey.shade400,
                fontSize: 14.0,
              ),
            ),
          ),
          const SizedBox(height: 40.0),

          //  Proceed Button.

            TextButton(
            onPressed: () {
              (formKey.currentState!.validate()) ? (
                  controller.buyAirtime()
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
              width: Get.width,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7.0),
                color: mainGreen,
              ),
              child:  (!controller.isLoading) ? (
                  const Text(
                    "PROCEED",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600
                    ),
                  ))
                      : const SpinKitCircle(
                color: Colors.white,
                size: 40,
              )
            ),
          ),
          const SizedBox(height: 50,)
        ],
      ),
    );
  }
}