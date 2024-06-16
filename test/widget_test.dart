// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:deeventures/main.dart';

void main() {
  FlutterSecureStorage flutterSecureStorage = const FlutterSecureStorage();

  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    String userData = await flutterSecureStorage.read(key: 'userData') ?? "";

    //  Decode userData
    Map<String, dynamic>? loggedInUserData;
    if (userData.isNotEmpty) {
      loggedInUserData = jsonDecode(userData);
    }

    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp(loggedInUserData));

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
