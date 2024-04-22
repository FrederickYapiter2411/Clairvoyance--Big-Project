import 'package:clairvoyant_tubes/screens/login.dart';
import 'package:clairvoyant_tubes/screens/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => UserProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clairvoyant',
      home: Login(),
    );
  }
}
