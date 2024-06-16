// To parse this JSON data, do
//
//     final cableTv = cableTvFromJson(jsonString);

import 'dart:convert';

CableTv cableTvFromJson(String str) => CableTv.fromJson(json.decode(str));

String cableTvToJson(CableTv data) => json.encode(data.toJson());

class CableTv {
  String? id;
  List<CableTVPackage>? product;

  CableTv({
    this.id,
    this.product,
  });

  factory CableTv.fromJson(Map<String, dynamic> json) => CableTv(
    id: json["ID"],
    product: json["PRODUCT"] == null ? [] : List<CableTVPackage>.from(json["PRODUCT"]!.map((x) => CableTVPackage.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "ID": id,
    "PRODUCT": product == null ? [] : List<dynamic>.from(product!.map((x) => x.toJson())),
  };
}

class CableTVPackage {
  String? packageId;
  String? packageName;
  String? packageAmount;
  String? productDiscountAmount;
  String? productDiscount;

  CableTVPackage({
    this.packageId,
    this.packageName,
    this.packageAmount,
    this.productDiscountAmount,
    this.productDiscount,
  });

  factory CableTVPackage.fromJson(Map<String, dynamic> json) => CableTVPackage(
    packageId: json["PACKAGE_ID"],
    packageName: json["PACKAGE_NAME"],
    packageAmount: json["PACKAGE_AMOUNT"],
    productDiscountAmount: json["PRODUCT_DISCOUNT_AMOUNT"],
    productDiscount: json["PRODUCT_DISCOUNT"],
  );

  Map<String, dynamic> toJson() => {
    "PACKAGE_ID": packageId,
    "PACKAGE_NAME": packageName,
    "PACKAGE_AMOUNT": packageAmount,
    "PRODUCT_DISCOUNT_AMOUNT": productDiscountAmount,
    "PRODUCT_DISCOUNT": productDiscount,
  };
}
