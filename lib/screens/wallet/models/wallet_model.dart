import 'dart:convert';

Wallet walletFromJson(Map<String, dynamic> json) => Wallet.fromJson(json);
String walletToJson(Wallet data) => json.encode(data.toJson());

class Wallet {
  int? id;
  double? amount;
  String? currencySymbol;
  int? userId;
  String? createdAt;
  String? updatedAt;

  Wallet({
    this.id,
    this.amount,
    this.currencySymbol,
    this.userId,
    this.createdAt,
    this.updatedAt,
  });

  factory Wallet.fromJson(Map<String, dynamic> json) => Wallet(
    id: json['id'],
    amount: json['amount'].toDouble(),
    currencySymbol: json['currency_symbol'],
    userId: json['user_id'],
    createdAt: json['createdAt'],
    updatedAt: json['updatedAt'],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "amount": amount,
    "currency_symbol": currencySymbol,
    "user_id": userId,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
  };
}

/*
{
  "id": 1,
  "amount": 300,
  "currency_symbol": "$",
  "user_id": 1,
  "createdAt": "2024-05-18T10:12:24.747Z",
  "updatedAt": "2024-05-18T10:41:24.320Z",
}
*/