import 'package:deeventures/screens/tradeCryptocurrency/widgets/sell_crypto_bottom_sheet_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../routes/api_routes/api_route_names.dart';
import 'controllers/trade_cryptocurrency_state_controller.dart';
import 'models/currency_model.dart';

class CryptocurrencyDetailScreen extends StatelessWidget {
  CryptocurrencyDetailScreen({super.key});

  final TradeCryptocurrencyStateController tradeCryptoCurrencyStateController = Get.put(TradeCryptocurrencyStateController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            tradeCryptoCurrencyStateController.setIsLoading(false);
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
          "Trade Cryptocurrency",
          style: TextStyle(
            color: Colors.grey.shade700,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),

      body: GetBuilder<TradeCryptocurrencyStateController>(builder: (controller) {
        return Container(
          height: Get.height,
          width: Get.width,
          padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 25.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    mainAxisAlignment: MainAxisAlignment.center,
                    textBaseline: TextBaseline.ideographic,
                    children: [
                      Text(
                        "${controller.currency.currencyBuyRate}",
                        style: const TextStyle(
                          fontSize: 28.0,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                      Text(
                        "NGN",
                        style: TextStyle(
                          color: Colors.grey.shade400
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 20.0),

                  // Row(
                  //   crossAxisAlignment: CrossAxisAlignment.baseline,
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   textBaseline: TextBaseline.ideographic,
                  //   children: [
                  //     Text(
                  //       "\$${controller.currency.currencyPrice}",
                  //       style: const TextStyle(
                  //           color: Color(0XFF07B46B),
                  //         fontWeight: FontWeight.w800
                  //       ),
                  //     ),
                  //     /*Text(
                  //       "${controller.currency.currencyBuyRate}%",
                  //       style: TextStyle(
                  //         color: Colors.grey.shade400,
                  //         fontSize: 13.0
                  //       ),
                  //     )*/
                  //   ],
                  // ),
                  const SizedBox(height: 20.0),

                  Container(
                    margin: const EdgeInsets.only(bottom: 12.0),
                    decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(5.0)
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 20.0),
                    child: Row(
                      children: [

                        CircleAvatar(
                            backgroundColor: const Color(0xffE7F0FF),
                            radius: 20.0,
                            child: Image.network(controller.currency.currencyImage!.replaceAll("../", imgBaseUrlDev))
                        ),
                        const SizedBox(width: 20.0,),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              controller.currency.currencySymbol!,
                              style: TextStyle(
                                color: Colors.amber.shade800,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 5.0,),

                            // Text(
                            //   "${controller.currency.currencySellRate!}",
                            //   style: TextStyle(
                            //     color: Colors.grey.shade500,
                            //     fontSize: 10.0,
                            //     fontWeight: FontWeight.w400,
                            //   ),
                            // ),
                            Text(
                              "${controller.currency.currencyBuyRate!}",
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
                          controller.chartImages[0],
                          height: 40.0,
                          width: 70.0,
                        ),
                        const Spacer(),

                        InkWell(
                          onTap: () {
                            controller.setNewCurrencyBuyRate(0.0);
                            Get.back();
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 7.0),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey.shade300,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0)
                            ),
                            child: Text(
                              "Change",
                              style: TextStyle(
                                color: Colors.blue.shade800,
                                fontSize: 12.0
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 10.0),

                  // Crypto Network
                  Container(
                    height: 50.0,
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: DropdownButtonFormField<CurrencyNetwork>(
                      onChanged: (value) {
                        controller.setCurrencyNetwork(value!);
                      },
                      focusNode: FocusNode(),
                      icon: const Icon(Iconsax.arrow_down_1),
                      items: controller.currencyNetworks.map((CurrencyNetwork currencyNetwork) {
                        return DropdownMenuItem<CurrencyNetwork>(
                          value: currencyNetwork,
                          child: Text(
                            currencyNetwork.networkName!,
                            overflow: TextOverflow.ellipsis,
                          ),
                        );
                      }).toList(),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(
                            color: Colors.grey.shade300,
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
                        contentPadding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Select Network",
                        hintStyle: TextStyle(
                          color: Colors.grey.shade400,
                          fontSize: 15.0,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40.0),

                  // CandleStick Chart
                  /*(!controller.isLoading) ? (
                      Container(
                        height: 400.0,
                        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 0.0),
                        child: InteractiveChart(
                          candles: controller.candles!,
                          initialVisibleCandleCount: 50,
                          // priceLabel: (price) => "\$${price.round()}",
                          style: ChartStyle(
                            priceGainColor: Colors.teal.shade400,
                            priceLossColor: Colors.deepOrange,
                            volumeColor: Colors.blue.withOpacity(0.8),
                            volumeHeightFactor: 0.08,
                            priceLabelWidth: 30.0,
                            priceGridLineColor: Colors.grey.shade300,
                            priceLabelStyle: TextStyle(
                                color: Colors.grey.shade500,
                                fontSize: 12.0
                            ),
                            timeLabelStyle: TextStyle(
                                color: Colors.grey.shade500,
                                fontSize: 12.0
                            ),
                            selectionHighlightColor: Colors.grey.withOpacity(0.2),
                            overlayBackgroundColor: Colors.grey.shade700.withOpacity(0.9),
                            timeLabelHeight: 30,
                          ),
                        ),
                      )
                  ) : (
                      Container(
                        height: 400.0,
                        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 0.0),
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
                  ),*/
                  /*Container(
                    height: 400.0,
                    padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 0.0),
                    child: StreamBuilder(
                      // stream: ,
                      builder: (context, snapshot) {
                        return Candlesticks(
                          candles: controller.candlesTwo!,
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 30.0),*/

                  Container(
                    width: Get.width,
                    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        (controller.currencyNetwork.networkAddress != null) ? (
                            TextButton(
                              onPressed: () {
                                  SellCryptoBottomSheetWidget.tradeCryptocurrencyStateController();
                              },
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                              ),
                              child: Container(
                                height: 50.0,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7.0),
                                  color: Colors.green,
                                ),
                                child: const Text(
                                  "Sell Crypto",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w600
                                  ),
                                ),
                              ),
                            )
                        ) : (
                            TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                              ),
                              child: Container(
                                height: 50.0,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7.0),
                                  color: Colors.grey.shade400,
                                ),
                                child: const Text(
                                  "Sell Crypto",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w600
                                  ),
                                ),
                              ),
                            )
                        ),
                        const SizedBox(height: 40.0),

                        /*const Text(
                          "About",
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600
                          ),
                        ),
                        const SizedBox(height: 15.0),*/

                        /*Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mattis posuere non tellus dictum at. Integer eget sed amet nisi, elit odio.",
                          style: TextStyle(
                            color: Colors.grey.shade600
                          ),
                        ),
                        const SizedBox(height: 40.0),*/

                        // const Text(
                        //   "Market",
                        //   style: TextStyle(
                        //       color: Colors.black54,
                        //       fontSize: 18.0,
                        //       fontWeight: FontWeight.w600
                        //   ),
                        // ),
                        // const SizedBox(height: 10.0),

                        // Container(
                        //   margin: const EdgeInsets.only(bottom: 12.0),
                        //   decoration: BoxDecoration(
                        //       color: Colors.grey.shade100,
                        //       borderRadius: BorderRadius.circular(5.0)
                        //   ),
                        //   padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 10.0),
                        //   child: Row(
                        //     children: [
                        //
                        //       const Icon(
                        //         Iconsax.presention_chart5,
                        //         color: Color(0XFF07B46B),
                        //       ),
                        //       const SizedBox(width: 15.0,),
                        //
                        //       const Text(
                        //         "Market Cap",
                        //         style: TextStyle(
                        //           color: Colors.black54,
                        //           fontSize: 15.0,
                        //           fontWeight: FontWeight.w500,
                        //         ),
                        //       ),
                        //       const Spacer(),
                        //
                        //       Text(
                        //         "41,228.00 BTC",
                        //         style: TextStyle(
                        //           color: Colors.grey.shade400,
                        //           fontSize: 13.0,
                        //           fontWeight: FontWeight.w600
                        //         ),
                        //       )
                        //     ],
                        //   ),
                        // ),
                        // const SizedBox(height: 10.0),
                        //
                        // Container(
                        //   margin: const EdgeInsets.only(bottom: 12.0),
                        //   decoration: BoxDecoration(
                        //       color: Colors.grey.shade100,
                        //       borderRadius: BorderRadius.circular(5.0)
                        //   ),
                        //   padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 10.0),
                        //   child: Row(
                        //     children: [
                        //
                        //       const Icon(
                        //         Iconsax.chart_35,
                        //         color: Color(0XFF07B46B),
                        //       ),
                        //       const SizedBox(width: 15.0,),
                        //
                        //       const Text(
                        //         "Volume (24 h)",
                        //         style: TextStyle(
                        //           color: Colors.black54,
                        //           fontSize: 15.0,
                        //           fontWeight: FontWeight.w500,
                        //         ),
                        //       ),
                        //       const Spacer(),
                        //
                        //       Text(
                        //         "\$12,999.00",
                        //         style: TextStyle(
                        //             color: Colors.grey.shade400,
                        //             fontSize: 13.0,
                        //             fontWeight: FontWeight.w600
                        //         ),
                        //       )
                        //     ],
                        //   ),
                        // ),
                        // const SizedBox(height: 10.0),
                        //
                        // Container(
                        //   margin: const EdgeInsets.only(bottom: 12.0),
                        //   decoration: BoxDecoration(
                        //       color: Colors.grey.shade100,
                        //       borderRadius: BorderRadius.circular(5.0)
                        //   ),
                        //   padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 10.0),
                        //   child: Row(
                        //     children: [
                        //
                        //       const Icon(
                        //         Iconsax.chart_success5,
                        //         color: Color(0XFF07B46B),
                        //       ),
                        //       const SizedBox(width: 15.0,),
                        //
                        //       const Text(
                        //         "Available Supply",
                        //         style: TextStyle(
                        //           color: Colors.black54,
                        //           fontSize: 15.0,
                        //           fontWeight: FontWeight.w500,
                        //         ),
                        //       ),
                        //       const Spacer(),
                        //
                        //       Text(
                        //         "9,779.64",
                        //         style: TextStyle(
                        //             color: Colors.grey.shade400,
                        //             fontSize: 13.0,
                        //             fontWeight: FontWeight.w600
                        //         ),
                        //       )
                        //     ],
                        //   ),
                        // ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}
