import 'package:flutter/material.dart';
import 'package:tugas_week4_form_input_button/contacts_home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const ContactsHome(),
    );
  }
}
