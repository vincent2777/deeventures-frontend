import 'dart:convert';

Settings settingFromJson(Map<String, dynamic> json) => Settings.fromJson(json);

String settingToJson(Settings data) => json.encode(data.toJson());

class Settings {
  int? id;
  int? kyclevel1MaxWithdrawal;
  int? kyclevel2MaxWithdrawal;
  int? kyclevel3MaxWithdrawal;
  int? referralCommission;
  String? accountBank;
  String? accountNumber;
  String? depositInstructions;
  int? minWithdrawal;
  String? clubkonectApi;
  String? clubkonectUserid;
  int? maxWithdrawal;
  DateTime? createdAt;
  DateTime? updatedAt;

  Settings({
    this.id,
    this.kyclevel1MaxWithdrawal,
    this.kyclevel2MaxWithdrawal,
    this.kyclevel3MaxWithdrawal,
    this.referralCommission,
    this.accountBank,
    this.accountNumber,
    this.depositInstructions,
    this.minWithdrawal,
    this.clubkonectApi,
    this.clubkonectUserid,
    this.maxWithdrawal,
    this.createdAt,
    this.updatedAt,
  });

  factory Settings.fromJson(Map<String, dynamic> json) => Settings(
    id: json["id"],
    kyclevel1MaxWithdrawal: json["kyclevel1_max_withdrawal"],
    kyclevel2MaxWithdrawal: json["kyclevel2_max_withdrawal"],
    kyclevel3MaxWithdrawal: json["kyclevel3_max_withdrawal"],
    referralCommission: json["referral_commission"],
    accountBank: json["account_bank"],
    accountNumber: json["account_number"],
    depositInstructions: json["deposit_instructions"],
    minWithdrawal: json["min_withdrawal"],
    clubkonectApi: json["clubkonect_api"],
    clubkonectUserid: json["clubkonect_userid"],
    maxWithdrawal: json["max_withdrawal"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "kyclevel1_max_withdrawal": kyclevel1MaxWithdrawal,
    "kyclevel2_max_withdrawal": kyclevel2MaxWithdrawal,
    "kyclevel3_max_withdrawal": kyclevel3MaxWithdrawal,
    "referral_commission": referralCommission,
    "account_bank": accountBank,
    "account_number": accountNumber,
    "deposit_instructions": depositInstructions,
    "min_withdrawal": minWithdrawal,
    "clubkonect_api": clubkonectApi,
    "clubkonect_userid": clubkonectUserid,
    "max_withdrawal": maxWithdrawal,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
  };
}

/*
{
  "id": 1,
  "kyclevel1_max_withdrawal": 1000,
  "kyclevel2_max_withdrawal": 5000,
  "kyclevel3_max_withdrawal": 10000,
  "referral_commission": 10,
  "account_bank": "ACCESS BANK",
  "account_number": "0992233234",
  "deposit_instructions": "Kindly pay into the account and verify your payment. Endeavour to upload your proof of payment.",
  "min_withdrawal": 500,
  "clubkonect_api": "5T5B0CQIW1XA92OX8229BLPQY7J4A935T650E0LRG8U4426XCX371OU288WTY1U1",
  "clubkonect_userid": "CK11256149",
  "max_withdrawal": 200000,
  "createdAt": "2024-06-03T14:07:45.000Z",
  "updatedAt": "2024-06-03T14:07:45.000Z"
}
*/