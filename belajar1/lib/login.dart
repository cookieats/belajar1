import 'package:belajar1/utama.dart';
import 'package:flutter/material.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
    final usernameController = TextEditingController();
    final passwordController = TextEditingController();
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
                        width: 200,
                        height: 200,
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
                      child: Text('Username'),
                    ),
                    SizedBox(
                      width: 350,
                      child: TextField(
                        controller: usernameController,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(20),
                          border: OutlineInputBorder(),
                          hintText: 'masukan username anda',
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.fromLTRB(30, 10, 0, 5),
                      child: Text('Password'),
                    ),
                    SizedBox(
                      
                      width: 350,
                      child: TextField(
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
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                          fixedSize: Size(200, 35),
                        ),
                        onPressed: () {
                          if(usernameController.text =="anik" && passwordController.text =="anik"){
                            Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Utama()
                            )
                            );
                          }
                          else{
                            AlertDialog alert = AlertDialog(
                              title: Text('warning'),
                              content: Text("maaf data yang anda masukan salah, silahkan masukan data yang benar"),
                              actions: [
                                TextButton(onPressed: (){
                                  Navigator.of(context).pop(); // dismiss dialog
                                  
                            
                                }, 
                                child: Text('ok'))
                              ],
                            );
                            showDialog(context: context,
                             builder: (BuildContext context){
                              return alert;
                             },);

                            // Text('maaf data yang anda masukan salah');
                          }
                        },
                          child: Text('login'),
                          )
                          
                      
                      ),
                        
                      
                    
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
            

      ),
      bottomNavigationBar: Container(
                height: 47,
                width: 500,
                color: Colors.grey,
                alignment: Alignment.center,
                child: Text('copyright @2022 by undiksha'),
      )
        
      );
      
  }
}