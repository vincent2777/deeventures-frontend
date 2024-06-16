import 'package:deeventures/general/controllers/general_state_controller.dart';
import 'package:deeventures/screens/wallet/controllers/wallet_state_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

import '../../routes/app_routes/app_route_names.dart';
import 'controllers/dashboard_state_controller.dart';


class DashboardScreen extends StatelessWidget {
  DashboardScreen({super.key});

  final DashboardStateController dashboardStateController = Get.put(DashboardStateController());
  final formatter = NumberFormat("#,##0");

  @override
  Widget build(BuildContext context) {

    return GetBuilder<DashboardStateController>(builder: (controller) {
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
        child: Column(
          children: [

            // Header Bar
            Container(
              height: 65.0,
              width: Get.width,
              // color: Colors.blue,
              padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 0.0),
              child: Row(

                children: [
                  Builder(builder: (context) {
                    // this uses the new context to open the drawer properly provided by the Builder
                    return IconButton(
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                        icon: const Icon(
                          Iconsax.textalign_justifycenter,
                          color: Colors.white,
                          size: 25,
                        ),
                      );
                  }),
                  const Spacer(),

                  SizedBox(
                    height: 30.0,
                    width: 90.0,
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.white,
                          padding: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0)
                          )
                      ),
                      child: const Text(
                        "Top Traders",
                        style: TextStyle(
                          color: Color(0XFF07B46B),
                          fontSize: 12.0,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10.0,),

                  const Icon(
                    Iconsax.star,
                    color: Colors.white,
                    size: 25,
                  ),

                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Iconsax.notification_bing5,
                      color: Colors.white,
                      size: 25,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 5.0),

            Expanded(
              child: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        children: [
                          const CircleAvatar(
                            backgroundColor: Colors.white,
                            backgroundImage: AssetImage("assets/images/profile_img.png"),
                            radius: 30.0,
                          ),
                          const SizedBox(width: 10.0),

                          GetBuilder<GeneralStateController>(builder: (controller) {
                            return Text(
                              "Hello, ${controller.user.fullName != null ? controller.user.fullName!.split(" ")[0] : ''}",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600,
                              ),
                            );
                          }),
                          const Spacer(),

                          Container(
                            height: 32.0,
                            width: 32.0,
                            padding: const EdgeInsets.all(1.0),
                            child: IconButton(
                              onPressed: () {
                                controller.setShowWalletBalance();
                              },
                              color: Colors.white,
                              padding: EdgeInsets.zero,
                              icon: Icon(
                                controller.showWalletBalance ? Iconsax.eye : Iconsax.eye_slash,
                                color: Colors.black,
                                size: 20.0,
                              ),
                              style: IconButton.styleFrom(
                                backgroundColor: Colors.white,
                                fixedSize: const Size(20.0, 20.0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0)
                                )
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 10.0),

                    const Text(
                      "Available Balance",
                      style: TextStyle(
                          color: Colors.white70
                      ),
                    ),

                    (controller.showWalletBalance) ? (
                      GetBuilder<WalletStateController>(builder: (controller) {
                        return
                          Text(
                            "${controller.wallet.currencySymbol}${formatter.format(controller.wallet.amount)}",
                            style: const TextStyle(
                              color: Colors.white,
                              fontFamily: "Roboto",
                              fontSize: 24.0,
                              fontWeight: FontWeight.w700,
                            ),
                          );
                      })
                    ) : (
                      GetBuilder<WalletStateController>(builder: (controller) {
                        return Text(
                          "${controller.wallet.currencySymbol}****",
                          style: const TextStyle(
                            color: Colors.white,
                            fontFamily: "Roboto",
                            fontSize: 24.0,
                            fontWeight: FontWeight.w700,
                          ),
                        );
                      })
                    ),
                    const SizedBox(height: 20.0),

                    Stack(
                      children: [
                        Container(
                          height: Get.height,
                          width: Get.width,
                          padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 20.0),
                          margin: const EdgeInsets.only(top: 35.0),
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30.0),
                                topRight: Radius.circular(30.0),
                              ),
                              color: Colors.white
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 80.0),

                              Text(
                                "Quick Action",
                                style: TextStyle(
                                  color: Colors.grey.shade700,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 20.0),

                              // Trade Gift Cards
                              IconButton(
                                onPressed: () {
                                  Get.toNamed(tradeGiftCardScreen);
                                },
                                padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 40.0),
                                style: TextButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                                    backgroundColor: const Color(0XFF09A060),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    )
                                ),
                                icon: const Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Iconsax.gift,
                                      color: Colors.white,
                                      size: 25.0,
                                    ),
                                    SizedBox(width: 20),

                                    Text(
                                      "Trade Gift Card",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w600
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 20.0),

                              // Trade Crypto Currency
                              IconButton(
                                onPressed: () {
                                  Get.toNamed(tradeCryptocurrencyScreen);
                                },
                                padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 40.0),
                                style: TextButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                                    backgroundColor: const Color(0XFF09A060),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    )
                                ),
                                icon: const Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Iconsax.bitcoin_refresh,
                                      color: Colors.white,
                                      size: 25.0,
                                    ),
                                    SizedBox(width: 20),

                                    Text(
                                      "Trade Cryptocurrency",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w600
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 20.0),

                              // Pay Bills
                              IconButton(
                                onPressed: () {
                                  Get.toNamed(billPaymentScreen);
                                },
                                padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 40.0),
                                style: TextButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                                    backgroundColor: Colors.grey.shade200,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    )
                                ),
                                icon: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Iconsax.receipt_minus,
                                      color: Colors.grey.shade600,
                                      size: 25.0,
                                    ),
                                    const SizedBox(width: 20),

                                    Text(
                                      "Bill Payment",
                                      style: TextStyle(
                                          color: Colors.grey.shade600,
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w600
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        Positioned(
                          top: 0.0,
                          left: 0.0,
                          right: 0.0,
                          child: Container(
                            margin: const EdgeInsets.only(left: 35.0, right: 35.0),
                            padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 13.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromRGBO(143, 148, 251, .15),
                                  blurRadius: 10.0,
                                  offset: Offset(0, 2),
                                )
                              ],
                              color: Colors.white,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  children: [
                                    const Icon(
                                      Iconsax.moneys,
                                      color: Color(0XFF59C88A),
                                    ),
                                    const SizedBox(height: 3.0),

                                    Text(
                                      "Withdraw",
                                      style: TextStyle(
                                          color: Colors.grey.shade700,
                                          fontSize: 11.0,
                                          fontWeight: FontWeight.w600
                                      ),
                                    ),
                                  ],
                                ),

                                Column(
                                  children: [
                                    const Icon(
                                      Iconsax.money_send,
                                      color: Color(0XFF59C88A),
                                    ),
                                    const SizedBox(height: 3.0),

                                    Text(
                                      "Send",
                                      style: TextStyle(
                                          color: Colors.grey.shade700,
                                          fontSize: 11.0,
                                          fontWeight: FontWeight.w600
                                      ),
                                    ),
                                  ],
                                ),

                                Column(
                                  children: [
                                    const Icon(
                                      Iconsax.money_recive,
                                      color: Color(0XFF59C88A),
                                    ),
                                    const SizedBox(height: 3.0),

                                    Text(
                                      "Fund Wallet",
                                      style: TextStyle(
                                          color: Colors.grey.shade700,
                                          fontSize: 11.0,
                                          fontWeight: FontWeight.w600
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}
