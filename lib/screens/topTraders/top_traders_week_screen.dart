import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'controllers/top_traders_state_controller.dart';

class TopTradersWeekScreen extends StatelessWidget {
  TopTradersWeekScreen({super.key});

  final formatter = NumberFormat("#,##0");

  String getInitials(String fullName) {
    return fullName.isNotEmpty ? fullName.split(" ").map((eachName) => eachName[0]).join(".") : "";
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TopTradersStateController>(builder: (controller) {
      return (!controller.isLoading) ? (
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    (controller.topTraders.length >= 2) ? (
                        Stack(
                            children: [
                              Column(
                                children: [
                                  Container(
                                    height: 75.0,
                                    width: 85.0,
                                    margin: const EdgeInsets.only(top: 10.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50.0),
                                      color: const Color(0XFFF7AB1A),
                                    ),
                                    child: Center(
                                      child: Text(
                                        (controller.topTraders.isNotEmpty ? getInitials(controller.topTraders[1].user!.fullName!) : ""),
                                        style: const TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w600
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 5.0),

                                  Column(
                                    children: [
                                      Text(
                                        "₦${formatter.format(controller.topTraders[1].totalAmount!)}",
                                        style: const TextStyle(
                                          color: Color(0XFF09A060),
                                          fontFamily: "Roboto",
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        controller.topTraders[1].user!.username!,
                                        style: const TextStyle(
                                          color: Colors.grey,
                                          fontSize: 11.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),

                              Positioned(
                                top: 0.0,
                                left: 0.0,
                                right: 0.0,
                                child: Container(
                                  height: 24.0,
                                  width: 24.0,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.grey.shade300,
                                  ),
                                  child: const Center(
                                    child: Text(
                                      "2",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ]
                        )
                    ) : (
                        Stack(
                            children: [
                              Column(
                                children: [
                                  Container(
                                    height: 75.0,
                                    width: 85.0,
                                    margin: const EdgeInsets.only(top: 10.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50.0),
                                      color: Colors.grey.shade400,
                                    ),
                                    child: const Center(
                                      child: Text(
                                        "",
                                        style: TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w600
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 41.0),
                                ],
                              ),

                              Positioned(
                                top: 0.0,
                                left: 0.0,
                                right: 0.0,
                                child: Container(
                                  height: 24.0,
                                  width: 24.0,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.grey.shade300,
                                  ),
                                  child: const Center(
                                    child: Text(
                                      "2",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ]
                        )
                    ),

                    (controller.topTraders.isNotEmpty) ? (
                        Stack(
                            children: [
                              Column(
                                children: [
                                  Container(
                                    height: 100.0,
                                    width: 115.0,
                                    margin: const EdgeInsets.only(top: 10.0),
                                    decoration: BoxDecoration(
                                      // borderRadius: BorderRadius.circular(50.0),
                                      color: const Color(0XFF09A060),
                                        shape: BoxShape.circle

                                    ),
                                    child: Center(
                                      child: Text(
                                        (controller.topTraders.isNotEmpty ? getInitials(controller.topTraders[0].user!.fullName!) : ""),
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.w700
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 5.0),

                                  Column(
                                    children: [
                                      Text(
                                        "₦${formatter.format(controller.topTraders[0].totalAmount!)}",
                                        style: const TextStyle(
                                          color: Color(0XFF09A060),
                                          fontFamily: "Roboto",
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        controller.topTraders[0].user!.username!,
                                        style: const TextStyle(
                                          color: Colors.grey,
                                          fontSize: 11.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),

                              Positioned(
                                top: 0.0,
                                left: 0.0,
                                right: 0.0,
                                child: Container(
                                  height: 24.0,
                                  width: 24.0,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.grey.shade300,
                                  ),
                                  child: const Center(
                                    child: Text(
                                      "1",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ]
                        )
                    ) : (
                        Stack(
                            children: [
                              Column(
                                children: [
                                  Container(
                                    height: 100.0,
                                    width: 100.0,
                                    margin: const EdgeInsets.only(top: 10.0),
                                    decoration: BoxDecoration(
                                      // borderRadius: BorderRadius.circular(50.0),
                                      color: Colors.grey.shade400,
                                        shape: BoxShape.circle

                                    ),
                                    child: const Center(
                                      child: Text(
                                        "",
                                        style: TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w600
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 41.0),
                                ],
                              ),

                              Positioned(
                                top: 0.0,
                                left: 0.0,
                                right: 0.0,
                                child: Container(
                                  height: 24.0,
                                  width: 24.0,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.grey.shade300,
                                  ),
                                  child: const Center(
                                    child: Text(
                                      "1",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ]
                        )
                    ),

                    (controller.topTraders.length >= 3) ? (
                        Stack(
                            children: [
                              Column(
                                children: [
                                  Container(
                                    height: 75.0,
                                    width: 85.0,
                                    margin: const EdgeInsets.only(top: 10.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50.0),
                                      color: const Color(0XFFF7AB1A),
                                    ),
                                    child: Center(
                                      child: Text(
                                        (controller.topTraders.isNotEmpty ? getInitials(controller.topTraders[2].user!.fullName!) : ""),
                                        style: const TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w600
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 5.0),

                                  Column(
                                    children: [
                                      Text(
                                        "₦${formatter.format(controller.topTraders[2].totalAmount!)}",
                                        style: const TextStyle(
                                          color: Color(0XFF09A060),
                                          fontFamily: "Roboto",
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        controller.topTraders[2].user!.username!,
                                        style: const TextStyle(
                                          color: Colors.grey,
                                          fontSize: 11.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),

                              Positioned(
                                top: 0.0,
                                left: 0.0,
                                right: 0.0,
                                child: Container(
                                  height: 24.0,
                                  width: 24.0,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.grey.shade300,
                                  ),
                                  child: const Center(
                                    child: Text(
                                      "3",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ]
                        )
                    ) : (
                        Stack(
                            children: [
                              Column(
                                children: [
                                  Container(
                                    height: 75.0,
                                    width: 85.0,
                                    margin: const EdgeInsets.only(top: 10.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50.0),
                                      color: Colors.grey.shade400,
                                    ),
                                    child: const Center(
                                      child: Text(
                                        "",
                                        style: TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w600
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 41.0),
                                ],
                              ),

                              Positioned(
                                top: 0.0,
                                left: 0.0,
                                right: 0.0,
                                child: Container(
                                  height: 24.0,
                                  width: 24.0,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.grey.shade300,
                                  ),
                                  child: const Center(
                                    child: Text(
                                      "3",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ]
                        )
                    ),

                  ],
                ),
                const SizedBox(height: 20.0),

                (controller.topTraders.length >= 4) ? (
                    Expanded(
                      child: ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.topTraders.length - 3,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            leading: CircleAvatar(
                              backgroundColor: const Color(0XFFF7AB1A),
                              child: Text(
                                (controller.topTraders.isNotEmpty ? getInitials(controller.topTraders[index+3].user!.fullName!) : ""),
                                style: const TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),

                            title: Text(
                              "₦${formatter.format(controller.topTraders[index+3].totalAmount!)}",
                              style: const TextStyle(
                                color: Color(0XFF09A060),
                                fontFamily: "Roboto",
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),

                            subtitle: Text(
                              controller.topTraders[index+3].user!.username!,
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 12.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),

                            trailing: Container(
                              height: 24.0,
                              width: 24.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey.shade300,
                              ),
                              child: Center(
                                child: Text(
                                  "${index  + 4}",
                                  style: const TextStyle(
                                      fontSize: 13.0,
                                      fontWeight: FontWeight.w700
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return Divider(
                            height: 1.0,
                            thickness: 1.0,
                            color: Colors.teal.shade600,
                          );
                        },
                      ),
                    )
                ) : Container(),
              ],
            ),
          )
      ) : (
          const Center(
            child: CircularProgressIndicator(
              strokeWidth: 2.0,
            ),
          )
      );
    }
    );
  }
}
