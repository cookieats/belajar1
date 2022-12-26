import 'package:belajar1/pages/grid.dart';
import 'package:belajar1/pages/grid2.dart';
import 'package:belajar1/pages/mutasi.dart';
import 'package:belajar1/pages/transfer.dart';
import 'package:flutter/material.dart';
import 'package:belajar1/widget/menu.dart';
import 'package:belajar1/pages/login.dart';
import 'package:belajar1/pages/qr_screen.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

// final usernameController = TextEditingController();
// final passwordController = TextEditingController();

class Utama extends StatefulWidget {
  String? name;
  Utama({Key? key, this.name}) : super(key: key);

  @override
  State<Utama> createState() => _UtamaState();
}

class _UtamaState extends State<Utama> {
  String _scanBarcode = '';

  @override
  Widget build(BuildContext context) {
Future<void> _launchUrl() async {
    final Uri _url = Uri.parse(_scanBarcode);
    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
    }
  }
     AlertDialog alert = AlertDialog(
        title: Text('URL'),
        content: Text(
            "site:"+_scanBarcode.toString(),
          ),
        actions: [
          TextButton(
            onPressed: () async {
            print(_scanBarcode);
                              _launchUrl();
                              },
              // onPressed: () {
              //   Navigator.of(context)
              //       .pop(); // dismiss dialog
              // },
              child: Text('visit link'))
        ],
    );

    Future<void> scanQR() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return alert;
                              },
                            );
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }

  



    return Scaffold(
      
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
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            margin: EdgeInsets.fromLTRB(10, 20, 10, 10),
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
                          Text("${widget.name}")
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
            child: Wrap(
              spacing: 27.0,
              runSpacing: 10.0,
              children: [
                Menu(icon: Icons.wallet, text: "Saldo", onTap: (){},),
                Menu(
                 icon: Icons.money,
                 text: "Transfer",
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                      builder: (context) => Transfer()
                      )
                    );
                                },),
                Menu(icon: Icons.savings, text: "Deposito", onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                      builder: (context) => grid(),
                      )
                    );
                },),
                Menu(icon: Icons.credit_card_outlined, text: "Payment", onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                      builder: (context) => grid2(),
                      )
                    );
                },),
                Menu(icon: Icons.monetization_on_outlined, text: "Pinjaman", onTap: (){},),
                Menu(icon: Icons.add_chart, text: "Mutasi", onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                      builder: (context) => Mutasi(),
                      )
                    );
                },),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
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
                      Text(
                        'Butuh Bantuan?',
                        style: TextStyle(fontWeight: FontWeight.normal),
                      ),
                      Text(
                        '0878-1234-1024',
                        style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                      )
                    ],
                  ),
                ),
                Container(
                  child: Icon(
                    Icons.phone,
                    size: 50,
                    color: Colors.green,
                  ),
                )
              ],
            ),
          ),
          // _scanBarcode == ''
          //           ? const Text(
          //               'Scan a code',
          //               style: TextStyle(fontSize: 20),
          //             )
          //           : Column(
          //               children: [
          //                 const SizedBox(
          //                   height: 20,
          //                 ),
          //                 Text(_scanBarcode,
          //                     style: const TextStyle(fontSize: 20)),
          //                 ElevatedButton(
          //                     onPressed: () async {
          //                       _launchUrl();
          //                     },
          //                     child: const Text("Visit link")),
          //               ],
          //             ),
          //       Text(
          //           _scanBarcode == ''
          //               ? 'Scan result'
          //               : 'Scan result' + _scanBarcode,
          //           style: TextStyle(fontSize: 20))
        ]),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
        BottomNavigationBarItem(
          label: 'setting',
          icon: Expanded(
              flex: 1,
              child: Icon(
            Icons.settings,
            size: 60,
            color: Colors.blueAccent,
          )),
        ),
        BottomNavigationBarItem(
          label: 'profil',
          icon: Expanded(
              flex: 1,
              child: Icon(
                Icons.person,
                size: 60,
                color: Colors.blueAccent,
              )),
        ),
      ],
      
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton.large(
        
        onPressed: () {
            scanQR();
          // Add your onPressed code here!
          print("halo");
          
        },

        backgroundColor: Color.fromARGB(255, 22, 6, 88),
        child: const Icon(
          Icons.qr_code_scanner_outlined,
          size: 60,
        ),
      ),
    );
  }
}


  
  
