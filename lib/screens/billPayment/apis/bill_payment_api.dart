
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../routes/api_routes/api_route_names.dart';

class BillPaymentAPI {

  //  Get Electricity Companies.
  static Future<Response?> getAirtelService(String url, String token) async {
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
      if (e.response != null) {
        return e.response;
      }
      debugPrint("ERROR RESPONSE::: $e");
      throw Exception(e.response);
    }
  }
  static Future<Response?> buyAirtimeService(String url, Map<String, dynamic> buyAirtimeData, String token) async {
    var fullURL = "$baseURL$url";
    debugPrint("URL::: $fullURL \n $buyAirtimeData");

    try {
      return await Dio().post(
        fullURL,
        data: buyAirtimeData,
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
      debugPrint("ERROR RESPONSE::: $e");
      throw Exception(e.response);
    }
  }

  //  Get Electricity Companies.
  static Future<Response?> getInternetServiceProvidersService(String url, Map<String, dynamic> internetServiceProvidersData, String token) async {
    String fullURL = "$baseURL$url";
    debugPrint("URL::: $fullURL");

    try {
      return await Dio().get(
        fullURL,
        data: internetServiceProvidersData,
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
      debugPrint("ERROR RESPONSE::: $e");
      throw Exception(e.response);
    }
  }
  static Future<Response?> getInternetServiceProvidersCommissionService(String url, code, String token) async {
    String fullURL = "$baseURL$url/$code";
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
      if (e.response != null) {
        return e.response;
      }
      debugPrint("ERROR RESPONSE::: $e");
      throw Exception(e.response);
    }
  }
  static Future<Response?> buyInternetService(String url, Map<String, dynamic> buyInternetData, String token) async {
    var fullURL = "$baseURL$url";
    debugPrint("URL::: $fullURL \n $buyInternetData");

    try {
      return await Dio().post(
        fullURL,
        data: buyInternetData,
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
      debugPrint("ERROR RESPONSE::: $e");
      throw Exception(e.response);
    }
  }

  //  Get Cable TV.
  static Future<Response?> getCableTVService(String url, Map<String, dynamic> cableTVData, String token) async {
    String fullURL = "$baseURL$url";
    debugPrint("URL::: $fullURL");

    try {
      return await Dio().get(
        fullURL,
        data: cableTVData,
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
      debugPrint("ERROR RESPONSE::: $e");
      throw Exception(e.response);
    }
  }
  static Future<Response?> getCableTVCommissionService(String url, code, String token) async {
    String fullURL = "$baseURL$url/$code";
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
      if (e.response != null) {
        return e.response;
      }
      debugPrint("ERROR RESPONSE::: $e");
      throw Exception(e.response);
    }
  }

  //  Get Electricity Companies.
  static Future<Response?> getElectricityCompaniesService(String url, Map<String, dynamic> electricCompaniesData, String token) async {
    var fullURL = "$baseURL$url";
    debugPrint("URL::: $fullURL");

    try {
      return await Dio().get(
        fullURL,
        data: electricCompaniesData,
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
      debugPrint("ERROR RESPONSE::: $e");
      throw Exception(e.response);
    }
  }
  static Future<Response?> getMeterTypesService(String url, String token) async {
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
      if (e.response != null) {
        return e.response;
      }
      debugPrint("ERROR RESPONSE::: $e");
      throw Exception(e.response);
    }
  }
  static Future<Response?> getElectricCompaniesCommissionService(String url, code, String token) async {
    String fullURL = "$baseURL$url/$code";
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
      if (e.response != null) {
        return e.response;
      }
      debugPrint("ERROR RESPONSE::: $e");
      throw Exception(e.response);
    }
  }

  //  Buy Airtime.

  //  Buy Airtime.
  static Future<Response?> buyElectricityService(String url, Map<String, dynamic> buyElectricityData, String token) async {
    var fullURL = "$baseURL$url";
    debugPrint("URL::: $fullURL \n $buyElectricityData");

    try {
      return await Dio().post(
        fullURL,
        data: buyElectricityData,
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
      debugPrint("ERROR RESPONSE::: $e");
      throw Exception(e.response);
    }
  }

  //  Buy Airtime.
  static Future<Response?> buyCableTVService(String url, Map<String, dynamic> buyCableTVData, String token) async {
    var fullURL = "$baseURL$url";
    debugPrint("URL::: $fullURL \n $buyCableTVData");

    try {
      return await Dio().post(
        fullURL,
        data: buyCableTVData,
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
      debugPrint("ERROR RESPONSE::: $e");
      throw Exception(e.response);
    }
  }
}