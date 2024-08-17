import 'package:deeventures/routes/api_routes/api_route_names.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../routes/app_routes/app_route_names.dart';
import 'controllers/trade_gift_card_state_controller.dart';

class TradeGiftCardScreen extends StatelessWidget {
  TradeGiftCardScreen({super.key});

  final TradeGiftCardStateController tradeCryptoCurrencyStateController = Get.put(TradeGiftCardStateController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(

      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.chevron_left_outlined),
        ),

        title: Text(
          "Gift Cards",
          style: TextStyle(
            color: Colors.grey.shade700,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),

      body: GetBuilder<TradeGiftCardStateController>(builder: (controller) {
        return Container(
          height: Get.height,
          width: Get.width,
          color: Colors.grey.shade100,
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 25.0),
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: TextFormField(
                  onChanged: (value) {
                    controller.setSearchText(value);
                  },
                  // autofocus: true,
                  keyboardType: TextInputType.text,
                  validator: ValidationBuilder().minLength(8).required().build(),
                  autovalidateMode: controller.autoValidateMode,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(
                          color: Color(0XFF07B46B),
                          width: 1,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(
                          color: Color(0xFFFF9191),
                          width: 1,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(
                          color: Color(0XFF07B46B),
                          width: 2.0,
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: const BorderSide(
                          color: Color(0xFFFF9191),
                          width: 2.0,
                        ),
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 0.0),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Amazon gift card",
                      hintStyle: const TextStyle(
                        color: Colors.black26,
                        fontSize: 1.0,
                      ),
                      prefixIcon: IconButton(
                        onPressed: () { },
                        icon: const Icon(
                          Iconsax.search_normal,
                          color: Colors.black54,
                        ),
                      ),
                      suffixIcon: IconButton(
                        onPressed: () { },
                        icon: const Icon(
                          Icons.close,
                          color: Colors.black54,
                        ),
                      )
                  ),
                ),
              ),

              (!controller.isLoading) ? (
                  (controller.giftCards.isNotEmpty) ? (
                      Expanded(
                        child: SingleChildScrollView(
                          child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            padding: const EdgeInsets.only(top: 15.0),
                            itemCount: controller.giftCards.length,
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                onTap: () {
                                  controller.setSelectedGiftCard(controller.giftCards[index]);
                                  controller.getGiftCardRates();
                                  Get.toNamed(tradeGiftCardScreen2);
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(bottom: 12.0),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(5.0)
                                  ),
                                  padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 60.0,
                                        width: 80.0,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(5.0),
                                            color: Colors.grey.shade200,
                                            image: DecorationImage(
                                                image: NetworkImage("$imgBaseUrlDev/${controller.giftCards[index].gCardImage!}"),
                                                fit: BoxFit.cover
                                            )
                                        ),
                                      ),
                                      const SizedBox(width: 20.0,),

                                      Text(
                                        controller.giftCards[index].gCardName!,
                                        style: TextStyle(
                                          color: Colors.grey.shade600,
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      )
                  ) : (
                      Container(
                        height: 100.0,
                        width: Get.width,
                        decoration: BoxDecoration(
                            color: const Color(0xffF0F0F0),
                            borderRadius: BorderRadius.circular(10.0)
                        ),
                        child: const Center(
                          child: Text("You don't have any gift card yet."),
                        ),
                      )
                  )
              ) : (
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(
                          color: Colors.grey.shade400,
                          strokeWidth: 2.0,
                        ),
                        const SizedBox(height: 20.0),

                        Text(
                          "Please wait...",
                          style: TextStyle(
                              color: Colors.grey.shade600
                          ),
                        )
                      ],
                    ),
                  )
              )
            ],
          ),
        );
      }
      ),
    ));
  }
}
