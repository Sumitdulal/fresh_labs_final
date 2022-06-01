// // ignore_for_file: prefer_const_constructors

// import 'package:flutter/material.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:fresh_labs_final/appointments.dart';
// import 'package:fresh_labs_final/card.dart';
// import 'package:fresh_labs_final/viewServices.dart';

// class myedit extends StatefulWidget {
//   const myedit({Key? key}) : super(key: key);

//   @override
//   State<myedit> createState() => _myeditState();
// }

// class _myeditState extends State<myedit> {
//   final TextEditingController serviceController = TextEditingController();
//   final TextEditingController timeController = TextEditingController();
//   final TextEditingController amountController = TextEditingController();
//   final TextEditingController stylistController = TextEditingController();
//   final TextEditingController saloonController = TextEditingController();
//   final _formKey = GlobalKey<FormState>();
//   final _database = FirebaseDatabase.instance.ref();
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//           image: DecorationImage(
//               image: AssetImage('assets/4.png'), fit: BoxFit.cover)),
//       child: Scaffold(
//         backgroundColor: Colors.transparent,
//         appBar: AppBar(
//           backgroundColor: Colors.purple,
//           elevation: 0,
//         ),
//         body: Stack(
//           children: [
//             Container(
//               padding: EdgeInsets.only(left: 95, top: 10),
//               child: Text(
//                 'Edit',
//                 style: TextStyle(color: Colors.purple, fontSize: 33),
//               ),
//             ),
//             SingleChildScrollView(
//               child: Container(
//                 padding: EdgeInsets.only(
//                     top: MediaQuery.of(context).size.height * 0.15),
//                 child: Form(
//                   key: _formKey,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Container(
//                         margin: EdgeInsets.only(left: 35, right: 35),
//                         child: Column(
//                           children: [
//                             TextField(
//                               controller: stylistController,
//                               style: TextStyle(color: Colors.purple),
//                               decoration: InputDecoration(
//                                   enabledBorder: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(10),
//                                     borderSide: BorderSide(
//                                         color: Colors.purple, width: 2),
//                                   ),
//                                   focusedBorder: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(10),
//                                     borderSide: BorderSide(
//                                       color: Colors.black,
//                                     ),
//                                   ),
//                                   hintText: "Stylist name",
//                                   hintStyle: TextStyle(
//                                       color: Colors.black,
//                                       fontWeight: FontWeight.bold),
//                                   border: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(10),
//                                   )),
//                             ),
//                             SizedBox(
//                               height: 30,
//                             ),
//                             TextField(
//                               controller: saloonController,
//                               style: TextStyle(color: Colors.purple),
//                               decoration: InputDecoration(
//                                   enabledBorder: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(10),
//                                     borderSide: BorderSide(
//                                         color: Colors.purple, width: 2),
//                                   ),
//                                   focusedBorder: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(10),
//                                     borderSide: BorderSide(
//                                       color: Colors.black,
//                                     ),
//                                   ),
//                                   hintText: "Saloon name",
//                                   hintStyle: TextStyle(
//                                       color: Colors.black,
//                                       fontWeight: FontWeight.bold),
//                                   border: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(10),
//                                   )),
//                             ),
//                             SizedBox(
//                               height: 30,
//                             ),
//                             TextField(
//                               controller: serviceController,
//                               style: TextStyle(color: Colors.purple),
//                               decoration: InputDecoration(
//                                   enabledBorder: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(10),
//                                     borderSide: BorderSide(
//                                         color: Colors.purple, width: 2),
//                                   ),
//                                   focusedBorder: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(10),
//                                     borderSide: BorderSide(
//                                       color: Colors.black,
//                                     ),
//                                   ),
//                                   hintText: "Service",
//                                   hintStyle: TextStyle(
//                                       color: Colors.black,
//                                       fontWeight: FontWeight.bold),
//                                   border: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(10),
//                                   )),
//                             ),
//                             SizedBox(
//                               height: 30,
//                             ),
//                             TextField(
//                               controller: timeController,
//                               style: TextStyle(color: Colors.purple),
//                               decoration: InputDecoration(
//                                   enabledBorder: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(10),
//                                     borderSide: BorderSide(
//                                         color: Colors.purple, width: 2),
//                                   ),
//                                   focusedBorder: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(10),
//                                     borderSide: BorderSide(
//                                       color: Colors.black,
//                                     ),
//                                   ),
//                                   hintText: "Estimated time",
//                                   hintStyle: TextStyle(
//                                       color: Colors.black,
//                                       fontWeight: FontWeight.bold),
//                                   border: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(10),
//                                   )),
//                             ),
//                             SizedBox(
//                               height: 30,
//                             ),
//                             TextField(
//                               controller: amountController,
//                               style: TextStyle(color: Colors.purple),
//                               decoration: InputDecoration(
//                                   enabledBorder: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(10),
//                                     borderSide: BorderSide(
//                                         color: Colors.purple, width: 2),
//                                   ),
//                                   focusedBorder: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(10),
//                                     borderSide: BorderSide(
//                                       color: Colors.black,
//                                     ),
//                                   ),
//                                   hintText: "Amount",
//                                   hintStyle: TextStyle(
//                                       color: Colors.black,
//                                       fontWeight: FontWeight.bold),
//                                   border: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(10),
//                                   )),
//                             ),
//                             SizedBox(
//                               height: 20,
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text(
//                                   'Edit Service',
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 27,
//                                       fontWeight: FontWeight.w700),
//                                 ),
//                                 CircleAvatar(
//                                   radius: 30,
//                                   backgroundColor: Colors.purple,
//                                   child: IconButton(
//                                       color: Colors.white,
//                                       onPressed: () async {
//                                         final newService = <String, dynamic>{
//                                           'stylist':
//                                               stylistController.text.toString(),
//                                           'saloon':
//                                               saloonController.text.toString(),
//                                           'service':
//                                               serviceController.text.toString(),
//                                           'time':
//                                               timeController.text.toString(),
//                                           'amount':
//                                               amountController.text.toString()
//                                         };
//                                         _database
//                                             .child('service')
//                                             .child(FirebaseAuth
//                                                 .instance.currentUser!.uid)
//                                             .push()
//                                             .set(newService);
//                                       },
//                                       icon: Icon(
//                                         Icons.arrow_forward,
//                                       )),
//                                 )
//                               ],
//                             ),
                            
//                           ],
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
