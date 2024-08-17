import 'package:deeventures/routes/api_routes/api_route_names.dart';
import 'package:deeventures/screens/tradeGiftCard/models/gift_card_rate_model.dart';
import 'package:deeventures/screens/tradeGiftCard/value_row_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../utils/colors.dart';
import '../../utils/format_numbers.dart';
import '../transactions/widgets/upload_image_bottom_sheet_widget.dart';
import 'controllers/trade_gift_card_state_controller.dart';
import 'models/gift_card_model.dart';
import 'models/value_row.dart';

class TradeGiftCardScreen2 extends StatelessWidget {
  TradeGiftCardScreen2({super.key});

  final TradeGiftCardStateController tradeCryptoCurrencyStateController =
      Get.put(TradeGiftCardStateController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.grey.shade50,
              leading: IconButton(
                onPressed: () {
                  Get.back();
                  tradeCryptoCurrencyStateController.resetState();
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
            body:
                GetBuilder<TradeGiftCardStateController>(builder: (controller) {
              return Container(
                height: Get.height,
                width: Get.width,
                color: Colors.white,
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 25.0),
                child: Column(
                  children: [
                    (!controller.isLoading)
                        ? ((controller.giftCardRates.isNotEmpty)
                            ? (Expanded(
                                child: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Select Country",
                                        style: TextStyle(
                                            fontFamily: 'Manrope',
                                            fontWeight: FontWeight.w500),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      DropdownButtonFormField<GiftCardRate>(
                                        onChanged: (value) {
                                          if (value != null) {
                                            controller.setSelectedGiftCardRate(value);
                                          }
                                        },
                                        focusNode: FocusNode(),
                                        icon: const Icon(Iconsax.arrow_down_1),
                                        items: controller.giftCardRates
                                            .map((rates) {
                                          return DropdownMenuItem<GiftCardRate>(
                                            value: rates,
                                            child: Row(
                                              children: [
                                                Text(
                                                  rates.gcardCountry!,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ],
                                            ),
                                          );
                                        }).toList(),
                                        decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            borderSide: BorderSide(
                                              color: Colors.grey.shade300,
                                              width: 1,
                                            ),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            borderSide: const BorderSide(
                                              color: Color(0xFFFF9191),
                                              width: 1,
                                            ),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            borderSide: const BorderSide(
                                              color: primaryColor,
                                              width: 2.0,
                                            ),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                            borderSide: const BorderSide(
                                              color: Color(0xFFFF9191),
                                              width: 2.0,
                                            ),
                                          ),
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 15.0,
                                                  vertical: 5.0),
                                          filled: true,
                                          fillColor: Colors.white,
                                          hintText: "Choose Country",
                                          hintStyle: TextStyle(
                                            color: Colors.grey.shade400,
                                            fontSize: 15.0,
                                          ),
                                        ),
                                        validator: (value) {
                                          if (value == null) {
                                            return 'Please select a country';
                                          }
                                          return ValidationBuilder()
                                              .required()
                                              .build()(value.gcardCountry);
                                        },
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      controller.selectedGiftCardRate
                                          .gcardCurrencySym !=
                                          null
                                          ?
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Currency: ${controller.selectedGiftCardRate.gcardCurrencySym}",
                                            style: const TextStyle(
                                                fontFamily: 'Manrope',
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const Divider(),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Align(
                                            alignment: Alignment.center,
                                            child: Container(
                                              height: 100,
                                              width: 100,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(7)
                                              ),
                                              child: Image.network(
                                                  "$imgBaseUrlDev/${controller.selectedGiftCard.gCardImage!}"),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          const Divider(),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: [
                                              // Image section
                                              SizedBox(
                                                width: MediaQuery.of(context).size.width * 0.12, // 20% of the screen width
                                                child: ClipOval(
                                                    child: Image.network(
                                                      "$imgBaseUrlDev/${controller.selectedGiftCard.gCardImage!}",
                                                      width: MediaQuery.of(context).size.width * 0.1, // 10% of the screen width
                                                      fit: BoxFit.cover,
                                                    )
                                                ),
                                              ),
                                              const SizedBox(width: 10.0), // Spacing between columns

                                              // Text section
                                              SizedBox(
                                                width: MediaQuery.of(context).size.width * 0.40, // 30% of the screen width
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      '${controller.selectedGiftCardRate.gcardCurrencySym}${controller.selectedGiftCardRate.minSell} ${controller.selectedGiftCard.gCardName}\n₦${(addCommas(double.parse(controller.selectedGiftCardRate.nairaRate!) * double.parse(controller.selectedGiftCardRate.minSell!)))}',
                                                      style: const TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold,fontFamily: 'Roboto'),
                                                    ),
                                                    // Text(
                                                    //   '₦${addCommas((response.defaultNairaRate * response.minSell).toStringAsFixed(2))}',
                                                    //   style: const TextStyle(fontSize: 16.0),
                                                    // ),
                                                  ],
                                                ),
                                              ),
                                              // Button and input section
                                              SizedBox(
                                                width: MediaQuery.of(context).size.width * 0.34, // 40% of the screen width
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                  children: [
                                                    IconButton(
                                                      onPressed: () {
                                                        if(controller.cardQuantity >0){
                                                          controller.setCardQuantity(controller.cardQuantity - 1);
                                                          controller.computeTotal();
                                                          controller.updateTotalEstimatedValue();
                                                        }
                                                        // Implement subtract quantity logic here
                                                      }, icon: const Icon(Icons.remove,size: 20,),
                                                    ),
                                                    SizedBox(
                                                      width: 30.0,
                                                      child: TextField(
                                                        readOnly: true,
                                                        controller: TextEditingController(text: controller.cardQuantity.toString()),
                                                        decoration: const InputDecoration(
                                                          border: InputBorder.none,
                                                        ),
                                                        textAlign: TextAlign.center,
                                                        keyboardType: TextInputType.number,
                                                      ),
                                                    ),
                                                    IconButton(
                                                      onPressed: () {
                                                        controller.setCardQuantity(controller.cardQuantity + 1);
                                                        controller.computeTotal();
                                                        // Implement subtract quantity logic here
                                                      }, icon: const Icon(Icons.add,size: 20,),
                                                    ),
                                                  ],
                                                ),
                                              ),

                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          const Divider(),

                                          Row(
                                            children: [
                                              const Text(
                                                "Value not listed?",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontFamily: 'Manrope',
                                                    fontWeight: FontWeight.w500),
                                              ),
                                              TextButton(onPressed: controller.addNewRateRow,
                                                  child: const Text(
                                                "Add other value",
                                                style: TextStyle(
                                                    color: mainGreen,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold),
                                              ))
                                            ],
                                          ),

                                          controller.rows.isNotEmpty ?
                                          Column(
                                            children: [
                                              GetBuilder<TradeGiftCardStateController>(
                                                builder: (controller) => Column(
                                                  children: controller.rows.asMap().entries.map((entry) {
                                                    int idx = entry.key;
                                                    ValueRow row = entry.value;
                                                    return ValueRowWidget(
                                                      index: idx,
                                                      row: row,
                                                      onRemove: () => controller.removeRow(idx),
                                                      onValueChanged: controller.updateEstimatedValue,
                                                    );
                                                  }).toList(),
                                                ),
                                              ),

                                              GetBuilder<TradeGiftCardStateController>(
                                                builder: (controller) => Text(controller.addValueMessage,textAlign: TextAlign.center,style: const TextStyle(color: Colors.red),),
                                              ),
                                            ],
                                          ) : const SizedBox(),
                                          const SizedBox(
                                            height: 30,
                                          ),

                                          Row(
                                              children: [
                                                Expanded(child: TextFormField(
                                                  onChanged: (value) {
                                                    controller.setCouponCode(value);

                                                  },
                                                  keyboardType: TextInputType.text,
                                                  validator: ValidationBuilder().minLength(8).required().build(),
                                                  autovalidateMode: controller.autoValidateMode,
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
                                                      borderSide: BorderSide(
                                                        color: Colors.grey.shade50,
                                                        width: 1,
                                                      ),
                                                    ),
                                                    focusedBorder: OutlineInputBorder(
                                                      borderRadius: BorderRadius.circular(8.0),
                                                      borderSide:  BorderSide(
                                                        color: Colors.grey.shade50,
                                                        width: 2.0,
                                                      ),
                                                    ),
                                                    focusedErrorBorder: OutlineInputBorder(
                                                      borderRadius: BorderRadius.circular(5.0),
                                                      borderSide: BorderSide(
                                                        color: Colors.grey.shade50,
                                                        width: 2.0,
                                                      ),
                                                    ),
                                                    contentPadding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 0.0),
                                                    filled: true,
                                                    fillColor: Colors.white,
                                                    hintText: "Promo Code",
                                                    hintStyle: const TextStyle(
                                                      color: Colors.black26,
                                                      fontSize: 14.0,
                                                    ),

                                                  ),
                                                )),
                                                const SizedBox(width: 20,),

                                                SizedBox(
                                                  width: 100,
                                                  child: TextButton(
                                                    onPressed: ()
                                                    {
                                                      // controller.setCouponCode(value)
                                                    },
                                                    style: TextButton.styleFrom(
                                                      padding: EdgeInsets.zero,
                                                      shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(7.0), // Removes all curves
                                                      ),
                                                      backgroundColor: controller.couponCode.isNotEmpty ? Colors.deepOrange.withOpacity(0.6) :  Colors.deepOrange.withOpacity(0.4),
                                                    ),
                                                    child: Container(
                                                      height: 50.0,
                                                      width: Get.width,
                                                      alignment: Alignment.center,
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(7.0),
                                                        color:  controller.couponCode.isNotEmpty ? Colors.deepOrange.withOpacity(0.6) :  Colors.deepOrange.withOpacity(0.4),
                                                      ),
                                                      child: !controller.isLoading ? (
                                                          const Text(
                                                            "Apply",
                                                            style: TextStyle(
                                                              color: Colors.white,
                                                              fontSize: 16.0,
                                                              fontWeight: FontWeight.w600,
                                                            ),
                                                          )
                                                      ) : const SpinKitCircle(
                                                        color: Colors.white,
                                                        size: 40,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          const SizedBox(
                                            height: 40,
                                          ),

                                          const Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              "YOU GET",
                                              style: TextStyle(
                                                  fontFamily: 'Roboto',
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Align(
                                            alignment: Alignment.center,
                                            child:Text(
                                            "₦${addCommas(controller.amountToReceive)}",
                                            style: const TextStyle(
                                                fontFamily: 'Roboto',
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          )),
                                          const SizedBox(
                                            height: 30,
                                          ),

                                          TextButton(
                                            onPressed: ()
                                            {
                                              if(controller.amountToReceive > 0){
                                                UploadImageBottomSheetWidget().uploadCardImageBottomSheetWidget();
                                              }
                                            },
                                            style: TextButton.styleFrom(
                                              padding: EdgeInsets.zero,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(7.0), // Removes all curves
                                              ),
                                              backgroundColor: controller.amountToReceive > 0 ?  mainGreen : mainGreen.withOpacity(0.1),
                                            ),
                                            child: Container(
                                              height: 50.0,
                                              width: Get.width,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(7.0),
                                                color: controller.amountToReceive > 0 ? mainGreen : mainGreen.withOpacity(0.3),
                                              ),
                                              child: !controller.isLoading ? (
                                                  const Text(
                                                    "CONTINUE",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16.0,
                                                      fontWeight: FontWeight.w600,
                                                    ),
                                                  )
                                              ) : const SpinKitCircle(
                                                color: Colors.white,
                                                size: 40,
                                              ),
                                            ),
                                          ),

                                          const SizedBox(height: 30,),
                                          const Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              "Average Confirmation time 2 - 10 Minutes",
                                              style: TextStyle(
                                                  fontFamily: 'Manrope',
                                                  fontSize: 14,
                                                  color: Colors.red,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),


                                        ],
                                      ) : const SizedBox(),

                                    ],
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
                                      Text("You don't have any gift card yet."),
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
            })));
  }
}
