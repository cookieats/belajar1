import 'package:flutter/material.dart';

class grid2 extends StatefulWidget {
  grid2({Key? key}) : super(key: key);

  @override
  State<grid2> createState() => _grid2State();
}

class _grid2State extends State<grid2> {
  @override
  Widget build(BuildContext context) {
    double lebar = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(actions: []),
        body: Container(
          child: GridView.count(
            padding: EdgeInsets.all(20),
            crossAxisCount: (lebar > 500)?3:2,
            mainAxisSpacing: 15,
            children: <Widget>[
              
              Container(
                padding: EdgeInsets.all(15),
                height: 100,
                width: 100,
                color: Colors.teal,
                child: gridtext ('1'),
              ),
              Container(
                padding: EdgeInsets.all(15),
                height: 100,
                width: 100,
                color: Colors.teal,
                child: gridtext ('2'),
              ),
              Container(
                padding: EdgeInsets.all(15),
                height: 100,
                width: 100,
                color: Colors.teal,
                child: gridtext ('3'),
              ),
              Container(
                padding: EdgeInsets.all(15),
                height: 100,
                width: 100,
                color: Colors.teal,
                child: gridtext ('4'),
              ),
              Container(
                padding: EdgeInsets.all(15),
                height: 100,
                width: 100,
                color: Colors.teal,
                child: gridtext ('5'),
              ),
              Container(
                padding: EdgeInsets.all(15),
                height: 100,
                width: 100,
                color: Colors.teal,
                child: gridtext ('6'),
              )
            ],
          ),
        )
// LayoutBuilder(
//         builder: (context, constraint) {
//           if(constraint.maxWidth >500){
//             return TampilanLebar();

//           }
//           else{
//             return TampilanNormal();
//           }
//         },
//       ),
//     );
//   }

// Widget TampilanLebar(){
//   return Center(
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceAround,
//       children: [
//         Container(
//           height: 100,
//           width: 100,
//           color: Colors.teal,
//         ),
//         Container(
//           height: 100,
//           width: 100,
//           color: Color.fromARGB(255, 10, 99, 90),
//         )
//       ],
//     ),
//   );
// }
// Widget TampilanNormal(){
//   return Center(
//     child: Column(
//       mainAxisAlignment: MainAxisAlignment.spaceAround,
//       children: [
//         Container(
//           height: 100,
//           width: 100,
//           color: Colors.teal,
//         ),
//         Container(
//           height: 100,
//           width: 100,
//           color: Color.fromARGB(255, 10, 99, 90),
//         )
//       ],
//     ),
        );
  }
Widget gridtext(String value){
  return Text(
    value,
    style: TextStyle(
      fontSize: 60,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    )
  );
}
}

