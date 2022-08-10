import 'package:cleaner_contact/screens/home.screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Cleaner Contact',
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
