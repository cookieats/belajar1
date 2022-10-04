import 'package:belajar1/utama.dart';
import 'package:flutter/material.dart';

class login extends StatelessWidget {
  const login({Key? key}) : super(key: key);

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
      body: Column(
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
                child: Column(children: [
                  Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.fromLTRB(30, 0, 0, 5),
                    child: Text('Username'),
                  ),
                  SizedBox(
                    width: 350,
                    child: TextField(
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                      builder: (context) => Utama(),
                        )
                        
                    
                    );
                      },
                      child: Text('login'),
                    ),
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
              height: 50,
            ),
             Container(
              height: 47,
              width: 500,
              color: Colors.grey,
              alignment: Alignment.center,
              child: Text('copyright @2022 by undiksha'),
             )
            ],
          )
    );
  }
}