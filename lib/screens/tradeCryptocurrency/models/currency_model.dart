import 'dart:convert';

Currency currencyFromJson(Map<String, dynamic> json) => Currency.fromJson(json);

String currencyToJson(Currency data) => json.encode(data.toJson());

class Currency {
  int? id;
  String? currencyName;
  double? currencyBuyRate;
  double? currencySellRate;
  String? currencySymbol;
  double? currencyPrice;
  int? currencyIsActive;
  List<int>? currencyNetworkId;
  String? currencyImage;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<CurrencyNetwork>? currencyNetworks;

  Currency({
    this.id,
    this.currencyName,
    this.currencyBuyRate,
    this.currencySellRate,
    this.currencySymbol,
    this.currencyPrice,
    this.currencyIsActive,
    this.currencyNetworkId,
    this.currencyImage,
    this.createdAt,
    this.updatedAt,
    this.currencyNetworks,
  });

  factory Currency.fromJson(Map<String, dynamic> json) => Currency(
    id: json["id"],
    currencyName: json["currency_name"],
    currencyBuyRate: json["currency_buy_rate"].toDouble(),
    currencySellRate: json["currency_sell_rate"].toDouble(),
    currencySymbol: json["currency_symbol"],
    currencyPrice: json["currency_price"].toDouble(),
    currencyIsActive: json["currency_is_active"],
    currencyNetworkId: json["currency_network_id"] == null ? [] : List<int>.from(json["currency_network_id"]!.map((x) => x)),
    currencyImage: json["currency_image"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    currencyNetworks: json["currency_networks"] == null ? [] : List<CurrencyNetwork>.from(json["currency_networks"]!.map((x) => CurrencyNetwork.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "currency_name": currencyName,
    "currency_buy_rate": currencyBuyRate,
    "currency_sell_rate": currencySellRate,
    "currency_symbol": currencySymbol,
    "currency_price": currencyPrice,
    "currency_is_active": currencyIsActive,
    "currency_network_id": currencyNetworkId == null ? [] : List<dynamic>.from(currencyNetworkId!.map((x) => x)),
    "currency_image": currencyImage,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "currency_networks": currencyNetworks == null ? [] : List<dynamic>.from(currencyNetworks!.map((x) => x.toJson())),
  };
}

class CurrencyNetwork {
  int? id;
  String? networkName;
  String? networkAddress;
  String? networkImage;

  CurrencyNetwork({
    this.id,
    this.networkName,
    this.networkAddress,
    this.networkImage,
  });

  factory CurrencyNetwork.fromJson(Map<String, dynamic> json) => CurrencyNetwork(
    id: json["id"],
    networkName: json["network_name"],
    networkAddress: json["network_address"],
    networkImage: json["network_image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "network_name": networkName,
    "network_address": networkAddress,
    "network_image": networkImage,
  };
}
