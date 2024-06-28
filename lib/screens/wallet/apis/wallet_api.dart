
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../routes/api_routes/api_route_names.dart';

class WalletAPI {

  //  Get User Wallet.
  static Future<Response?> getUserWalletService(String url, int userID, String token) async {
    var fullURL = "$baseURL$url/$userID";
    // debugPrint("URL::: $fullURL");

    try {
      return await Dio().get(
        fullURL,
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        }),
      );
    } on DioException catch (e) {
      debugPrint("ERROR RESPONSE::: $e");
      if (e.response != null) {
        return e.response;
      }
      throw Exception(e.response);
    }
  }
  static Future<Response?> getUserReferralWalletService(String url, int userID, String token) async {
    var fullURL = "$baseURL$url/$userID";
    // debugPrint("URL::: $fullURL");

    try {
      return await Dio().get(
        fullURL,
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        }),
      );
    } on DioException catch (e) {
      debugPrint("ERROR RESPONSE::: $e");
      if (e.response != null) {
        return e.response;
      }
      throw Exception(e.response);
    }
  }

  // Deposit Money
  static Future<Response?> depositMoneyService(String url, int userID, Map<String, dynamic> depositData, String token) async {
    var fullURL = "$baseURL$url/$userID";
    debugPrint("URL::: $fullURL");

    try {
      return await Dio().post(
        fullURL,
        data: depositData,
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        }),
      );
    } on DioException catch (e) {
      debugPrint("ERROR RESPONSE::: $e");
      if (e.response != null) {
        return e.response;
      }
      throw Exception(e.response);
    }
  }
}