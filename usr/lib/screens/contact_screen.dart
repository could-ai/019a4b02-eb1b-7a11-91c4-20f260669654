import 'package:flutter/material.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('تواصل معنا'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: const [
            Card(
              child: ListTile(
                leading: Icon(Icons.phone),
                title: Text('رقم الهاتف'),
                subtitle: Text('+1234567890'),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.email),
                title: Text('البريد الإلكتروني'),
                subtitle: Text('contact@example.com'),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.web),
                title: Text('الموقع الإلكتروني'),
                subtitle: Text('www.example.com'),
              ),
            ),
             Card(
              child: ListTile(
                leading: Icon(Icons.location_on),
                title: Text('العنوان'),
                subtitle: Text('123 Main Street, City, Country'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
