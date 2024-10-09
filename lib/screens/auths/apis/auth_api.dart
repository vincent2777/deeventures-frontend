
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

  //  Forgot Password.
  static Future<Response?> forgotPasswordService(String url, Map<String, dynamic> forgotPasswordData) async {
    var fullURL = "$baseURL$url";
    // debugPrint("URL::: $fullURL \n $forgotPasswordData");

    try {
      return await Dio().post(
        fullURL,
        data: forgotPasswordData,
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

  //  Reset Password.
  static Future<Response?> resetPasswordService(String url, Map<String, dynamic> resetPasswordData) async {
    var fullURL = "$baseURL$url";
    debugPrint("URL::: $fullURL \n $resetPasswordData");

    try {
      return await Dio().post(
        fullURL,
        data: resetPasswordData,
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


  //  Update User Password.
  static Future<Response?> updatePasswordService(String url, Map<String, dynamic> passwordData, String token, int userID) async {
    var fullURL = "$baseURL$url/$userID";
    debugPrint("URL::: $fullURL \n $passwordData");

    try {
      return await Dio().post(
        fullURL,
        data: passwordData,
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        }),
      );
    } on DioException catch (error) {
      if (error.response != null) {
        return error.response;
      }
      debugPrint("ERROR RESPONSE::: $error");
      throw Exception(error.response);
    }
  }


  //  Delete User Password.
  static Future<Response?> deleteUserService(String url, String token, int userID) async {
    var fullURL = "$baseURL$url/$userID";
    debugPrint("URL::: $fullURL \n ");

    try {
      return await Dio().delete(
        fullURL,
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        }),
      );
    } on DioException catch (error) {
      if (error.response != null) {
        return error.response;
      }
      debugPrint("ERROR RESPONSE::: $error");
      throw Exception(error.response);
    }
  }


  //  Update User .
  static Future<Response?> updateUserService(String url, Map<String, dynamic> userData, String token, int userID) async {
    var fullURL = "$baseURL$url/$userID";
    debugPrint("URL::: $fullURL \n $userData");

    try {
      return await Dio().put(
        fullURL,
        data: userData,
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        }),
      );
    } on DioException catch (error) {
      if (error.response != null) {
        return error.response;
      }
      debugPrint("ERROR RESPONSE::: $error");
      throw Exception(error.response);
    }
  }

  // Upload User profile image Proof.
  static Future<Response?> uploadUserProfileImageService(String url, String userID, String imageFile, String token) async {
    var fullURL = "$baseURL$url/$userID";
    // debugPrint("URL::: $fullURL");

    try {
      FormData formData = FormData.fromMap({
        "profileImage": await MultipartFile.fromFile(
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