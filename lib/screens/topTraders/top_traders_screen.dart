import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/top_traders_state_controller.dart';
import 'top_traders_day_screen.dart';
import 'top_traders_month_screen.dart';
import 'top_traders_week_screen.dart';


class TopTradersScreen extends StatelessWidget {
  TopTradersScreen({super.key});

  final TopTradersStateController topTradersStateController = Get.put(TopTradersStateController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TopTradersStateController>(builder: (controller) {
        return SafeArea(
          child: DefaultTabController(
            length: 3,
            child: Scaffold(

              appBar: AppBar(
                leading: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(Icons.chevron_left_outlined),
                ),

                title: Text(
                  "Top Traders",
                  style: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                centerTitle: true,

                actions: [
                  PopupMenuButton(
                    onSelected: (value) {
                      controller.setTransactionType(value);
                    },
                    icon: const Icon(Icons.more_vert),
                    itemBuilder: (BuildContext context) {
                      return [
                        PopupMenuItem(
                          value: "",
                          child: Text(
                            "All",
                            style: TextStyle(
                                color: Colors.grey.shade700
                            ),
                          ),
                        ),
                        PopupMenuItem(
                          value: "gift_card",
                          child: Text(
                            "Gift Cards",
                            style: TextStyle(
                                color: Colors.grey.shade700
                            ),
                          ),
                        ),
                        PopupMenuItem(
                          value: "cryptocurrency",
                          child: Text(
                            "Cryptocurrency",
                            style: TextStyle(
                                color: Colors.grey.shade700
                            ),
                          ),
                        ),
                      ];
                    },
                  ),
                ],

                bottom: TabBar(
                  controller: controller.tabController,
                  indicatorColor: const Color(0XFF09A060),
                  unselectedLabelColor: Colors.grey.shade500,
                  labelColor: const Color(0XFF09A060),
                  labelStyle: const TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                  tabs: const [
                    Tab(text: "Day"),
                    Tab(text: "Week"),
                    Tab(text: "Month"),
                  ],
                ),
              ),

              body: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Container(
                  height: Get.height,
                  width: Get.width,
                  color: Colors.white,
                  child: TabBarView(
                    controller: controller.tabController,
                    children: [
                      TopTradersDayScreen(),
                      TopTradersWeekScreen(),
                      TopTradersMonthScreen(),
                    ],
                  )
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}
