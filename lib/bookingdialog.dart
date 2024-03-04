import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/bookingSuccessful.dart';
import 'package:flutter_application_1/homepage.dart';
import 'package:flutter_application_1/loginPage.dart';

class BookingDialog extends StatefulWidget {
  const BookingDialog();

  @override
  _BookingDialogState createState() => _BookingDialogState();
}

class _BookingDialogState extends State<BookingDialog> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 260),
      child: Dialog(
        child: Material(
          child: SingleChildScrollView(
            child: Container(
              width: 1000, // Adjust the width as needed
              child: Column(
                children: [
                  Container(
                    height: 50,
                    color: Color.fromRGBO(98, 105, 254, 1),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Booking XXXXXX',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 23,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Name',
                                style: const TextStyle(fontSize: 16),
                              ),
                              Text(
                                'Phone Number',
                                style: TextStyle(
                                  fontFamily: "SFProText",
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                'Booking ID',
                                style: const TextStyle(fontSize: 16),
                              ),
                              Text(
                                "Mode",
                                style: TextStyle(
                                  fontFamily: "SFProText",
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 20),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Jackson Maine",
                                style: const TextStyle(fontSize: 16),
                              ),
                              Text(
                                "+8424599721",
                                style: TextStyle(
                                  fontFamily: "SFProText",
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                '#2343543',
                                style: const TextStyle(fontSize: 16),
                              ),
                              Text(
                                "XXXX",
                                style: TextStyle(
                                  fontFamily: "SFProText",
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 20),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'From',
                                style: const TextStyle(fontSize: 16),
                              ),
                              Text(
                                "To",
                                style: TextStyle(
                                  fontFamily: "SFProText",
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                'Extra Labour',
                                style: const TextStyle(fontSize: 16),
                              ),
                              Text(
                                "To",
                                style: TextStyle(
                                  fontFamily: "SFProText",
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 20),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'XXXX',
                                style: const TextStyle(fontSize: 14),
                              ),
                              Text(
                                "XXXX",
                                style: TextStyle(
                                  fontFamily: "SFProText",
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                'XXXX',
                                style: const TextStyle(fontSize: 14),
                              ),
                              Text(
                                "XXXX",
                                style: TextStyle(
                                  fontFamily: "SFProText",
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (context) {
                              return BookingSuccessful();
                            },
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromRGBO(98, 105, 254, 1),
                          side: BorderSide(
                            color: Color.fromRGBO(98, 105, 254, 1),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Pay Advance: XXXX",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Colfax',
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      ElevatedButton(
                        onPressed: () {
                          // Handle Pay button click
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromRGBO(98, 105, 254, 1),
                          side: BorderSide(
                            color: Color.fromRGBO(98, 105, 254, 1),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Pay: XXXX",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Colfax',
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
