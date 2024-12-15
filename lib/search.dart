import 'package:flutter/material.dart';
import 'details_screen.dart';
import 'app_data.dart'; // استيراد البيانات من app_data.dart

class MissingPersonsList extends StatefulWidget {
  @override
  _MissingPersonsListState createState() => _MissingPersonsListState();
}

class _MissingPersonsListState extends State<MissingPersonsList> {
  List<Map<String, String>> filteredallData = [];
  String searchQuery = '';
  String? selectedName;
  String? selectedAge;
  // male  OR female

  @override
  void initState() {
    super.initState();
    filteredallData = allData;
  }

  void filterSearchResults() {
    setState(() {
      filteredallData = allData.where((person) {
        final matchesName =
            person['name']!.toLowerCase().contains(searchQuery.toLowerCase());
        final matchesAge = selectedAge == null || person['age'] == selectedAge;

        return matchesName && matchesAge;
      }).toList();
    });
  }

  void openFilterDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Filter'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Age'),
                onChanged: (value) {
                  selectedAge = value.isEmpty ? null : value;
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  selectedAge = null;

                  searchQuery = '';
                });
                filterSearchResults();
                Navigator.of(context).pop();
              },
              child: Text('Clear'),
            ),
            TextButton(
              onPressed: () {
                filterSearchResults();
                Navigator.of(context).pop();
              },
              child: Text('Apply'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 62, 182, 238),
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: openFilterDialog,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (query) {
                  searchQuery = query;
                  filterSearchResults();
                },
                decoration: InputDecoration(
                  labelText: 'Search',
                  hintText: 'Search by name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height - 150,
              child: ListView.builder(
                itemCount: filteredallData.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsScreen(
                            person: filteredallData[index],
                          ),
                        ),
                      );
                    },
                    child: Card(
                      color: Color.fromARGB(255, 92, 191, 230),
                      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.network(
                              filteredallData[index]['imageUrl']!,
                              height: 100,
                              width: 100,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(height: 8),
                            Text(
                              filteredallData[index]['name']!,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Age: ${filteredallData[index]['age']}',
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              'Found By: ${filteredallData[index]['foundBy']}',
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              'Found Date: ${filteredallData[index]['foundDate']}',
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              'Status: ${filteredallData[index]['status']}',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: MissingPersonsList(),
  ));
}
