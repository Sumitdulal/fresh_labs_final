// ignore_for_file: prefer_const_constructors, camel_case_types

import 'package:flutter/material.dart';

class forgotPassword extends StatefulWidget {
  const forgotPassword({Key? key}) : super(key: key);

  @override
  State<forgotPassword> createState() => _forgotPasswordState();
}

class _forgotPasswordState extends State<forgotPassword> {
  @override
  Widget build(BuildContext context) {
     return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: 
        AssetImage ('assets/login.png'), fit: BoxFit.cover)
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(left: 50,top: 110),
              child: Text('Forgot\nPassword?',style: TextStyle(
                color: Colors.white,
                fontSize: 33,

                ),),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height*0.5,
                  right: 35,
                  left: 35
                  ),
                child: Column(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        fillColor: Colors.grey.shade100,
                        hintText: 'Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),

                        )
                      ),
                    ),

                    SizedBox(
                      height: 30,
                    ),
                   
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Reset now!',
                        style: TextStyle(
                          color:Color(0xff4c505b),
                          fontSize: 27,
                          fontWeight: FontWeight.w700
                        ),
                        ),
                        CircleAvatar(
                          
                          radius: 30,
                          backgroundColor: Color(0xff4c505b),
                          child: IconButton(
                            color: Colors.white,
                            onPressed: (){
                              Navigator.pushNamed(context, 'homepage');
                            },
                           icon: Icon(Icons.arrow_forward)),
                        )
                      ],
                    ),
                     SizedBox(
                      height: 40,
                    ),
                   
                  ]),
              ),
            )
          ],

        ),
      ),
    );
    
  }
}