
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../utils/colors.dart';
import '../../transactions/widgets/upload_image_bottom_sheet_widget.dart';
import '../controllers/login_state_controller.dart';

class ForgotPasswordBottomSheetWidget {

  final LoginStateController loginStateController = Get.find<LoginStateController>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static void forgotPasswordBottomSheetWidget() {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    Get.bottomSheet(
      enableDrag: false,
      isDismissible: false,
      isScrollControlled: true,
        GetBuilder<LoginStateController>(builder: (controller) {
          return (!controller.showResetPassword)
              ? ConstrainedBox(
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
                            Get.back();
                          },
                          icon: const Icon(
                            Icons.close,
                            size: 30.0,
                          ),
                        )
                    ),
                    const SizedBox(height: 20.0),

                    Expanded(
                      flex: 20,
                      child: Form(
                        key: formKey,
                        child: GetBuilder<LoginStateController>(builder: (controller) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Forgot Password",
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.7),
                                    fontWeight: FontWeight.w800,
                                    fontSize: 18.0
                                ),
                              ),
                              const SizedBox(height: 30.0),

                              Text(
                                "Email address",
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.7),
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                              const SizedBox(height: 7.0),
                              TextFormField(
                                onChanged: (value) {
                                  controller.setEmail(value);
                                },
                                // autofocus: true,
                                keyboardType: TextInputType.emailAddress,
                                validator: ValidationBuilder().email().required().build(),
                                autovalidateMode: controller.autoValidateMode,
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    borderSide: const BorderSide(
                                      color: Color(0XFF07B46B),
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
                                  hintText: "example@email.com",
                                  hintStyle: const TextStyle(
                                    color: Colors.black26,
                                    fontSize: 1.0,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 40.0),

                              //  Submit Button.
                              TextButton(
                                onPressed: () {
                                  (formKey.currentState!.validate()) ? (
                                      controller.forgotPassword()
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
              : ConstrainedBox(
              constraints: BoxConstraints(
                  maxHeight: Get.height / 1.7
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
                    const SizedBox(height: 20.0),

                    Expanded(
                      flex: 20,
                      child: Form(
                        key: formKey,
                        child: GetBuilder<LoginStateController>(builder: (controller) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Reset Password",
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.7),
                                    fontWeight: FontWeight.w800,
                                    fontSize: 18.0
                                ),
                              ),
                              const SizedBox(height: 20.0),

                              Text(
                                "OTP",
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.7),
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                              const SizedBox(height: 7.0),
                              TextFormField(
                                onChanged: (value) {
                                  controller.setOTP(value);
                                },
                                // autofocus: true,
                                keyboardType: TextInputType.number,
                                validator: ValidationBuilder().required().build(),
                                autovalidateMode: controller.autoValidateMode,
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    borderSide: const BorderSide(
                                      color: Color(0XFF07B46B),
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
                                  hintText: "Enter OTP",
                                  hintStyle: const TextStyle(
                                    color: Colors.black26,
                                    fontSize: 1.0,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20.0),

                              Text(
                                "Password",
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.7),
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                              const SizedBox(height: 7.0),
                              TextFormField(
                                onChanged: (value) {
                                  controller.setPassword(value);
                                },
                                // autofocus: true,
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: controller.hidePassword,
                                validator: ValidationBuilder().minLength(8).required().build(),
                                autovalidateMode: controller.autoValidateMode,
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                      borderSide: const BorderSide(
                                        color: Color(0XFF07B46B),
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
                                    hintText: "Enter password",
                                    hintStyle: const TextStyle(
                                      color: Colors.black26,
                                      fontSize: 16.0,
                                    ),
                                    suffixIcon: IconButton(
                                      onPressed: () { controller.setHidePassword(); },
                                      icon: Icon(
                                        (controller.hidePassword) ? Iconsax.eye : Iconsax.eye_slash,
                                        color: Colors.black54,
                                      ),
                                    )
                                ),
                              ),
                              const SizedBox(height: 20.0),

                              Text(
                                "Confirm Password",
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.7),
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                              const SizedBox(height: 7.0),
                              TextFormField(
                                onChanged: (value) {
                                  controller.setConfirmPassword(value);
                                },
                                // autofocus: true,
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: controller.hideConfirmPassword,
                                validator: ValidationBuilder().minLength(8).required().build(),
                                autovalidateMode: controller.autoValidateMode,
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                      borderSide: const BorderSide(
                                        color: Color(0XFF07B46B),
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
                                    hintText: "Enter confirm password",
                                    hintStyle: const TextStyle(
                                      color: Colors.black26,
                                      fontSize: 16.0,
                                    ),
                                    suffixIcon: IconButton(
                                      onPressed: () { controller.setHideConfirmPassword(); },
                                      icon: Icon(
                                        (controller.hideConfirmPassword) ? Iconsax.eye : Iconsax.eye_slash,
                                        color: Colors.black54,
                                      ),
                                    )
                                ),
                              ),
                              const SizedBox(height: 40.0),

                              //  Submit Button.
                              TextButton(
                                onPressed: () {
                                  (formKey.currentState!.validate()) ? (
                                      controller.resetPassword()
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
                                  child: (!controller.isLoading) ? (
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
          );
        }
      ),
    );
  }
}