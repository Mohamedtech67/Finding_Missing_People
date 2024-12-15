import 'package:flutter/material.dart';
import 'search.dart';
import 'create_report.dart';
import 'app_data.dart';
import 'add_policeS.dart';
import 'R.1.dart';
import 'R.2.dart';
import 'R.3.dart';
import 'R4.dart';
import 'R.5.dart';
import 'R.6.dart';

class HomeScreenAdmin extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreenAdmin> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // تنفيذ العمليات بناءً على العنصر المحدد
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeScreenAdmin()),
        );
        // الصفحة الرئيسية
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AddPersonScreen()),
        );
        // إنشاء تقرير
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MissingPersonsList()),
        );
        // البحث
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[100],
        title: const Text(
          'بالسلامة',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.menu, color: Colors.black),
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'ابحث بالاسم أو الموقع',
                prefixIcon: Icon(Icons.search, color: Colors.grey),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ),
      ),
      endDrawer: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.lightBlue[100],
              ),
              child: Center(
                child: Text(
                  'بالسلامة',
                  style: TextStyle(fontSize: 24, color: Colors.black),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.info, color: Colors.blue),
              title: Text('معلومات قانونية'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => R1()),
                );
                // Handle navigation or actions
              },
            ),
            ListTile(
              leading: Icon(Icons.security, color: Colors.blue),
              title: Text('نصائح للسلامة'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => R2()),
                );
                // Handle navigation or actions
              },
            ),
            ListTile(
              leading: Icon(Icons.phone, color: Colors.blue),
              title: Text('أرقام الطوارئ'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => R3()),
                );
                // Handle navigation or actions
              },
            ),
            ListTile(
              leading: Icon(Icons.group, color: Colors.blue),
              title: Text('مجموعات الدعم'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => R4()),
                );
                // Handle navigation or actions
              },
            ),
            ListTile(
              leading: Icon(Icons.book, color: Colors.blue),
              title: Text('دليل الإرشادات'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => R5()),
                );
                // Handle navigation or actions
              },
            ),
            ListTile(
              leading: Icon(Icons.info_outline, color: Colors.blue),
              title: Text('عن التطبيق'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => R6()),
                );
                // Handle navigation or actions
              },
            ),
          ],
        ),
      ),
      body: Container(
        color: Colors.lightBlue[50],
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // زر "إضافة مركز شرطة"
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.lightBlue[100],
                      minimumSize: Size(150, 120), // تحديد حجم الزر
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(30), // الزوايا المستديرة
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddPoliceStationScreen()),
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add_business,
                            size: 40, color: Colors.black), // الأيقونة
                        SizedBox(height: 10), // مسافة بين الأيقونة والنص
                        Text(
                          'إضافة مركز شرطة',
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                      ],
                    ),
                  ),

                  // زر "إنشاء بلاغ"
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.lightBlue[100],
                      minimumSize: Size(150, 120), // حجم أكبر للزر الثاني
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddPersonScreen()),
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.report,
                            size: 50, color: Colors.black), // الأيقونة
                        SizedBox(height: 10),
                        Text(
                          'إنشاء بلاغ',
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 50),
            Text(
              'بلاغات حديثه',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                color: const Color.fromARGB(255, 0, 0, 0),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  SizedBox(
                    height: 300,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: allData.length,
                      itemBuilder: (context, index) {
                        final person = allData[index];
                        return Card(
                          color: Colors.lightBlue[200],
                          margin: EdgeInsets.symmetric(horizontal: 8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Container(
                            width: 200,
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                    person['imageUrl']!,
                                    height: 100,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  person['name']!,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'العمر: ${person['age']}',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                  'تم العثور عليه بواسطة: ${person['foundBy']}',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                  'تاريخ العثور: ${person['foundDate']}',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                  'الحالة: ${person['status']}',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            backgroundColor: Colors.lightBlue,
            icon: Icon(Icons.home),
            label: "الصفحة الرئيسية",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.create),
            label: "إنشاء بلاغ",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "بحث",
          ),
        ],
      ),
    );
  }
}

class FeatureButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  FeatureButton(
      {required this.icon, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.lightBlue[200],
            shape: CircleBorder(),
            padding: EdgeInsets.all(20),
          ),
          onPressed: onPressed,
          child: Icon(icon, size: 30, color: Colors.black),
        ),
        SizedBox(height: 8),
        Text(label, style: TextStyle(color: Colors.black, fontSize: 14)),
      ],
    );
  }
}
