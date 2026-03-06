import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ponymail/app.dart';

void main() {
  testWidgets('renders app shell', (tester) async {
    await tester.pumpWidget(const PonyMailApp());
    await tester.pump(const Duration(seconds: 1));
    await tester.pumpAndSettle();

    expect(find.byType(PonyMailApp), findsOneWidget);
    expect(find.byType(Scaffold), findsWidgets);
  });
}
