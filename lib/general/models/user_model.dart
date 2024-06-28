import 'dart:convert';

User userFromJson(Map<String, dynamic> json) => User.fromJson(json);
String userToJson(User data) => json.encode(data.toJson());

class User {
  int? id;
  String? fullName;
  String? username;
  String? email;
  String? phoneNumber;
  String? accountStatus;
  String? country;
  String? referredBy;
  DateTime? regDate;
  String? avatar;
  DateTime? createdAt;
  DateTime? updatedAt;
  UserWallet? wallet;

  User({
    this.id,
    this.fullName,
    this.username,
    this.email,
    this.phoneNumber,
    this.accountStatus,
    this.country,
    this.referredBy,
    this.regDate,
    this.avatar,
    this.createdAt,
    this.updatedAt,
    this.wallet,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    fullName: json["full_name"],
    username: json["username"],
    email: json["email"],
    phoneNumber: json["phone_number"],
    accountStatus: json["account_status"],
    country: json["country"],
    referredBy: json["referred_by"],
    regDate: json["reg_date"] == null ? null : DateTime.parse(json["reg_date"]),
    avatar: json["avatar"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    wallet: json["wallet"] == null ? null : UserWallet.fromJson(json["wallet"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "full_name": fullName,
    "username": username,
    "email": email,
    "phone_number": phoneNumber,
    "account_status": accountStatus,
    "country": country,
    "referred_by": referredBy,
    "reg_date": regDate?.toIso8601String(),
    "avatar": avatar,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "wallet": wallet?.toJson(),
  };
}


class UserWallet {
  int? id;
  int? userId;
  double? amount;
  String? currencySymbol;

  UserWallet({
    required this.id,
    required this.userId,
    required this.amount,
    required this.currencySymbol,
  });

  factory UserWallet.fromJson(Map<String, dynamic> json) => UserWallet(
    id: json["id"],
    userId: json["user_id"],
    amount: double.parse(json["amount"].toString()),
    currencySymbol: json['currency_symbol'],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "amount": amount,
    "currency_symbol": currencySymbol,
  };

}


/*
{
	"id": 1,
	"full_name": "Vincent Mbah",
	"username": "vincent24",
	"email": "vincent@gmail.com",
	"phone_number": "07031324456",
	"account_status": "active",
	"country": "Nigeria",
	"referred_by": "jBond2024",
	"reg_date": "2024-05-22T12:02:38.672Z",
	"avatar": "https://www.ddmcheb.cz/template/img/avatar.jpeg",
	"createdAt": "2024-05-22T12:02:40.357Z",
	"updatedAt": "2024-05-22T12:02:40.357Z",
	"wallet": {
    "id": 1,
    "user_id": 1,
    "amount": 300,
    "currency_symbol": "$",
	}
}*/
