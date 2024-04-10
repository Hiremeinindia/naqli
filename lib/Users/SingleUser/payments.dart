import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/Users/SingleUser/singleuser.dart';
import 'package:flutter_application_1/Widgets/colorContainer.dart';
import 'package:flutter_application_1/Widgets/formText.dart';
import 'package:flutter_application_1/pieChart/app_colors.dart';
import 'package:flutter_application_1/pieChart/indicator.dart';
import 'package:flutter_application_1/Widgets/customButton.dart';
import 'package:flutter_application_1/echarts_data.dart';
import 'package:graphic/graphic.dart';
import 'package:sizer/sizer.dart';
import 'dart:ui';

class SingleUserPayment extends StatefulWidget {
  final String? user;
  SingleUserPayment({required this.user});
  @override
  State<SingleUserPayment> createState() => _SingleUserPaymentState();
}

class _SingleUserPaymentState extends State<SingleUserPayment> {
  PageController page = PageController();
  SideMenuController sideMenu = SideMenuController();
  final ScrollController _scrollController1 = ScrollController();
  final ScrollController _scrollController2 = ScrollController();

  bool value = false;
  String month = '';
  bool checkbox1 = false;
  bool checkbox2 = false;
  bool checkbox3 = false;
  bool isButtonEnabled = false;
  bool isButtonEnabled1 = false;
  bool isButtonEnabled2 = false;
  int? selectedRadioValue;
  int? selectedRadioValue1;
  int? selectedRadioValue2;
  bool payNowButtonEnabled = false;
  String? selectedValue;

