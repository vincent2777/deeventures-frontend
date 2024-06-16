import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

import 'controllers/wallet_state_controller.dart';

class WalletScreen extends StatelessWidget {
  WalletScreen({super.key});

  final WalletStateController walletStateController = Get.put(WalletStateController());
  final formatter = NumberFormat("#,##0");

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Column(
          children: [

            // Header Bar
            Container(
              height: 65.0,
              width: Get.width,
              padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Builder(builder: (context) {
                    // this uses the new context to open the drawer properly provided by the Builder
                    return IconButton(
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                      icon: Icon(
                        Iconsax.textalign_justifycenter,
                        color: Colors.grey.shade800,
                        size: 25,
                      ),
                    );
                  }),

                  Text(
                    "Wallet",
                    style: TextStyle(
                        color: Colors.grey.shade700,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w700
                    ),
                  ),

                  const SizedBox(
                    height: 10.0,
                    width: 40.0,
                  ),
                ],
              ),
            ),

            GetBuilder<WalletStateController>(builder: (controller) {
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [

                        ClipRRect(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(15.0),
                          ),
                          child: Container(
                            padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 5.0),
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  width: 8.0,
                                  color: Color(0XFF8BFF63),
                                ),
                              ),
                              image: DecorationImage(
                                image: AssetImage(
                                  "assets/images/wallet_bg_2.png",
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Your Naira wallet",
                                      style: TextStyle(
                                          color: Colors.black87,
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w600
                                      ),
                                    ),
                                    const Spacer(),

                                    Container(
                                      height: 35.0,
                                      width: 35.0,
                                      padding: const EdgeInsets.all(1.0),
                                      child: IconButton(
                                        onPressed: () {
                                          controller.setShowWalletBalance();
                                        },
                                        color: const Color(0XFF5149F7),
                                        padding: EdgeInsets.zero,
                                        icon: Icon(
                                          controller.showWalletBalance ? Iconsax.eye : Iconsax.eye_slash,
                                          color: Colors.white,
                                          size: 20.0,
                                        ),
                                        style: IconButton.styleFrom(
                                            backgroundColor: const Color(0XFF09A060),
                                            fixedSize: const Size(20.0, 20.0),
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(7.0)
                                            )
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(height: 10.0),

                                (controller.showWalletBalance) ? (
                                    Text(
                                      "${controller.wallet.currencySymbol}${formatter.format(controller.wallet.amount)}",
                                      style: const TextStyle(
                                          color: Colors.black87,
                                          fontFamily: "Roboto",
                                          fontSize: 28.0,
                                          fontWeight: FontWeight.w600
                                      ),
                                    )
                                ) : (
                                    Text(
                                      "${controller.wallet.currencySymbol}****",
                                      style: const TextStyle(
                                          color: Colors.black87,
                                          fontFamily: "Roboto",
                                          fontSize: 28.0,
                                          fontWeight: FontWeight.w600
                                      ),
                                    )
                                ),
                                const SizedBox(height: 15.0),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      children: [
                                        Container(
                                          height: 50.0,
                                          width: 50.0,
                                          padding: const EdgeInsets.all(1.0),
                                          child: IconButton(
                                            onPressed: () {},
                                            color: const Color(0XFF59C88A),
                                            padding: EdgeInsets.zero,
                                            icon: const Icon(
                                              Iconsax.moneys,
                                              color: Colors.white,
                                              size: 26.0,
                                            ),
                                            style: IconButton.styleFrom(
                                                backgroundColor: const Color(0XFF09A060),
                                                fixedSize: const Size(20.0, 20.0),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(10.0)
                                                )
                                            ),
                                          ),
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
                                        Container(
                                          height: 50.0,
                                          width: 50.0,
                                          padding: const EdgeInsets.all(1.0),
                                          child: IconButton(
                                            onPressed: () {},
                                            color: const Color(0XFF59C88A),
                                            padding: EdgeInsets.zero,
                                            icon: const Icon(
                                              Iconsax.money_recive,
                                              color: Colors.white,
                                              size: 26.0,
                                            ),
                                            style: IconButton.styleFrom(
                                                backgroundColor: const Color(0XFF09A060),
                                                fixedSize: const Size(20.0, 20.0),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(10.0)
                                                )
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 3.0),

                                        Text(
                                          "Deposit",
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
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 20.0),

                        ClipRRect(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(15.0),
                          ),
                          child: Container(
                            padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 5.0),
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  width: 8.0,
                                  color: Color(0XFF63BFF8),
                                ),
                              ),
                              image: DecorationImage(
                                image: AssetImage(
                                  "assets/images/wallet_bg_3.png",
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Text(
                                      "Your referral bonus wallet",
                                      style: TextStyle(
                                          color: Colors.black87,
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w600
                                      ),
                                    ),
                                    const Spacer(),

                                    Container(
                                      height: 35.0,
                                      width: 35.0,
                                      padding: const EdgeInsets.all(1.0),
                                      child: IconButton(
                                        onPressed: () {
                                          controller.setShowReferralWalletBalance();
                                        },
                                        color: const Color(0XFF5149F7),
                                        padding: EdgeInsets.zero,
                                        icon: Icon(
                                          controller.showReferralWalletBalance ? Iconsax.eye : Iconsax.eye_slash,
                                          color: Colors.white,
                                          size: 20.0,
                                        ),
                                        style: IconButton.styleFrom(
                                            backgroundColor: const Color(0XFF5149F7),
                                            fixedSize: const Size(20.0, 20.0),
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(7.0)
                                            )
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(height: 10.0),

                                (controller.showReferralWalletBalance) ? (
                                    Text(
                                      "${controller.wallet.currencySymbol}${formatter.format(controller.referralWallet.amount)}",
                                      style: const TextStyle(
                                          color: Colors.black87,
                                          fontFamily: "Roboto",
                                          fontSize: 28.0,
                                          fontWeight: FontWeight.w600
                                      ),
                                    )
                                ) : (
                                    Text(
                                      "${controller.wallet.currencySymbol}****",
                                      style: const TextStyle(
                                          color: Colors.black87,
                                          fontFamily: "Roboto",
                                          fontSize: 28.0,
                                          fontWeight: FontWeight.w600
                                      ),
                                    )
                                ),
                                const SizedBox(height: 15.0),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Column(
                                      children: [
                                        Container(
                                          height: 50.0,
                                          width: 50.0,
                                          padding: const EdgeInsets.all(1.0),
                                          child: IconButton(
                                            onPressed: () {},
                                            color: const Color(0XFF5149F7),
                                            padding: EdgeInsets.zero,
                                            icon: const Icon(
                                              Iconsax.moneys,
                                              color: Colors.white,
                                              size: 26.0,
                                            ),
                                            style: IconButton.styleFrom(
                                                backgroundColor: const Color(0XFF5149F7),
                                                fixedSize: const Size(20.0, 20.0),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(10.0)
                                                )
                                            ),
                                          ),
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

                                    /*Column(
                                      children: [
                                        Container(
                                          height: 50.0,
                                          width: 50.0,
                                          padding: const EdgeInsets.all(1.0),
                                          child: IconButton(
                                            onPressed: () {},
                                            color: const Color(0XFF59C88A),
                                            padding: EdgeInsets.zero,
                                            icon: const Icon(
                                              Iconsax.money_send,
                                              color: Colors.white,
                                              size: 26.0,
                                            ),
                                            style: IconButton.styleFrom(
                                                backgroundColor: const Color(0XFF5149F7),
                                                fixedSize: const Size(20.0, 20.0),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(10.0)
                                                )
                                            ),
                                          ),
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
                                    ),*/

                                    /*Column(
                                      children: [
                                        Container(
                                          height: 50.0,
                                          width: 50.0,
                                          padding: const EdgeInsets.all(1.0),
                                          child: IconButton(
                                            onPressed: () {},
                                            color: const Color(0XFF59C88A),
                                            padding: EdgeInsets.zero,
                                            icon: const Icon(
                                              Iconsax.money_recive,
                                              color: Colors.white,
                                              size: 26.0,
                                            ),
                                            style: IconButton.styleFrom(
                                                backgroundColor: const Color(0XFF5149F7),
                                                fixedSize: const Size(20.0, 20.0),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(10.0)
                                                )
                                            ),
                                          ),
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
                                    ),*/
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
