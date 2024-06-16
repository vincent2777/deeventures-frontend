
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../routes/api_routes/api_route_names.dart';

class TransactionAPI {

  // Get Transactions
  static Future<Response?> getTransactionsService(String url, String token) async {
    var fullURL = "$baseURL$url";
    debugPrint("URL::: $fullURL");

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
      debugPrint("ERRoR RESPONSE::: $e");
      if (e.response != null) {
        return e.response;
      }
      throw Exception(e.response);
    }
  }


  // Upload Transaction Proof.
  static Future<Response?> uploadTransactionProofService(String url, String trnxReference, String imageFile, String token) async {
    var fullURL = "$baseURL$url/$trnxReference";
    debugPrint("URL::: $fullURL");

    try {
      FormData formData = FormData.fromMap({
        "transactionProof": await MultipartFile.fromFile(
          imageFile,
          filename: imageFile.split("/").last,
        ),
      });
      return await Dio().post(
        fullURL,
        data: formData,
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        }),
      );
    } on DioException catch (e) {
      if (e.response != null) {
        return e.response;
      }
      throw Exception(e.response);
    }
  }
}