import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../screens/home/controllers/home_state_controller.dart';

class AppBottomNavigationBar  extends StatelessWidget{
  const AppBottomNavigationBar(this.homeStateController, {super.key});

  final HomeStateController homeStateController;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      clipBehavior: Clip.hardEdge,
      elevation: 5.0,
      // height: 70.0,
      notchMargin: 7.0,
      shape: const CircularNotchedRectangle(),
      // shadowColor: Colors.grey.shade500,
      // padding: EdgeInsets.zero,
      child: Container(
        height: 70,
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              // color: Colors.grey,
              blurRadius: 5.0,
              blurStyle: BlurStyle.outer,
              spreadRadius: 5.0,
              offset: Offset(0, -5.0),
            )
          ],
          color: Colors.white,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildBottomAppBarItem(homeStateController, Iconsax.home, "Home", 0),
            _buildBottomAppBarItem(homeStateController, Iconsax.bitcoin_convert, "Transactions", 1),
            _buildBottomAppBarItem(homeStateController, Iconsax.gift, "Gift Card", 2),
            _buildBottomAppBarItem(homeStateController, Iconsax.wallet_1, "Wallet", 3),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomAppBarItem(HomeStateController controller, IconData icon, String label, int index) {
    return IconButton(
      onPressed: () {
        controller.setSelectedBottomBarIndex(index);
      },
      padding: EdgeInsets.zero,
      icon: Column(
        children: [
          Icon(
            icon,
            color: (controller.selectedBottomBarIndex == index)
                ? const Color(0XFF59C88A)
                : Colors.grey.shade600,
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: 11.0,
              color: (controller.selectedBottomBarIndex == index)
                  ? const Color(0XFF59C88A)
                  : Colors.grey.shade600,
            ),
          )
        ],
      ),
    );
  }
}
