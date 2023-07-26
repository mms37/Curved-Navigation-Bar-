// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:untitled27/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('App should load with initial page', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that our initial page is loaded (Home page).
    expect(find.text('Ürün 1'), findsOneWidget);
    expect(find.text('Arama yapın'), findsNothing);
    expect(find.text('Kullanıcı Adı: John Doe'), findsNothing);
  });

  testWidgets('Tap on navigation items should change page', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Tap on the second navigation item (Search page).
    await tester.tap(find.byIcon(Icons.search));
    await tester.pumpAndSettle();

    // Verify that the second page (Search page) is loaded.
    expect(find.text('Ürün 1'), findsNothing);
    expect(find.text('Arama yapın'), findsOneWidget);
    expect(find.text('Kullanıcı Adı: John Doe'), findsNothing);

    // Tap on the third navigation item (Profile page).
    await tester.tap(find.byIcon(Icons.person));
    await tester.pumpAndSettle();

    // Verify that the third page (Profile page) is loaded.
    expect(find.text('Ürün 1'), findsNothing);
    expect(find.text('Arama yapın'), findsNothing);
    expect(find.text('Kullanıcı Adı: John Doe'), findsOneWidget);

    // Tap on the first navigation item (Home page).
    await tester.tap(find.byIcon(Icons.home));
    await tester.pumpAndSettle();

    // Verify that the first page (Home page) is loaded again.
    expect(find.text('Ürün 1'), findsOneWidget);
    expect(find.text('Arama yapın'), findsNothing);
    expect(find.text('Kullanıcı Adı: John Doe'), findsNothing);
  });

  testWidgets('Search functionality should work correctly', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Tap on the second navigation item (Search page).
    await tester.tap(find.byIcon(Icons.search));
    await tester.pumpAndSettle();

    // Enter a search query.
    await tester.enterText(find.byType(TextField), 'Ürün 5');
    await tester.pumpAndSettle();

    // Verify that only the search result is displayed.
    expect(find.text('Ürün 5'), findsOneWidget);
    expect(find.text('Ürün 1'), findsNothing);
    expect(find.text('Ürün 2'), findsNothing);
    expect(find.text('Ürün 3'), findsNothing);
    expect(find.text('Ürün 4'), findsNothing);
    expect(find.text('Ürün 6'), findsNothing);
    expect(find.text('Ürün 7'), findsNothing);
    expect(find.text('Ürün 8'), findsNothing);
    expect(find.text('Ürün 9'), findsNothing);
    expect(find.text('Ürün 10'), findsNothing);
  });
}
