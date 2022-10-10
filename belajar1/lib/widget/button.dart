import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  VoidCallback onPressed;
  Button({Key? key, required this.text, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(onPressed: onPressed,
    color: Color.fromARGB(255, 216, 214, 214),
    child: Text(text),);
  }
}