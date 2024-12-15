import 'package:flutter/material.dart';
import 'welcom_screen.dart';
// استبدل بـ الشاشة التي تريد الانتقال إليها

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // الانتقال التلقائي بعد 3 ثوانٍ
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => WelcomeScreen()), // استبدل بـ الشاشة التالية
      );
    });

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // الخلفية
          Image.network(
            'https://i.imghippo.com/files/DOxF6477k.jpg', // رابط صورة الخلفية
            fit: BoxFit.cover,
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // الشعار
              Image.network(
                'https://i.imghippo.com/files/gV2681yt.png', // رابط الشعار
                width: 200,
                height: 200,
              ),
              SizedBox(width: 50),
              SizedBox(height: 0),
              // النصوص
              Text(
                "بالسلامة",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

              // زر استمرار
            ],
          ),
        ],
      ),
    );
  }
}
