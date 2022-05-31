import 'dart:developer';
import 'dart:math';

import 'package:flutter/material.dart';


class BookingInformationCard extends StatefulWidget {
  String name,email,service,amount,time;

  
   BookingInformationCard({
    Key? key,
    required this.name,required this.email,required this.service,required this.amount,required this.time
    
   
  }) : super(key: key);

  @override
  State<BookingInformationCard> createState() => _BookingInformationCardState();
}

class _BookingInformationCardState extends State<BookingInformationCard> {
  Random random = Random();

  Color getColor() {
    Color tempCol = Color.fromRGBO(
      random.nextInt(255),
      random.nextInt(255),
      random.nextInt(255),
      1,
    );
    return tempCol;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
       
      },
      child: Card(
        // color: Colors.blue,
        
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Text(
                'Appointment\'s Information',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                    fontSize: 18,
                    letterSpacing: 0.6),
              ),
              const SizedBox(height: 20),
              // FutureBuilder(future:_database.,builder: builder)
              // ,
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  const Flexible(
                    flex: 3,
                    child: Text(
                      'Name : '
                          '\nEmail : '
                          '\nService : '
                          '\nTime : ',
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 4,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        widget.name+'\n'+widget.email+'\n'+widget.service+'\n'+widget.amount,

                        style: const TextStyle(
                          color: Colors.green,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ),
                  // Flexible(
                  //   flex: 4,
                  //   child: Padding(
                  //     padding: const EdgeInsets.only(left: 30, bottom: 10),
                  //     child: Container(
                  //         width: 80.0,
                  //         height: 80.0,
                  //         child: Center(
                  //           child: Text(
                  //             widget.email,
                  //           ),
                  //         ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
              Row(
                children: [
                  const Flexible(
                      flex: 1,
                      child: Padding(
                        padding: EdgeInsets.only(
                          right: 5,
                        ),
                        child: Icon(Icons.access_time),
                      )),
                  //const SizedBox(width: 5),
                  const Flexible(
                    flex: 3,
                    child: Text('Appt. Date:',
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.3,
                        )),
                  ),
                  //const SizedBox(width: 10),
                  Flexible(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(widget.time,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.3,
                          )),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}