import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../controller/bill_payment_state_controller.dart';
import '../models/cableTV_model.dart';


class TVWidget extends StatelessWidget {
  TVWidget(this.controller, this.formKey, {super.key});

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
            "Service Provider",
          ),
          const SizedBox(height: 5.0),
          DropdownButtonFormField<CableTv>(
            onChanged: (value) {
              controller.setCableTv(value!.id!);
              controller.setCableTVPackages(value.product!);
              controller.getCableTVCommission(value.id!);
            },
            focusNode: FocusNode(),
            icon: const Icon(Iconsax.arrow_down_1),
            items: controller.cableTvs.map((CableTv cableTv) {
              return DropdownMenuItem<CableTv>(
                value: cableTv,
                child: Text(
                  cableTv.id!.toUpperCase(),
                  overflow: TextOverflow.ellipsis,
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
              contentPadding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 0.0),
              filled: true,
              fillColor: Colors.white,
              hintText: "Choose Service Provider",
              hintStyle: TextStyle(
                color: Colors.grey.shade400,
                fontSize: 15.0,
              ),
            ),
            validator: (value) {
              if (value == null) {
                return 'Please select a cable TV';
              }
              return ValidationBuilder().required().build()(value.id);
            },
          ),
          const SizedBox(height: 20.0),

          (controller.cableTVPackages.isNotEmpty) ? (
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Package",
              ),
              const SizedBox(height: 5.0),
              DropdownButtonFormField<CableTVPackage>(
                onChanged: (value) {
                  controller.setCableTVPackage(value!.packageId!);
                  controller.setAmount(double.parse(value.packageAmount!));
                },
                focusNode: FocusNode(),
                icon: const Icon(Iconsax.arrow_down_1),
                isExpanded: true,
                items: controller.cableTVPackages.map((CableTVPackage cableTVPackage) {
                  return DropdownMenuItem<CableTVPackage>(
                    value: cableTVPackage,
                    child: Text(
                      cableTVPackage.packageName!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
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
                  contentPadding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 0.0),
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Choose Service Provider",
                  hintStyle: TextStyle(
                    color: Colors.grey.shade400,
                    fontSize: 15.0,
                  ),
                ),
                validator: (value) {
                  if (value == null) {
                    return 'Please select a cable TV';
                  }
                  return ValidationBuilder().required().build()(value.packageId);
                },
              ),
              const SizedBox(height: 20.0)
            ],
          )
          ) : (
            const SizedBox()
          ),

          const Text(
            "Smart Card Number",
          ),
          const SizedBox(height: 5.0),
          TextFormField(
            onChanged: (value) {
              controller.setSmartCardNumber(value);
            },
            keyboardType: TextInputType.number,
            validator: ValidationBuilder().minLength(3).required().build(),
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
              hintText: "Smart Card Number",
              hintStyle: TextStyle(
                color: Colors.grey.shade400,
                fontSize: 14.0,
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
          const SizedBox(height: 20.0),

          Row(
            children: [
              const Text(
                "Total Amount",
              ),
              const Spacer(),

              Visibility(
                visible: controller.commissionRate > 0.0,
                child: Row(
                  children: [
                    const Text(
                      "Commission: ",
                      style: TextStyle(
                          fontSize: 12.0
                      ),
                    ),
                    Text(
                      "${controller.commissionRate.toInt()}%",
                      style: const TextStyle(
                          fontSize: 12.0
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 5.0),
          TextFormField(
            /*onChanged: (value) {
              controller.setAmount(double.parse(value));
            },*/
            readOnly: true,
            controller: controller.amountTextEditingController,
            keyboardType: TextInputType.number,
            validator: ValidationBuilder().minLength(3).required().build(),
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
              hintText: "0.0",
              hintStyle: TextStyle(
                color: Colors.grey.shade400,
                fontSize: 14.0,
              ),
              prefix: const Text(
                "₦",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 16.0,
                ),
              ),
            ),
          ),
          const SizedBox(height: 40.0),

          //  Proceed Button.
          (!controller.isLoading) ? (
              TextButton(
                onPressed: () {
                  (formKey.currentState!.validate()) ? (
                      controller.buyTVSubscription()
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
                    color: const Color(0XFF07B46B),
                  ),
                  child: const Text(
                    "PROCEED",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600
                    ),
                  ),
                ),
              )
          ) : (
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                ),
                child: Container(
                  height: 50.0,
                  width: Get.width,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7.0),
                    color: Colors.grey.shade300,
                  ),
                  child: const Text(
                    "PROCEED",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600
                    ),
                  ),
                ),
              )
          )
        ],
      ),
    );
  }
}