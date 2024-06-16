import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:form_validator/form_validator.dart';
import 'package:iconsax/iconsax.dart';

import '../../routes/app_routes/app_route_names.dart';
import 'controllers/register_state_controller.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final RegisterStateController registerStateController = Get.put(RegisterStateController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,

        body: GetBuilder<RegisterStateController>(builder: (controller) {
            return Container(
              height: Get.height,
              width: Get.width,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment(0, 0.26),
                  end: Alignment(1, 0.07),
                  colors: [Color(0XFF0E6C44), Color(0XFF07B46B)],
                ),
              ),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: Text(
                            "New User",
                            style: TextStyle(
                              color: Color(0XFFFFFFFF),
                              fontWeight: FontWeight.w800,
                              fontSize: 26.0,
                            ),
                          ),
                      ),
                      const Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: Text(
                            "Create your Deeventures Exchange Account",
                            style: TextStyle(
                              color: Colors.white54,
                              fontSize: 13.0,
                            ),
                          ),
                      ),
                      const SizedBox(height: 20.0),

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
                              "First name",
                              style: TextStyle(
                                color: Colors.black.withOpacity(0.7),
                                fontSize: 14.0,
                                fontWeight: FontWeight.w500
                              ),
                            ),
                            const SizedBox(height: 5.0),
                            TextFormField(
                              onChanged: (value) {
                                controller.setFirstName(value);
                              },
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
                              "Last name",
                              style: TextStyle(
                                color: Colors.black.withOpacity(0.7),
                                fontSize: 14.0,
                                fontWeight: FontWeight.w500
                              ),
                            ),
                            const SizedBox(height: 5.0),
                            TextFormField(
                              onChanged: (value) {
                                controller.setLastName(value);
                              },
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
                            const SizedBox(height: 15.0),

                            /*Text(
                              "Username",
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.7),
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w500
                              ),
                            ),
                            const SizedBox(height: 5.0),
                            TextFormField(
                              onChanged: (value) {
                                controller.setUserName(value);
                              },
                              keyboardType: TextInputType.name,
                              validator: ValidationBuilder().minLength(3).required().build(),
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
                                hintText: "Joe2024",
                                hintStyle: const TextStyle(
                                  color: Colors.black26,
                                  fontSize: 1.0,
                                ),
                              ),
                            ),
                            const SizedBox(height: 15.0),*/

                            Text(
                              "Email address",
                              style: TextStyle(
                                color: Colors.black.withOpacity(0.7),
                                fontSize: 14.0,
                                fontWeight: FontWeight.w500
                              ),
                            ),
                            const SizedBox(height: 5.0),
                            TextFormField(
                              onChanged: (value) {
                                controller.setEmail(value);
                              },
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
                            const SizedBox(height: 15.0),

                            Text(
                              "Password",
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.7),
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w500
                              ),
                            ),
                            const SizedBox(height: 5.0),
                            TextFormField(
                              onChanged: (value) {
                                controller.setPassword(value);
                              },
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
                                hintText: "example@email.com",
                                hintStyle: const TextStyle(
                                  color: Colors.black26,
                                  fontSize: 1.0,
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
                              keyboardType: TextInputType.name,
                              validator: ValidationBuilder().minLength(3).required().build(),
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
                                hintText: "Select country",
                                hintStyle: const TextStyle(
                                  color: Colors.black26,
                                  fontSize: 1.0,
                                ),
                              ),
                            ),
                            const SizedBox(height: 15.0),

                            Row(
                              children: [
                                Text(
                                  "Referral",
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.7),
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w500
                                  ),
                                ),
                                Text(
                                  "(Optional)",
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.5),
                                      fontSize: 9.0,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 5.0),
                            TextFormField(
                              onChanged: (value) {
                                controller.setReferral(value);
                              },
                              keyboardType: TextInputType.name,
                              // validator: ValidationBuilder().minLength(3).build(),
                              // autovalidateMode: controller.autoValidateMode,
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
                                hintText: "Select country",
                                hintStyle: const TextStyle(
                                  color: Colors.black26,
                                  fontSize: 1.0,
                                ),
                              ),
                            ),
                            const SizedBox(height: 35.0),

                            // Privacy Policy
                            RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                  text: "By clicking the Register button below, you agree to Deeventures Exchange ",
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                    fontSize: 14.0,
                                  ),
                                ),
                                const TextSpan(
                                  text: "Privacy Policy",
                                  style: TextStyle(
                                    color: Color(0XFF07B46B),
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                              ]),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 30.0),

                            //  Register Button.
                            TextButton(
                              onPressed: () {
                                (_formKey.currentState!.validate()) ? (
                                    controller.registerUser()
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
                                child: (!controller.isLoading) ?
                                const Text(
                                  "REGISTER",
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
                            const SizedBox(height: 20.0),

                            // Already have an account
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Already have an account? ",
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Get.offNamed(loginScreen);
                                  },
                                  child: const Text(
                                    "Login",
                                    style: TextStyle(
                                      color: Color(0XFF07B46B),
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }
        ),
      ),
    );
  }
}