  Stream<QuerySnapshot<Map<String, dynamic>>>? _currentStream;
  @override
  void dispose() {
    _scrollController1.dispose();
    _scrollController2.dispose();
    super.dispose();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> allBookings() {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    // Query for user collection
    Stream<QuerySnapshot<Map<String, dynamic>>> userStream = firestore
        .collection('user')
        .doc(widget.user)
        .collection('vehicleBooking')
        .snapshots();

    // Combine both streams into one
    return userStream;
  }

  void initState() {
    sideMenu.addListener((p0) {
      page.jumpToPage(p0);
    });
    _currentStream = allBookings();
    super.initState();
  }

  void enablePayNowButton() {
    setState(() {
      payNowButtonEnabled = true;
    });
  }

  void disablePayNowButton() {
    setState(() {
      payNowButtonEnabled = false;
    });
  }

  bool isAnyCheckboxSelected() {
    return checkbox1 || checkbox2 || checkbox3;
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return LayoutBuilder(
          builder: (BuildContext ctx, BoxConstraints constraints) {
        if (constraints.maxWidth >= 850) {
          return SingleChildScrollView(
              child: Container(
            height: 100.h,
            width: 300.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Color.fromRGBO(255, 255, 255, 0.925),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 90,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(75, 61, 82, 1),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: 80, top: 20),
                          child: Text('Payments',
                              style: BookingHistoryText.helvetica40),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(4.w, 12.h, 4.w, 2.h),
                  child: Column(
                    children: [
                      ElevationContainer(
                        child: Scrollbar(
                          controller: _scrollController1,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            controller: _scrollController1,
                            child: Container(
                              width: 1070,
                              height:
                                  100, // Increased height to accommodate button
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    'Booking ID  XXXXX',
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontFamily: 'SFProText',
                                        color: Color.fromRGBO(92, 86, 86, 1)),
                                  ),
                                  Text(
                                    'Booking Value : SAR xxxxxx',
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontFamily: 'SFProText',
                                        color:
                                            Color.fromRGBO(149, 143, 143, 1)),
                                  ),
                                  Text(
                                    'Paid : SAR xxxxx',
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontFamily: 'SFProText',
                                        color:
                                            Color.fromRGBO(149, 143, 143, 1)),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Balance',
                                        style: TextStyle(
                                            fontSize: 17.0,
                                            fontFamily: 'SFProText'),
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          // Add your button functionality here
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              Color.fromRGBO(98, 105, 254, 1),
                                          foregroundColor: Colors.white,
                                          minimumSize: Size(200, 35),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                        ),
                                        child: Text('XXXXX SAR',
                                            style: TextStyle(
                                                fontSize: 17.0,
                                                fontFamily: 'SFProText')),
                                      ),
                                    ],
                                  )
                                ],
                              ),

                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                border: Border.all(
                                  color: Color.fromRGBO(112, 112, 112, 1)
                                      .withOpacity(0.3),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 50),
                      StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                        stream: _currentStream,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(child: CircularProgressIndicator());
                          } else if (snapshot.hasError) {
                            return Center(
                                child: Text('Error: ${snapshot.error}'));
                          } else if (!snapshot.hasData ||
                              snapshot.data!.docs.isEmpty) {
                            return Center(
                                child: Text("You haven't done any bookings"));
                          } else {
                            // Map documents to SingleUser objects
                            List<SingleUserBooking> blueSingleUsers = snapshot
                                .data!.docs
                                .map((doc) =>
                                    SingleUserBooking.fromSnapshot(doc))
                                .toList();

                            return ElevationContainer(
                              //width:300; // Set width to match screen width

                              child: Scrollbar(
                                controller: _scrollController2,
                                thumbVisibility: true,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  controller: _scrollController2,
                                  child: Container(
                                    height: 340,
                                    width: 1070,
                                    child: DataTable(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(8),
                                            bottomRight: Radius.circular(8)),
                                        border: Border.all(
                                          color:
                                              Color.fromRGBO(112, 112, 112, 1)
                                                  .withOpacity(0.3),
                                        ),
                                      ),
                                      headingRowColor: MaterialStateColor
                                          .resolveWith((states) =>
                                              Color.fromRGBO(75, 61, 82, 1)),
                                      dividerThickness: 1.0,
                                      dataRowHeight: 65,
                                      headingRowHeight: 70,
                                      columns: DataSource.getColumns(context),
                                      rows: blueSingleUsers.map((user) {
                                        return DataRow(
                                          cells: DataSource.getCells(user),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ));
        } else {
          return SingleChildScrollView(
              child: Container(
            height: 100.h,
            width: 300.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Color.fromRGBO(255, 255, 255, 0.925),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 90,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(75, 61, 82, 1),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: 80, top: 20),
                          child: Text('Payments',
                              style: BookingHistoryText.helvetica40),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(4.w, 12.h, 4.w, 2.h),
                  child: Column(
                    children: [
                      ElevationContainer(
                        child: Scrollbar(
                          controller: _scrollController1,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            controller: _scrollController1,
                            child: Container(
                              width: 1070,
                              height:
                                  100, // Increased height to accommodate button
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    'Booking ID  XXXXX',
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontFamily: 'SFProText',
                                        color: Color.fromRGBO(92, 86, 86, 1)),
                                  ),
                                  Text(
                                    'Booking Value : SAR xxxxxx',
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontFamily: 'SFProText',
                                        color:
                                            Color.fromRGBO(149, 143, 143, 1)),
                                  ),
                                  Text(
                                    'Paid : SAR xxxxx',
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontFamily: 'SFProText',
                                        color:
                                            Color.fromRGBO(149, 143, 143, 1)),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Balance',
                                        style: TextStyle(
                                            fontSize: 17.0,
                                            fontFamily: 'SFProText'),
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          // Add your button functionality here
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              Color.fromRGBO(98, 105, 254, 1),
                                          foregroundColor: Colors.white,
                                          minimumSize: Size(200, 35),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                        ),
                                        child: Text('XXXXX SAR',
                                            style: TextStyle(
                                                fontSize: 17.0,
                                                fontFamily: 'SFProText')),
                                      ),
                                    ],
                                  )
                                ],
                              ),

                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                border: Border.all(
                                  color: Color.fromRGBO(112, 112, 112, 1)
                                      .withOpacity(0.3),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 50),
                      ElevationContainer(
                        //width:300; // Set width to match screen width

                        child: Scrollbar(
                          controller: _scrollController2,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            controller: _scrollController2,
                            child: SizedBox(
                              width: 1070,
                              child: DataTable(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(8),
                                      bottomRight: Radius.circular(8)),
                                  border: Border.all(
                                    color: Color.fromRGBO(112, 112, 112, 1)
                                        .withOpacity(0.3),
                                  ),
                                ),
                                headingRowColor: MaterialStateColor.resolveWith(
                                    (states) => Color.fromRGBO(75, 61, 82, 1)),
                                dividerThickness: 1.0,
                                dataRowHeight: 65,
                                headingRowHeight: 70,
                                columns: <DataColumn>[
                                  DataColumn(
                                      label: Expanded(
                                          child: Text(
                                    'Mode',
                                    style: BookingHistoryText.sfpro20white,
                                    textAlign: TextAlign.center,
                                  ))),
                                  DataColumn(
                                      label: Expanded(
                                          child: Text(
                                    'Booking ID',
                                    style: BookingHistoryText.sfpro20white,
                                    textAlign: TextAlign.center,
                                  ))),
                                  DataColumn(
                                      label: Expanded(
                                          child: Text(
                                    'Date',
                                    style: BookingHistoryText.sfpro20white,
                                    textAlign: TextAlign.center,
                                  ))),
                                  DataColumn(
                                      label: Expanded(
                                          child: Text(
                                    'Unit Type',
                                    style: BookingHistoryText.sfpro20white,
                                    textAlign: TextAlign.center,
                                  ))),
                                  DataColumn(
                                      label: Expanded(
                                          child: Text(
                                    'Payment',
                                    style: BookingHistoryText.sfpro20white,
                                    textAlign: TextAlign.center,
                                  ))),
                                  DataColumn(
                                      label: Expanded(
                                          child: Text(
                                    'Payment Status',
                                    style: BookingHistoryText.sfpro20white,
                                    textAlign: TextAlign.center,
                                  ))),
                                ],
                                rows: <DataRow>[
                                  DataRow(
                                    cells: <DataCell>[
                                      for (var item in [
                                        'Trip',
                                        '#456789231',
                                        '18.2.2022',
                                        'Box truck',
                                        'XXXX SAR',
                                        'Completed'
                                      ])
                                        DataCell(
                                          Container(
                                            height:
                                                65, // Adjust height as needed
                                            alignment: Alignment.center,
                                            child: Text(item,
                                                style: BookingHistoryText
                                                    .sfpro20black),
                                          ),
                                        ),
                                    ],
                                  ),
                                  DataRow(
                                    cells: <DataCell>[
                                      for (var item in [
                                        'Bus Trip',
                                        '#456789231',
                                        '13.6.2022',
                                        'Sleeper',
                                        'XXXX SAR',
                                        'Completed'
                                      ])
                                        DataCell(
                                          Container(
                                            height:
                                                65, // Adjust height as needed
                                            alignment: Alignment.center,
                                            child: Text(item,
                                                style: BookingHistoryText
                                                    .sfpro20black),
                                          ),
                                        ),
                                    ],
                                  ),
                                  DataRow(
                                    cells: <DataCell>[
                                      for (var item in [
                                        'Equipment hire',
                                        '#456789231',
                                        '12.5.2022',
                                        'Crane',
                                        'XXXX SAR',
                                        'Completed'
                                      ])
                                        DataCell(
                                          Container(
                                            height:
                                                65, // Adjust height as needed
                                            alignment: Alignment.center,
                                            child: Text(item,
                                                style: BookingHistoryText
                                                    .sfpro20black),
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
                    ],
                  ),
                ),
              ],
            ),
          ));
        }
      });
    });
  }

  DataTable _booking1Table() {
    return DataTable(
        columnSpacing: 15,
        dataRowHeight: 65,
        columns: _booking1Columns(),
        rows: _booking1Rows());
  }

  List<DataColumn> _booking1Columns() {
    return [
      DataColumn(label: SizedBox(), numeric: true),
    ];
  }

  // List<DataRow> _createRows() {
  //   return _books
  //       .map((book) => DataRow(cells: [
  //             DataCell(Text('#' + book['id'].toString())),
  //             DataCell(Text(book['title'])),
  //             DataCell(Text(book['author']))
  //           ]))
  //       .toList();
  // }
  List<DataRow> _booking1Rows() {
    return [
      DataRow(cells: [
        DataCell(
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 35,
                      height: 35,
                      child: CircleAvatar(
                        backgroundColor: Color.fromRGBO(230, 228, 238, 1),
                      ),
                    ),
                    SizedBox(
                      width: 1.w,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Trip 1', style: TabelText.text1),
                        SizedBox(height: 3),
                        Text("18.02.2022", style: TabelText.text2),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                        width: 60,
                        child: Text('Truck',
                            textAlign: TextAlign.center,
                            style: TabelText.text2)),
                    SizedBox(
                      width: 1.w,
                    ),
                    ViewButton(
                      text: 'View',
                      onPressed: () {},
                      colors: Color.fromRGBO(245, 243, 255, 1),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ]),
      DataRow(cells: [
        DataCell(
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 35,
                      height: 35,
                      child: CircleAvatar(
                        backgroundColor: Color.fromRGBO(230, 228, 238, 1),
                      ),
                    ),
                    SizedBox(
                      width: 1.w,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Equipment Hire', style: TabelText.text1),
                        SizedBox(height: 3),
                        Text("10.02.2022", style: TabelText.text2),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                        width: 60,
                        child: Text('Heavy Equipment',
                            textAlign: TextAlign.center,
                            style: TabelText.text2)),
                    SizedBox(
                      width: 1.w,
                    ),
                    ViewButton(
                      text: 'View',
                      onPressed: () {},
                      colors: Color.fromRGBO(245, 243, 255, 1),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ]),
      DataRow(cells: [
        DataCell(
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 35,
                      height: 35,
                      child: CircleAvatar(
                        backgroundColor: Color.fromRGBO(230, 228, 238, 1),
                      ),
                    ),
                    SizedBox(
                      width: 1.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Fletch Skinner', style: TabelText.text1),
                        SizedBox(height: 3),
                        Text("07.02.2022", style: TabelText.text2),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                        width: 60,
                        child: Text('Trailer',
                            textAlign: TextAlign.center,
                            style: TabelText.text2)),
                    SizedBox(
                      width: 1.w,
                    ),
                    ViewButton(
                      text: 'View',
                      onPressed: () {},
                      colors: Color.fromRGBO(245, 243, 255, 1),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ]),
    ];
  }

  DataTable _pendingbookTable() {
    return DataTable(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.white,
            Color.fromRGBO(245, 243, 255, 1),
            Color.fromRGBO(245, 243, 255, 1),
            Color.fromRGBO(245, 243, 255, 1),
          ], stops: [
            0.4,
            0.4,
            0.4,
            0.4
          ], begin: Alignment.centerLeft, end: Alignment.centerRight),
        ),
        columnSpacing: 0,
        dataRowHeight: 65,
        headingRowHeight: 0,
        columns: _pendingbookColumns(),
        dividerThickness: 1,
        rows: _pendingbookRows());
  }

  List<DataColumn> _pendingbookColumns() {
    return [
      DataColumn(label: SizedBox(), numeric: false),
      DataColumn(
          label: SizedBox(
            width: 140,
          ),
          numeric: true),
      DataColumn(
          label: SizedBox(
            width: 140,
          ),
          numeric: true),
      DataColumn(
          label: SizedBox(
            width: 130,
          ),
          numeric: true),
    ];
  }

  // List<DataRow> _createRows() {
  //   return _books
  //       .map((book) => DataRow(cells: [
  //             DataCell(Text('#' + book['id'].toString())),
  //             DataCell(Text(book['title'])),
  //             DataCell(Text(book['author']))
  //           ]))
  //       .toList();
  // }
  List<DataRow> _pendingbookRows() {
    return [
      DataRow(cells: [
        DataCell(
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: Row(
              children: [
                SizedBox(
                  width: 35,
                  height: 35,
                  child: CircleAvatar(
                    backgroundColor: Color.fromRGBO(230, 228, 238, 1),
                  ),
                ),
                SizedBox(
                  width: 1.w,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Truck', style: TabelText.text1),
                    SizedBox(height: 3),
                    Text("Booking ID XXXXXX", style: TabelText.text2),
                  ],
                ),
              ],
            ),
          ),
        ),
        DataCell(
          ColorContainer(
            text1: 'Vendor 3',
            text2: 'Xxxxx SAR',
            colors: Color.fromRGBO(200, 251, 253, 1),
          ),
        ),
        DataCell(
          ColorContainer(
            text1: 'Vendor 2',
            text2: 'Xxxxx SAR',
            colors: Color.fromRGBO(224, 253, 200, 1),
          ),
        ),
        DataCell(
          ColorContainer(
            text1: 'Vendor 3',
            text2: 'Xxxxx SAR',
            colors: Color.fromRGBO(245, 253, 200, 1),
          ),
        ),
      ]),
      DataRow(cells: [
        DataCell(
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: Row(
              children: [
                SizedBox(
                  width: 35,
                  height: 35,
                  child: CircleAvatar(
                    backgroundColor: Color.fromRGBO(230, 228, 238, 1),
                  ),
                ),
                SizedBox(
                  width: 1.w,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Equipment Hire', style: TabelText.text1),
                    SizedBox(height: 3),
                    Text("Booking ID XXXXXX", style: TabelText.text2),
                  ],
                ),
              ],
            ),
          ),
        ),
        DataCell(
          ColorContainer(
            text1: 'Vendor 3',
            text2: 'Xxxxx SAR',
            colors: Color.fromRGBO(200, 251, 253, 1),
          ),
        ),
        DataCell(
          ColorContainer(
            text1: 'Vendor 2',
            text2: 'Xxxxx SAR',
            colors: Color.fromRGBO(224, 253, 200, 1),
          ),
        ),
        DataCell(
          ColorContainer(
            text1: 'Vendor 3',
            text2: 'Xxxxx SAR',
            colors: Color.fromRGBO(245, 253, 200, 1),
          ),
        ),
      ]),
      DataRow(cells: [
        DataCell(
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: Row(
              children: [
                SizedBox(
                  width: 35,
                  height: 35,
                  child: CircleAvatar(
                    backgroundColor: Color.fromRGBO(230, 228, 238, 1),
                  ),
                ),
                SizedBox(
                  width: 1.w,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Bus Trip', style: TabelText.text1),
                    SizedBox(height: 3),
                    Text("Booking ID XXXXXX", style: TabelText.text2),
                  ],
                ),
              ],
            ),
          ),
        ),
        DataCell(
          ColorContainer(
            text1: 'Vendor 3',
            text2: 'Xxxxx SAR',
            colors: Color.fromRGBO(200, 251, 253, 1),
          ),
        ),
        DataCell(
          ColorContainer(
            text1: 'Vendor 2',
            text2: 'Xxxxx SAR',
            colors: Color.fromRGBO(224, 253, 200, 1),
          ),
        ),
        DataCell(
          ColorContainer(
            text1: 'Vendor 3',
            text2: 'Xxxxx SAR',
            colors: Color.fromRGBO(245, 253, 200, 1),
          ),
        ),
      ]),
    ];
  }
}

