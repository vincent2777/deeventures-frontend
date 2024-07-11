// To parse this JSON data, do
//
//     final giftCardRates = giftCardRatesFromJson(jsonString);

import 'dart:convert';

GiftCardRates giftCardRatesFromJson(String str) => GiftCardRates.fromJson(json.decode(str));

String giftCardRatesToJson(GiftCardRates data) => json.encode(data.toJson());

class GiftCardRates {
  List<GiftCardRate>? giftCardRates;

  GiftCardRates({
    this.giftCardRates,
  });

  factory GiftCardRates.fromJson(Map<String, dynamic> json) => GiftCardRates(
    giftCardRates: json["giftCardRates"] == null ? [] : List<GiftCardRate>.from(json["giftCardRates"]!.map((x) => GiftCardRate.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "giftCardRates": giftCardRates == null ? [] : List<dynamic>.from(giftCardRates!.map((x) => x.toJson())),
  };
}

class GiftCardRate {
  int? id;
  int? giftCardTypeId;
  int? giftCardId;
  String? minSell;
  String? defaultNairaRate;
  String? minPrice;
  String? maxPrice;
  String? nairaRate;
  String? fixedPriceValue;
  String? fixedPriceRate;
  String? gcardCurrencyName;
  String? gcardCurrencySym;
  String? gcardCountry;
  DateTime? createdAt;
  DateTime? updatedAt;

  GiftCardRate({
    this.id,
    this.giftCardTypeId,
    this.giftCardId,
    this.minSell,
    this.defaultNairaRate,
    this.minPrice,
    this.maxPrice,
    this.nairaRate,
    this.fixedPriceValue,
    this.fixedPriceRate,
    this.gcardCurrencyName,
    this.gcardCurrencySym,
    this.gcardCountry,
    this.createdAt,
    this.updatedAt,
  });

  factory GiftCardRate.fromJson(Map<String, dynamic> json) => GiftCardRate(
    id: json["id"],
    giftCardTypeId: json["gift_card_type_id"],
    giftCardId: json["gift_card_id"],
    minSell: json["min_sell"],
    defaultNairaRate: json["default_naira_rate"],
    minPrice: json["min_price"],
    maxPrice: json["max_price"],
    nairaRate: json["naira_rate"],
    fixedPriceValue: json["fixed_price_value"],
    fixedPriceRate: json["fixed_price_rate"],
    gcardCurrencyName: json["gcard_currency_name"],
    gcardCurrencySym: json["gcard_currency_sym"],
    gcardCountry: json["gcard_country"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "gift_card_type_id": giftCardTypeId,
    "gift_card_id": giftCardId,
    "min_sell": minSell,
    "default_naira_rate": defaultNairaRate,
    "min_price": minPrice,
    "max_price": maxPrice,
    "naira_rate": nairaRate,
    "fixed_price_value": fixedPriceValue,
    "fixed_price_rate": fixedPriceRate,
    "gcard_currency_name": gcardCurrencyName,
    "gcard_currency_sym": gcardCurrencySym,
    "gcard_country": gcardCountry,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
  };
}
