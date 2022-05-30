// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_typing_uninitialized_variables, prefer_const_constructors_in_immutables, unused_import

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fresh_labs_final/screens/detail_screen.dart';
import 'package:fresh_labs_final/auth.dart';
import 'package:fresh_labs_final/screens/stylish_card.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  final _database = FirebaseDatabase.instance.ref();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff4E295B),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(50),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 50,
                        ),
                        Text(
                          'Hair Stylist',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                        StreamBuilder(
                            stream: _database.child('Userinfo').onValue,
                            builder: (context, snapshot) {
                              final clientCards = <StylistCard>[];
                              if (snapshot.hasData) {
                                final allstylish = Map<dynamic, dynamic>.from(
                                    ((snapshot.data! as DatabaseEvent)
                                            .snapshot
                                            .value ??
                                        {}) as Map<dynamic, dynamic>);
                                allstylish.forEach((key, value) {
                                  String cKey = key.toString();
                                  
                                  final individualDetail =
                                      Map<String, dynamic>.from(value);
                                  if (individualDetail['usertype'].toString() ==
                                      'Stylist') {
                                        print('........................................ '+ cKey);
                                    final item = StylistCard(
                                        cKey: cKey,
                                        stylishName: individualDetail['name'],
                                        stylishservice: '',
                                        saloonName: individualDetail['saloon']);
                                    clientCards.add(item);
                                  }
                                });
                              }
                              return Column(children: clientCards);
                            }),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
