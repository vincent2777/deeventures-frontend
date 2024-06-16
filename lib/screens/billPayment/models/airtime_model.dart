// To parse this JSON data, do
//
//     final airtime = airtimeFromJson(jsonString);

import 'dart:convert';

Airtime airtimeFromJson(String str) => Airtime.fromJson(json.decode(str));

String airtimeToJson(Airtime data) => json.encode(data.toJson());

class Airtime {
  int? id;
  String? code;
  String? airtimeIsp;
  int? airtimeCommission;
  String? airtimeImage;
  int? isActive;
  DateTime? createdAt;
  DateTime? updatedAt;

  Airtime({
    this.id,
    this.code,
    this.airtimeIsp,
    this.airtimeCommission,
    this.airtimeImage,
    this.isActive,
    this.createdAt,
    this.updatedAt,
  });

  factory Airtime.fromJson(Map<String, dynamic> json) => Airtime(
    id: json["id"],
    code: json["code"],
    airtimeIsp: json["airtime_isp"],
    airtimeCommission: json["airtime_commission"],
    airtimeImage: json["airtime_image"],
    isActive: json["is_active"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "code": code,
    "airtime_isp": airtimeIsp,
    "airtime_commission": airtimeCommission,
    "airtime_image": airtimeImage,
    "is_active": isActive,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
  };
}


/*
{
  "id": 2,
  "code": "02",
  "airtime_isp": "Glo-NG",
  "airtime_commission": 0,
  "airtime_image": "https://mtek3d.com/wp-content/uploads/2018/01/image-placeholder-500x500.jpg",
  "is_active": 1,
  "createdAt": "2024-06-08T22:25:36.170Z",
  "updatedAt": "2024-06-08T22:25:36.170Z"
}
*/