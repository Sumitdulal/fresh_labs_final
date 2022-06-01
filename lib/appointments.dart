import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fresh_labs_final/card.dart';

class AppointmentList extends StatefulWidget {
  const AppointmentList({Key? key}) : super(key: key);

  @override
  State<AppointmentList> createState() => _AppointmentListState();
}

class _AppointmentListState extends State<AppointmentList> {
  final _database = FirebaseDatabase.instance.ref();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
          backgroundColor: Colors.purple,
          elevation: 0,
        ),
      body: Container(
        child: StreamBuilder(
          stream: _database.child('BookedService').child(FirebaseAuth.instance.currentUser!.uid).onValue,
          builder: (context, snapshot) {
            final allbookings = <BookingInformationCard>[];
           
            if (snapshot.hasData) {
              final allstylish = Map<dynamic, dynamic>.from(
                  ((snapshot.data! as DatabaseEvent).snapshot.value ?? {})
                      as Map<dynamic, dynamic>);
                       print(FirebaseAuth.instance.currentUser?.uid.toString());
                       allstylish.forEach((key, value) {String userid = key;
                          final Services = Map<dynamic, dynamic>.from(
                  value
                      as Map<dynamic, dynamic>);
                      print(Services);
                      final bookingDetails = BookingInformationCard(name: Services['customerName'],time: Services['time'],amount: Services['amount'], email: Services['customerEmail'], service: Services['service']);
                      allbookings.add(bookingDetails);
                      // Services.forEach((key, value) { 
                      //   if(userid == FirebaseAuth.instance.currentUser?.uid.toString()){
                      //       print(value);
                      //       final bookingDetails = BookingInformationCard(name: Services[], email: email, service: service)
                      //   }
                      // });
                        });
            }
            return Container(
                  // margin: EdgeInsets.only(
                      // top: size.height / 20, left: 20, right: 20),
                  height: 300,
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    children: allbookings,
                  ),
                );
          },
        ),
      ),
    );
  }
}
