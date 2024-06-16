import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/leader_board_state_controller.dart';

class LeaderBoardScreen extends StatelessWidget {
  LeaderBoardScreen({super.key});

  final LeaderBoardStateController leaderBoardStateController = Get.put(LeaderBoardStateController());

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
          "Leader Board",
          style: TextStyle(
            color: Colors.grey.shade700,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),

      body: GetBuilder<LeaderBoardStateController>(builder: (controller) {
          return Container(
            height: Get.height,
            width: Get.width,
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image.asset(
                    "assets/images/leader_board.png",
                    height: 265.0,
                    width: Get.width,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 20.0),

                const Text(
                  "Get Extra Cash On Your Trade",
                  style: TextStyle(
                    color: Color(0XFF09A060),
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600
                  ),
                ),
                const SizedBox(height: 5.0),

                Text(
                  "To celebrate INDEPENDENCE, Deeventures is giving extra 1,000 naira on Giftcard transaction above 25,000 or 353 cedis.\nOver valid from now till Wednesday 5th of October 2022.\nUSE PROMO CODE: 9JA@62",
                  maxLines: 6,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.grey.shade700,
                    fontWeight: FontWeight.w500
                  ),
                ),
              ],
            ),
          );
        }
      ),
    );
  }
}
