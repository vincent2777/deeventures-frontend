
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../routes/api_routes/api_route_names.dart';

class GeneralAPI {

  //  Get User.
  static Future<Response?> getUserService(String url, int userID, String token) async {
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
      debugPrint("ERROR RESPONSE::: $e");
      if (e.response != null) {
        return e.response;
      }
      throw Exception(e.response);
    }
  }

  //  Get Account Setting.
  static Future<Response?> getAccountSettingService(String url, String token) async {
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
      debugPrint("ERROR RESPONSE::: $e");
      if (e.response != null) {
        return e.response;
      }
      throw Exception(e.response);
    }
  }
}