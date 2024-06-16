import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'controllers/setting_state_controller.dart';

class SettingScreen extends StatelessWidget {
  SettingScreen({super.key});

  final SettingStateController settingStateController = Get.put(SettingStateController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingStateController>(builder: (controller) {
      return SafeArea(
        child: Scaffold(

          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Image.asset(
                "assets/images/arrow_back.png",
                height: 17.0,
                width: 30.0,
                color: Colors.grey.shade700,
              ),
            ),

            title: Text(
              "Settings",
              style: TextStyle(
                color: Colors.grey.shade700,
                fontSize: 18.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            centerTitle: true,
          ),

          body: Container(
            height: Get.height,
            width: Get.width,
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 20.0),

                  _profile(),
                  const SizedBox(height: 10.0),

                  _security(),
                  const SizedBox(height: 10.0),

                  _information(),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  Widget _profile() {
    return Column(
      children: [
        Container(
          width: Get.width,
          color: Colors.green,
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
          child: const Text(
              "Profile",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.w500
            ),
          ),
        ),
        ListView(
          shrinkWrap: true,
          children: [
            ListTile(
              onTap: () {},
              dense: true,
              leading: const Icon(Iconsax.user_edit),
              title: const Text(
                "Edit Profile",
                style: TextStyle(
                  fontSize: 14.0
                ),
              ),
            ),
            ListTile(
              onTap: () {},
              dense: true,
              leading: const Icon(Iconsax.bank),
              title: const Text(
                "Bank Account",
                style: TextStyle(
                    fontSize: 14.0
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget _security() {
    return Column(
      children: [
        Container(
          width: Get.width,
          color: Colors.green,
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
          child: const Text(
              "Security",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.w500
            ),
          ),
        ),
        ListView(
          shrinkWrap: true,
          children: [
            ListTile(
              onTap: () {},
              dense: true,
              leading: const Icon(Iconsax.password_check),
              title: const Text(
                "Change Password",
                style: TextStyle(
                  fontSize: 14.0
                ),
              ),
            ),
            ListTile(
              onTap: () {},
              dense: true,
              leading: Text(
                "2FA",
                style: TextStyle(
                  color: Colors.grey.shade800,
                  fontSize: 14.0,
                ),
              ),
              title: const Text(
                "2 Factor Authentication",
                style: TextStyle(
                    fontSize: 14.0
                ),
              ),
            ),
            ListTile(
              onTap: () {},
              dense: true,
              leading: const Icon(Iconsax.profile_delete,),
              title: const Text(
                "Delete Account",
                style: TextStyle(
                    fontSize: 14.0
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget _information() {
    return Column(
      children: [
        Container(
          width: Get.width,
          color: Colors.green,
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
          child: const Text(
              "Information",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.w500
            ),
          ),
        ),
        ListView(
          shrinkWrap: true,
          children: [
            ListTile(
              onTap: () {},
              dense: true,
              leading: Image.asset(
                "assets/images/launcher_icon.png",
                height: 18.0,
                width: 18.0,
                color: Colors.grey.shade600,
              ),
              title: const Text(
                "About Deeventures",
                style: TextStyle(
                  fontSize: 14.0
                ),
              ),
            ),
            ListTile(
              onTap: () {},
              dense: true,
              leading: Text(
                "T&C",
                style: TextStyle(
                  color: Colors.grey.shade800,
                  fontSize: 13.5,
                  fontWeight: FontWeight.w800
                ),
              ),
              title: const Text(
                "Terms & Condition",
                style: TextStyle(
                    fontSize: 14.0
                ),
              ),
            ),
            ListTile(
              onTap: () {},
              dense: true,
              leading: Text(
                "Ref",
                style: TextStyle(
                    color: Colors.grey.shade800,
                    fontSize: 13.5,
                    fontWeight: FontWeight.w800
                ),
              ),
              title: const Text(
                "About Referral",
                style: TextStyle(
                    fontSize: 14.0
                ),
              ),
            ),
            ListTile(
              onTap: () {},
              dense: true,
              leading: const Icon(Iconsax.tag),
              title: const Text(
                "FAQs",
                style: TextStyle(
                    fontSize: 14.0
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
