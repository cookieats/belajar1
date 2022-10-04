import 'package:flutter/material.dart';


class Utama extends StatelessWidget {
  const Utama({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 2, 14, 147),
          title: Center(
            child: const Text("Koperasi Undiksha"),
          ),
          actions: [
            Container(
              child: Icon(Icons.logout),
              padding: EdgeInsets.all(10),
            )
          ],
        ),
        body: Column(children: [
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Container(
                    height: 100,
                    width: 100,
                    child: Image.asset(
                      'Assets/img/saya.jpeg',
                      width: 100,
                      height: 100,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Container(
                    child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 200,
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 194, 215, 233),
                        // border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Column(
                        children: [
                          Text(
                            'Nasabah',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text('Ni Wayan Anik Puspita Sari')
                        ],
                      ),
                    ),
                    Container(
                      width: 200,
                      margin: EdgeInsets.all(5),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 194, 215, 233),

                        // border: Border.all(color: Colors.black,),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Column(
                        children: [
                          Text(
                            'Saldo',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text('Rp.1.000.000,00')
                        ],
                      ),
                    )
                  ],
                ))
              ],
            ),
          ),
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
            child: Column(
              children: [
                Table(
                  children: [
                    TableRow(children: [
                      Container(
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 192, 220, 242),
                        ),
                        width: 90,
                        child: Column(
                          children: [Icon(Icons.wallet), Text('Saldo')],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 192, 220, 242),
                        ),
                        width: 90,
                        child: Column(
                          children: [Icon(Icons.money), Text('Transfer')],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 192, 220, 242),
                        ),
                        width: 90,
                        child: Column(
                          children: [Icon(Icons.savings), Text('Deposito')],
                        ),
                      ),
                    ]),
                    TableRow(children: [
                      Container(
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 192, 220, 242),
                        ),
                        width: 90,
                        child: Column(
                          children: [
                            Icon(Icons.credit_card_outlined),
                            Text('payment')
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 192, 220, 242),
                        ),
                        width: 90,
                        child: Column(
                          children: [
                            Icon(Icons.monetization_on_outlined),
                            Text('pinjaman')
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 192, 220, 242),
                        ),
                        width: 90,
                        child: Column(
                          children: [
                            Icon(Icons.add_chart_outlined),
                            Text('Mutasi')
                          ],
                        ),
                      ),
                    ])
                  ],
                ),
              ],
            ),
          ),
          Container(
            // margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 209, 212, 215),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [  
                     Text('Butuh Bantuan?', style: TextStyle(fontWeight: FontWeight.normal), ),
                      Text('0878-1234-1024',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),)
                    ],
                  ),
                ),
                Container(
                  child: Icon(Icons.phone, size: 50, color: Colors.green,),
                )
              ],
              
            ),
          ),
          SizedBox(
            height: 135,
          ),
   
      
    BottomAppBar(
      
      color: Colors.indigo[200],
      shape: const CircularNotchedRectangle(),
      child: Container(
        alignment: Alignment.center,
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
            margin: EdgeInsets.all(10),
            alignment: Alignment.topLeft,
             child: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/setting');
              },
              icon: const Icon(Icons.settings, size: 50, color: Colors.blue,),
              
            ),
            ),
            Container(
            margin: EdgeInsets.all(10),
            child:IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/profil');
              },
              icon: const Icon(Icons.person,size: 50, color: Colors.blue),
            ),  
            
            )
            
          ],
        ),
      ),
    )
        
          
        ]),
    floatingActionButton: FloatingActionButton(
      
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        onPressed: () {
          // Add your onPressed code here!
        },
        backgroundColor: Color.fromARGB(255, 22, 6, 88),
        child: const Icon(Icons.qr_code_scanner_outlined),
        
        ));
  }
}
