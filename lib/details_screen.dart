import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final Map<String, String> person;

  DetailsScreen({required this.person});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Missing Person'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(person['imageUrl'] ??
                        'https://via.placeholder.com/150'), // Ensure to provide the image URL
                  ),
                  SizedBox(height: 10),
                  Text(
                    person['name'] ?? 'Person Name',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text('Missing - Family is looking for them'),
                ],
              ),
            ),
            SizedBox(height: 20),
            Divider(),
            _buildInfoRow('Age', person['age'] ?? 'Unknown'),
            _buildInfoRow('Gender', person['gender'] ?? 'Unknown'),
            _buildInfoRow('Health Status', person['healthStatus'] ?? 'Unknown'),
            SizedBox(height: 20),
            Divider(),
            Text(
              'Physical Description',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            _buildInfoRow('Height', person['height'] ?? 'Unknown'),
            _buildInfoRow('Weight', person['weight'] ?? 'Unknown'),
            _buildInfoRow('Eye Color', person['eyeColor'] ?? 'Unknown'),
            _buildInfoRow('Hair Color', person['hairColor'] ?? 'Unknown'),
            _buildInfoRow(
                'Distinctive Marks', person['distinctiveMarks'] ?? 'None'),
            SizedBox(height: 20),
            Divider(),
            Text(
              'Last Seen Details',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('Last known location: ${person['lastLocation'] ?? 'Unknown'}'),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              height: 200,
              color: Colors.grey[300], // Placeholder for the map
              child: Center(child: Text('Map location')),
            ),
            Text(
                'Date of disappearance: ${person['missingDate'] ?? 'Unknown'}'),
            Text(
                'Time of disappearance: ${person['missingTime'] ?? 'Unknown'}'),
            SizedBox(height: 20),
            Divider(),
            Text(
              'Contact Information',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            _buildInfoRow('Guardian Name', person['guardianName'] ?? 'Unknown'),
            _buildInfoRow(
                'Guardian Phone', person['guardianPhone'] ?? 'Unknown'),
            _buildInfoRow('Responsible Police Station',
                person['policeStation'] ?? 'Unknown'),
            SizedBox(height: 20),
            Divider(),
            Text(
              'Additional Notes',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(person['additionalNotes'] ?? 'No additional notes'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Action for contacting the police
              },
              child: Text('Contact Police Station'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 12),
                minimumSize: Size(double.infinity, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(value),
        ],
      ),
    );
  }
}
