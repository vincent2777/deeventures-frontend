
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

import '../../../general/widgets/app_toast_widget.dart';
import '../../../routes/api_routes/api_route_names.dart';
import '../apis/gift_card_api.dart';
import '../models/gift_card_model.dart';

class TradeGiftCardStateController extends GetxController {

  String _searchText = "";
  late GiftCard _giftCard = GiftCard();
  late List<GiftCard> _giftCards = <GiftCard>[];
  bool _isLoading = false;
  final AppToastWidget _appToastWidget = AppToastWidget();
  AutovalidateMode _autoValidateMode = AutovalidateMode.disabled;
  final FlutterSecureStorage _flutterSecureStorage = const FlutterSecureStorage();

  /*
  * GETTERS
  * */
  String get searchText => _searchText;
  GiftCard get giftCard => _giftCard;
  List<GiftCard> get giftCards => _giftCards;
  bool get isLoading => _isLoading;
  AutovalidateMode get autoValidateMode => _autoValidateMode;


  /*
  * SETTERS
  * */
  void setSearchText(String value) {
    _searchText = value;
    update();
  }
  void setCurrency(GiftCard value) {
    _giftCard = value;
    update();
  }
  void setGiftCards(List<GiftCard> value) {
    _giftCards = value;
    update();
  }
  void setAutoValidateMode() {
    _autoValidateMode = AutovalidateMode.onUserInteraction;
    update();
  }
  void setIsLoading(bool value) {
    _isLoading = value;
    update();
  }

  @override
  void onInit() {
    super.onInit();

    getGiftCards();
  }

  Future<void> getGiftCards() async {
    setIsLoading(true);

    String? token = await _flutterSecureStorage.read(key: "token");
    String decodedToken = jsonDecode(token!);

    var response = await GiftCardAPI.getGiftCardsService(getGiftCardsRoute, decodedToken);
    bool isSuccess = response!.data["success"];

    if (isSuccess) {
      setIsLoading(false);
      List<dynamic> giftCardData = response.data["data"]["giftCards"];
      debugPrint("RESPONSE DATA::: $giftCardData");
      
      List<GiftCard> giftCards = giftCardData.map((eachGiftCard) => GiftCard.fromJson(eachGiftCard)).toList();
      setGiftCards(giftCards);
    } else {
      setIsLoading(false);
      String errorMessage = response.data["message"];
      _appToastWidget.notification("Oooops!", errorMessage, "Error");
    }
  }
}