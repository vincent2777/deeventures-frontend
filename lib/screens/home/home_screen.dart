import 'package:deeventures/screens/tradeGiftCard/trade_gift_card_screen.dart';
import 'package:deeventures/screens/transactions/transactions_screen.dart';
import 'package:deeventures/screens/wallet/wallet_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../general/controllers/general_state_controller.dart';
import '../../general/widgets/app_bottom_navigation_bar.dart';
import '../../general/widgets/app_drawer.dart';
import 'controllers/home_state_controller.dart';
import '../dashboard/dashboard_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeStateController homeStateController = Get.put(HomeStateController());
  final GeneralStateController generalStateController = Get.put(GeneralStateController());

  final List<Widget> screens = [
    DashboardScreen(),
    TransactionsScreen(),
    TradeGiftCardScreen(),
    WalletScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<HomeStateController>(builder: (controller) {
        return Scaffold(
          extendBody: true,
          extendBodyBehindAppBar: true,

          body: screens[controller.selectedBottomBarIndex],

          drawer: AppDrawer(),

          bottomNavigationBar: AppBottomNavigationBar(controller),

          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            backgroundColor: Colors.green,
            shape: const CircleBorder(),
            child: const Icon(
              Iconsax.add,
              color: Colors.white,
              size: 26.0,
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        );
      }),
    );
  }
}