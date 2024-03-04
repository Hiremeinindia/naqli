import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sizer/sizer.dart';

import '../homepage.dart';

class Bookings extends StatefulWidget {
  Bookings();
  @override
  State<Bookings> createState() => _BookingsState();
}

class _BookingsState extends State<Bookings> {
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return LayoutBuilder(
          builder: (BuildContext ctx, BoxConstraints constraints) {
        if (constraints.maxWidth >= 950) {
          return SingleChildScrollView(
            child: Expanded(
              child: Container(
                color: Color.fromRGBO(255, 255, 255, 200),
                padding: EdgeInsets.fromLTRB(3.w, 7.h, 3.w, 0),
                child: Container(
                  padding: EdgeInsets.fromLTRB(3.w, 5.h, 3.w, 3.h),
                  decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Expanded(
                                child: Column(
                                  children: [
                                    Container(
                                      height: 70,
                                      color: Color.fromRGBO(
                                          75, 61, 82, 1), // Brown color
                                      child: Center(
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10),
                                                child: Text(
                                                  'Booking 1',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 100),
                                              child: Text(
                                                "Booking ID XXXXX",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 6.0,
                                    ), // Add spacing between the brown container and the white container
                                    Container(
                                      height: 215,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      child: ListView(
                                        children: [
                                          SizedBox(
                                            height: 60,
                                            width: 100,
                                            child: ListTile(
                                              leading: CircleAvatar(),
                                              title: Text(
                                                'Truck',
                                                style: const TextStyle(
                                                  fontSize: 12,
                                                ),
                                              ),
                                              subtitle: Text(
                                                'Truck no ******',
                                                style: TextStyle(fontSize: 10),
                                              ),
                                              trailing: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  SizedBox(
                                                      width:
                                                          30), // Add some space between "Truck" and "View" button
                                                  GestureDetector(
                                                    onTap: () {
                                                      // Add your View button functionality here
                                                      print(
                                                          'View button pressed');
                                                    },
                                                    child: Container(
                                                      height: 43,
                                                      width: 80,
                                                      padding:
                                                          EdgeInsets.all(8),
                                                      decoration: BoxDecoration(
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: Colors.grey,
                                                            spreadRadius: 1,
                                                            blurRadius:
                                                                2, // changes position of shadow
                                                          ),
                                                        ],
                                                        color: Color.fromRGBO(
                                                            98, 105, 254, 1),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Center(
                                                          child: Text(
                                                            'View',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 9,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Divider(
                                            thickness: 1,
                                            color: Color.fromRGBO(
                                                206, 203, 203, 1),
                                          ),
                                          SizedBox(
                                            height: 60,
                                            width: 100,
                                            child: ListTile(
                                              leading: CircleAvatar(),
                                              title: Text(
                                                'Pick Up Location',
                                                style: const TextStyle(
                                                  fontSize: 11,
                                                ),
                                              ),
                                              subtitle: Text(
                                                'Destination Location',
                                                style: TextStyle(fontSize: 10),
                                              ),
                                              trailing: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  SizedBox(
                                                      width:
                                                          30), // Add some space between "Truck" and "View" button
                                                  GestureDetector(
                                                    onTap: () {
                                                      // Add your View button functionality here
                                                      print(
                                                          'View button pressed');
                                                    },
                                                    child: Container(
                                                      height: 43,
                                                      width: 80,
                                                      padding:
                                                          EdgeInsets.all(8),
                                                      decoration: BoxDecoration(
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: Colors.grey,
                                                            spreadRadius: 1,
                                                            blurRadius:
                                                                2, // changes position of shadow
                                                          ),
                                                        ],
                                                        color: Color.fromRGBO(
                                                            98, 105, 254, 1),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Center(
                                                          child: Text(
                                                            'Edit',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 9,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Divider(
                                            thickness: 1,
                                            color: Color.fromRGBO(
                                                206, 203, 203, 1),
                                          ),
                                          SizedBox(
                                            height: 60,
                                            width: 100,
                                            child: ListTile(
                                              leading: CircleAvatar(),
                                              title: Text(
                                                'Balance Amount',
                                                style: const TextStyle(
                                                  fontSize: 12,
                                                ),
                                              ),
                                              subtitle: Text(
                                                '07.02.2022',
                                                style: TextStyle(fontSize: 10),
                                              ),
                                              trailing: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      Text("Trailer"),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                      width:
                                                          30), // Add some space between "Truck" and "View" button
                                                  GestureDetector(
                                                    onTap: () {
                                                      // Add your View button functionality here
                                                      print(
                                                          'View button pressed');
                                                    },
                                                    child: Container(
                                                      height: 43,
                                                      width: 80,
                                                      padding:
                                                          EdgeInsets.all(8),
                                                      decoration: BoxDecoration(
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: Colors.grey,
                                                            spreadRadius: 1,
                                                            blurRadius:
                                                                2, // changes position of shadow
                                                          ),
                                                        ],
                                                        color: Color.fromRGBO(
                                                            98, 105, 254, 1),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Center(
                                                          child: Text(
                                                            'Pay',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 9,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          // Add more cards with your data as needed
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 4.w,
                          ),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Expanded(
                                child: Column(
                                  children: [
                                    Container(
                                      height: 70,
                                      color: Color.fromRGBO(
                                          75, 61, 82, 1), // Brown color
                                      child: Center(
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10),
                                                child: Text(
                                                  'Booking 2',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 100),
                                              child: Text(
                                                "Booking ID XXXXX",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 6.0,
                                    ), // Add spacing between the brown container and the white container
                                    Container(
                                      height: 215,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      child: ListView(
                                        children: [
                                          SizedBox(
                                            height: 60,
                                            width: 100,
                                            child: ListTile(
                                              leading: CircleAvatar(),
                                              title: Text(
                                                'Truck',
                                                style: const TextStyle(
                                                  fontSize: 12,
                                                ),
                                              ),
                                              subtitle: Text(
                                                'Truck no ******',
                                                style: TextStyle(fontSize: 10),
                                              ),
                                              trailing: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  SizedBox(
                                                      width:
                                                          30), // Add some space between "Truck" and "View" button
                                                  GestureDetector(
                                                    onTap: () {
                                                      // Add your View button functionality here
                                                      print(
                                                          'View button pressed');
                                                    },
                                                    child: Container(
                                                      height: 43,
                                                      width: 80,
                                                      padding:
                                                          EdgeInsets.all(8),
                                                      decoration: BoxDecoration(
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: Colors.grey,
                                                            spreadRadius: 1,
                                                            blurRadius:
                                                                2, // changes position of shadow
                                                          ),
                                                        ],
                                                        color: Color.fromRGBO(
                                                            98, 105, 254, 1),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Center(
                                                          child: Text(
                                                            'View',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 9,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Divider(
                                            thickness: 1,
                                            color: Color.fromRGBO(
                                                206, 203, 203, 1),
                                          ),
                                          SizedBox(
                                            height: 60,
                                            width: 100,
                                            child: ListTile(
                                              leading: CircleAvatar(),
                                              title: Text(
                                                'Pick Up Location',
                                                style: const TextStyle(
                                                  fontSize: 11,
                                                ),
                                              ),
                                              subtitle: Text(
                                                'Destination Location',
                                                style: TextStyle(fontSize: 10),
                                              ),
                                              trailing: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  SizedBox(
                                                      width:
                                                          30), // Add some space between "Truck" and "View" button
                                                  GestureDetector(
                                                    onTap: () {
                                                      // Add your View button functionality here
                                                      print(
                                                          'View button pressed');
                                                    },
                                                    child: Container(
                                                      height: 43,
                                                      width: 80,
                                                      padding:
                                                          EdgeInsets.all(8),
                                                      decoration: BoxDecoration(
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: Colors.grey,
                                                            spreadRadius: 1,
                                                            blurRadius:
                                                                2, // changes position of shadow
                                                          ),
                                                        ],
                                                        color: Color.fromRGBO(
                                                            98, 105, 254, 1),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Center(
                                                          child: Text(
                                                            'Edit',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 9,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Divider(
                                            thickness: 1,
                                            color: Color.fromRGBO(
                                                206, 203, 203, 1),
                                          ),
                                          SizedBox(
                                            height: 60,
                                            width: 100,
                                            child: ListTile(
                                              leading: CircleAvatar(),
                                              title: Text(
                                                'Balance Amount',
                                                style: const TextStyle(
                                                  fontSize: 12,
                                                ),
                                              ),
                                              subtitle: Text(
                                                '07.02.2022',
                                                style: TextStyle(fontSize: 10),
                                              ),
                                              trailing: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      Text("Trailer"),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                      width:
                                                          30), // Add some space between "Truck" and "View" button
                                                  GestureDetector(
                                                    onTap: () {
                                                      // Add your View button functionality here
                                                      print(
                                                          'View button pressed');
                                                    },
                                                    child: Container(
                                                      height: 43,
                                                      width: 80,
                                                      padding:
                                                          EdgeInsets.all(8),
                                                      decoration: BoxDecoration(
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: Colors.grey,
                                                            spreadRadius: 1,
                                                            blurRadius:
                                                                2, // changes position of shadow
                                                          ),
                                                        ],
                                                        color: Color.fromRGBO(
                                                            98, 105, 254, 1),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Center(
                                                          child: Text(
                                                            'Pay',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 9,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          // Add more cards with your data as needed
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 4.w,
                          ),
                          Container(
                            width: 200,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  height: 70,

                                  color: Color.fromRGBO(
                                      75, 61, 82, 1), // Brown color
                                  child: Center(
                                    child: Text(
                                      'New Booking',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => MyHomePage(),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    height: 215,
                                    color: Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset(
                                        color: Color.fromRGBO(225, 225, 225, 1),
                                        'add.png',
                                        width: 60,
                                        height: 300,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 110),
                                  child: Expanded(
                                    child: Container(
                                      height: 230,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      child: Table(
                                        // textDirection: TextDirection.rtl,
                                        // defaultVerticalAlignment: TableCellVerticalAlignment.bottom,
                                        // border:TableBorder.all(width: 2.0,color: Colors.red),
                                        children: [
                                          TableRow(children: [
                                            Container(
                                              height: 60,
                                              color: Color.fromRGBO(
                                                  75, 61, 82, 1), // Brown color
                                              child: Center(
                                                child: Text(
                                                  "Booking ID",
                                                  textScaleFactor: 1.5,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 10,
                                                      fontFamily: "SFProText"),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              height: 60,
                                              color:
                                                  Color.fromRGBO(75, 61, 82, 1),
                                              child: Center(
                                                child: Text(
                                                  "Mode",
                                                  textScaleFactor: 1.5,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 10,
                                                      fontFamily: "SFProText"),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              height: 60,
                                              color:
                                                  Color.fromRGBO(75, 61, 82, 1),
                                              child: Center(
                                                child: Text(
                                                  "Booking Type",
                                                  textScaleFactor: 1.5,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 10,
                                                      fontFamily: "SFProText"),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              height: 60,
                                              color:
                                                  Color.fromRGBO(75, 61, 82, 1),
                                              child: Center(
                                                child: Text(
                                                  "Vendor",
                                                  textScaleFactor: 1.5,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 10,
                                                      fontFamily: "SFProText"),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              height: 60,
                                              color:
                                                  Color.fromRGBO(75, 61, 82, 1),
                                              child: Center(
                                                child: Text(
                                                  "Payment Status",
                                                  textScaleFactor: 1.5,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 10,
                                                      fontFamily: "SFProText"),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              height: 60,
                                              color:
                                                  Color.fromRGBO(75, 61, 82, 1),
                                              child: Center(
                                                child: Text(
                                                  "Status",
                                                  textScaleFactor: 1.5,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 10,
                                                      fontFamily: "SFProText"),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              height: 60,
                                              color:
                                                  Color.fromRGBO(75, 61, 82, 1),
                                              child: Center(
                                                child: Text(
                                                  "Actions",
                                                  textScaleFactor: 1.5,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 10,
                                                      fontFamily: "SFProText"),
                                                ),
                                              ),
                                            ),
                                          ]),
                                          TableRow(children: [
                                            Container(
                                              height: 50,
                                              child: Center(
                                                child: Text(
                                                  "NAQBOOK***",
                                                  textScaleFactor: 1.5,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 9,
                                                      fontFamily: "SFProText"),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              height: 50,
                                              child: Center(
                                                child: Text(
                                                  "Truck",
                                                  textScaleFactor: 1.5,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 9,
                                                      fontFamily: "SFProText"),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              height: 50,
                                              child: Center(
                                                child: Text(
                                                  "Single",
                                                  textScaleFactor: 1.5,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 9,
                                                      fontFamily: "SFProText"),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              height: 50,
                                              child: Center(
                                                child: Text(
                                                  "Vendor 1",
                                                  textScaleFactor: 1.5,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 9,
                                                      fontFamily: "SFProText"),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              height: 50,
                                              child: Center(
                                                child: SizedBox(
                                                  width: 100,
                                                  height: 30,
                                                  child: ElevatedButton(
                                                    onPressed: () {},
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      backgroundColor:
                                                          Color.fromRGBO(
                                                              247, 230, 176, 1),
                                                      side: BorderSide(
                                                        color: Color.fromRGBO(
                                                            247, 230, 176, 1),
                                                      ),
                                                    ),
                                                    child: Text(
                                                      'BalXXXX',
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 12,
                                                        fontFamily: "Helvetica",
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              height: 50,
                                              child: Center(
                                                child: Image.asset(
                                                  'Group268.png',
                                                  width: 50,
                                                  height: 30,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              height: 50,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  IconButton(
                                                      padding: EdgeInsets.zero,
                                                      constraints:
                                                          BoxConstraints(),
                                                      onPressed: null,
                                                      icon: Icon(
                                                        Icons.edit_document,
                                                        color: Color.fromRGBO(
                                                            74, 60, 81, 1),
                                                      )),
                                                  IconButton(
                                                      padding: EdgeInsets.zero,
                                                      // constraints:
                                                      //     BoxConstraints(),
                                                      onPressed: null,
                                                      icon: Icon(Icons.delete)),
                                                ],
                                              ),
                                            ),
                                          ]),
                                          TableRow(children: [
                                            Container(
                                              height: 50,
                                              child: Center(
                                                child: Text(
                                                  "NAQBOOK***",
                                                  textScaleFactor: 1.5,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 9,
                                                      fontFamily: "SFProText"),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              height: 50,
                                              child: Center(
                                                child: Text(
                                                  "Truck",
                                                  textScaleFactor: 1.5,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 9,
                                                      fontFamily: "SFProText"),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              height: 50,
                                              child: Center(
                                                child: Text(
                                                  "Single",
                                                  textScaleFactor: 1.5,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 9,
                                                      fontFamily: "SFProText"),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              height: 50,
                                              child: Center(
                                                child: Text(
                                                  "Vendor 1",
                                                  textScaleFactor: 1.5,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 9,
                                                      fontFamily: "SFProText"),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              height: 50,
                                              child: Center(
                                                child: SizedBox(
                                                  width: 100,
                                                  height: 30,
                                                  child: ElevatedButton(
                                                    onPressed: () {},
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      backgroundColor:
                                                          Color.fromRGBO(
                                                              247, 230, 176, 1),
                                                      side: BorderSide(
                                                        color: Color.fromRGBO(
                                                            247, 230, 176, 1),
                                                      ),
                                                    ),
                                                    child: Text(
                                                      'BalXXXX',
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 12,
                                                        fontFamily: "Helvetica",
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              height: 50,
                                              child: Center(
                                                child: Image.asset(
                                                  'Group268.png',
                                                  width: 50,
                                                  height: 30,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              height: 50,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  IconButton(
                                                      padding: EdgeInsets.zero,
                                                      constraints:
                                                          BoxConstraints(),
                                                      onPressed: null,
                                                      icon: Icon(
                                                        Icons.edit_document,
                                                        color: Color.fromRGBO(
                                                            74, 60, 81, 1),
                                                      )),
                                                  IconButton(
                                                      padding: EdgeInsets.zero,
                                                      // constraints:
                                                      //     BoxConstraints(),
                                                      onPressed: null,
                                                      icon: Icon(Icons.delete)),
                                                ],
                                              ),
                                            ),
                                          ]),
                                          TableRow(children: [
                                            Container(
                                              height: 50,
                                              child: Center(
                                                child: Text(
                                                  "NAQBOOK***",
                                                  textScaleFactor: 1.5,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 9,
                                                      fontFamily: "SFProText"),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              height: 50,
                                              child: Center(
                                                child: Text(
                                                  "Truck",
                                                  textScaleFactor: 1.5,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 9,
                                                      fontFamily: "SFProText"),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              height: 50,
                                              child: Center(
                                                child: Text(
                                                  "Single",
                                                  textScaleFactor: 1.5,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 9,
                                                      fontFamily: "SFProText"),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              height: 50,
                                              child: Center(
                                                child: Text(
                                                  "Vendor 1",
                                                  textScaleFactor: 1.5,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 9,
                                                      fontFamily: "SFProText"),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              height: 50,
                                              child: Center(
                                                child: SizedBox(
                                                  width: 100,
                                                  height: 30,
                                                  child: ElevatedButton(
                                                    onPressed: () {},
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      backgroundColor:
                                                          Color.fromRGBO(
                                                              247, 230, 176, 1),
                                                      side: BorderSide(
                                                        color: Color.fromRGBO(
                                                            247, 230, 176, 1),
                                                      ),
                                                    ),
                                                    child: Text(
                                                      'BalXXXX',
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 12,
                                                        fontFamily: "Helvetica",
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              height: 50,
                                              child: Center(
                                                child: Image.asset(
                                                  'Group268.png',
                                                  width: 50,
                                                  height: 30,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              height: 50,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  IconButton(
                                                      padding: EdgeInsets.zero,
                                                      constraints:
                                                          BoxConstraints(),
                                                      onPressed: null,
                                                      icon: Icon(
                                                        Icons.edit_document,
                                                        color: Color.fromRGBO(
                                                            74, 60, 81, 1),
                                                      )),
                                                  IconButton(
                                                      padding: EdgeInsets.zero,
                                                      // constraints:
                                                      //     BoxConstraints(),
                                                      onPressed: null,
                                                      icon: Icon(Icons.delete)),
                                                ],
                                              ),
                                            ),
                                          ]),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 110),
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Container(
                                      height: 10, // Adjust the height as needed
                                      width:
                                          1100, // Set the desired length of the scroll bar
                                      color: Colors
                                          .grey, // Background color of the scrollable area
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        } else {
          return SingleChildScrollView(
            child: Expanded(
              child: Container(
                color: Color.fromRGBO(255, 255, 255, 200),
                padding: EdgeInsets.fromLTRB(3.w, 1.5.h, 3.w, 1.5.h),
                child: Container(
                  height: 90.h,
                  padding: EdgeInsets.fromLTRB(5.w, 1.5.h, 5.w, 1.5.h),
                  color: Color.fromRGBO(255, 255, 255, 157),
                  child: Expanded(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 292,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              width: 350,
                              child: Column(
                                children: [
                                  Container(
                                    height: 70,
                                    color: Color.fromRGBO(
                                        75, 61, 82, 1), // Brown color
                                    child: Center(
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10),
                                              child: Text(
                                                'Booking 1',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 100),
                                            child: Text(
                                              "Booking ID XXXXX",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 6.0,
                                  ), // Add spacing between the brown container and the white container
                                  Container(
                                    height: 215,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: ListView(
                                      children: [
                                        SizedBox(
                                          height: 60,
                                          width: 100,
                                          child: ListTile(
                                            leading: CircleAvatar(),
                                            title: Text(
                                              'Truck',
                                              style: const TextStyle(
                                                fontSize: 12,
                                              ),
                                            ),
                                            subtitle: Text(
                                              'Truck no ******',
                                              style: TextStyle(fontSize: 10),
                                            ),
                                            trailing: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                SizedBox(
                                                    width:
                                                        30), // Add some space between "Truck" and "View" button
                                                GestureDetector(
                                                  onTap: () {
                                                    // Add your View button functionality here
                                                    print(
                                                        'View button pressed');
                                                  },
                                                  child: Container(
                                                    height: 43,
                                                    width: 80,
                                                    padding: EdgeInsets.all(8),
                                                    decoration: BoxDecoration(
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Colors.grey,
                                                          spreadRadius: 1,
                                                          blurRadius:
                                                              2, // changes position of shadow
                                                        ),
                                                      ],
                                                      color: Color.fromRGBO(
                                                          98, 105, 254, 1),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Center(
                                                        child: Text(
                                                          'View',
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 9,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Divider(
                                          thickness: 1,
                                          color:
                                              Color.fromRGBO(206, 203, 203, 1),
                                        ),
                                        SizedBox(
                                          height: 60,
                                          width: 100,
                                          child: ListTile(
                                            leading: CircleAvatar(),
                                            title: Text(
                                              'Pick Up Location',
                                              style: const TextStyle(
                                                fontSize: 11,
                                              ),
                                            ),
                                            subtitle: Text(
                                              'Destination Location',
                                              style: TextStyle(fontSize: 10),
                                            ),
                                            trailing: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                SizedBox(
                                                    width:
                                                        30), // Add some space between "Truck" and "View" button
                                                GestureDetector(
                                                  onTap: () {
                                                    // Add your View button functionality here
                                                    print(
                                                        'View button pressed');
                                                  },
                                                  child: Container(
                                                    height: 43,
                                                    width: 80,
                                                    padding: EdgeInsets.all(8),
                                                    decoration: BoxDecoration(
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Colors.grey,
                                                          spreadRadius: 1,
                                                          blurRadius:
                                                              2, // changes position of shadow
                                                        ),
                                                      ],
                                                      color: Color.fromRGBO(
                                                          98, 105, 254, 1),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Center(
                                                        child: Text(
                                                          'Edit',
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 9,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Divider(
                                          thickness: 1,
                                          color:
                                              Color.fromRGBO(206, 203, 203, 1),
                                        ),
                                        SizedBox(
                                          height: 60,
                                          width: 100,
                                          child: ListTile(
                                            leading: CircleAvatar(),
                                            title: Text(
                                              'Balance Amount',
                                              style: const TextStyle(
                                                fontSize: 12,
                                              ),
                                            ),
                                            subtitle: Text(
                                              '07.02.2022',
                                              style: TextStyle(fontSize: 10),
                                            ),
                                            trailing: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    Text("Trailer"),
                                                  ],
                                                ),
                                                SizedBox(
                                                    width:
                                                        30), // Add some space between "Truck" and "View" button
                                                GestureDetector(
                                                  onTap: () {
                                                    // Add your View button functionality here
                                                    print(
                                                        'View button pressed');
                                                  },
                                                  child: Container(
                                                    height: 43,
                                                    width: 80,
                                                    padding: EdgeInsets.all(8),
                                                    decoration: BoxDecoration(
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Colors.grey,
                                                          spreadRadius: 1,
                                                          blurRadius:
                                                              2, // changes position of shadow
                                                        ),
                                                      ],
                                                      color: Color.fromRGBO(
                                                          98, 105, 254, 1),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Center(
                                                        child: Text(
                                                          'Pay',
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 9,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        // Add more cards with your data as needed
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 90,
                            ),
                            Container(
                              height: 292,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              width: 350,
                              child: Column(
                                children: [
                                  Container(
                                    height: 70,
                                    color: Color.fromRGBO(
                                        75, 61, 82, 1), // Brown color
                                    child: Center(
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10),
                                              child: Text(
                                                'Booking 2',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 100),
                                            child: Text(
                                              "Booking ID XXXXX",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 6.0,
                                  ), // Add spacing between the brown container and the white container
                                  Container(
                                    height: 215,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: ListView(
                                      children: [
                                        SizedBox(
                                          height: 60,
                                          width: 100,
                                          child: ListTile(
                                            leading: CircleAvatar(),
                                            title: Text(
                                              'Truck',
                                              style: const TextStyle(
                                                fontSize: 12,
                                              ),
                                            ),
                                            subtitle: Text(
                                              'Truck no ******',
                                              style: TextStyle(fontSize: 10),
                                            ),
                                            trailing: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                SizedBox(
                                                    width:
                                                        30), // Add some space between "Truck" and "View" button
                                                GestureDetector(
                                                  onTap: () {
                                                    // Add your View button functionality here
                                                    print(
                                                        'View button pressed');
                                                  },
                                                  child: Container(
                                                    height: 43,
                                                    width: 80,
                                                    padding: EdgeInsets.all(8),
                                                    decoration: BoxDecoration(
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Colors.grey,
                                                          spreadRadius: 1,
                                                          blurRadius:
                                                              2, // changes position of shadow
                                                        ),
                                                      ],
                                                      color: Color.fromRGBO(
                                                          98, 105, 254, 1),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Center(
                                                        child: Text(
                                                          'View',
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 9,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Divider(
                                          thickness: 1,
                                          color:
                                              Color.fromRGBO(206, 203, 203, 1),
                                        ),
                                        SizedBox(
                                          height: 60,
                                          width: 100,
                                          child: ListTile(
                                            leading: CircleAvatar(),
                                            title: Text(
                                              'Pick Up Location',
                                              style: const TextStyle(
                                                fontSize: 11,
                                              ),
                                            ),
                                            subtitle: Text(
                                              'Destination Location',
                                              style: TextStyle(fontSize: 10),
                                            ),
                                            trailing: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                SizedBox(
                                                    width:
                                                        30), // Add some space between "Truck" and "View" button
                                                GestureDetector(
                                                  onTap: () {
                                                    // Add your View button functionality here
                                                    print(
                                                        'View button pressed');
                                                  },
                                                  child: Container(
                                                    height: 43,
                                                    width: 80,
                                                    padding: EdgeInsets.all(8),
                                                    decoration: BoxDecoration(
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Colors.grey,
                                                          spreadRadius: 1,
                                                          blurRadius:
                                                              2, // changes position of shadow
                                                        ),
                                                      ],
                                                      color: Color.fromRGBO(
                                                          98, 105, 254, 1),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Center(
                                                        child: Text(
                                                          'Edit',
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 9,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Divider(
                                          thickness: 1,
                                          color:
                                              Color.fromRGBO(206, 203, 203, 1),
                                        ),
                                        SizedBox(
                                          height: 60,
                                          width: 100,
                                          child: ListTile(
                                            leading: CircleAvatar(),
                                            title: Text(
                                              'Balance Amount',
                                              style: const TextStyle(
                                                fontSize: 12,
                                              ),
                                            ),
                                            subtitle: Text(
                                              '07.02.2022',
                                              style: TextStyle(fontSize: 10),
                                            ),
                                            trailing: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    Text("Trailer"),
                                                  ],
                                                ),
                                                SizedBox(
                                                    width:
                                                        30), // Add some space between "Truck" and "View" button
                                                GestureDetector(
                                                  onTap: () {
                                                    // Add your View button functionality here
                                                    print(
                                                        'View button pressed');
                                                  },
                                                  child: Container(
                                                    height: 43,
                                                    width: 80,
                                                    padding: EdgeInsets.all(8),
                                                    decoration: BoxDecoration(
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Colors.grey,
                                                          spreadRadius: 1,
                                                          blurRadius:
                                                              2, // changes position of shadow
                                                        ),
                                                      ],
                                                      color: Color.fromRGBO(
                                                          98, 105, 254, 1),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Center(
                                                        child: Text(
                                                          'Pay',
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 9,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        // Add more cards with your data as needed
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 85,
                            ),
                            Container(
                              height: 290,
                              width: 200,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      // Navigate to a different screen when the brown container is pressed
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => MyHomePage(),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      height: 70,

                                      color: Color.fromRGBO(
                                          75, 61, 82, 1), // Brown color
                                      child: Center(
                                        child: Text(
                                          'New Booking',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8.0,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => MyHomePage(),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      height: 70,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: ColorFiltered(
                                          colorFilter: ColorFilter.mode(
                                            Color.fromRGBO(183, 174, 185, 1),
                                            BlendMode.srcIn,
                                          ),
                                          child: Transform.translate(
                                            offset: Offset(0,
                                                50), // Adjust the Y offset as needed
                                            child: Image.asset(
                                              'add.png',
                                              width: 120,
                                              height: 170,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 110),
                                    child: Expanded(
                                      child: Container(
                                        height: 230,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        child: Table(
                                          // textDirection: TextDirection.rtl,
                                          // defaultVerticalAlignment: TableCellVerticalAlignment.bottom,
                                          // border:TableBorder.all(width: 2.0,color: Colors.red),
                                          children: [
                                            TableRow(children: [
                                              Container(
                                                height: 60,
                                                color: Color.fromRGBO(75, 61,
                                                    82, 1), // Brown color
                                                child: Center(
                                                  child: Text(
                                                    "Booking ID",
                                                    textScaleFactor: 1.5,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 10,
                                                        fontFamily:
                                                            "SFProText"),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                height: 60,
                                                color: Color.fromRGBO(
                                                    75, 61, 82, 1),
                                                child: Center(
                                                  child: Text(
                                                    "Mode",
                                                    textScaleFactor: 1.5,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 10,
                                                        fontFamily:
                                                            "SFProText"),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                height: 60,
                                                color: Color.fromRGBO(
                                                    75, 61, 82, 1),
                                                child: Center(
                                                  child: Text(
                                                    "Booking Type",
                                                    textScaleFactor: 1.5,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 10,
                                                        fontFamily:
                                                            "SFProText"),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                height: 60,
                                                color: Color.fromRGBO(
                                                    75, 61, 82, 1),
                                                child: Center(
                                                  child: Text(
                                                    "Vendor",
                                                    textScaleFactor: 1.5,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 10,
                                                        fontFamily:
                                                            "SFProText"),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                height: 60,
                                                color: Color.fromRGBO(
                                                    75, 61, 82, 1),
                                                child: Center(
                                                  child: Text(
                                                    "Payment Status",
                                                    textScaleFactor: 1.5,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 10,
                                                        fontFamily:
                                                            "SFProText"),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                height: 60,
                                                color: Color.fromRGBO(
                                                    75, 61, 82, 1),
                                                child: Center(
                                                  child: Text(
                                                    "Status",
                                                    textScaleFactor: 1.5,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 10,
                                                        fontFamily:
                                                            "SFProText"),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                height: 60,
                                                color: Color.fromRGBO(
                                                    75, 61, 82, 1),
                                                child: Center(
                                                  child: Text(
                                                    "Actions",
                                                    textScaleFactor: 1.5,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 10,
                                                        fontFamily:
                                                            "SFProText"),
                                                  ),
                                                ),
                                              ),
                                            ]),
                                            TableRow(children: [
                                              Container(
                                                height: 50,
                                                child: Center(
                                                  child: Text(
                                                    "NAQBOOK***",
                                                    textScaleFactor: 1.5,
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 9,
                                                        fontFamily:
                                                            "SFProText"),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                height: 50,
                                                child: Center(
                                                  child: Text(
                                                    "Truck",
                                                    textScaleFactor: 1.5,
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 9,
                                                        fontFamily:
                                                            "SFProText"),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                height: 50,
                                                child: Center(
                                                  child: Text(
                                                    "Single",
                                                    textScaleFactor: 1.5,
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 9,
                                                        fontFamily:
                                                            "SFProText"),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                height: 50,
                                                child: Center(
                                                  child: Text(
                                                    "Vendor 1",
                                                    textScaleFactor: 1.5,
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 9,
                                                        fontFamily:
                                                            "SFProText"),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                height: 50,
                                                child: Center(
                                                  child: SizedBox(
                                                    width: 100,
                                                    height: 30,
                                                    child: ElevatedButton(
                                                      onPressed: () {},
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        backgroundColor:
                                                            Color.fromRGBO(247,
                                                                230, 176, 1),
                                                        side: BorderSide(
                                                          color: Color.fromRGBO(
                                                              247, 230, 176, 1),
                                                        ),
                                                      ),
                                                      child: Text(
                                                        'BalXXXX',
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 12,
                                                          fontFamily:
                                                              "Helvetica",
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                height: 50,
                                                child: Center(
                                                  child: Image.asset(
                                                    'Group268.png',
                                                    width: 50,
                                                    height: 30,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                height: 50,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    IconButton(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        constraints:
                                                            BoxConstraints(),
                                                        onPressed: null,
                                                        icon: Icon(
                                                          Icons.edit_document,
                                                          color: Color.fromRGBO(
                                                              74, 60, 81, 1),
                                                        )),
                                                    IconButton(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        // constraints:
                                                        //     BoxConstraints(),
                                                        onPressed: null,
                                                        icon:
                                                            Icon(Icons.delete)),
                                                  ],
                                                ),
                                              ),
                                            ]),
                                            TableRow(children: [
                                              Container(
                                                height: 50,
                                                child: Center(
                                                  child: Text(
                                                    "NAQBOOK***",
                                                    textScaleFactor: 1.5,
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 9,
                                                        fontFamily:
                                                            "SFProText"),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                height: 50,
                                                child: Center(
                                                  child: Text(
                                                    "Truck",
                                                    textScaleFactor: 1.5,
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 9,
                                                        fontFamily:
                                                            "SFProText"),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                height: 50,
                                                child: Center(
                                                  child: Text(
                                                    "Single",
                                                    textScaleFactor: 1.5,
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 9,
                                                        fontFamily:
                                                            "SFProText"),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                height: 50,
                                                child: Center(
                                                  child: Text(
                                                    "Vendor 1",
                                                    textScaleFactor: 1.5,
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 9,
                                                        fontFamily:
                                                            "SFProText"),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                height: 50,
                                                child: Center(
                                                  child: SizedBox(
                                                    width: 100,
                                                    height: 30,
                                                    child: ElevatedButton(
                                                      onPressed: () {},
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        backgroundColor:
                                                            Color.fromRGBO(247,
                                                                230, 176, 1),
                                                        side: BorderSide(
                                                          color: Color.fromRGBO(
                                                              247, 230, 176, 1),
                                                        ),
                                                      ),
                                                      child: Text(
                                                        'BalXXXX',
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 12,
                                                          fontFamily:
                                                              "Helvetica",
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                height: 50,
                                                child: Center(
                                                  child: Image.asset(
                                                    'Group268.png',
                                                    width: 50,
                                                    height: 30,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                height: 50,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    IconButton(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        constraints:
                                                            BoxConstraints(),
                                                        onPressed: null,
                                                        icon: Icon(
                                                          Icons.edit_document,
                                                          color: Color.fromRGBO(
                                                              74, 60, 81, 1),
                                                        )),
                                                    IconButton(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        // constraints:
                                                        //     BoxConstraints(),
                                                        onPressed: null,
                                                        icon:
                                                            Icon(Icons.delete)),
                                                  ],
                                                ),
                                              ),
                                            ]),
                                            TableRow(children: [
                                              Container(
                                                height: 50,
                                                child: Center(
                                                  child: Text(
                                                    "NAQBOOK***",
                                                    textScaleFactor: 1.5,
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 9,
                                                        fontFamily:
                                                            "SFProText"),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                height: 50,
                                                child: Center(
                                                  child: Text(
                                                    "Truck",
                                                    textScaleFactor: 1.5,
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 9,
                                                        fontFamily:
                                                            "SFProText"),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                height: 50,
                                                child: Center(
                                                  child: Text(
                                                    "Single",
                                                    textScaleFactor: 1.5,
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 9,
                                                        fontFamily:
                                                            "SFProText"),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                height: 50,
                                                child: Center(
                                                  child: Text(
                                                    "Vendor 1",
                                                    textScaleFactor: 1.5,
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 9,
                                                        fontFamily:
                                                            "SFProText"),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                height: 50,
                                                child: Center(
                                                  child: SizedBox(
                                                    width: 100,
                                                    height: 30,
                                                    child: ElevatedButton(
                                                      onPressed: () {},
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        backgroundColor:
                                                            Color.fromRGBO(247,
                                                                230, 176, 1),
                                                        side: BorderSide(
                                                          color: Color.fromRGBO(
                                                              247, 230, 176, 1),
                                                        ),
                                                      ),
                                                      child: Text(
                                                        'BalXXXX',
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 12,
                                                          fontFamily:
                                                              "Helvetica",
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                height: 50,
                                                child: Center(
                                                  child: Image.asset(
                                                    'Group268.png',
                                                    width: 50,
                                                    height: 30,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                height: 50,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    IconButton(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        constraints:
                                                            BoxConstraints(),
                                                        onPressed: null,
                                                        icon: Icon(
                                                          Icons.edit_document,
                                                          color: Color.fromRGBO(
                                                              74, 60, 81, 1),
                                                        )),
                                                    IconButton(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        // constraints:
                                                        //     BoxConstraints(),
                                                        onPressed: null,
                                                        icon:
                                                            Icon(Icons.delete)),
                                                  ],
                                                ),
                                              ),
                                            ]),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 110),
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Container(
                                        height:
                                            10, // Adjust the height as needed
                                        width:
                                            1100, // Set the desired length of the scroll bar
                                        color: Colors
                                            .grey, // Background color of the scrollable area
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        }
      });
    });
  }
}
