import 'package:deeventures/screens/setting/controllers/setting_state_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

import '../../utils/colors.dart';
import '../auths/controllers/register_state_controller.dart';
import '../wallet/controllers/wallet_state_controller.dart';

class SettingsBottomSheetWidget {

  final SettingStateController settingStateController = Get.find<SettingStateController>();

  static void aboutDeeventures() {

    Get.bottomSheet(
      enableDrag: false,
      isDismissible: false,
      isScrollControlled: true,
      GetBuilder<SettingStateController>(builder: (controller) {
        return  ConstrainedBox(
                constraints: BoxConstraints(
                    maxHeight: Get.height / 2.4
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

                        const Text(
                          "About Deeventures",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(height: 20.0,),

                        Text(
                          "At Deeventures, we specialize in facilitating the buying and selling of "
                              "cryptocurrencies and handling bills payment efficiently and securely. "
                              "Our mission is to provide a seamless experience for our customers, ensuring transparency, "
                              "reliability, and convenience in every transaction.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.7),
                            fontSize: 14.0,
                            fontWeight: FontWeight.normal,
                          ),
                        ),

                        const SizedBox(height: 20.0,),

                        //  Submit Button.
                        TextButton(
                          onPressed: () {
                            Get.back();
                            // controller.withdrawMoney();
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
                              "Okay!",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600
                              ),
                            )
                          ),
                        ),
                        const SizedBox(height: 15.0),
                      ],
                    ),
                  ),
                )
            );
      }
      ),
    );
  }

  static void deleteAccount() {

    Get.bottomSheet(
      enableDrag: false,
      isDismissible: false,
      isScrollControlled: true,
      GetBuilder<SettingStateController>(builder: (controller) {
        return  ConstrainedBox(
            constraints: BoxConstraints(
                maxHeight: Get.height / 2.2
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

                    const Text(
                      "Delete Account",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.redAccent,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 20.0,),

                    Text(
                      "We're sorry to see you go! Deleting your account will permanently remove all your data, "
                          "including your order history, saved items, and account settings. This action cannot be undone.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.7),
                        fontSize: 14.0,
                        fontWeight: FontWeight.normal,
                      ),
                    ),

                    const SizedBox(height: 20.0,),
                    const Text(
                      "Are you sure you want to delete your account?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20.0,),

                    //  Submit Button.
                    TextButton(
                      onPressed: () {
                       controller.deleteUser();
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                      ),
                      child: Container(
                          height: 50.0,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7.0),
                            color: Colors.redAccent,
                          ),
                          child: !controller.isLoading ? const Text(
                            "Yes, Proceed!",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600
                            ),
                          ) : const SpinKitCircle(
                        color: Colors.white,
                        size: 40,
                      )
                      ),
                    ),
                    const SizedBox(height: 15.0),
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
                            color: mainGreen,
                          ),
                          child: const Text(
                            "No, Cancel!",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600
                            ),
                          )
                      ),
                    ),
                    const SizedBox(height: 15.0),
                  ],
                ),
              ),
            )
        );
      }
      ),
    );
  }

  static void editProfile() {
    final RegisterStateController registerStateController = Get.put(RegisterStateController());
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    Get.bottomSheet(
      enableDrag: false,
      isDismissible: false,
      isScrollControlled: true,
      GetBuilder<SettingStateController>(builder: (controller) {
        return  ConstrainedBox(
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
              child: Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 10.0),

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

                      Text("Update Profile".toUpperCase(),style: const TextStyle(fontSize: 18,color: mainGreen,fontWeight: FontWeight.bold),),

                      Container(
                        // height: Get.height,
                        // width: Get.width,
                        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30.0),
                              topRight: Radius.circular(30.0),
                            ),
                            color: Colors.white
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Full name",
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.7),
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w500
                              ),
                            ),
                            const SizedBox(height: 5.0),
                            TextFormField(
                              onChanged: (value) {
                                controller.setFullName(value);
                              },
                              controller: controller.fullNameTextController,
                              keyboardType: TextInputType.name,
                              validator: ValidationBuilder().minLength(3).required().build(),
                              autovalidateMode: controller.autoValidateMode,
                              textCapitalization: TextCapitalization.words,
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
                                hintText: "Don",
                                hintStyle: const TextStyle(
                                  color: Colors.black26,
                                  fontSize: 1.0,
                                ),
                              ),
                            ),
                            const SizedBox(height: 15.0),

                            Text(
                              "Country",
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.7),
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w500
                              ),
                            ),
                            const SizedBox(height: 5.0),
                            TextFormField(
                              onChanged: (value) {
                                controller.setCountry(value);
                              },
                              controller: controller.countryTextController,
                              keyboardType: TextInputType.name,
                              validator: ValidationBuilder().minLength(3).required().build(),
                              autovalidateMode: controller.autoValidateMode,
                              textCapitalization: TextCapitalization.words,
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
                                hintText: "Joe",
                                hintStyle: const TextStyle(
                                  color: Colors.black26,
                                  fontSize: 1.0,
                                ),
                              ),
                            ),
                            const SizedBox(height: 15.0),

                            Text(
                              "Phone number",
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.7),
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w500
                              ),
                            ),
                            const SizedBox(height: 5.0),
                            TextFormField(
                              onChanged: (value) {
                                controller.setPhoneNumber(value);
                              },
                              controller: controller.phoneNumberTextController,
                              keyboardType: TextInputType.phone,
                              validator: ValidationBuilder().phone().required().build(),
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
                                hintText: "+234 800000000",
                                hintStyle: const TextStyle(
                                  color: Colors.black54,
                                  fontSize: 1.0,
                                ),
                              ),
                            ),


                            const SizedBox(height: 35.0),

                            //  Register Button.
                            TextButton(
                              onPressed: () {
                                (formKey.currentState!.validate()) ? (
                                    controller.updateProfile()
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
                                child: (!controller.isLoading) ?
                                const Text(
                                  "UPDATE",
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
                            const SizedBox(height: 20.0),

                          ],
                        ),
                      ),
                      const SizedBox(height: 15.0),

                    ],
                  ),
                ),
              ),
            )
        );
      }
      ),
    );
  }

  static void changePassword() {
    final RegisterStateController registerStateController = Get.put(RegisterStateController());
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    Get.bottomSheet(
      enableDrag: false,
      isDismissible: false,
      isScrollControlled: true,
      GetBuilder<SettingStateController>(builder: (controller) {
        return  ConstrainedBox(
            constraints: BoxConstraints(
                maxHeight: Get.height / 1.9
            ),
            child: Container(
              height: Get.height,
              width: Get.width,
              padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),
                color: Colors.white,
              ),
              child:  Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 10.0),

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

                    Text("Change Password".toUpperCase(),style: const TextStyle(fontSize: 18,color: mainGreen,fontWeight: FontWeight.bold),),

                    Container(
                      // height: Get.height,
                      // width: Get.width,
                      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30.0),
                            topRight: Radius.circular(30.0),
                          ),
                          color: Colors.white
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Text(
                            "Old Password",
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.7),
                                fontSize: 14.0,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                          const SizedBox(height: 5.0),
                          TextFormField(
                            onChanged: (value) {
                              controller.setCurrentPassword(value);
                            },
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: controller.hideOldPassword,
                            validator: ValidationBuilder().minLength(8).required().build(),
                            autovalidateMode: registerStateController.autoValidateMode,
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
                                hintText: "*****",
                                hintStyle: const TextStyle(
                                  color: Colors.black26,
                                  fontSize: 1.0,
                                ),
                                suffixIcon: IconButton(
                                  onPressed: () { controller.setHideOldPassword(); },
                                  icon: Icon(
                                    (controller.hideOldPassword) ? Iconsax.eye : Iconsax.eye_slash,
                                    color: Colors.black54,
                                  ),
                                )
                            ),
                          ),
                          const SizedBox(height: 15.0),

                          Text(
                            "New Password",
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.7),
                                fontSize: 14.0,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                          const SizedBox(height: 5.0),
                          TextFormField(
                            onChanged: (value) {
                              controller.setNewPassword(value);
                            },
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: controller.hideNewPassword,
                            validator: ValidationBuilder().minLength(8).required().build(),
                            autovalidateMode: registerStateController.autoValidateMode,
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
                                hintText: "*****",
                                hintStyle: const TextStyle(
                                  color: Colors.black26,
                                  fontSize: 1.0,
                                ),
                                suffixIcon: IconButton(
                                  onPressed: () { controller.setHideNewPassword(); },
                                  icon: Icon(
                                    (controller.hideNewPassword) ? Iconsax.eye : Iconsax.eye_slash,
                                    color: Colors.black54,
                                  ),
                                )
                            ),
                          ),
                          const SizedBox(height: 15.0),

                          Text(
                            "Confirm Password",
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.7),
                                fontSize: 14.0,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                          const SizedBox(height: 5.0),
                          TextFormField(
                            onChanged: (value) {
                              controller.setConfirmNewPassword(value);
                            },
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: controller.hideCNewPassword,
                            validator: ValidationBuilder().minLength(8).required().build(),
                            autovalidateMode: registerStateController.autoValidateMode,
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
                                hintText: "*****",
                                hintStyle: const TextStyle(
                                  color: Colors.black26,
                                  fontSize: 1.0,
                                ),
                                suffixIcon: IconButton(
                                  onPressed: () { controller.setHideCNewPassword(); },
                                  icon: Icon(
                                    (controller.hideCNewPassword) ? Iconsax.eye : Iconsax.eye_slash,
                                    color: Colors.black54,
                                  ),
                                )
                            ),
                          ),
                          const SizedBox(height: 25.0),

                          //  Register Button.
                          TextButton(
                            onPressed: () {
                              (formKey.currentState!.validate()) ? (
                                  controller.updatePassword()
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
                              child: (!controller.isLoading) ?
                              const Text(
                                "SUBMIT",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w600
                                ),
                              ) : const SpinKitCircle(
                                color: Colors.white,
                                size: 40,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20.0),

                        ],
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