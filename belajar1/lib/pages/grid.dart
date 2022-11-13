
import 'package:flutter/material.dart';

class grid extends StatefulWidget {
  grid({Key? key}) : super(key: key);

  @override
  State<grid> createState() => _gridState();
}

class _gridState extends State<grid> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: []),
      body: LayoutBuilder(
        builder: (context, constraint) {
          if(constraint.maxWidth >500){
            return TampilanLebar();

          }
          else{
            return TampilanNormal();
          }
        },
      ),
    );
  }

Widget TampilanLebar(){
  return Center(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          height: 100,
          width: 100,
          color: Colors.teal,
        ),
        Container(
          height: 100,
          width: 100,
          color: Color.fromARGB(255, 10, 99, 90),
        )
      ],
    ),
  );
}
Widget TampilanNormal(){
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          height: 100,
          width: 100,
          color: Colors.teal,
        ),
        Container(
          height: 100,
          width: 100,
          color: Color.fromARGB(255, 10, 99, 90),
        )
      ],
    ),
  );
}

}