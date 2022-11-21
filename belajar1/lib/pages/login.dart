import 'package:belajar1/pages/utama.dart';
import 'package:belajar1/routes/route_list.dart';
import 'package:belajar1/routes/route.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_framework/responsive_value.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../service/list_user_service.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  // bool isLogin = false;
  // String? name ;
  // String? password ;
  @override
  void saveLogin() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("username", usernameController.text);
    pref.setString("password", passwordController.text);

    String? namaUser = pref.getString("username");
    String? pass = pref.getString("password");
    if (usernameController.text == " " && passwordController.text == "") {
      return print("anda tidak bisa masuk");
    } else {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Utama(name: namaUser)
              
            ),
          );
    }

    // setState(() {
    //   name = usernameController.text;
    //   password = passwordController.text;
    // });
  }
  // Future<String?> getNama() async{
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   return pref.getString("username");
  // }

  // void initState(){
  //   super.initState();
  //   autoLogIn();

  // void autoLogIn() async{
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   final String? userId = prefs.getString('username');

  //   if (userId != null){
  //     setState(() {
  //       isLogin = true;
  //       name = userId;
  //     });
  //     return;
  //   }

  // Future<Null> logout() async{
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setString('username', "");

  //   setState(() {
  //     name = '';
  //     isLogin = false;
  //   });

  // }
  // Future<Null> loginUser() async{
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setString('username', usernameController.text);
  //   prefs.setString('password', passwordController.text);

  //   setState(() {
  //     name = usernameController.text;
  //     password = passwordController.text;
  //     isLogin = true;
  //   });
  //   usernameController.clear();
  //   passwordController.clear();
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 2, 14, 147),
          title: Center(
            child: const Text("Koperasi Undiksha"),
          ),
          // actions: [
          //   Container(
          //     child: Icon(Icons.logout),
          //     padding: EdgeInsets.all(10),
          //   )
          // ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  padding: EdgeInsets.all(25),
                  child: Center(
                    child: Image.asset(
                      'Assets/img/logo1.jpg',
                      width: ResponsiveValue(context,
                          defaultValue: 200.0,
                          valueWhen: const [
                            Condition.largerThan(name: TABLET, value: 350.0),
                            Condition.smallerThan(name: TABLET, value: 200.0)
                          ]).value,
                      height: ResponsiveValue(context,
                          defaultValue: 200.0,
                          valueWhen: const [
                            Condition.largerThan(name: TABLET, value: 350.0),
                            Condition.smallerThan(name: TABLET, value: 200.0)
                          ]).value,
                      fit: BoxFit.contain,
                    ),
                  )),
              Container(
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
                        'Username',
                        style: TextStyle(
                            fontSize: ResponsiveValue(context,
                                defaultValue: 15.0,
                                valueWhen: [
                                  Condition.smallerThan(
                                      name: MOBILE, value: 10.0),
                                  Condition.largerThan(
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
                      controller: usernameController,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(20),
                        border: OutlineInputBorder(),
                        hintText: 'masukan username anda',
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.fromLTRB(30, 10, 0, 5),
                    child: Text(
                      'Password',
                      style: TextStyle(
                          fontSize: ResponsiveValue(context,
                              defaultValue: 15.0,
                              valueWhen: [
                                Condition.smallerThan(
                                    name: MOBILE, value: 10.0),
                                Condition.largerThan(name: TABLET, value: 20.0)
                              ]).value,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    width: ResponsiveValue(context,
                        defaultValue: 350.0,
                        valueWhen: const [
                          Condition.largerThan(name: TABLET, value: 700.0),
                          Condition.largerThan(name: DESKTOP, value: 1000.0)
                        ]).value,
                    child: TextField(
                      obscureText: true,
                      controller: passwordController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(20),
                        border: OutlineInputBorder(),
                        hintText: 'masukan password anda',
                      ),
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.fromLTRB(0, 15, 0, 30),
                      child: ElevatedButton(
                        child: Text('login'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                          fixedSize: Size(200, 35),
                        ),
                        onPressed: () {
                          saveLogin();
                          // print(usernameController.text);
                          // print(passwordController.text);
                          // postLogin(
                          //     usernameController.text, passwordController.text);
                          
                          
                          // if (usernameController.text == "anik" &&
                          //     passwordController.text == "anik") {
                          // Navigator.of(context).push(
                          //   MaterialPageRoute(
                          //     builder: (context) => const Utama(),
                          //   ),
                          // );
                          // } else {
                          //   AlertDialog alert = AlertDialog(
                          //     title: Text('warning'),
                          //     content: Text(
                          //         "maaf data yang anda masukan salah, silahkan masukan data yang benar"),
                          //     actions: [
                          //       TextButton(
                          //           onPressed: () {
                          //             Navigator.of(context)
                          //                 .pop(); // dismiss dialog
                          //           },
                          //           child: Text('ok'))
                          //     ],
                          //   );
                          //   showDialog(
                          //     context: context,
                          //     builder: (BuildContext context) {
                          //       return alert;
                          //     },
                          //   );

                          // Text('maaf data yang anda masukan salah');
                          //   }
                          }
                        
                      )),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton(
                            onPressed: () {}, child: Text('Datar Mbanking')),
                        TextButton(
                            onPressed: () {}, child: Text('lupa password?')),
                      ],
                    ),
                  )
                ]),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        )
        // bottomNavigationBar: Container(
        //   height: 47,
        //   width: 500,
        //   color: Colors.grey,
        //   alignment: Alignment.center,
        //   child: Text('copyright @2022 by undiksha'),
        // )
        );
  }
}

 

// postLogin(String username, String password) async {
//   ListUsersService _service = ListUsersService();
//   await _service.postLogin(username, password);
// }
