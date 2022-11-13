import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class NoRouteScreen extends StatefulWidget {
  const NoRouteScreen({Key? key}) : super(key: key);

  @override
  State<NoRouteScreen> createState() => _NoRouteScreenState();
}

class _NoRouteScreenState extends State<NoRouteScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: const Text("OOPS!, laman tidak ditemukan")),
    );
  }
}