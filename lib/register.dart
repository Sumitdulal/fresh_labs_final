// ignore_for_file: camel_case_types, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class myRegister extends StatefulWidget {
  const myRegister({Key? key}) : super(key: key);

  @override
  State<myRegister> createState() => _myRegisterState();
}

class _myRegisterState extends State<myRegister> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController snameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _database = FirebaseDatabase.instance.ref();
  String dropdownValue = 'Customer';
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/4.png'), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.purple,
          elevation: 0,
        ),
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(left: 75, top: 10),
              child: Text(
                'Create Account',
                style: TextStyle(color: Colors.purple, fontSize: 33),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.15),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 35, right: 35),
                        child: Column(
                          children: [
                            TextField(
                              controller: nameController,
                              style: TextStyle(color: Colors.purple, fontWeight: FontWeight.bold),
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.purple,
                                      width: 2
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.purple,
                                    ),
                                  ),
                                  hintText: "Name",
                                  hintStyle: TextStyle(color: Color.fromARGB(255, 34, 32, 32), fontWeight: FontWeight.bold),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            TextField(
                              controller: emailController,
                              style: TextStyle(color: Colors.purple, fontWeight: FontWeight.bold),
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.purple,
                                      width: 2
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.purple,
                                      width: 2
                                    ),
                                  ),
                                  hintText: "Email",
                                  hintStyle: TextStyle(color: Color.fromARGB(255, 34, 32, 32), fontWeight: FontWeight.bold),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                              height: 65,
                              child: InputDecorator(
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: Colors.purple,
                                        width: 2
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: Colors.purple,
                                      ),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    )),
                                child: DropdownButton<String>(
                                  value: dropdownValue,
                                  isExpanded: true,
                                  icon: const Icon(Icons.arrow_drop_down),
                                  
                                  elevation: 0,
                                  underline: Container(
                                    height: 0,
                                  ),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      dropdownValue = newValue!;
                                    });
                                  },
                                  items: <String>['Customer', 'Stylist']
                                      .map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  style: TextStyle(color: Colors.purple,fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            TextField(
                              controller: snameController,
                              style: TextStyle(color: Colors.purple, fontWeight: FontWeight.bold),
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                     color: Colors.purple,
                                      width: 2
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.purple,
                                      width: 2
                                    ),
                                  ),
                                  hintText: "Saloon Name",
                                  hintStyle: TextStyle(color: Color.fromARGB(255, 34, 32, 32), fontWeight: FontWeight.bold),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            TextField(
                              controller: passwordController,
                              style: TextStyle(color: Colors.purple, fontWeight: FontWeight.bold),
                              obscureText: true,
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                     color: Colors.purple,
                                     width: 2
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                     color: Colors.purple,
                                     width: 2
                                    ),
                                  ),
                                  hintText: "Password",
                                  hintStyle: TextStyle(color: Color.fromARGB(255, 34, 32, 32), fontWeight: FontWeight.bold),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Sign Up',
                                  style: TextStyle(
                                      color: Colors.purple,
                                      fontSize: 27,
                                      fontWeight: FontWeight.w700),
                                ),
                                CircleAvatar(
                                  radius: 30,
                                  backgroundColor: Colors.purple,
                                  child: IconButton(
                                      color: Colors.white,
                                      onPressed: () async {
                                        if (_formKey.currentState!.validate()) {
                                          try{

                                          final credential =
                                              EmailAuthProvider.credential(
                                                  email: emailController.text
                                                      .toString()
                                                      .trim(),
                                                  password:
                                                      passwordController.text);
                                          final userDetailsRef = _database.child(
                                              '/userDetails/' +
                                                  FirebaseAuth.instance
                                                      .currentUser!.uid);
                                          UserCredential userCredential =
                                              await FirebaseAuth.instance
                                                  .createUserWithEmailAndPassword(
                                            email: emailController.text
                                                .toString()
                                                .trim(),
                                            password: passwordController.text,
                                          );
                                          if(dropdownValue.toString()=='Customer'){
                                           final newuser = <String,dynamic>{'name':nameController.text.toString(),'email':emailController.text.toString(),'usertype':dropdownValue.toString(),'password':passwordController.text.toString()};
                                          _database.child('Userinfo').child(FirebaseAuth.instance.currentUser!.uid).set(newuser);}
                                                       ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Signed up successfully!')),
                          
                        );
                        Navigator.pushNamed(context, 'login');
                                          }catch(e){
                                               ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Invalid inputs! Please enter valid ones')),
                        );
                                    }
                           
                                        }
                                        final newuser = <String,dynamic>{'name':nameController.text.toString(),'email':emailController.text.toString(),'saloon':snameController.text.toString(),'usertype':dropdownValue.toString(),'password':passwordController.text.toString()};
                                          _database.child('Userinfo').child(FirebaseAuth.instance.currentUser!.uid).set(newuser);
                                          
                                           
                          
                                          
                                      },

                                      icon: Icon(
                                        Icons.arrow_forward,
                                      )),

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
                                    
                                    Navigator.pushNamed(context, 'login');
                                  },
                                  // ignore: sort_child_properties_last
                                  child: Text(
                                    'Sign In',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        color: Colors.purple,
                                        fontSize: 18),
                                  ),
                                  style: ButtonStyle(),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
