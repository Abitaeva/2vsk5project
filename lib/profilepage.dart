import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final String firstName;
  final String lastName;
  final String phoneNumber;

  ProfilePage({
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              '$firstName $lastName',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Phone Number:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              phoneNumber,
              style: TextStyle(fontSize: 16),
            ),
            // Добавьте другие поля профиля по аналогии
          ],
        ),
      ),
    );
  }
}
