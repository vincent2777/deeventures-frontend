import 'package:deeventures/screens/auths/controllers/login_state_controller.dart';
import 'package:deeventures/screens/dashboard/controllers/dashboard_state_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/make_money_state_controller.dart';

class MakeMoneyScreen extends StatelessWidget {
  MakeMoneyScreen({super.key});

  final MakeMoneyStateController makeMoneyStateController = Get.put(MakeMoneyStateController());
  final DashboardStateController dashboardStateController = Get.put(DashboardStateController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(

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
          "Make Money",
          style: TextStyle(
            color: Colors.grey.shade700,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),

      body: GetBuilder<MakeMoneyStateController>(builder: (controller) {
          return Container(
            height: Get.height,
            width: Get.width,
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 25.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Referral Link",
                    style: TextStyle(
                      fontWeight: FontWeight.w500
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(4)),
                    child: const Text("https://app.deeventures.com.ng/?ref="),
                  ),
                  const SizedBox(height: 30.0),

                  const Text(
                    "Referral Code",
                    style: TextStyle(
                        fontWeight: FontWeight.w500
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(4)),
                    child: Text(dashboardStateController.user.username!),
                  ),
                  const SizedBox(height: 30.0),

                  const Text(
                    "About Our Referral",
                    style: TextStyle(
                        color: Color(0XFF09A060),
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    "To show our appreciation to all our customers effort to refer people to us, because we understand that more percentage of our customers get to know us by being reffered by other satisfied customers. We have therefore implemented a referral by other satisfied customers. We have therefore implemented a referral program in terms of reward to show our appreciation to our customers who refer others to us.",
                    maxLines: 10,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.grey.shade700,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                  const SizedBox(height: 30.0),

                  const Text(
                    "How does it work?",
                    style: TextStyle(
                        color: Color(0XFF09A060),
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    "A unique referral link has been created for every user  whether verified or not, you can share your link via any platform you desire to get people to sign up under you.",
                    maxLines: 10,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.grey.shade700,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                  const SizedBox(height: 30.0),

                  const Text(
                    "How much will I earn?",
                    style: TextStyle(
                        color: Color(0XFF09A060),
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    "Anyone who clicks the link and registers on our platform becomes your referral and you will receive 0.2% of their total transactions, both on their BUY and SELL order for a lifetime.\n\nCommissions can be withdrawn  into your DEEVENTURES Wallet which you can withdraw directly into your bank account or you can use the same to purchase any of our services.\n\nNOTE, minimum withdrawal is NGN 2500",
                    maxLines: 12,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.grey.shade700,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                  const SizedBox(height: 30.0),

                  const Text(
                    "Rules",
                    style: TextStyle(
                        color: Color(0XFF09A060),
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    "Referring oneself is fraud! You cannot refer yourself in anyway (either in disguise or open). We have put security in place to check this type of fraud. Any account detected to have perpetuated this type of fraud will have all commission earned frozen at the point of withdrawal and account closed by the admin.",
                    maxLines: 8,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.grey.shade700,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    "It is very simple to start. Just copy your referral link above and start telling people about Deeventures or you could share directly with the share button.",
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.grey.shade700,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                  const SizedBox(height: 30.0),
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}
