// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:fresh_labs_final/homepage.dart';
import 'package:fresh_labs_final/login.dart';
import 'package:fresh_labs_final/register.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';


void main() async { 
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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