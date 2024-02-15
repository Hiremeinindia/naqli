import 'dart:math';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_application_1/createAccount.dart';

import 'loginPage.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({
    Key? key,
  }) : super(key: key);

  @override
  State<Dashboard> createState() => _MyHomePageState();
}

class ScaleSize {
  static double textScaleFactor(BuildContext context,
      {double maxTextScaleFactor = 2}) {
    final width = MediaQuery.of(context).size.width;
    double val = (width / 1400) * maxTextScaleFactor;
    return max(1, min(val, maxTextScaleFactor));
  }
}

class _MyHomePageState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size(screenSize.height, 90),
            child: Material(
                elevation: 5,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                      w * 0.05, h * 0.005, w * 0.025, h * 0.005),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        'Naqli-final-logo.png',
                        width: 140,
                        height: 150,
                      ),
                      Row(
                        children: [
                          Container(
                            child: TextButton(
                              onPressed: () {
                                // Handle the first button press
                              },
                              child: Text(
                                'User',
                                textScaleFactor:
                                    ScaleSize.textScaleFactor(context),
                                style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: "Segoe UI",
                                    color: Color.fromRGBO(112, 112, 112, 1)),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                            child: VerticalDivider(
                              color: Color.fromRGBO(206, 203, 203, 1),
                            ),
                          ),
                          Container(
                            child: TextButton(
                              onPressed: () {
                                // Handle the second button press
                              },
                              child: Text(
                                'Enterprise',
                                textScaleFactor:
                                    ScaleSize.textScaleFactor(context),
                                style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: "Segoe UI",
                                    color: Color.fromRGBO(206, 203, 203, 1)),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                            child: VerticalDivider(
                              color: Color.fromRGBO(206, 203, 203, 1),
                            ),
                          ),
                          Container(
                            child: TextButton(
                              onPressed: () {
                                // Handle the third button press
                              },
                              child: Text(
                                'Partner',
                                textScaleFactor:
                                    ScaleSize.textScaleFactor(context),
                                style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: "Segoe UI",
                                    color: Color.fromRGBO(206, 203, 203, 1)),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 20.0, top: 10),
                        child: Row(
                          children: [
                            Icon(
                              Icons.notifications,
                              color: Color.fromRGBO(106, 102, 209, 1),
                            ),
                            SizedBox(
                              height: 30,
                              child: Padding(
                                padding: EdgeInsets.only(left: 15, top: 5),
                                child: Text(
                                  "Contact Us",
                                  textScaleFactor:
                                      ScaleSize.textScaleFactor(context),
                                  style: TextStyle(
                                    fontFamily: 'Colfax',
                                    fontSize: 8,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              height: 30,
                              child: VerticalDivider(
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              height: 30,
                              width: 170,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 13, top: 5),
                                child: Text(
                                  "Hello Customer!",
                                  textScaleFactor:
                                      ScaleSize.textScaleFactor(context),
                                  style: TextStyle(
                                    fontFamily: 'Colfax',
                                    fontSize: 8,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 40),
                          ],
                        ),
                      ),
                    ],
                  ),
                ))));
  }
}
