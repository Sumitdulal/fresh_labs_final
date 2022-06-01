// ignore_for_file: prefer_typing_uninitialized_variables, prefer_const_constructors_in_immutables, use_key_in_widget_constructors, sized_box_for_whitespace, prefer_const_constructors, import_of_legacy_library_into_null_safe

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:outline_material_icons/outline_material_icons.dart';

class myService extends StatefulWidget {
  final ckey;

  myService(this.ckey);

  @override
  State<myService> createState() => _myServiceState();
}

class _myServiceState extends State<myService> {
  final _database = FirebaseDatabase.instance.ref();
  String barbername = '';
  String saname = '';
  String customerName = '';
  String customerEmail = '';
  @override
  void initState() {
    super.initState();
    _selectUsetType();
    stname();
  }

  void stname() {
    _database.child('Userinfo').child(widget.ckey).onValue.listen((event) {
      final barberinfo = event.snapshot.value as Map<dynamic, dynamic>;
      print(widget.ckey);
      setState(() {
        saname = barberinfo['name'];
        barbername = barberinfo['saloon'];
      });
    });
  }

  _selectUsetType() {
    _database.child('Userinfo').onValue.listen((event) {
      print(event.snapshot.value);
      final cudetail = event.snapshot.value as Map<dynamic, dynamic>;
      cudetail.forEach((key, value) {
        final cudetails = value as Map<dynamic, dynamic>;
        setState(() {
          customerName = cudetails['name'];
          customerEmail = cudetails['email'];
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: <Widget>[
              
              
              Positioned(
                top: MediaQuery.of(context).size.height / 3 - 30,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 130,
                        ),
                        Text(
                          'Service List',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        StreamBuilder(
                            stream: _database
                                .child('service')
                                .child(widget.ckey)
                                .onValue,
                            builder: (context, snapshot) {
                              final clientCards = <ServiceTile>[];
                              if (snapshot.hasData) {
                                final allstylish = Map<dynamic, dynamic>.from(
                                    ((snapshot.data! as DatabaseEvent)
                                            .snapshot
                                            .value ??
                                        {}) as Map<dynamic, dynamic>);
                                        print(allstylish);
                                allstylish.forEach((key, value) {
                                  String cKey = key.toString();
                                  final individualDetail =
                                      Map<String, dynamic>.from(value);
                                  final item = ServiceTile(
                                    ckey: cKey,
                                    stylistId: widget.ckey,
                                    service: individualDetail,
                                    cemail: customerEmail,
                                    cname: customerName,
                                  );
                                  clientCards.add(item);
                                });
                              }
                              return Column(children: clientCards);
                            })
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height / 3 - 120,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            saname,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            barbername,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.purple,
                              

                            ),
                          ),
                        ],
                      ),
                    ],
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

class ServiceTile extends StatelessWidget {
  final ckey;
  final stylistId;
  final service;
  final cname;
  final cemail;
  final _database = FirebaseDatabase.instance.ref();
  ServiceTile(
      {required this.service,
      required this.ckey,
      required this.stylistId,
      required this.cname,
      required this.cemail});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                width: MediaQuery.of(context).size.width / 2 - 40,
                child: Text(
                  service['service'],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                '${service['time']} Min',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          Text(
            '\$${service['amount']}',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          MaterialButton(
            onPressed: () {
              _database.child('BookedService').child(stylistId).push().set({
                'amount': service['amount'],
                'customerEmail': cemail,
                'customerName': cname,
                'saloon': service['saloon'],
                'service': service['service'],
                'stylist': service['stylist'],
                'time': service['time']
              });
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Service Edited!')),
                        );
            },
            
            color: Colors.purple,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              'Edit',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  void setStatus() {
    print(_database.child('service').child(ckey).path);
  }
}
