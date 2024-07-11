import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:form_validator/form_validator.dart';
import 'package:iconsax/iconsax.dart';

import '../../routes/app_routes/app_route_names.dart';
import '../../utils/colors.dart';
import 'controllers/login_state_controller.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final LoginStateController loginStateController = Get.put(LoginStateController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,

        body: GetBuilder<LoginStateController>(builder: (controller) {
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
                  padding: const EdgeInsets.only(top: 90.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: Text(
                            "Welcome Back",
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
                            "Sign into your account",
                            style: TextStyle(
                              color: Colors.white54,
                              fontSize: 13.0,
                            ),
                          ),
                      ),
                      const SizedBox(height: 45.0),

                      Container(
                        height: Get.height,
                        width: Get.width,
                        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
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
                              "LOGIN",
                              style: TextStyle(
                                color: Colors.black.withOpacity(0.7),
                                fontWeight: FontWeight.w800,
                                fontSize: 18.0
                              ),
                            ),
                            const SizedBox(height: 25.0),

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
                            const SizedBox(height: 10.0),

                            // Forgot password
                            Align(
                              alignment: Alignment.centerRight,
                              child: InkWell(
                                onTap: () {},
                                child: const Text(
                                  "Forgot password?",
                                  style: TextStyle(
                                    color: Color(0XFFFB2D00),
                                    fontSize: 14.0,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20.0),

                            // Don't have an account
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Don't have an account? ",
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Get.offNamed(registerScreen);
                                  },
                                  child: const Text(
                                    "Register",
                                    style: TextStyle(
                                      color: Color(0XFF07B46B),
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 50.0),

                            //  Login Button.
                            TextButton(
                              onPressed: () {
                                (_formKey.currentState!.validate()) ? (
                                    controller.loginUser()
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
                                  "LOGIN",
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
                            const SizedBox(height: 30.0),

                            const Center(
                              child: Icon(
                                Iconsax.finger_scan,
                                color: Color(0XFF07B46B),
                                size: 40,
                              ),
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
