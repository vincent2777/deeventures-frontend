
import 'package:deeventures/screens/transactions/models/transaction_type_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import 'controllers/transactions_state_controller.dart';
import 'models/transaction_model.dart';
import 'widgets/transaction_details_bottom_sheet_widget.dart';


class TransactionsScreen extends StatelessWidget {
  TransactionsScreen({super.key});

  final TransactionsStateController dashboardStateController = Get.put(TransactionsStateController());
  final formatter = NumberFormat("#,##0");

  @override
  Widget build(BuildContext context) {

    return GetBuilder<TransactionsStateController>(builder: (controller) {
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
                      "Transaction History",
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
              const SizedBox(height: 5.0),

              // Search Box
              Container(
                height: 50.0,
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: DropdownButtonFormField<String>(
                  onChanged: (value) {
                    controller.setTransactionType(value);
                  },
                  focusNode: FocusNode(),
                  icon: const Icon(Iconsax.arrow_down_1),
                  items: controller.transactionTypes.map((TransactionType transactionType) {
                    return DropdownMenuItem<String>(
                      value: transactionType.value,
                      child: Text(
                        transactionType.label!,
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
                    hintText: "Transaction Type",
                    hintStyle: TextStyle(
                      color: Colors.grey.shade400,
                      fontSize: 15.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10.0),

              Container(
                height: 50.0,
                width: Get.width,
                color: Colors.grey.shade100,
                child: TabBar(
                  controller: controller.tabController,
                  indicatorColor: const Color(0XFF09A060),
                  indicatorPadding: const EdgeInsets.symmetric(vertical: 10.0),
                  indicatorSize: TabBarIndicatorSize.tab,
                  dividerColor: Colors.transparent,
                  unselectedLabelColor: Colors.grey.shade500,
                  labelColor: const Color(0XFF09A060),
                  labelPadding: EdgeInsets.zero,
                  labelStyle: const TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                  tabs: const [
                    Tab(text: "All"),
                    Tab(text: "Approved"),
                    Tab(text: "Pending"),
                    Tab(text: "Declined"),
                  ],
                ),
              ),
              const SizedBox(height: 10.0),

              Expanded(
                child: TabBarView(
                  controller: controller.tabController,
                  children: [
                    _buildPagedListView(controller),
                    _buildPagedListView(controller),
                    _buildPagedListView(controller),
                    _buildPagedListView(controller),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    });
  }

  Widget _buildPagedListView(TransactionsStateController controller) {
    return RefreshIndicator(
      onRefresh: () async {
        controller.pagingController.refresh();
      },
      backgroundColor: Colors.green.shade300,
      color: Colors.green.shade50,
      child: PagedListView<int, Transaction>(
        pagingController: controller.pagingController,
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
        builderDelegate: PagedChildBuilderDelegate<Transaction>(
          itemBuilder: (context, item, _) {
            return InkWell(
              onTap: () {
                controller.setTransaction(item);
                TransactionDetailsBottomSheetWidget.transactionDetailsBottomSheetWidget();
              },
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 0.0),
                decoration: BoxDecoration(
                    color: Colors.blueGrey.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(10.0)
                ),
                padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),

                child: Row(
                  children: [

                    CircleAvatar(
                      backgroundColor: (item.trnxStatus == 0)
                          ? const Color(0xffE0E0E0)
                          : (item.trnxStatus == 1)
                          ? const Color(0xffe9ffe7)
                          : (const Color(0xffFFDCDC)),
                      radius: 25.0,
                      child: Icon(
                        (item.trnxStatus == 0)
                            ? Iconsax.clock
                            : (item.trnxStatus == 1)
                            ? Iconsax.card_tick
                            : Iconsax.card_slash,
                        color: (item.trnxStatus == 0)
                            ? const Color(0xff797979)
                            : (item.trnxStatus == 1)
                            ? const Color(0xff0CA100)
                            : (const Color(0xffDD2E44)
                        ),
                      ),
                    ),
                    const SizedBox(width: 10.0,),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.trnxType!,
                          style: const TextStyle(
                            fontSize: 13.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 3.0,),

                        Row(
                          children: [
                            Text(
                              "₦${formatter.format(item.trnxAmount!)}",
                              style: const TextStyle(
                                color: Color(0xFF8C8C8C),
                                fontFamily: "Roboto",
                                fontSize: 14.0,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            // const SizedBox(width: 3.0,),

                            /*Text(
                              "| ${item.currency}",
                              style: const TextStyle(
                                color: Color(0XFFEB876B),
                                fontSize: 10.0,
                                fontWeight: FontWeight.w400,
                              ),
                            ),*/
                          ],
                        ),
                        const SizedBox(height: 3.0,),
                      ],
                    ),
                    const Spacer(),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.fromLTRB(10.0, 2.0, 10.0, 4.0),
                          decoration: BoxDecoration(
                              color: (item.trnxStatus == 0)
                                  ? const Color(0xffE0E0E0)
                                  : (item.trnxStatus == 1)
                                  ? const Color(0xffe9ffe7)
                                  : (const Color(0xffFFDCDC)),
                              borderRadius: BorderRadius.circular(10.0)
                          ),
                          child: Text(
                            (item.trnxStatus == 0)
                                ? "Pending"
                                : (item.trnxStatus == 1)
                                ? "Approved"
                                : "Declined",
                            style: TextStyle(
                              color: (item.trnxStatus! == 0)
                                  ? const Color(0xff797979)
                                  : (item.trnxStatus! == 1)
                                  ? const Color(0xff0CA100)
                                  : (const Color(0xffDD2E44)
                              ),
                              fontSize: 10.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        const SizedBox(height: 5.0),

                        Text(
                          DateFormat("dd/MM/yyyy").format(item.trnxDate!),
                          style: const TextStyle(
                            color: Color(0xFF8C8C8C),
                            fontSize: 11.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              /*Card(
                  margin: EdgeInsets.zero,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 12.0),
                    child: Row(
                      children: [

                        CircleAvatar(
                          backgroundColor: (item.trnxStatus == 0)
                              ? const Color(0xffF0F0F0)
                              : (item.trnxStatus == 1)
                              ? const Color(0xffe9ffe7)
                              : (const Color(0xffFFDCDC)),
                          radius: 25.0,
                          child: Icon(
                            (item.trnxStatus == 0)
                                ? Iconsax.clock
                                : (item.trnxStatus == 1)
                                ? Iconsax.card_tick
                                : Iconsax.card_slash,
                            color: (item.trnxStatus == 0)
                                ? const Color(0xff797979)
                                : (item.trnxStatus == 1)
                                ? const Color(0xff0CA100)
                                : (const Color(0xffDD2E44)
                            ),
                          ),
                        ),
                        const SizedBox(width: 10.0,),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.trnxType!,
                              style: const TextStyle(
                                fontSize: 13.0,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(height: 3.0,),

                            Row(
                              children: [
                                Text(
                                  "₦${formatter.format(item.trnxAmount!)}",
                                  style: const TextStyle(
                                    color: Color(0xFF8C8C8C),
                                    fontFamily: "Roboto",
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                const SizedBox(width: 3.0,),

                                Text(
                                  "| ${item.currency}",
                                  style: const TextStyle(
                                    color: Color(0XFFEB876B),
                                    fontSize: 10.0,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 3.0,),
                          ],
                        ),
                        const Spacer(),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.fromLTRB(10.0, 2.0, 10.0, 4.0),
                              decoration: BoxDecoration(
                                  color: (item.trnxStatus == 0)
                                      ? const Color(0xffF0F0F0)
                                      : (item.trnxStatus == 1)
                                      ? const Color(0xffe9ffe7)
                                      : (const Color(0xffFFDCDC)),
                                  borderRadius: BorderRadius.circular(10.0)
                              ),
                              child: Text(
                                (item.trnxStatus == 0)
                                    ? "Pending"
                                    : (item.trnxStatus == 1)
                                    ? "Successful"
                                    : "Declined",
                                style: TextStyle(
                                  color: (item.trnxStatus! == 0)
                                      ? const Color(0xff797979)
                                      : (item.trnxStatus! == 1)
                                      ? const Color(0xff0CA100)
                                      : (const Color(0xffDD2E44)
                                  ),
                                  fontSize: 10.0,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            const SizedBox(height: 5.0,),

                            Text(
                              DateFormat("dd/MM/yyyy").format(item.trnxDate!),
                              style: const TextStyle(
                                color: Color(0xFF8C8C8C),
                                fontSize: 11.0,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),*/
            );
          }
        ),
      ),
    );
  }
}
