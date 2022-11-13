

import 'package:belajar1/Model/list_user.dart';
import 'package:belajar1/service/list_user_service.dart';
import 'package:flutter/material.dart';

class Mutasi extends StatefulWidget {
  Mutasi({Key? key}) : super(key: key);

  @override
  State<Mutasi> createState() => _MutasiState();
}

class _MutasiState extends State<Mutasi> {
  List<ListUserModel> _listUser =[];

  getUsers() async {
    ListUsersService _service = ListUsersService();
    await _service.getDataUsers().then((value){
      setState(() {
        _listUser = value!;
      });
    });
  }
  @override
  void initState(){
    super.initState();
    getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        centerTitle: true,
        title: Text("Mutasi"),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: _listUser.length,
                  itemBuilder: (context, index){
                    ListUserModel data = _listUser[index];
                    return ListTile(
                      title: Text("${data.firstName!} ${data.lastName}"),
                      subtitle: Text(data.email!),
                      leading:  Image.network(data.avatar!),
                      onTap: () => print(data.firstName),
                    );
                    
                  } ,)
                 )
            ],
          ),
        ),
      ),
      
    );
  }
  Widget cardlist(
    String title, String subtitle, Color color, String nilai, Color bgColor) {
  return Card(
    color: bgColor,
    child: ListTile(
      title: Text(title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
      subtitle: Text(subtitle),
      trailing: Container(
        height: 50,
        width: 50,
        color: color,
        child: Center(
          child: Text(nilai,
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)),
        ),
      ),
    ),
  );
    }
}