// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:fresh_labs_final/homepage.dart';
import 'package:fresh_labs_final/login.dart';
import 'package:fresh_labs_final/register.dart';



void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'login',
    routes: {
      'login':(context) => myLogin(),
      'register':(context) => myRegister(),
      'homepage':(context) => myhome()
    },
  ));
  
}