import 'package:belajar1/pages/grid.dart';
import 'package:belajar1/pages/login.dart';
import 'package:belajar1/pages/qr_screen.dart';
import 'package:belajar1/pages/transfer.dart';
import 'package:belajar1/pages/utama.dart';

import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

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
    Login(),
    Utama(),
    Transfer(),
    QrScanner(),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, widget) => ResponsiveWrapper.builder(
        ClampingScrollWrapper.builder(context, widget!),
        breakpoints: const[
          ResponsiveBreakpoint.resize(300, name: MOBILE),
          ResponsiveBreakpoint.autoScale(600, name: TABLET),
          ResponsiveBreakpoint.resize(700, name: DESKTOP),
          ResponsiveBreakpoint.autoScale(1500, name: 'XL'),
        ]),
      debugShowCheckedModeBanner: false,
       title: 'Bank Undiksha',
      theme: ThemeData.light(),
      home: Utama(),
    );
  }
}


