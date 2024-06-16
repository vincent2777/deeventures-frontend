import 'dart:convert';

Transaction transactionFromJson(Map<String, dynamic> json) => Transaction.fromJson(json);

String transactionToJson(Transaction data) => json.encode(data.toJson());

class Transaction {
  int? id;
  int? userId;
  double? trnxAmount;
  String? trnxReference;
  DateTime? trnxDate;
  String? trnxType;
  String? trnxDesc;
  int? trnxStatus;
  double? trnxRate;
  String? trnxAddress;
  String? trnxImage;
  double? toReceive;
  String? currency;
  DateTime? createdAt;
  DateTime? updatedAt;

  Transaction({
    this.id,
    this.userId,
    this.trnxAmount,
    this.trnxReference,
    this.trnxDate,
    this.trnxType,
    this.trnxDesc,
    this.trnxStatus,
    this.trnxRate,
    this.trnxAddress,
    this.trnxImage,
    this.toReceive,
    this.currency,
    this.createdAt,
    this.updatedAt,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
    id: json["id"],
    userId: json["user_id"],
    trnxAmount: json["trnx_amount"]?.toDouble(),
    trnxReference: json["trnx_reference"],
    trnxDate: json["trnx_date"] == null ? null : DateTime.parse(json["trnx_date"]),
    trnxType: json["trnx_type"],
    trnxDesc: json["trnx_desc"],
    trnxStatus: json["trnx_status"],
    trnxRate: json["trnx_rate"]?.toDouble(),
    trnxAddress: json["trnx_address"],
    trnxImage: json["trnx_image"],
    toReceive: json["to_receive"]?.toDouble(),
    currency: json["currency"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "trnx_amount": trnxAmount,
    "trnx_reference": trnxReference,
    "trnx_date": trnxDate?.toIso8601String(),
    "trnx_type": trnxType,
    "trnx_desc": trnxDesc,
    "trnx_status": trnxStatus,
    "trnx_rate": trnxRate,
    "trnx_address": trnxAddress,
    "trnx_image": trnxImage,
    "to_receive": toReceive,
    "currency": currency,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
  };
}

/*
{
	"id": 1,
	"user_id": 1,
	"trnx_amount": 100.1,
	"trnx_reference": "REF-12345",
	"trnx_date": "2023-05-19T12:34:56.789Z",
	"trnx_type": "Gift Card Sale",
	"trnx_desc": "Initial deposit",
	"trnx_status": 1,
	"trnx_rate": 1.1,
	"trnx_address": "Address 1",
	"trnx_image": "null",
	"to_receive": 90.1,
	"currency": "USD",
	"createdAt": "2024-05-18T11:40:32.886Z",
	"updatedAt": "2024-05-18T11:40:32.886Z"
}
*/