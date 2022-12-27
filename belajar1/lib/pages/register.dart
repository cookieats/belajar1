
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_framework/responsive_value.dart';
import 'package:belajar1/pages/utama.dart';

import '../Model/list_user.dart';
import '../service/list_user_service.dart';

class Register extends StatefulWidget {
  Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordConfirmController = TextEditingController();

  final _services = ListUsersService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Register Page'),
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
                          defaultValue: 100.0,
                          valueWhen: const [
                            Condition.largerThan(name: TABLET, value: 200.0),
                            Condition.smallerThan(name: TABLET, value: 100.0)
                          ]).value,
                      height: ResponsiveValue(context,
                          defaultValue: 100.0,
                          valueWhen: const [
                            Condition.largerThan(name: TABLET, value: 200.0),
                            Condition.smallerThan(name: TABLET, value: 100.0)
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
                  
                  TextFormField(
                     controller: _usernameController,
                     decoration: InputDecoration(
                      labelText: 'username',
                      border: OutlineInputBorder(gapPadding: 2.0),
                      hintText: 'masukan nama anda'
                     ),
                  
                     ),
                     const SizedBox(height: 15.0,),
                     TextFormField(
                     controller: _emailController,
                     decoration: InputDecoration(
                      labelText: 'email',
                      border: OutlineInputBorder(gapPadding: 2.0),
                      hintText: 'masukan email aktif'
                     ),
                     ),
                     const SizedBox(height: 15.0,),
                     TextFormField(
                     controller: _passwordController,
                     decoration: InputDecoration(
                      labelText: 'password',
                      border: OutlineInputBorder(gapPadding: 2.0),
                      hintText: 'masukan password'
                     ),
                     obscureText: true,
                     ),
                     const SizedBox(height: 15.0,),
                     TextFormField(
                     controller: _passwordConfirmController,
                     decoration: InputDecoration(
                      labelText: 'confirm password',
                      border: OutlineInputBorder(gapPadding: 2.0),
                      hintText: 'masukan kembali password'
                     ),
                     obscureText: true,
                     ),
                     ElevatedButton(
                      onPressed: (){
                        Future<ListUserModel?> result = _services.registerUsers(
                        email: _emailController.text,
                        name: _usernameController.text,
                        password: _passwordController.text,
                      );

                      result.then((value) {
                        if (value != null) {
                          
                          Navigator.pushNamedAndRemoveUntil(
                              context, '/utama', (route) => false,
                    
                              arguments: value);
                        } else {
                          
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Terjadi Kesalahan'),
                            ),
                          );
                        }
                      });
                      },
                      child: const SizedBox(

                        width: 100,
                        child: Text('Daftar', textAlign: TextAlign.center,),
                      ))



                      
              
              
              ]),

          )]
      )),
      bottomNavigationBar: Container(
         height: 47,
          width: 500,
          color: Colors.grey,
          alignment: Alignment.center,
          child: Text('copyright @2022 by Cookieats'),
      ) ,
      );
  }
}