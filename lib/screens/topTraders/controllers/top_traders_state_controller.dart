
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

import '../../../routes/api_routes/api_route_names.dart';
import '../apis/top_traders_api.dart';
import '../models/top_traders_model.dart';

class TopTradersStateController extends GetxController with GetSingleTickerProviderStateMixin {

  String _transactionType = "";
  String _duration = "Day";
  List<TopTraders> _topTraders = [];
  bool _isLoading = false;
  final FlutterSecureStorage _flutterSecureStorage = const FlutterSecureStorage();
  late final TabController _tabController;

  /*
  * GETTERS
  * */
  String get transactionType => _transactionType;
  String get duration => _duration;
  List<TopTraders> get topTraders => _topTraders;
  bool get isLoading => _isLoading;
  TabController get tabController => _tabController;


  /*
  * SETTERS
  * */
  void setTransactionType(String value) {
    _transactionType = value;
    update();
    getTopTraders();
  }
  void setDuration(String value) {
    _duration = value;
    update();
    getTopTraders();
  }
  void setTopTraders(List<TopTraders> value) {
    _topTraders = value;
    update();
  }
  void setIsLoading(bool value) {
    _isLoading = value;
    update();
  }

  @override
  void onInit() async {
    getTopTraders();

    _tabController = TabController(vsync: this, length: 3);
    _tabController.addListener(() {
      (_tabController.index == 0) ? (
          setDuration("Day")
      ) : (_tabController.index == 1) ? (
          setDuration("Week")
      ) : (
          setDuration("Month")
      );
    });

    super.onInit();
  }

  Future<void> getTopTraders() async {
    setIsLoading(true);

    String? token = await _flutterSecureStorage.read(key: "token");
    String decodedToken = jsonDecode(token!);
    String topTradersPaginatedRoute = "$getTopTradersRoute?type=$_transactionType&duration=$_duration";

    var response = await TopTradersAPI.getTopTradersService(topTradersPaginatedRoute ,decodedToken);
    bool isSuccess = response!.data["success"];
    // debugPrint("PROGRESS:::: ${response.data}");

    if (isSuccess) {
      setIsLoading(false);

      List<dynamic> topTraderData = response.data["data"]["topTraders"] ?? [];
      List<TopTraders> topTraders = topTraderData.map((eachTrader) => TopTraders.fromJson(eachTrader)).toList();
      setTopTraders(topTraders);

    } else {
      setIsLoading(false);
      setTopTraders([]);
      String errorMessage = response.data["message"];
      debugPrint("Oooops!!! $errorMessage");
    }
  }
}