import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:founta_app/app.dart';

void main() {
  testWidgets('App loads and shows shell with Home', (WidgetTester tester) async {
    await tester.pumpWidget(const FountaApp());

    expect(find.text('Home'), findsOneWidget);
  });
}
