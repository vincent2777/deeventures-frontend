// To parse this JSON data, do
//
//     final meterType = meterTypeFromJson(jsonString);

import 'dart:convert';

MeterType meterTypeFromJson(String str) => MeterType.fromJson(json.decode(str));

String meterTypeToJson(MeterType data) => json.encode(data.toJson());

class MeterType {
  int? id;
  String? code;
  String? name;
  DateTime? createdAt;
  DateTime? updatedAt;

  MeterType({
    this.id,
    this.code,
    this.name,
    this.createdAt,
    this.updatedAt,
  });

  factory MeterType.fromJson(Map<String, dynamic> json) => MeterType(
    id: json["id"],
    code: json["code"],
    name: json["name"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "code": code,
    "name": name,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
  };
}

/*
{
	"id": 2,
	"code": "02",
	"name": "Postpaid",
	"createdAt": "2024-06-07T13:24:05.528Z",
	"updatedAt": "2024-06-07T13:24:05.528Z"
}
*/