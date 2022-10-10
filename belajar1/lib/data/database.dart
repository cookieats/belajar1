import 'package:hive_flutter/hive_flutter.dart';

class TransferDatabase {
  List transfer = [];

  // reference our box
  final _myBox = Hive.box('mybox');

  // run this method if this is the 1st time ever opening this app
 void createInitialData() {
    transfer = [
      ["2015051014", "100.000"],
      
    ];
  }

  // load the data from database
  void loadData() {
    transfer = _myBox.get("TRANSFER");
  }

  // update the database
  void updateDataBase() {
    _myBox.put("TRANSFER", transfer);
  }
}