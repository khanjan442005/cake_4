// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:cake_shop_4/main.dart';

void main() {
  testWidgets('SplashScreen test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const SweetBitesApp());

    // Verify that SplashScreen is shown
    expect(find.byType(SplashScreen), findsOneWidget);

    // Wait for 3 seconds
    await tester.pump(const Duration(seconds: 3));

    // pumpAndSettle will wait for all animations to complete
    await tester.pumpAndSettle();

    // Verify that HomePage is shown
    expect(find.byType(HomePage), findsOneWidget);
  });
}