
import 'package:belajar1/Model/list_user.dart';
import 'package:flutter/material.dart';

import '../service/list_user_service.dart';

class Transfer extends StatefulWidget {
  Transfer({Key? key}) : super(key: key);

  @override
  State<Transfer> createState() => _TransferState();
}

class _TransferState extends State<Transfer> {
  List<ListUserModel> _listUser = [];

  getUser()async{
    ListUsersService _service = ListUsersService();
    await _service.getDataUsers().then((value) {
      setState(() {
        _listUser = value!;
      });
    });
    
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUser();
  }
  @override
  Widget build(BuildContext context) {
    // print(_listUser);
    return Scaffold(
      appBar: AppBar(
        title: const Text('List User'),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: _listUser.length,
          itemBuilder: (context, index) {
            ListUserModel data = _listUser[index];
            print(data.nama);
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://reqres.in/img/faces/${data.user_id!}-image.jpg'),
              ),
              title: Text(data.nama!),
              subtitle: Text(data.username!),
              trailing: Text(data.user_id!.toString()),
              onTap: () {
                Navigator.pushNamed(context, '/transfer',
                    arguments: data.user_id);
              },
            );
          },
        ),
      ),

    );
  }
}