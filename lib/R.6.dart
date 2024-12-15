import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'login_screen.dart'; // استبدل بـ الشاشة التي تريد الانتقال إليها

class R6 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // الخلفية
          Image.network(
            'https://i.imghippo.com/files/ouD2110nME.jpg', // رابط صورة الخلفية
            fit: BoxFit.cover,
          ),
          // تأثير التغميق
          Container(
            color: Colors.black.withOpacity(0.5), // تغميق الخلفية بنسبة 50%
          ),
          // أيقونة تسجيل الدخول

          // المحتوى الرئيسي
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // الشعار
              Image.network(
                'https://i.imghippo.com/files/gV2681yt.png', // رابط الشعار
                width: 200,
                height: 200,
              ),
              SizedBox(height: 20),
              // النصوص
              Text(
                "بالسلامة",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              Text(
                "عن التطبيق\n"
                "مرحبًا بكم في تطبيق بالسلامة\n"
                "تطبيق يساعد الناس على العثور على أحبائهم المفقودين بدون تسجيل.\n"
                "يمكنك البحث عن أفراد مفقودين من خلال فئات مختلفة مثل الأطفال، السيدات، أو الرجال، وتصفح قاعدة البيانات بسهولة.\n"
                "هدفنا هو تسهيل عمليات البحث وتسريع لمّ الشمل مع أحبائك.\n",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),

              SizedBox(height: 30),
              // زر استمرار
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            HomeScreen()), // استبدل بـ الشاشة التالية
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlue, // لون الزر
                  padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  "رجوع",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
