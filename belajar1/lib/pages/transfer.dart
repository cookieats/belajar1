
import 'package:belajar1/data/database.dart';
import 'package:belajar1/widget/TransferList.dart';
import 'package:belajar1/widget/dialog_box.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Transfer extends StatefulWidget {
  

  Transfer({Key? key}) : super(key: key);

  @override
  State<Transfer> createState() => _TransferState();
}


class _TransferState extends State<Transfer> {
  final _myBox = Hive.box('mybox');
  TransferDatabase db = TransferDatabase();

  @override
  void initState(){
    if (_myBox.get("TRANSFER") == null) {
      db.createInitialData();
    } else {
      // there already exists data
      db.loadData();
    }
    super.initState();
  }

  final _rekController = TextEditingController();
  final _hargaController = TextEditingController();


void simpanRiwayat(){
  setState(() {
    
    db.transfer.add([_rekController.text, _hargaController.text]);
    _rekController.clear();
    _hargaController.clear();
  });
  Navigator.of(context).pop();
  db.updateDataBase();
}
void newTransfer(){
   showDialog(context: context,
    builder: (context){
      return Dialog_box(
        rekController: _rekController,
        hargaController: _hargaController,
        onSimpan: simpanRiwayat,
        onCancel: () => Navigator.of(context).pop(),
      );
   }
   );
}
void deleteRiwayat(int index){
  setState(() {
    db.transfer.removeAt(index);
  });
  db.updateDataBase();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Transfer"),
        )
      ),
      body: ListView.builder(
        itemCount: db.transfer.length,
        itemBuilder: (context, index){
          return TransferList(
            namaBarang: db.transfer[index][0], 
            hargaBarang: db.transfer[index][1],
            deleteFunction: (context) => deleteRiwayat(index),
            );
        }
        
      ),
      floatingActionButton: FloatingActionButton(onPressed: newTransfer,
      child: Icon(Icons.add),),
    );
  }
}