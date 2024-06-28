
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';



class AuthAPI {

  //  Get Default.
  static Future<String?> getDefaultService() async {

    try {
      return "Hello";
    } on DioException catch (error) {
      debugPrint("ERROR::: $error");
      throw Exception(error.response);
    }
  }

}