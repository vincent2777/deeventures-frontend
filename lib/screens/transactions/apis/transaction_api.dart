
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../routes/api_routes/api_route_names.dart';

class TransactionAPI {

  // Get Transactions
  static Future<Response?> getTransactionsService(String url, String token) async {
    var fullURL = "$baseURL$url";
    // debugPrint("Requesting URL: $fullURL");
    // debugPrint("Requesting Token: $token");

    try {
      var dio = Dio();
      dio.options.headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };

      var response = await dio.get(fullURL);
      // debugPrint("Response status code: ${response.statusCode}");
      // debugPrint("Response data: ${response.data}");
      return response;
    } on DioException catch (e) {
      // debugPrint("DioException in getTransactionsService: $e");
      if (e.response != null) {
        // debugPrint("Response status code: ${e.response?.statusCode}");
        // debugPrint("Response data: ${e.response?.data}");
        // debugPrint("Response headers: ${e.response?.headers}");

        if (e.response?.statusCode == 404) {
          // debugPrint("404 Error: The requested resource was not found.");
          // debugPrint("Requested URL: ${e.requestOptions.uri}");
          // debugPrint("Request Parameters: ${e.requestOptions.queryParameters}");
        }

        return e.response;
      } else {
        // debugPrint("Request: ${e.requestOptions}");
        // debugPrint("Error message: ${e.message}");
        throw Exception("Failed to connect to the server. Please check your internet connection.");
      }
    } catch (e) {
      // debugPrint("Unexpected error in getTransactionsService: $e");
      throw Exception("An unexpected error occurred. Please try again later.");
    }
  }

  // Upload Transaction Proof.
  static Future<Response?> uploadTransactionProofService(String url, String trnxReference, List<File?> pickedFiles, String token) async {
    var fullURL = "$baseURL$url/$trnxReference";
    // debugPrint("URL::: $fullURL");

    try {
      FormData formData = FormData.fromMap({});
      // Append the images to the form data
      for (var file in pickedFiles) {
        String fileName = file!.path.split('/').last;
        formData.files.add(MapEntry(
          "transactionProof",
          await MultipartFile.fromFile(file.path, filename: fileName),
        ));
      }

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