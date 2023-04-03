import 'package:centennial_care/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  testWidgets('LoginPage should display correctly', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: LoginPage()));
    
    expect(find.text('CENTENNIAL-CARE'), findsOneWidget);
    expect(find.text('Welcome to'), findsOneWidget);
    expect(find.text('CENTENNIAL CARE'), findsOneWidget);
    expect(find.text('Login Below'), findsOneWidget);
    expect(find.text('Username'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);
    expect(find.text('LOGIN'), findsOneWidget);
  });
}
