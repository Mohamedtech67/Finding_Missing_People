import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'login_screen.dart'; // استبدل بـ الشاشة التي تريد الانتقال إليها

class R5 extends StatelessWidget {
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
                "دليل الإرشادات\n"
                "1. ابدأ بالبحث في الأماكن التي زارها المفقود مؤخرًا.\n"
                "2. تواصل مع الأقارب والأصدقاء للحصول على أي معلومات قد تكون مفيدة.\n"
                "3. أبلغ الشرطة وشارك جميع التفاصيل المتاحة حول المفقود (صورة حديثة، مكان آخر ظهور، ملابسه...).\n"
                "4. استخدم تطبيق بالسلامة للبحث عن المفقودين عبر قاعدة البيانات المتاحة.\n"
                "5. شارك معلومات المفقود على وسائل التواصل الاجتماعي لزيادة فرص العثور عليه.\n",
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
