// To parse this JSON data, do
//
//     final electricCompany = electricCompanyFromJson(jsonString);

import 'dart:convert';

ElectricCompany electricCompanyFromJson(String str) => ElectricCompany.fromJson(json.decode(str));

String electricCompanyToJson(ElectricCompany data) => json.encode(data.toJson());

class ElectricCompany {
  int? id;
  String? code;
  String? name;
  int? isActive;
  DateTime? createdAt;
  DateTime? updatedAt;

  ElectricCompany({
    this.id,
    this.code,
    this.name,
    this.isActive,
    this.createdAt,
    this.updatedAt,
  });

  factory ElectricCompany.fromJson(Map<String, dynamic> json) => ElectricCompany(
    id: json["id"],
    code: json["code"],
    name: json["name"],
    isActive: json["is_active"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "code": code,
    "name": name,
    "is_active": isActive,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
  };
}

/*
{
	"id": 1,
	"code": "01",
	"name": "EKEDC - Eko Electric",
	"is_active": 1,
	"createdAt": "2024-06-07T12:27:51.845Z",
	"updatedAt": "2024-06-07T12:27:51.845Z"
}
*/