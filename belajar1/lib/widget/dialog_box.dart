import 'package:belajar1/widget/button.dart';
import 'package:flutter/material.dart';

class Dialog_box extends StatelessWidget {
  final rekController;
  final hargaController;
  VoidCallback onSimpan;
  VoidCallback onCancel;

  Dialog_box({Key? key, 
  required this.rekController,
  required this.hargaController,
  required this.onSimpan,
  required this.onCancel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: rekController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "No Rekening"
              ),
            ),
            TextField(
              controller: hargaController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "jumlah Transaksi",
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Button(
                 text: "simpan",
                 onPressed: onSimpan),
                SizedBox(width: 10,),
                Button(
                  text: "cancel",
                 onPressed: onCancel)
              ],
            )
            

          ],
        ),
      ),
    );
  }
}