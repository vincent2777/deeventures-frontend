
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../routes/api_routes/api_route_names.dart';


class AuthAPI {

  // Prepare the Headers
  static const _headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    // 'Authorization': _token,
  };

  //  Register User.
  static Future<Response?> registerUserService(String url, Map<String, dynamic> registrationData) async {
    var fullURL = "$baseURL$url";
    debugPrint("URL::: $fullURL \n $registrationData");

    try {
      return await Dio().post(
        fullURL,
        data: registrationData,
        options: Options(headers: _headers),
      );
    } on DioException catch (error) {
      if (error.response != null) {
        return error.response;
      }
      debugPrint("ERROR RESPONSE::: $error");
      throw Exception(error.response);
    }
  }

  //  Login User.
  static Future<Response?> loginUserService(String url, Map<String, dynamic> loginData) async {
    var fullURL = "$baseURL$url";
    debugPrint("URL::: $fullURL \n $loginData");

    try {
      return await Dio().post(
        fullURL,
        data: loginData,
        options: Options(headers: _headers),
      );
    } on DioException catch (error) {
      debugPrint("ERROR::: $error");
      if (error.response != null) {
        return error.response;
      }
      throw Exception(error.response);
    }
  }

}