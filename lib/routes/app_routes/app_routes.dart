import 'package:deeventures/screens/billPayment/bill_payment_screen.dart';
import 'package:deeventures/screens/setting/setting_screen.dart';
import 'package:deeventures/screens/setting/web_view.dart';
import 'package:deeventures/screens/tradeGiftCard/trade_gift_card_screen.dart';
import 'package:flutter/animation.dart';
import 'package:get/get.dart';

import '../../screens/tradeGiftCard/trade_gift_card_screen2.dart';
import 'app_route_names.dart';
import '../../screens/auths/login_screen.dart';
import '../../screens/auths/register_screen.dart';
import '../../screens/home/home_screen.dart';
import '../../screens/topTraders/top_traders_screen.dart';
import '../../screens/splash/splash_screen.dart';
import '../../screens/onboarding/onboarding_screen.dart';
import '../../screens/customerSupport/customer_support_screen.dart';
import '../../screens/makeMoney/make_money_screen.dart';
import '../../screens/notification/notification_screen.dart';
import '../../screens/promo/promo_screen.dart';
import '../../screens/leaderBoard/leader_board_screen.dart';
import '../../screens/tradeCryptocurrency/trade_cryptocurrency_screen.dart';
import '../../screens/tradeCryptocurrency/crypto_currency_detail_screen.dart';

List<GetPage<dynamic>> getPages = [
  /*
  * Walk-Through Screens.
  */
  GetPage(
    name: splashScreen,
    page: () => const SplashScreen(),
  ),
  GetPage(
    name: onboardingScreen,
    page: () => OnboardingScreen(),
    transition: Transition.circularReveal,
    transitionDuration:  const Duration(seconds: 3),
    curve: Curves.easeIn,
  ),

  /*
  * Auth Screens.
  */
  GetPage(
    name: loginScreen,
    page: () => LoginScreen(),
    transition: Transition.native,
    transitionDuration:  const Duration(seconds: 1),
    curve: Curves.easeOut,
  ),
  GetPage(
    name: registerScreen,
    page: () => RegisterScreen(),
    transition: Transition.rightToLeft,
    transitionDuration: const Duration(milliseconds: 350),
    curve: Curves.easeIn,
  ),


  /*
  * Home Screens.
  */
  GetPage(
    name: homeScreen,
    page: () => HomeScreen(),
    transition: Transition.rightToLeft,
    transitionDuration: const Duration(milliseconds: 700),
    curve: Curves.easeIn,
  ),

  // Dashboard -> Trade Cryptocurrency Screens.
  GetPage(
    name: tradeCryptocurrencyScreen,
    page: () => TradeCryptocurrencyScreen(),
    transition: Transition.rightToLeft,
    transitionDuration: const Duration(milliseconds: 700),
    curve: Curves.easeIn,
  ),
  GetPage(
    name: cryptocurrencyDetailScreen,
    page: () => CryptocurrencyDetailScreen(),
    transition: Transition.rightToLeft,
    transitionDuration: const Duration(milliseconds: 300),
    curve: Curves.easeIn,
  ),

  // Dashboard -> Trade Gift Card Screens.
  GetPage(
    name: tradeGiftCardScreen,
    page: () => TradeGiftCardScreen(),
    transition: Transition.rightToLeft,
    transitionDuration: const Duration(milliseconds: 700),
    curve: Curves.easeIn,
  ),

  // Dashboard -> Trade Gift Card Screens step 2.
  GetPage(
    name: tradeGiftCardScreen2,
    page: () => TradeGiftCardScreen2(),
    transition: Transition.rightToLeft,
    transitionDuration: const Duration(milliseconds: 700),
    curve: Curves.easeIn,
  ),

  // Dashboard -> Bill Payment Screens.
  GetPage(
    name: billPaymentScreen,
    page: () => BillPaymentScreen(),
    transition: Transition.rightToLeft,
    transitionDuration: const Duration(milliseconds: 700),
    curve: Curves.easeIn,
  ),

  
  // Top Traders Screens.
  GetPage(
    name: topTradersScreen,
    page: () => TopTradersScreen(),
    transition: Transition.rightToLeft,
    transitionDuration: const Duration(milliseconds: 200),
    curve: Curves.easeIn,
  ),

  // Leader Board Screens.
  GetPage(
    name: leaderBoardScreen,
    page: () => LeaderBoardScreen(),
    transition: Transition.rightToLeft,
    transitionDuration: const Duration(milliseconds: 200),
    curve: Curves.easeIn,
  ),

  // Make Money Screens.
  GetPage(
    name: makeMoneyScreen,
    page: () => MakeMoneyScreen(),
    transition: Transition.rightToLeft,
    transitionDuration: const Duration(milliseconds: 200),
    curve: Curves.easeIn,
  ),

  // Promo Screens.
  GetPage(
    name: promoScreen,
    page: () => PromoScreen(),
    transition: Transition.rightToLeft,
    transitionDuration: const Duration(milliseconds: 200),
    curve: Curves.easeIn,
  ),

  // Notification Screens.
  GetPage(
    name: notificationScreen,
    page: () => NotificationScreen(),
    transition: Transition.rightToLeft,
    transitionDuration: const Duration(milliseconds: 200),
    curve: Curves.easeIn,
  ),

  // Customer Support Screens.
  GetPage(
    name: customerSupportScreen,
    page: () => CustomerSupportScreen(),
    transition: Transition.rightToLeft,
    transitionDuration: const Duration(milliseconds: 200),
    curve: Curves.easeIn,
  ),

  // Settings Screens.
  GetPage(
    name: settingsScreen,
    page: () => SettingScreen(),
    transition: Transition.rightToLeft,
    transitionDuration: const Duration(milliseconds: 200),
    curve: Curves.easeIn,
  ),

  // Webview Screens.
  GetPage(
    name: webViewScreen,
    page: () => WebView(
      pageLink: Get.parameters['pageLink'] ?? "",
      pageTitle: Get.parameters['pageTitle'] ?? "",
    ),
    transition: Transition.rightToLeft,
    transitionDuration: const Duration(milliseconds: 200),
    curve: Curves.easeIn,
  ),
];