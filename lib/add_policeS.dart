import 'package:flutter/material.dart';
import 'app_data.dart'; // استيراد ملف القوائم

class AddPoliceStationScreen extends StatefulWidget {
  @override
  _AddPoliceStationScreenState createState() => _AddPoliceStationScreenState();
}

class _AddPoliceStationScreenState extends State<AddPoliceStationScreen> {
  final _formKey = GlobalKey<FormState>();

  // متغيرات لتخزين المدخلات
  String? _stationName;
  String? _address;
  String? _phoneNumber;
  String? _area;
  String? _imageUrl;

  void _addPoliceStation() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // إنشاء مركز الشرطة الجديد
      Map<String, String> newStation = {
        'stationName': _stationName!,
        'address': _address!,
        'phoneNumber': _phoneNumber!,
        'area': _area!,
        'imageUrl': _imageUrl ?? 'https://i.ibb.co/3zBpjgh/station.jpg',
      };

      // إضافة المركز إلى القائمة
      police.add(newStation);

      // إظهار رسالة نجاح
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('تمت إضافة مركز الشرطة بنجاح!')),
      );

      // إعادة تعيين الحقول
      _formKey.currentState!.reset();
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl, // لضبط الاتجاه من اليمين لليسار
      child: Scaffold(
        appBar: AppBar(
          title: Text('إضافة مركز شرطة'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // اسم المركز
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'اسم المركز',
                      alignLabelWithHint: true, // يجعل النص يتماشى مع الاتجاه
                    ),
                    textAlign:
                        TextAlign.right, // النص داخل الحقل يكون على اليمين
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'الرجاء إدخال اسم المركز';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _stationName = value;
                    },
                  ),
                  SizedBox(height: 16),
                  // العنوان
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'العنوان',
                      alignLabelWithHint: true,
                    ),
                    textAlign: TextAlign.right,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'الرجاء إدخال العنوان';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _address = value;
                    },
                  ),
                  SizedBox(height: 16),
                  // رقم الهاتف
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'رقم الهاتف',
                      alignLabelWithHint: true,
                    ),
                    textAlign: TextAlign.right,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'الرجاء إدخال رقم الهاتف';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _phoneNumber = value;
                    },
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'المنطقة',
                      alignLabelWithHint: true,
                    ),
                    textAlign: TextAlign.right,
                    onSaved: (value) {
                      _area = value;
                    },
                  ),
                  SizedBox(height: 16),
                  // رابط الصورة
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'رابط الصورة (اختياري)',
                      alignLabelWithHint: true,
                    ),
                    textAlign: TextAlign.right,
                    onSaved: (value) {
                      _imageUrl = value;
                    },
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _addPoliceStation,
                    child: Text('إضافة'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
