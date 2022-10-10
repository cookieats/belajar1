import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TransferList extends StatelessWidget {
  final String namaBarang;
  final String hargaBarang;
  Function(BuildContext)? deleteFunction;
  TransferList(
      {Key? key, 
      required this.namaBarang,
      required this.hargaBarang,
      required this.deleteFunction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 25.0, left: 25.0, right: 25.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children:[
            SlidableAction(onPressed: deleteFunction,
            icon: Icons.delete, backgroundColor: Colors.red,
            borderRadius: BorderRadius.circular(12))
          ]
        ),
        child: Container(
          // height: 70,
          padding: EdgeInsets.all(24),
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 210, 230, 250),
              borderRadius: BorderRadius.circular(8)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(Icons.check_circle_outline, color: Colors.green,),
              Text(namaBarang),
              Text(hargaBarang)],
          ),
        ),
      ),
    );
  }
}
