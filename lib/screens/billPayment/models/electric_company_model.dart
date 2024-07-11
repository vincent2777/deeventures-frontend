// To parse this JSON data, do
//
//     final electricCompany = electricCompanyFromJson(jsonString);

import 'dart:convert';

ElectricCompany electricCompanyFromJson(String str) => ElectricCompany.fromJson(json.decode(str));

String electricCompanyToJson(ElectricCompany data) => json.encode(data.toJson());

class ElectricCompany {
  String? code;
  String? name;

  ElectricCompany({
    this.code,
    this.name,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is ElectricCompany &&
              runtimeType == other.runtimeType &&
              code == other.code &&
              name == other.name;

  @override
  int get hashCode => code.hashCode ^ name.hashCode;

  factory ElectricCompany.fromJson(Map<String, dynamic> json) => ElectricCompany(
    code: json["code"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "name": name,
  };
}

/*
{
	"code": "01",
	"name": "EKEDC - Eko Electric",
}
*/