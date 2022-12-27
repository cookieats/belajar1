
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_framework/responsive_value.dart';

import '../service/list_user_service.dart';
import '../model/list_user.dart';

class Penarikan extends StatefulWidget {
  Penarikan({Key? key}) : super(key: key);

  @override
  State<Penarikan> createState() => _PenarikanState();
}

class _PenarikanState extends State<Penarikan> {
  final _formKey = GlobalKey<FormState>();

  final nominal = TextEditingController();

  final _service = ListUsersService();
  @override
  Widget build(BuildContext context) {
    var userId = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Penarikan Dana'),
      ),
      body: Center(
        child: Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        offset: const Offset(
                          0.0,
                          0.0,
                        ),
                        blurRadius: 1.0,
                        spreadRadius: 1.0,
                      ), //BoxShadow
                      BoxShadow(
                        color: Colors.white,
                        offset: const Offset(0.0, 0.0),
                        blurRadius: 0.0,
                        spreadRadius: 0.0,
                      )
                    ]),
                child: Column(children: [
                  Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.fromLTRB(30, 0, 0, 5),
                      child: Text(
                        'jumlah penarikan',
                        style: TextStyle(
                            fontSize: ResponsiveValue(context,
                                defaultValue: 15.0,
                                valueWhen: [
                                 const Condition.smallerThan(
                                      name: MOBILE, value: 10.0),
                                 const Condition.largerThan(
                                      name: TABLET, value: 20.0)
                                ]).value,
                            fontWeight: FontWeight.bold),
                      )),
                  SizedBox(
                    width: ResponsiveValue(context,
                        defaultValue: 350.0,
                        valueWhen: const [
                          Condition.largerThan(name: TABLET, value: 700.0),
                          Condition.largerThan(name: DESKTOP, value: 1000.0)
                        ]).value,
                    child: TextField(
                      controller: nominal,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(20),
                        border: OutlineInputBorder(),
                        hintText: 'Rp. 10.000',
                      ),
                    ),
                  
                  ),
                  SizedBox(height: 25.0,),
                  ElevatedButton(
                    key: _formKey,
                        child: Text('Tarik'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                          fixedSize: Size(200, 35),
                        ),
                        onPressed: () async {
                           var data = await _service.setTarik(userId, nominal.text);
              print(data);
              if (data['status'] == 'success') {
                print(data);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Penarikan Berhasil'),
                  ),
                );
              } else {
                print(data);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Penarikan Gagal'),
                  ),
                );
              }
            },
                        
                  )

  ]),
      ))
    );
  }
}