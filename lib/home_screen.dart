import 'package:flutter/material.dart';
import 'search.dart';
import 'app_data.dart';
import 'R.1.dart';
import 'R.2.dart';
import 'R.3.dart';
import 'R4.dart';
import 'R.5.dart';
import 'R.6.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
        break;
      case 1:
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('تنبيه'),
              content: Text('يرجى التوجه إلى أقرب مركز شرطة.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('حسناً'),
                ),
              ],
            );
          },
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MissingPersonsList()),
        );
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
              padding: const EdgeInsets.all(40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.lightBlue[100],
                      minimumSize: Size(160, 120),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('تنبيه'),
                            content: Text('يرجى التوجه إلى أقرب مركز شرطة.'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('حسناً'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add_business, size: 90, color: Colors.black),
                        SizedBox(height: 30),
                        Text(
                          'إضافة مركز شرطة',
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(179, 229, 252, 1),
                      minimumSize: Size(160, 120),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('تنبيه'),
                            content: Text('يرجى التوجه إلى أقرب مركز شرطة'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('حسناً'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.report, size: 90, color: Colors.black),
                        SizedBox(height: 30),
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
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 25,
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
                          margin:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 1),
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
