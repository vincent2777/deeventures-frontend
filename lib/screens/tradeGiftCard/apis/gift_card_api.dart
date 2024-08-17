
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../routes/api_routes/api_route_names.dart';
import '../models/value_row.dart';

class GiftCardAPI {

  //  Get Gift Cards.
  static Future<Response?> getGiftCardsService(String url, String token) async {
    var fullURL = "$baseURL$url";
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
      debugPrint("ERRoR RESPONSE::: $e");
      if (e.response != null) {
        return e.response;
      }
      throw Exception(e.response);
    }
  }

  //  Sell GiftCard.
  static Future<Response?> sellGiftCardService(
      String sellGiftCardRoute,
      Map<String, dynamic> sellGiftCardData, String token,
      List<File?> files,
      List<ValueRow> rows) async {

    var fullURL = "$baseURL$sellGiftCardRoute";
    // debugPrint("URL::: $fullURL");

    FormData formData = FormData();

    // Append the images to the form data
    for (var file in files) {
      String fileName = file!.path.split('/').last;
      formData.files.add(MapEntry(
        "trnx_image",
        await MultipartFile.fromFile(file.path, filename: fileName),
      ));
    }

    List<Map<String, dynamic>> convertItemsToRates(List<ValueRow> items) {
      List<Map<String, dynamic>> rates = [];
      for (var item in items) {
        var value = item.value;
        var estimatedValue = item.estimatedValue;

        if (value != null && estimatedValue != null) {
          rates.add({
            'value': value,
            'estimated_value': estimatedValue,
          });
        }
      }
      return rates;
    }

    // Convert items to rates
    List<Map<String, dynamic>> rates = convertItemsToRates(rows);

    // Append the rates to the form data as a JSON string
    formData.fields.add(MapEntry('rates', jsonEncode(rates)));

    // Append the other data to the form data
    sellGiftCardData.forEach((key, value) {
      formData.fields.add(MapEntry(key, value.toString()));
    });

    try {
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


  //  Get Gift Card Rates.
  static Future<Response?> getGiftCardRatesService(String url, String token, String giftCardId) async {
    var fullURL = "$baseURL$url/$giftCardId";
    // debugPrint("URL::: $fullURL");

    try {
      return await Dio().get(
        fullURL,
        options: Options(headers: {
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
}