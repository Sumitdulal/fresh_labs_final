// ignore_for_file: prefer_typing_uninitialized_variables, prefer_const_constructors_in_immutables, use_key_in_widget_constructors, sized_box_for_whitespace, prefer_const_constructors, import_of_legacy_library_into_null_safe

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:outline_material_icons/outline_material_icons.dart';

// var serviceList = [
//   {'title': 'Men Hair Cut', 'duration': 45, 'price': 30},
//   {'title': 'Women Hair Cut', 'duration': 60, 'price': 50},
//   {'title': 'Color & Blow Dry', 'duration': 90, 'price': 75},
//   {'title': 'Oil Treatment', 'duration': 30, 'price': 20},
// ];

class DetailScreen extends StatefulWidget {
  final ckey;

  DetailScreen(this.ckey);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final _database = FirebaseDatabase.instance.ref();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    stname();
  }
  String barbername = '';
  String saname = '';
  void stname(){
    _database.child('Userinfo').child(widget.ckey).onValue.listen((event) {
      // print(event.snapshot.value);
      final barberinfo = event.snapshot.value as Map<dynamic,dynamic>;
      print(widget.ckey);
      setState(() {
        saname = barberinfo['name'];
        barbername = barberinfo['saloon'];
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
              Container(
                height: MediaQuery.of(context).size.height / 3 + 20,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    Image.asset(
                      'assets/detail_bg.png',
                      fit: BoxFit.fill,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      color: Colors.purple.withOpacity(0.1),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 50,
                left: 20,
                child: IconButton(
            
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
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
                        // ServiceTile(serviceList[0]),
                         StreamBuilder(
                            stream: _database.child('service').child(widget.ckey).onValue,
                            builder: (context, snapshot) {
                              final clientCards = <ServiceTile>[];
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
                                      // print(individualDetail);
                                    final item = ServiceTile(
                                      ckey:cKey,
                                      stylistId: widget.ckey,
                                      service:individualDetail

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
                      Container(
                        width: MediaQuery.of(context).size.width / 3 - 20,
                        height: MediaQuery.of(context).size.height / 6 + 20,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Stack(
                          fit: StackFit.expand,
                          children: <Widget>[
                            Positioned(
                              top: 10,
                              right: -25,
                              child: Image.asset(
                               'assets/stylist2.png',
                                scale: 1.7,
                              ),
                            ),
                          ],
                        ),
                      ),
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
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            barbername,
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              color: Colors.grey,
                            ),
                          ),
                          // SizedBox(
                          //   height: 10,
                          // ),
                          // Row(
                          //   children: <Widget>[
                          //     Icon(
                          //       Icons.star,
                          //       size: 16,
                          //       color: Color(0xffFF8573),
                          //     ),
                          //     SizedBox(width: 5),
                          //     Text(
                          //       stylist['rating'],
                          //       style: TextStyle(
                          //         color: Color(0xffFF8573),
                          //       ),
                          //     ),
                          //     SizedBox(
                          //       width: 5,
                          //     ),
                          //     Text(
                          //       '(${stylist['rateAmount']})',
                          //       style: TextStyle(
                          //         color: Colors.grey,
                          //       ),
                          //     ),
                          //   ],
                          // )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              // Positioned(
              //   right: 10,
              //   top: MediaQuery.of(context).size.height / 3 - 55,
              //   child: MaterialButton(
              //     onPressed: () {},
              //     padding: EdgeInsets.all(10),
              //     shape: CircleBorder(),
              //     color: Colors.white,
              //     child: Icon(OMIcons.favoriteBorder),
              //   ),
              // ),
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
  final _database = FirebaseDatabase.instance.ref();
  ServiceTile({required this.service,required this.ckey,required this.stylistId});
  

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

              setStatus();

            },
            color: Color(0xffFF8573),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              'Book',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
  void setStatus(){
    // final value = service as Map<dynamic,dynamic>;
    _database.child('service').child(stylistId).child(ckey).update({'booked':true});
    print( _database.child('service').child(ckey).path);

  }
}