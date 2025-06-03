import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:learn/main.dart';

void main() {
  testWidgets('MyApp builds without error', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
