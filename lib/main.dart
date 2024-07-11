import 'dart:convert';

import 'package:deeventures/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

import 'routes/app_routes/app_route_names.dart';
import 'routes/app_routes/app_routes.dart';

void main() async {
  //  Call this whenever you're using "async" in the "main" method.
  WidgetsFlutterBinding.ensureInitialized();

  //  Load .env file.
  await dotenv.load(fileName: ".env");

  // Set status bar color to green with light white text
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor:  mainGreen,
    statusBarIconBrightness: Brightness.light, // For Android
    statusBarBrightness: Brightness.light, // For iOS
  ));

  FlutterSecureStorage flutterSecureStorage = const FlutterSecureStorage();
  String userData = await flutterSecureStorage.read(key: 'userData') ?? "";

  //  Decode userData
  Map<String, dynamic>? loggedInUserData;
  if (userData.isNotEmpty) {
    loggedInUserData = jsonDecode(userData);
  }

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp
  ]).then((value) async {
    runApp(MyApp(
      loggedInUserData,
    ));
  });
}

class MyApp extends StatelessWidget {
  const MyApp(this.loggedInUserData, {super.key});
  final Map<String, dynamic>? loggedInUserData;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    String initialRoute = (loggedInUserData == null)
        ? splashScreen
        : homeScreen;

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('en', 'US'),
      title: 'Dee Ventures',
      theme: ThemeData(
        // brightness: true ? Brightness.dark : Brightness.light,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
        fontFamily: "Manrope",
      ),

      initialRoute: initialRoute,
      getPages: getPages,
    );
  }
}