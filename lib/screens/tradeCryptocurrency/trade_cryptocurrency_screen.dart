import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../routes/api_routes/api_route_names.dart';
import '../../routes/app_routes/app_route_names.dart';
import 'controllers/trade_cryptocurrency_state_controller.dart';

class TradeCryptocurrencyScreen extends StatelessWidget {
  TradeCryptocurrencyScreen({super.key});

  final TradeCryptocurrencyStateController tradeCryptoCurrencyStateController =
      Get.put(TradeCryptocurrencyStateController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.chevron_left_outlined),
        ),
        title: Text(
          "Trade Cryptocurrency",
          style: TextStyle(
            color: Colors.grey.shade700,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body:
          GetBuilder<TradeCryptocurrencyStateController>(builder: (controller) {
        controller.chartImages.shuffle();
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
                  validator:
                      ValidationBuilder().minLength(8).required().build(),
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
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 0.0),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "example@email.com",
                      hintStyle: const TextStyle(
                        color: Colors.black26,
                        fontSize: 1.0,
                      ),
                      prefixIcon: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Iconsax.search_normal,
                          color: Colors.black54,
                        ),
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.close,
                          color: Colors.black54,
                        ),
                      )),
                ),
              ),
              (!controller.isLoading)
                  ? ((controller.currencies.isNotEmpty)
                      ? (Expanded(
                          child: SingleChildScrollView(
                            child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              padding: const EdgeInsets.only(top: 15.0),
                              itemCount: controller.currencies.length,
                              itemBuilder: (BuildContext context, int index) {
                                return InkWell(
                                  onTap: () {
                                    controller.setCurrency(
                                        controller.currencies[index]);
                                    controller.setCurrencyNetworks(controller
                                        .currencies[index].currencyNetworks!);
                                    // controller.getCryptocurrencyChartData();
                                    Get.toNamed(cryptocurrencyDetailScreen);
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(bottom: 12.0),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(5.0)),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 18.0, horizontal: 12.0),
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                            backgroundColor:
                                                const Color(0xffE7F0FF),
                                            radius: 20.0,
                                            child: Image.network(controller
                                                .currencies[index]
                                                .currencyImage!
                                                .replaceAll(
                                                    "../", imgBaseUrlDev))),
                                        const SizedBox(
                                          width: 20.0,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              controller.currencies[index]
                                                  .currencySymbol!,
                                              style: TextStyle(
                                                color: Colors.amber.shade800,
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 5.0,
                                            ),
                                            Text(
                                              "${controller.currencies[index].currencyBuyRate!}%",
                                              style: TextStyle(
                                                color: Colors.grey.shade500,
                                                fontSize: 10.0,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const Spacer(),
                                        Image.asset(
                                          controller.chartImages[index],
                                          height: 40.0,
                                          width: 70.0,
                                        ),
                                        const Spacer(),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${controller.currencies[index].currencyPrice!}",
                                              style: const TextStyle(
                                                color: Colors.black87,
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 5.0,
                                            ),
                                            Text(
                                              "${controller.currencies[index].currencyBuyRate!} BTC",
                                              style: TextStyle(
                                                color: Colors.grey.shade500,
                                                fontSize: 11.0,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ))
                      : (Container(
                          height: 100.0,
                          width: Get.width,
                          decoration: BoxDecoration(
                              color: const Color(0xffF0F0F0),
                              borderRadius: BorderRadius.circular(10.0)),
                          child: const Center(
                            child:
                                Text("You don't have any cryptocurrency yet."),
                          ),
                        )))
                  : (Expanded(
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
                            style: TextStyle(color: Colors.grey.shade600),
                          )
                        ],
                      ),
                    ))
            ],
          ),
        );
      }),
    ));
  }
}
