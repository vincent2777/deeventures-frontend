import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../routes/api_routes/api_route_names.dart';


class CryptocurrencyAPI {

  // Prepare the Headers
  static const _headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    // 'Authorization': _token,
  };

  //  Get Cryptocurrency.
  static Future<Response?> getCryptocurrenciesService(String getCryptocurrenciesRoute, String token) async {
    var fullURL = "$baseURL$getCryptocurrenciesRoute";
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

  static Future<Response?> getCryptocurrencyService(String getCryptocurrencyRoute, String product, String granularity) async {
    var fullURL = "$getCryptocurrencyRoute/$product/candles?granularity=$granularity";
    debugPrint("URL::: $fullURL");

    try {
      return await Dio().get(
        fullURL,
        options: Options(headers: _headers),
      );
    } on DioException catch (e) {
      if (e.response != null) {
        return e.response;
      }
      throw Exception(e.response);
    }
  }

  //  Sell Cryptocurrency.
  static Future<Response?> sellCryptoService(String sellCryptocurrencyRoute, Map<String, dynamic> sellCryptoData, String token) async {
    var fullURL = "$baseURL$sellCryptocurrencyRoute";
    debugPrint("URL::: $fullURL");

    try {
      return await Dio().post(
        fullURL,
        data: sellCryptoData,
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

  //  Sell Cryptocurrency.
  /*static Future<Response?> uploadTransactionProofService(String url, String trnxReference, String imageFile, String token) async {
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
  }*/

}