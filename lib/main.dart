import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'login_screen.dart';
import 'admin_screen.dart';
import 'welcom_screen.dart';
import 'splash.dart';

void main() {
  runApp(FindMeApp());
}

class FindMeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FindMe',
      initialRoute: '/splash',
      routes: {
        'welcom/': (context) => WelcomeScreen(),
        '/': (context) => HomeScreen(), // الصفحة الرئيسية
        '/login': (context) => LoginPage(), // صفحة تسجيل الدخول
        '/splash': (context) => SplashScreen(),
        '/admin': (context) => HomeScreenAdmin(),
      },
    );
  }
}
