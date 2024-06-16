// To parse this JSON data, do
//
//     final internetServiceProvider = internetServiceProviderFromJson(jsonString);

import 'dart:convert';

InternetServiceProvider internetServiceProviderFromJson(String str) => InternetServiceProvider.fromJson(json.decode(str));

String internetServiceProviderToJson(InternetServiceProvider data) => json.encode(data.toJson());

class InternetServiceProvider {
  String? name;
  String? id;
  List<InternetServiceProviderPackage>? product;

  InternetServiceProvider({
    this.name,
    this.id,
    this.product,
  });

  factory InternetServiceProvider.fromJson(Map<String, dynamic> json) => InternetServiceProvider(
    name: json["NAME"],
    id: json["ID"],
    product: json["PRODUCT"] == null ? [] : List<InternetServiceProviderPackage>.from(json["PRODUCT"]!.map((x) => InternetServiceProviderPackage.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "NAME": name,
    "ID": id,
    "PRODUCT": product == null ? [] : List<dynamic>.from(product!.map((x) => x.toJson())),
  };
}

class InternetServiceProviderPackage {
  String? productCode;
  String? productId;
  String? productName;
  String? productAmount;

  InternetServiceProviderPackage({
    this.productCode,
    this.productId,
    this.productName,
    this.productAmount,
  });

  factory InternetServiceProviderPackage.fromJson(Map<String, dynamic> json) => InternetServiceProviderPackage(
    productCode: json["PRODUCT_CODE"],
    productId: json["PRODUCT_ID"],
    productName: json["PRODUCT_NAME"],
    productAmount: json["PRODUCT_AMOUNT"],
  );

  Map<String, dynamic> toJson() => {
    "PRODUCT_CODE": productCode,
    "PRODUCT_ID": productId,
    "PRODUCT_NAME": productName,
    "PRODUCT_AMOUNT": productAmount,
  };
}
