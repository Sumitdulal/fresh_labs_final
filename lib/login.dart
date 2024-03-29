// ignore_for_file: camel_case_types, prefer_const_constructors, unused_import

import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fresh_labs_final/homepage.dart';
import 'package:fresh_labs_final/auth.dart';
import 'package:fresh_labs_final/stylist.dart';
import 'package:provider/provider.dart';

class myLogin extends StatefulWidget {
  const myLogin({Key? key}) : super(key: key);

  @override
  State<myLogin> createState() => _myLoginState();
}

class _myLoginState extends State<myLogin> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _database = FirebaseDatabase.instance.ref();
  final _formKey = GlobalKey<FormState>();
  late StreamSubscription _userTypeStream;
  int flag = 0;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    // checkInternet();
    _selectUsetType();
  }

  _selectUsetType() {
    _userTypeStream = _database
        .child(
            'userDetails/' + (FirebaseAuth.instance.currentUser?.uid.toString()??''))
        .child('usertype')
        .onValue
        .listen((event) {
      String uType = event.snapshot.value.toString();
      if (uType == 'Customer') {
        setState(() {
          flag = 11;
        });
      } else if (uType == 'Stylist') {
        setState(() {
          flag = 22;
        });
      }

      _userTypeStream.cancel();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/5.png'), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(left: 50, top: 60),
              child: Text(
                'Welcome Back',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 33,
                ),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.5,
                    right: 35,
                    left: 35),
                child: Form(
                  key: _formKey,
                  child: Column(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        TextField(
                          controller: emailController,
                          style: TextStyle(
                              color: Colors.purple,
                              fontWeight: FontWeight.bold),
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    BorderSide(color: Colors.purple, width: 2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    BorderSide(color: Colors.purple, width: 2),
                              ),
                              fillColor: Colors.grey.shade100,
                              hintText: 'Email',
                              hintStyle: TextStyle(
                                  color: Color.fromARGB(255, 34, 32, 32),
                                  fontWeight: FontWeight.bold),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    BorderSide(color: Colors.purple, width: 2),
                              )),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        TextField(
                          controller: passwordController,
                          style: TextStyle(
                              color: Colors.purple,
                              fontWeight: FontWeight.bold),
                          obscureText: true,
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    BorderSide(color: Colors.purple, width: 2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    BorderSide(color: Colors.purple, width: 2),
                              ),
                              fillColor: Colors.grey.shade100,
                              hintText: 'Password',
                              hintStyle: TextStyle(
                                  color: Color.fromARGB(255, 34, 32, 32),
                                  fontWeight: FontWeight.bold),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    BorderSide(color: Colors.purple, width: 2),
                              )),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Sign in',
                              style: TextStyle(
                                  color: Color(0xff4c505b),
                                  fontSize: 27,
                                  fontWeight: FontWeight.w700),
                            ),
                            CircleAvatar(
                              radius: 25,
                              backgroundColor: Colors.purple,
                              child: IconButton(
                                color: Colors.white,
                                onPressed: () async {
                                  final FirebaseAuth _firebaseAuth =
                                      FirebaseAuth.instance;
                                  if (_formKey.currentState!.validate()) {
                                    try{
                                      await _firebaseAuth
                                        .signInWithEmailAndPassword(
                                            email: emailController.text,
                                            password: passwordController.text)
                                        .then((value) {
                                      _userTypeStream = _database
                                          .child('Userinfo/' +
                                              FirebaseAuth
                                                  .instance.currentUser!.uid
                                                  .toString())
                                          .child('usertype')
                                          .onValue
                                          .listen((event) {
                                        String uType =
                                            event.snapshot.value.toString();
                                        if (uType == 'Customer') {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => myhome()),
                                          );
                                        } else if (uType == 'Stylist') {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    stylish_ui()),
                                          );
                                        }

                                        _userTypeStream.cancel();
                                      });
                                    });
                                    } catch(e){
                                               ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Invalid credentials! Please enter correct one')),
                        );
                                    }
                                    
                                    ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Logged in...')),
                        );
                                  }
                                },
                                icon: Icon(
                                  Icons.arrow_forward,
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, 'register');
                                },
                                child: Text(
                                  'Sign Up',
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      fontSize: 18,
                                      color: Color(0xff4c505b)),
                                )),
                            TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, 'forgot_password');
                                },
                                child: Text(
                                  'Try Filters',
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      fontSize: 18,
                                      color: Color(0xff4c505b)),
                                ))
                          ],
                        )
                      ]),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
