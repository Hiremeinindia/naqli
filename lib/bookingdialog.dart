import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/dashboard.dart';
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
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: 360,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                spreadRadius: 1,
                blurRadius: 2, // changes position of shadow
              ),
            ],
            borderRadius: BorderRadius.circular(12.0),
          ),
          width: 1200,
          child: Column(
            children: [
              Container(
                height: 70,
                color: Color.fromRGBO(98, 105, 254, 1), // Brown color
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Booking XXXXXX',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              // Add spacing between the brown container and the white container
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 250,
                  decoration: BoxDecoration(
                    color: Colors.white,

                    // Set a common borderRadius for all containers
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 100,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              SizedBox(width: 10),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Name',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 100,
                                  ),
                                  Text(
                                    "Jackson Maine",
                                    style: TextStyle(
                                        fontFamily: "SFProText", fontSize: 14),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Phone Number',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 100,
                                  ),
                                  Text(
                                    "+8424599721",
                                    style: TextStyle(
                                        fontFamily: "SFProText", fontSize: 14),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Booking ID',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 100,
                                  ),
                                  Text(
                                    "#2343543",
                                    style: TextStyle(
                                        fontFamily: "SFProText", fontSize: 14),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Mode',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 100,
                                  ),
                                  Text(
                                    "XXXXX",
                                    style: TextStyle(
                                        fontFamily: "SFProText", fontSize: 14),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              SizedBox(width: 10),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'From',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 100,
                                  ),
                                  Text(
                                    "XXXX",
                                    style: TextStyle(
                                        fontFamily: "SFProText", fontSize: 14),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'To',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 100,
                                  ),
                                  Text(
                                    "XXXX",
                                    style: TextStyle(
                                        fontFamily: "SFProText", fontSize: 14),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Extra Labour',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 100,
                                  ),
                                  Text(
                                    "XXXX",
                                    style: TextStyle(
                                        fontFamily: "SFProText", fontSize: 14),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'To',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 100,
                                  ),
                                  Text(
                                    "XXXX",
                                    style: TextStyle(
                                        fontFamily: "SFProText", fontSize: 14),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              // Handle Create Request button click
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Color.fromRGBO(98, 105, 254, 1),
                              side: BorderSide(
                                color: Color.fromRGBO(98, 105, 254, 1),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                "Pay Advance: XXXX",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Colfax',
                                    fontSize: 16),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              // Handle Create Request button click
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Color.fromRGBO(98, 105, 254, 1),
                              side: BorderSide(
                                color: Color.fromRGBO(98, 105, 254, 1),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                "Pay: XXXX",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Colfax',
                                    fontSize: 16),
                              ),
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
