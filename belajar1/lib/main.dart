import 'package:belajar1/pages/login.dart';
import 'package:belajar1/pages/transfer.dart';
import 'package:belajar1/pages/utama.dart';
import 'package:flutter/material.dart';

import 'package:hive_flutter/hive_flutter.dart';


void main() async {
  await Hive.initFlutter();


// open box
var box = await Hive.openBox('mybox');


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static final List<Widget> _pages = <Widget>[
    // Main Menu
    login(),
    Utama(),
    Transfer(),
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


