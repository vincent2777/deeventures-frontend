// To parse this JSON data, do
//
//     final giftCard = giftCardFromJson(jsonString);

import 'dart:convert';

GiftCard giftCardFromJson(String str) => GiftCard.fromJson(json.decode(str));

String giftCardToJson(GiftCard data) => json.encode(data.toJson());

class GiftCard {
  int? id;
  String? gCardName;
  String? gCardCountry;
  String? gCardCurrency;
  String? gCardType;
  int? gCardSellPrice;
  int? gCardMinSell;
  int? gCardMinRateRange;
  int? gCardMaxRateRange;
  int? gCardNairaRateRange;
  int? gCardBuyPrice;
  String? gCardImage;
  int? isActive;
  DateTime? createdAt;
  DateTime? updatedAt;

  GiftCard({
    this.id,
    this.gCardName,
    this.gCardCountry,
    this.gCardCurrency,
    this.gCardType,
    this.gCardSellPrice,
    this.gCardMinSell,
    this.gCardMinRateRange,
    this.gCardMaxRateRange,
    this.gCardNairaRateRange,
    this.gCardBuyPrice,
    this.gCardImage,
    this.isActive,
    this.createdAt,
    this.updatedAt,
  });

  factory GiftCard.fromJson(Map<String, dynamic> json) => GiftCard(
    id: json["id"],
    gCardName: json["gcard_name"],
    gCardCountry: json["gcard_country"],
    gCardCurrency: json["gcard_currency"],
    gCardType: json["gcard_type"],
    gCardSellPrice: json["gcard_sellprice"],
    gCardMinSell: json["gcard_min_sell"],
    gCardMinRateRange: json["gcard_minrate_range"],
    gCardMaxRateRange: json["gcard_maxrate_range"],
    gCardNairaRateRange: json["gcard_naira_rate_range"],
    gCardBuyPrice: json["gcard_buyprice"],
    gCardImage: json["gcard_image"],
    isActive: json["is_active"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "gcard_name": gCardName,
    "gcard_country": gCardCountry,
    "gcard_currency": gCardCurrency,
    "gcard_type": gCardType,
    "gcard_sellprice": gCardSellPrice,
    "gcard_min_sell": gCardMinSell,
    "gcard_minrate_range": gCardMinRateRange,
    "gcard_maxrate_range": gCardMaxRateRange,
    "gcard_naira_rate_range": gCardNairaRateRange,
    "gcard_buyprice": gCardBuyPrice,
    "gcard_image": gCardImage,
    "is_active": isActive,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
  };
}

/*
{
  "id": 1,
  "gcard_name": "Amazon Card",
  "gcard_country": "United State of America",
  "gcard_currency": "USD",
  "gcard_type": "open-loop card",
  "gcard_sellprice": 50,
  "gcard_min_sell": 48,
  "gcard_minrate_range": 45,
  "gcard_maxrate_range": 50,
  "gcard_naira_rate_range": 450000,
  "gcard_buyprice": 50,
  "gcard_image": "https://www.hrkgame.com/media/screens/amazon-50-gift-card/amazon_800x500.jpg",
  "is_active": 1,
  "createdAt": "2024-05-18T10:12:24.705Z",
  "updatedAt": "2024-05-18T10:12:24.705Z"
}
*/