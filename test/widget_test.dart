import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tdd_sum/main.dart';

void main() {
  testWidgets('String Calculator App smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const StringCalculatorApp());

    // Verify that the app loads with the calculator screen
    expect(find.text('String Calculator'), findsOneWidget);
    expect(find.text('Input Numbers:'), findsOneWidget);
    
    // Verify input field exists
    expect(find.byType(TextField), findsOneWidget);
    
    // Verify clear button exists
    expect(find.text('Clear'), findsOneWidget);
  });
}
