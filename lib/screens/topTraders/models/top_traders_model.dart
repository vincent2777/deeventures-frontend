// To parse this JSON data, do
//
//     final topTraders = topTradersFromJson(jsonString);

import 'dart:convert';

TopTraders topTradersFromJson(String str) => TopTraders.fromJson(json.decode(str));

String topTradersToJson(TopTraders data) => json.encode(data.toJson());

class TopTraders {
  double? totalAmount;
  String? transactionCount;
  User? user;

  TopTraders({
    this.totalAmount,
    this.transactionCount,
    this.user,
  });

  factory TopTraders.fromJson(Map<String, dynamic> json) => TopTraders(
    totalAmount: json["total_amount"]?.toDouble(),
    transactionCount: json["transaction_count"].toString(),
    user: json["user"] == null ? null : User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "total_amount": totalAmount,
    "transaction_count": transactionCount,
    "user": user?.toJson(),
  };
}

class User {
  int? id;
  String? fullName;
  String? username;
  String? country;

  User({
    this.id,
    this.fullName,
    this.username,
    this.country,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    fullName: json["full_name"],
    username: json["username"],
    country: json["country"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "full_name": fullName,
    "username": username,
    "country": country,
  };
}


/*
{
	"total_amount": 9600,
	"transaction_count": "3",
	"user": {
		"id": 7,
		"full_name": "Vincent Mbah",
		"username": "vincent24",
		"country": "Nigeria"
	}
}
*/