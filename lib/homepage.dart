// ignore_for_file: camel_case_types, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:fresh_labs_final/screens/home_screen.dart';

void main() => runApp(myhome());

class myhome extends StatelessWidget {
  const myhome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
    
  }
}