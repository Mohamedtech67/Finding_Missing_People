import 'package:flutter/material.dart';
import 'app_data.dart'; // استيراد ملف القوائم

class AddPersonScreen extends StatefulWidget {
  @override
  _AddPersonScreenState createState() => _AddPersonScreenState();
}

class _AddPersonScreenState extends State<AddPersonScreen> {
  final _formKey = GlobalKey<FormState>();

  // متغيرات لتخزين المدخلات
  String? _name;
  String? _age;
  String? _foundBy;
  String? _foundDate;
  String? _status;
  String? _imageUrl;
  String _selectedCategory = 'رجل'; // النوع الافتراضي

  void _addPerson() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // إنشاء الشخص الجديد
      Map<String, String> newPerson = {
        'name': _name!,
        'age': _age!,
        'foundBy': _foundBy!,
        'foundDate': _foundDate!,
        'status': _status!,
        'imageUrl': _imageUrl ?? 'https://i.ibb.co/3zBpjgh/person.jpg',
      };

      // إضافة الشخص إلى القائمة المناسبة
      if (_selectedCategory == 'رجل') {
        allData.add(newPerson);
      } else if (_selectedCategory == 'امرأة') {
        allData.add(newPerson);
      } else if (_selectedCategory == 'طفل') {
        allData.add(newPerson);
      }

      // إظهار رسالة نجاح
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('تمت إضافة البيانات بنجاح!')),
      );

      // إعادة تعيين الحقول
      _formKey.currentState!.reset();
      setState(() {
        _selectedCategory = 'رجل';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl, // لضبط الاتجاه من اليمين لليسار
      child: Scaffold(
        appBar: AppBar(
          title: Text('إضافة شخص جديد'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // الاسم
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'الاسم بالكامل',
                      alignLabelWithHint: true, // يجعل النص يتماشى مع الاتجاه
                    ),
                    textAlign:
                        TextAlign.right, // النص داخل الحقل يكون على اليمين
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'الرجاء إدخال الاسم';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _name = value;
                    },
                  ),
                  SizedBox(height: 16),
                  // العمر
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'العمر',
                      alignLabelWithHint: true,
                    ),
                    textAlign: TextAlign.right,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'الرجاء إدخال العمر';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _age = value;
                    },
                  ),
                  SizedBox(height: 16),
                  // تم العثور بواسطة
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'تم العثور بواسطة',
                      alignLabelWithHint: true,
                    ),
                    textAlign: TextAlign.right,
                    onSaved: (value) {
                      _foundBy = value;
                    },
                  ),
                  SizedBox(height: 16),
                  // تاريخ العثور
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'تاريخ العثور',
                      alignLabelWithHint: true,
                    ),
                    textAlign: TextAlign.right,
                    onSaved: (value) {
                      _foundDate = value;
                    },
                  ),
                  SizedBox(height: 16),
                  // الحالة
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'الحالة',
                      alignLabelWithHint: true,
                    ),
                    textAlign: TextAlign.right,
                    onSaved: (value) {
                      _status = value;
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
                  DropdownButtonFormField<String>(
                    value: _selectedCategory,
                    items: ['رجل', 'امرأة', 'طفل']
                        .map((category) => DropdownMenuItem(
                              value: category,
                              child: Text(category, textAlign: TextAlign.right),
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedCategory = value!;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'النوع',
                      alignLabelWithHint: true,
                    ),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _addPerson,
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
