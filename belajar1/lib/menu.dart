import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  final IconData icon;
  final String text;
  
  const Menu({Key? key, 
  required this.icon,
  required this.text}) 
  : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // color: Colors.grey,
        borderRadius: BorderRadius.circular(10)
      ),
      width: 90,
      // padding: EdgeInsets.all(7),
      // margin: EdgeInsets.all(10),
      child: InkWell(
        onTap: (){},
        child: Card(
          color: Color.fromARGB(255, 223, 220, 220),
          child: Column(
            children: [
              Icon(icon, color: Color.fromARGB(255, 4, 70, 211), size: 60,),
              Text(text),
            ],
          ),
        ),
      ),
      
    );
  }
}