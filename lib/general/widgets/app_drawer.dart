import 'package:deeventures/general/controllers/general_state_controller.dart';
import 'package:deeventures/general/models/drawer_item_model.dart';
import 'package:deeventures/screens/auths/controllers/login_state_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../routes/app_routes/app_route_names.dart';

class AppDrawer extends StatelessWidget {
  AppDrawer({super.key});


  final int selectedIndex = 0;
  final List<DrawerItem> _drawerItems = [
    DrawerItem(icon: Iconsax.home, title: "Home", route: homeScreen),
    DrawerItem(icon: Iconsax.align_vertically, title: "Top Trader", route: topTradersScreen),
    DrawerItem(icon: Iconsax.chart_1, title: "Leaderboard Info", route: leaderBoardScreen),
    DrawerItem(icon: Iconsax.moneys, title: "Make Money", route: makeMoneyScreen),
    DrawerItem(icon: Iconsax.sms_tracking, title: "Promo Code", route: promoScreen),
    DrawerItem(icon: Iconsax.notification, title: "Notification", route: notificationScreen),
    DrawerItem(icon: Iconsax.call_calling, title: "Customer Support", route: customerSupportScreen),
    DrawerItem(icon: Iconsax.setting_2, title: "Settings", route: settingsScreen),
    DrawerItem(icon: Iconsax.logout_14, title: "Logout", route: ""),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: 300.0,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),

      child: Column(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              onPressed: () { Scaffold.of(context).closeDrawer(); },
              padding: EdgeInsets.zero,
              icon: const Icon(
                Icons.clear,
                size: 28.0,
              ),
            ),
          ),
          const SizedBox(height: 20.0),

          GetBuilder<GeneralStateController>(builder: (controller) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 65.0,
                    width: 65.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: const DecorationImage(image: AssetImage("assets/images/profile_img.png"))
                    ),
                  ),
                  const SizedBox(width: 15.0),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hello, ${controller.user.fullName != null ? controller.user.fullName!.split(" ")[0] : ''}",
                        style: TextStyle(
                          color: Colors.grey.shade800,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        controller.user.email!,
                        style: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  )
                ],
              );
            }
          ),
          const SizedBox(height: 40.0),

          Expanded(
              child: ListView.builder(
                itemCount: _drawerItems.length,
                itemBuilder: (context, index) {

                  return Container(
                    decoration: BoxDecoration(
                      color: (index == selectedIndex)
                          ? Colors.green.withOpacity(0.2)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      onTap: () {
                        if (index == 0) {
                          Get.back();
                        } else if (index == _drawerItems.length - 1) {
                          // Logout User
                          LoginStateController().logoutUser();
                        } else {
                          Get.back();
                          Get.toNamed(_drawerItems[index].route);
                        }
                      },
                      horizontalTitleGap: 15.0,
                      // Set the horizontal gap to zero
                      leading: Icon(
                        _drawerItems[index].icon,
                        color: Colors.grey.shade700,
                      ),
                      title: Text(
                        _drawerItems[index].title,
                        style: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  );
                },
              ),
          ),
        ],
      ),
    );
  }
}