class DataSource extends DataTableSource {
  final List<SingleUserBooking> candidates;
  final BuildContext context;
  final Function(SingleUserBooking) onSelect;

  DataSource(this.candidates, {required this.context, required this.onSelect});

  @override
  DataRow? getRow(int index) {
    final e = candidates[index];

    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(Text(e.truck?.toString() ?? 'nill')),
        DataCell(Text('#623832623')),
        DataCell(Text('14.02.2024')),
        DataCell(Text(e.load.toString())),
        DataCell(Text(e.size?.toString() ?? 'nill')),
        DataCell(Text(e.size?.toString() ?? 'nill')),
      ],
    );
  }

  static List<DataColumn> getColumns(BuildContext context) {
    return [
      DataColumn(
          label: Text(
        'Mode',
        style: BookingHistoryText.sfpro20white,
        textAlign: TextAlign.center,
      )),
      DataColumn(
          label: Text(
        'Booking ID',
        style: BookingHistoryText.sfpro20white,
        textAlign: TextAlign.center,
      )),
      DataColumn(
          label: Text(
        'Date',
        style: BookingHistoryText.sfpro20white,
        textAlign: TextAlign.center,
      )),
      DataColumn(
          label: Text(
        'Unit Type',
        style: BookingHistoryText.sfpro20white,
        textAlign: TextAlign.center,
      )),
      DataColumn(
          label: Text(
        'Payment',
        style: BookingHistoryText.sfpro20white,
        textAlign: TextAlign.center,
      )),
      DataColumn(
          label: Text(
        'Payment Status',
        style: BookingHistoryText.sfpro20white,
        textAlign: TextAlign.center,
      )),
    ];
  }

  static List<DataCell> getCells(SingleUserBooking user) {
    return [
      DataCell(Text(user.truck?.toString() ?? 'nill')),
      DataCell(Text('#623832623')),
      DataCell(Text(user.date?.toString() ?? 'nill')),
      DataCell(Text(user.load.toString())),
      DataCell(Text(user.size?.toString() ?? 'nill')),
      DataCell(Text(user.size?.toString() ?? 'nill')),
    ];
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => candidates.length;

  @override
  int get selectedRowCount => 0;
}
