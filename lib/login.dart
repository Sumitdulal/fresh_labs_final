// ignore_for_file: camel_case_types, prefer_const_constructors

import 'package:flutter/material.dart';

class myLogin extends StatefulWidget {
  const myLogin({Key? key}) : super(key: key);

  @override
  State<myLogin> createState() => _myLoginState();
}

class _myLoginState extends State<myLogin> {
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
              child: Text('Welcome\nBack',style: TextStyle(
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
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
              
                        fillColor: Colors.grey.shade100,
                        hintText: 'Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),

                        )
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Sign in',
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(onPressed: (){
                          Navigator.pushNamed(context, 'register');
                          
                        }, 
                        child: Text('Sign Up',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 18,
                          color: Color(0xff4c505b)
                        ),
                        )
                        ),

                        TextButton(onPressed: (){}, 
                        child: Text('Forgot Password',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 18,
                          color: Color(0xff4c505b)
                        ),
                        )
                        )
                      ],
                      
                    )
                  ]),
              ),
            )
          ],

        ),
      ),
    );
  }
}