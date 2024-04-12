import 'package:clairvoyant_tubes/screens/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Login(),
      theme: ThemeData(useMaterial3: false),
      debugShowCheckedModeBanner: false,
    );
  }
}
