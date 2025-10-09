import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ezcom/main.dart';

void main() {
  testWidgets('EZcom app smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const EZcomApp());

    expect(find.text('EZcom'), findsOneWidget);
    expect(find.text('Computer Ordering System'), findsOneWidget);
  });
}
