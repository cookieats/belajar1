import 'package:belajar1/login.dart';
import 'package:belajar1/utama.dart';
import 'package:flutter/material.dart';
import 'package:footer/footer.dart';
import 'package:footer/footer_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static final List<Widget> _pages = <Widget>[
    // Main Menu
    login(),
    Utama(),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
       title: 'DRAP',
      theme: ThemeData.light(),
      home: login(),
    );
  }
}


