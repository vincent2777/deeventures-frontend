import 'package:deeventures/screens/billPayment/models/electric_company_model.dart';
import 'package:deeventures/screens/billPayment/models/meterType_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../controller/bill_payment_state_controller.dart';

class ElectricityWidget extends StatelessWidget {
  const ElectricityWidget(this.controller, this.formKey, {super.key});

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
          DropdownButtonFormField<ElectricCompany>(
            onChanged: (value) {
              if (value != null) {
                controller.setElectricCompanyCode(value.code!);
                controller.getElectricCompaniesCommission(value.code!);
              }
            },
            focusNode: FocusNode(),
            icon: const Icon(Iconsax.arrow_down_1),
            items: controller.electricCompanies
                .map((ElectricCompany electricCompany) {
              return DropdownMenuItem<ElectricCompany>(
                value: electricCompany,
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.green.shade100,
                      radius: 16.0,
                      child: Container(
                        height: 27.0,
                        width: 27.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(11.0),
                        ),
                        child: Center(
                          child: Text(
                            electricCompany.name!.substring(0, 2).toUpperCase(),
                            style: const TextStyle(
                              fontSize: 12.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20.0),
                    Text(
                      electricCompany.name!,
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
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 0.0),
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
                return 'Please select a network';
              }
              return ValidationBuilder().required().build()(value.name);
            },
          ),
          const SizedBox(height: 15.0),

          const Text(
            "Meter Type",
          ),
          const SizedBox(height: 5.0),
          DropdownButtonFormField<MeterType>(
            onChanged: (value) {
              if (value != null) {
                controller.setMeterTypeCode(value.code!);
              }
            },
            focusNode: FocusNode(),
            icon: const Icon(Iconsax.arrow_down_1),
            items: controller.meterTypes.map((MeterType electricCompany) {
              return DropdownMenuItem<MeterType>(
                value: electricCompany,
                child: Text(
                  electricCompany.name!,
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
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 0.0),
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
                return 'Please select a network';
              }
              return ValidationBuilder().required().build()(value.name);
            },
          ),
          const SizedBox(height: 15.0),

          const Text(
            "Meter Number",
          ),
          const SizedBox(height: 5.0),
          TextFormField(
            onChanged: (value) {
              controller.setMeterNumber(value);
            },
            focusNode: controller.meterNoFocusNode,
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
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 0.0),
              filled: true,
              fillColor: Colors.white,
              hintText: "123456789",
              hintStyle: TextStyle(
                color: Colors.grey.shade400,
                fontSize: 14.0,
              ),
            ),
          ),
          const SizedBox(height: 15.0),
          (controller.meterOwnerName.isNotEmpty ?
          (Text(
            controller.meterOwnerName,
            style: const TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.bold,
              fontSize: 16,
              overflow: TextOverflow.ellipsis
            ),
          )) : const SizedBox()),
          const SizedBox(height: 20.0),
          Row(
            children: [
              const Text(
                "Amount",
              ),
              const Spacer(),
              Visibility(
                visible: controller.commissionRate > 0.0,
                child: Row(
                  children: [
                    const Text(
                      "Convenience Fee: ",
                      style: TextStyle(fontSize: 12.0),
                    ),
                    Text(
                      "₦${controller.commissionRate.toInt()}",
                      style:
                          const TextStyle(fontSize: 12.0, fontFamily: 'Roboto'),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 5.0),
          TextFormField(
            onChanged: (value) {
              controller.setAmount(double.parse(value));
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
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 0.0),
              filled: true,
              fillColor: Colors.white,
              hintText: "₦0.0",
              hintStyle: TextStyle(
                  color: Colors.grey.shade400,
                  fontSize: 14.0,
                  fontFamily: 'Roboto'),
            ),
          ),
          const SizedBox(height: 15.0),

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
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 0.0),
              filled: true,
              fillColor: Colors.white,
              hintText: "0800000000",
              hintStyle: TextStyle(
                color: Colors.grey.shade400,
                fontSize: 14.0,
              ),
            ),
          ),

          const SizedBox(height: 30.0),

          //  Proceed Button.

          TextButton(
            onPressed: () {
              (formKey.currentState!.validate())
                  ? (controller.buyElectricity())
                  : ({
                      controller.setAutoValidateMode(),
                      controller.appToastWidget.notification("Note!",
                          "Please fill all the required fields.", 'Warning'),
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
              child: (!controller.isLoading)
                  ? (Text(
                      "PAY ₦${controller.totalPrice}",
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w600),
                    ))
                  : const SpinKitCircle(
                      color: Colors.white,
                      size: 40,
                    ),
            ),
          )
        ],
      ),
    );
  }
}
