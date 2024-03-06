import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/Widgets/customButton.dart';
import 'package:sizer/sizer.dart';

import '../Widgets/formText.dart';
import '../homepage.dart';

class Bookings extends StatefulWidget {
  Bookings();
  @override
  State<Bookings> createState() => _BookingsState();
}

class _BookingsState extends State<Bookings> {
  final ScrollController _book1Scroll = ScrollController();
  final ScrollController _book2Scroll = ScrollController();
  final ScrollController _book3Scroll = ScrollController();
  final ScrollController _scrollController = ScrollController();
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
                child: Scrollbar(
                  controller: _scrollController,
                  thumbVisibility: true,
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      width: 1200,
                      padding: EdgeInsets.fromLTRB(35, 5.h, 35, 3.h),
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Expanded(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(0),
                                          topRight: Radius.circular(0),
                                          bottomLeft: Radius.circular(12),
                                          bottomRight: Radius.circular(12)),
                                    ),
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 55,
                                          color: Color.fromRGBO(
                                              75, 61, 82, 1), // Brown color
                                          child: Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                1.5.w, 1.5.h, 1.5.w, 1.5.h),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text('Booking 1',
                                                    style:
                                                        TabelText.headerText),
                                                Text("Booking iD XXXXXX",
                                                    style: TabelText.text3),
                                              ],
                                            ),
                                          ),
                                        ),
                                        // Add spacing between the brown container and the white container

                                        Padding(
                                          padding: EdgeInsets.fromLTRB(
                                              1.w, 2.h, 1.w, 1.h),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  SizedBox(
                                                      width: 35,
                                                      height: 35,
                                                      child: SizedBox(
                                                          width: 35,
                                                          height: 35,
                                                          child:
                                                              CircleAvatar())),
                                                  SizedBox(
                                                    width: 1.w,
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text('Truck',
                                                          style:
                                                              TabelText.text1),
                                                      SizedBox(
                                                        height: 3,
                                                      ),
                                                      Text(
                                                        "Truck no ******",
                                                        style: TabelText.text2,
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              ViewButton(
                                                text: 'View',
                                                onPressed: () {},
                                                colors: Color.fromRGBO(
                                                    98, 106, 254, 1),
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 1184,
                                          child: Divider(
                                            color: Color.fromRGBO(
                                                206, 203, 203, 1),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.fromLTRB(
                                              1.w, 1.h, 1.w, 1.h),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  SizedBox(
                                                      width: 35,
                                                      height: 35,
                                                      child: CircleAvatar()),
                                                  SizedBox(
                                                    width: 1.w,
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text('Pick Up Location',
                                                          style:
                                                              TabelText.text1),
                                                      SizedBox(
                                                        height: 3,
                                                      ),
                                                      Text(
                                                        "Destination Location",
                                                        style: TabelText.text2,
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              ViewButton(
                                                text: 'Edit',
                                                onPressed: () {},
                                                colors: Color.fromRGBO(
                                                    98, 106, 254, 1),
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 1184,
                                          child: Divider(
                                            color: Color.fromRGBO(
                                                206, 203, 203, 1),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.fromLTRB(
                                              1.w, 1.h, 1.w, 2.h),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  SizedBox(
                                                      width: 35,
                                                      height: 35,
                                                      child: CircleAvatar()),
                                                  SizedBox(
                                                    width: 1.w,
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text('Balance Amount',
                                                          style:
                                                              TabelText.text1),
                                                      SizedBox(
                                                        height: 3,
                                                      ),
                                                      Text(
                                                        "07.02.2022",
                                                        style: TabelText.text2,
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              ViewButton(
                                                text: 'Pay',
                                                onPressed: () {},
                                                colors: Color.fromRGBO(
                                                    98, 106, 254, 1),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 4.5.w,
                                ),
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(0),
                                          topRight: Radius.circular(0),
                                          bottomLeft: Radius.circular(12),
                                          bottomRight: Radius.circular(12)),
                                    ),
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 55,
                                          color: Color.fromRGBO(
                                              75, 61, 82, 1), // Brown color
                                          child: Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                1.5.w, 1.5.h, 1.5.w, 1.5.h),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text('Booking 1',
                                                    style:
                                                        TabelText.headerText),
                                                Text("Booking iD XXXXXX",
                                                    style: TabelText.text3),
                                              ],
                                            ),
                                          ),
                                        ),
                                        // Add spacing between the brown container and the white container

                                        Padding(
                                          padding: EdgeInsets.fromLTRB(
                                              1.w, 2.h, 1.w, 1.h),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  SizedBox(
                                                      width: 35,
                                                      height: 35,
                                                      child: SizedBox(
                                                          width: 35,
                                                          height: 35,
                                                          child:
                                                              CircleAvatar())),
                                                  SizedBox(
                                                    width: 1.w,
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text('Truck',
                                                          style:
                                                              TabelText.text1),
                                                      SizedBox(
                                                        height: 3,
                                                      ),
                                                      Text(
                                                        "Truck no ******",
                                                        style: TabelText.text2,
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              ViewButton(
                                                text: 'View',
                                                onPressed: () {},
                                                colors: Color.fromRGBO(
                                                    98, 106, 254, 1),
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 1184,
                                          child: Divider(
                                            color: Color.fromRGBO(
                                                206, 203, 203, 1),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.fromLTRB(
                                              1.w, 1.h, 1.w, 1.h),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  SizedBox(
                                                      width: 35,
                                                      height: 35,
                                                      child: CircleAvatar()),
                                                  SizedBox(
                                                    width: 1.w,
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text('Pick Up Location',
                                                          style:
                                                              TabelText.text1),
                                                      SizedBox(
                                                        height: 3,
                                                      ),
                                                      Text(
                                                        "Destination Location",
                                                        style: TabelText.text2,
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              ViewButton(
                                                text: 'Edit',
                                                onPressed: () {},
                                                colors: Color.fromRGBO(
                                                    98, 106, 254, 1),
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 1184,
                                          child: Divider(
                                            color: Color.fromRGBO(
                                                206, 203, 203, 1),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.fromLTRB(
                                              1.w, 1.h, 1.w, 2.h),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  SizedBox(
                                                      width: 35,
                                                      height: 35,
                                                      child: CircleAvatar()),
                                                  SizedBox(
                                                    width: 1.w,
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text('Balance Amount',
                                                          style:
                                                              TabelText.text1),
                                                      SizedBox(
                                                        height: 3,
                                                      ),
                                                      Text(
                                                        "07.02.2022",
                                                        style: TabelText.text2,
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              ViewButton(
                                                text: 'Pay',
                                                onPressed: () {},
                                                colors: Color.fromRGBO(
                                                    98, 106, 254, 1),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 4.5.w,
                                ),
                                Container(
                                  width: 200,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(0),
                                        topRight: Radius.circular(0),
                                        bottomLeft: Radius.circular(12),
                                        bottomRight: Radius.circular(12)),
                                  ),
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 55,

                                        color: Color.fromRGBO(
                                            75, 61, 82, 1), // Brown color
                                        child: Center(
                                          child: Text('New Booking',
                                              style: TabelText.headerText),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  MyHomePage(),
                                            ),
                                          );
                                        },
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Container(
                                            height: 195,
                                            child: Image.asset(
                                              color: Color.fromRGBO(
                                                  225, 225, 225, 1),
                                              'add.png',
                                              width: 60,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 4.h,
                            ),
                            Scrollbar(
                              controller: _book3Scroll,
                              thumbVisibility:
                                  true, // Set to true to always show the scrollbar
                              child: SingleChildScrollView(
                                controller: _book3Scroll,
                                scrollDirection: Axis.horizontal,
                                child: Container(
                                  width: 1150,
                                  height: 210,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  child: ListView(
                                    children: [_createDataTable()],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        } else {
          return Expanded(
            child: Container(
              color: Color.fromRGBO(255, 255, 255, 200),
              padding: EdgeInsets.fromLTRB(3.w, 1.5.h, 3.w, 1.5.h),
              child: Container(
                height: 100.h,
                padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Scrollbar(
                        controller: _book1Scroll,
                        thumbVisibility:
                            true, // Set to true to always show the scrollbar
                        child: SingleChildScrollView(
                          controller: _book1Scroll,
                          scrollDirection: Axis.horizontal,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(0),
                                  topRight: Radius.circular(0),
                                  bottomLeft: Radius.circular(12),
                                  bottomRight: Radius.circular(12)),
                            ),
                            width: 800,
                            child: Column(
                              children: [
                                Container(
                                  height: 55,
                                  color: Color.fromRGBO(
                                      75, 61, 82, 1), // Brown color
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        1.5.w, 1.5.h, 1.5.w, 1.5.h),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Booking 1',
                                            style: TabelText.headerText),
                                        Text("Booking iD XXXXXX",
                                            style: TabelText.text3),
                                      ],
                                    ),
                                  ),
                                ),
                                // Add spacing between the brown container and the white container

                                Padding(
                                  padding:
                                      EdgeInsets.fromLTRB(4.w, 2.h, 4.w, 1.h),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(
                                              width: 35,
                                              height: 35,
                                              child: CircleAvatar()),
                                          SizedBox(
                                            width: 1.w,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text('Truck',
                                                  style: TabelText.text1),
                                              SizedBox(
                                                height: 3,
                                              ),
                                              Text(
                                                "Truck no ******",
                                                style: TabelText.text2,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      ViewButton(
                                        text: 'View',
                                        onPressed: () {},
                                        colors: Color.fromRGBO(98, 106, 254, 1),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 1184,
                                  child: Divider(
                                    color: Color.fromRGBO(206, 203, 203, 1),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.fromLTRB(4.w, 1.h, 4.w, 1.h),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(
                                              width: 35,
                                              height: 35,
                                              child: CircleAvatar()),
                                          SizedBox(
                                            width: 1.w,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text('Pick Up Location',
                                                  style: TabelText.text1),
                                              SizedBox(
                                                height: 3,
                                              ),
                                              Text(
                                                "Destination Location",
                                                style: TabelText.text2,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      ViewButton(
                                        text: 'Edit',
                                        onPressed: () {},
                                        colors: Color.fromRGBO(98, 106, 254, 1),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 1184,
                                  child: Divider(
                                    color: Color.fromRGBO(206, 203, 203, 1),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.fromLTRB(4.w, 1.h, 4.w, 2.h),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(
                                              width: 35,
                                              height: 35,
                                              child: CircleAvatar()),
                                          SizedBox(
                                            width: 1.w,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text('Balance Amount',
                                                  style: TabelText.text1),
                                              SizedBox(
                                                height: 3,
                                              ),
                                              Text(
                                                "07.02.2022",
                                                style: TabelText.text2,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      ViewButton(
                                        text: 'Pay',
                                        onPressed: () {},
                                        colors: Color.fromRGBO(98, 106, 254, 1),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      Scrollbar(
                        controller: _book2Scroll,
                        thumbVisibility:
                            true, // Set to true to always show the scrollbar
                        child: SingleChildScrollView(
                          controller: _book2Scroll,
                          scrollDirection: Axis.horizontal,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(0),
                                  topRight: Radius.circular(0),
                                  bottomLeft: Radius.circular(12),
                                  bottomRight: Radius.circular(12)),
                            ),
                            width: 800,
                            child: Column(
                              children: [
                                Container(
                                  height: 55,
                                  color: Color.fromRGBO(
                                      75, 61, 82, 1), // Brown color
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        1.5.w, 1.5.h, 1.5.w, 1.5.h),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Booking 1',
                                            style: TabelText.headerText),
                                        Text("Booking iD XXXXXX",
                                            style: TabelText.text3),
                                      ],
                                    ),
                                  ),
                                ),
                                // Add spacing between the brown container and the white container

                                Padding(
                                  padding:
                                      EdgeInsets.fromLTRB(4.w, 2.h, 4.w, 1.h),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(
                                              width: 35,
                                              height: 35,
                                              child: SizedBox(
                                                  width: 35,
                                                  height: 35,
                                                  child: CircleAvatar())),
                                          SizedBox(
                                            width: 1.w,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text('Truck',
                                                  style: TabelText.text1),
                                              SizedBox(
                                                height: 3,
                                              ),
                                              Text(
                                                "Truck no ******",
                                                style: TabelText.text2,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      ViewButton(
                                        text: 'View',
                                        onPressed: () {},
                                        colors: Color.fromRGBO(98, 106, 254, 1),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 1184,
                                  child: Divider(
                                    color: Color.fromRGBO(206, 203, 203, 1),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.fromLTRB(4.w, 1.h, 4.w, 1.h),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(
                                              width: 35,
                                              height: 35,
                                              child: CircleAvatar()),
                                          SizedBox(
                                            width: 1.w,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text('Pick Up Location',
                                                  style: TabelText.text1),
                                              SizedBox(
                                                height: 3,
                                              ),
                                              Text(
                                                "Destination Location",
                                                style: TabelText.text2,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      ViewButton(
                                        text: 'Edit',
                                        onPressed: () {},
                                        colors: Color.fromRGBO(98, 106, 254, 1),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 1184,
                                  child: Divider(
                                    color: Color.fromRGBO(206, 203, 203, 1),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.fromLTRB(4.w, 1.h, 4.w, 2.h),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(
                                              width: 35,
                                              height: 35,
                                              child: CircleAvatar()),
                                          SizedBox(
                                            width: 1.w,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text('Balance Amount',
                                                  style: TabelText.text1),
                                              SizedBox(
                                                height: 3,
                                              ),
                                              Text(
                                                "07.02.2022",
                                                style: TabelText.text2,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      ViewButton(
                                        text: 'Pay',
                                        onPressed: () {},
                                        colors: Color.fromRGBO(98, 106, 254, 1),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(0),
                              topRight: Radius.circular(0),
                              bottomLeft: Radius.circular(12),
                              bottomRight: Radius.circular(12)),
                        ),
                        child: Column(
                          children: [
                            Container(
                              height: 55,

                              color:
                                  Color.fromRGBO(75, 61, 82, 1), // Brown color
                              child: Center(
                                child: Text('New Booking',
                                    style: TabelText.headerText),
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
                              child: Align(
                                alignment: Alignment.center,
                                child: Container(
                                  height: 195,
                                  child: Image.asset(
                                    color: Color.fromRGBO(225, 225, 225, 1),
                                    'add.png',
                                    width: 60,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      Scrollbar(
                        controller: _book3Scroll,
                        thumbVisibility:
                            true, // Set to true to always show the scrollbar
                        child: SingleChildScrollView(
                          controller: _book3Scroll,
                          scrollDirection: Axis.horizontal,
                          child: Container(
                            width: 800,
                            height: 230,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: ListView(
                              children: [_createDataTable()],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
      });
    });
  }

  DataTable _createDataTable() {
    return DataTable(
        headingRowHeight: 55,
        headingRowColor: MaterialStateColor.resolveWith(
          (states) => Color.fromRGBO(75, 61, 82, 1),
        ),
        columns: _createColumns(),
        rows: _createRows());
  }

  List<DataColumn> _createColumns() {
    return [
      DataColumn(label: Text('Booking ID', style: TabelText.headerText)),
      DataColumn(label: Text('Mode', style: TabelText.headerText)),
      DataColumn(label: Text('Booking Type', style: TabelText.headerText)),
      DataColumn(label: Text('Vendor', style: TabelText.headerText)),
      DataColumn(label: Text('Payment Status', style: TabelText.headerText)),
      DataColumn(label: Text('Status', style: TabelText.headerText)),
      DataColumn(label: Text('Actions', style: TabelText.headerText)),
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
  List<DataRow> _createRows() {
    return [
      DataRow(cells: [
        DataCell(Text('NAQBOOK***', style: TabelText.tableText)),
        DataCell(Text('Truck', style: TabelText.tableText)),
        DataCell(Text('Single', style: TabelText.tableText)),
        DataCell(Text('Vendor', style: TabelText.tableText)),
        DataCell(Text('Bal XXXX', style: TabelText.tableText)),
        DataCell(
          Center(
            child: Image.asset(
              'Group268.png',
              width: 50,
              height: 30,
            ),
          ),
        ),
        DataCell(
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(),
                  onPressed: null,
                  icon: Icon(
                    Icons.edit_document,
                    color: Color.fromRGBO(74, 60, 81, 1),
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
      DataRow(cells: [
        DataCell(Text('NAQBOOK***', style: TabelText.tableText)),
        DataCell(Text('Truck', style: TabelText.tableText)),
        DataCell(Text('Single', style: TabelText.tableText)),
        DataCell(Text('Vendor', style: TabelText.tableText)),
        DataCell(Text('Bal XXXX', style: TabelText.tableText)),
        DataCell(
          Center(
            child: Image.asset(
              'Group268.png',
              width: 50,
              height: 30,
            ),
          ),
        ),
        DataCell(
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(),
                  onPressed: null,
                  icon: Icon(
                    Icons.edit_document,
                    color: Color.fromRGBO(74, 60, 81, 1),
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
      DataRow(cells: [
        DataCell(Text('NAQBOOK***', style: TabelText.tableText)),
        DataCell(Text('Truck', style: TabelText.tableText)),
        DataCell(Text('Single', style: TabelText.tableText)),
        DataCell(Text('Vendor', style: TabelText.tableText)),
        DataCell(Text('Bal XXXX', style: TabelText.tableText)),
        DataCell(
          Center(
            child: Image.asset(
              'Group268.png',
              width: 50,
              height: 30,
            ),
          ),
        ),
        DataCell(
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(),
                  onPressed: null,
                  icon: Icon(
                    Icons.edit_document,
                    color: Color.fromRGBO(74, 60, 81, 1),
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
    ];
  }
}
