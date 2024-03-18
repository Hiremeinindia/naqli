// ignore_for_file: dead_code

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/Widgets/customButton.dart';
import 'package:flutter_application_1/Widgets/customTextField.dart';
import 'package:flutter_application_1/classes/language.dart';
import 'package:flutter_application_1/classes/language_constants.dart';
import 'package:sizer/sizer.dart';

import '../../Widgets/formText.dart';

class AvailableUnits extends StatefulWidget {
  const AvailableUnits({
    Key? key,
  }) : super(key: key);

  @override
  State<AvailableUnits> createState() => _AvailableUnitsState();
}

class _AvailableUnitsState extends State<AvailableUnits> {
  String _selectedValue = '1';
  String categoryValue = '1';
  String dropdownValues = 'None';
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return LayoutBuilder(
          builder: (BuildContext ctx, BoxConstraints constraints) {
        if (constraints.maxWidth >= 720) {
          return Scaffold(
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(75),
                child: Material(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(17.w, 0, 17.w, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          'naqlilogo.png',
                          height: 75,
                          width: 100,
                        ),
                        Row(
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: TextButton(
                                onPressed: () {
                                  // Handle the first button press
                                },
                                child: Text(
                                  'User',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: "Helvetica",
                                    color: Color.fromRGBO(112, 112, 112, 1),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                              child: VerticalDivider(
                                color: Color.fromRGBO(206, 203, 203, 1),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                // Handle the third button press
                              },
                              child: Text(
                                'Partner',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: "Helvetica",
                                  color: Color.fromRGBO(206, 203, 203, 1),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.notifications,
                              color: Color.fromRGBO(106, 102, 209, 1),
                            ),
                            Text("Contact Us ", style: TabelText.helvetica11),
                            SizedBox(
                              height: 20,
                              child: VerticalDivider(
                                color: Colors.black,
                              ),
                            ),
                            Text("Hello Customer!",
                                style: TabelText.helvetica11),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              body: SingleChildScrollView(
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          Column(
                            children: [
                              CarouselSlider(
                                options: CarouselOptions(
                                  height: 500,
                                ),
                                items: [
                                  Container(
                                    margin: EdgeInsets.all(6.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                      image: DecorationImage(
                                        image: AssetImage('truckslide.jpg'),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.all(6.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                      image: DecorationImage(
                                        image: AssetImage('truckslide.jpg'),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 450, right: 200, top: 200),
                                child: Container(
                                  height: 750,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                height: 40.h,
                                padding: EdgeInsets.all(16.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(1.0),
                                  color: Color.fromARGB(255, 232, 229,
                                      240), // Set the background color
                                ),
                              ),
                              Container(
                                height: 50,
                                color: Color.fromRGBO(13, 13, 255, 1),
                              ),
                            ],
                          ),
                          Positioned(
                            left: 20.w,
                            right: 20.w,
                            top: 80,
                            child: Container(
                              padding: EdgeInsets.fromLTRB(2.w, 6.h, 2.w, 6.h),
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      spreadRadius: 1,
                                      blurRadius:
                                          2, // changes position of shadow
                                    ),
                                  ],
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(25))),
                              height: 740,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(0, 0, 1.5.w, 0),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  padding: EdgeInsets.fromLTRB(
                                                      0.5.w, 0, 1.w, 0),
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Color.fromRGBO(
                                                            183, 183, 183, 1)),
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(8),
                                                      topRight:
                                                          Radius.circular(0),
                                                      bottomLeft:
                                                          Radius.circular(8),
                                                      bottomRight:
                                                          Radius.circular(0),
                                                    ),
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      Image.asset(
                                                        'delivery-truck.png',
                                                        width: 50,
                                                        height: 50,
                                                      ),
                                                      Text('Tralia')
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              DropdownButtonHideUnderline(
                                                child: DropdownButton2<String>(
                                                  value:
                                                      dropdownValues, // Use value from the list
                                                  items: <String>[
                                                    'Trigger Bookings',
                                                    'Booking Manager',
                                                    'Contract',
                                                    'None'
                                                  ].map<
                                                          DropdownMenuItem<
                                                              String>>(
                                                      (String value) {
                                                    return DropdownMenuItem<
                                                        String>(
                                                      value: value,
                                                      child: Text(
                                                        value,
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            fontFamily:
                                                                'SegoeItalic',
                                                            color:
                                                                Colors.black),
                                                      ),
                                                    );
                                                  }).toList(),
                                                  onChanged:
                                                      (String? newValue) {
                                                    setState(() {
                                                      dropdownValues =
                                                          newValue!; // Update value in the list
                                                    });
                                                  },
                                                  buttonStyleData:
                                                      ButtonStyleData(
                                                    height: 50,
                                                    width: 15.w,
                                                    padding: EdgeInsets.only(
                                                        left: 9, right: 9),
                                                    decoration: BoxDecoration(
                                                      border: Border(
                                                        bottom: BorderSide(
                                                            color:
                                                                Color.fromRGBO(
                                                                    183,
                                                                    183,
                                                                    183,
                                                                    1)),
                                                        right: BorderSide(
                                                            color:
                                                                Color.fromRGBO(
                                                                    183,
                                                                    183,
                                                                    183,
                                                                    1)),
                                                        top: BorderSide(
                                                            color:
                                                                Color.fromRGBO(
                                                                    183,
                                                                    183,
                                                                    183,
                                                                    1)),
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(0),
                                                        topRight:
                                                            Radius.circular(8),
                                                        bottomLeft:
                                                            Radius.circular(0),
                                                        bottomRight:
                                                            Radius.circular(8),
                                                      ),
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  iconStyleData:
                                                      const IconStyleData(
                                                    icon: Icon(
                                                      Icons
                                                          .arrow_drop_down_sharp,
                                                    ),
                                                    iconSize: 25,
                                                    iconEnabledColor:
                                                        Colors.black,
                                                    iconDisabledColor: null,
                                                  ),
                                                  dropdownStyleData:
                                                      DropdownStyleData(
                                                    elevation: 0,
                                                    maxHeight: 200,
                                                    padding: EdgeInsets.all(3),
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Color.fromRGBO(
                                                              112,
                                                              112,
                                                              112,
                                                              1)),
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(0),
                                                        topRight:
                                                            Radius.circular(0),
                                                        bottomLeft:
                                                            Radius.circular(5),
                                                        bottomRight:
                                                            Radius.circular(5),
                                                      ),
                                                      color: Colors.white,
                                                    ),
                                                    scrollPadding:
                                                        EdgeInsets.all(5),
                                                    scrollbarTheme:
                                                        ScrollbarThemeData(
                                                      thickness:
                                                          MaterialStateProperty
                                                              .all<double>(6),
                                                      thumbVisibility:
                                                          MaterialStateProperty
                                                              .all<bool>(true),
                                                    ),
                                                  ),
                                                  menuItemStyleData:
                                                      MenuItemStyleData(
                                                    height: 30,
                                                    padding: EdgeInsets.only(
                                                        left: 9, right: 9),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  padding: EdgeInsets.fromLTRB(
                                                      0.5.w, 0, 1.w, 0),
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Color.fromRGBO(
                                                            183, 183, 183, 1)),
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(8),
                                                      topRight:
                                                          Radius.circular(0),
                                                      bottomLeft:
                                                          Radius.circular(8),
                                                      bottomRight:
                                                          Radius.circular(0),
                                                    ),
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      Image.asset(
                                                        'delivery-truck.png',
                                                        width: 50,
                                                        height: 50,
                                                      ),
                                                      Text('Tralia')
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              DropdownButtonHideUnderline(
                                                child: DropdownButton2<String>(
                                                  value:
                                                      dropdownValues, // Use value from the list
                                                  items: <String>[
                                                    'Trigger Bookings',
                                                    'Booking Manager',
                                                    'Contract',
                                                    'None'
                                                  ].map<
                                                          DropdownMenuItem<
                                                              String>>(
                                                      (String value) {
                                                    return DropdownMenuItem<
                                                        String>(
                                                      value: value,
                                                      child: Text(
                                                        value,
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            fontFamily:
                                                                'SegoeItalic',
                                                            color:
                                                                Colors.black),
                                                      ),
                                                    );
                                                  }).toList(),
                                                  onChanged:
                                                      (String? newValue) {
                                                    setState(() {
                                                      dropdownValues =
                                                          newValue!; // Update value in the list
                                                    });
                                                  },
                                                  buttonStyleData:
                                                      ButtonStyleData(
                                                    height: 50,
                                                    width: 15.w,
                                                    padding: EdgeInsets.only(
                                                        left: 9, right: 9),
                                                    decoration: BoxDecoration(
                                                      border: Border(
                                                        bottom: BorderSide(
                                                            color:
                                                                Color.fromRGBO(
                                                                    183,
                                                                    183,
                                                                    183,
                                                                    1)),
                                                        right: BorderSide(
                                                            color:
                                                                Color.fromRGBO(
                                                                    183,
                                                                    183,
                                                                    183,
                                                                    1)),
                                                        top: BorderSide(
                                                            color:
                                                                Color.fromRGBO(
                                                                    183,
                                                                    183,
                                                                    183,
                                                                    1)),
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(0),
                                                        topRight:
                                                            Radius.circular(8),
                                                        bottomLeft:
                                                            Radius.circular(0),
                                                        bottomRight:
                                                            Radius.circular(8),
                                                      ),
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  iconStyleData:
                                                      const IconStyleData(
                                                    icon: Icon(
                                                      Icons
                                                          .arrow_drop_down_sharp,
                                                    ),
                                                    iconSize: 25,
                                                    iconEnabledColor:
                                                        Colors.black,
                                                    iconDisabledColor: null,
                                                  ),
                                                  dropdownStyleData:
                                                      DropdownStyleData(
                                                    elevation: 0,
                                                    maxHeight: 200,
                                                    padding: EdgeInsets.all(3),
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Color.fromRGBO(
                                                              112,
                                                              112,
                                                              112,
                                                              1)),
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(0),
                                                        topRight:
                                                            Radius.circular(0),
                                                        bottomLeft:
                                                            Radius.circular(5),
                                                        bottomRight:
                                                            Radius.circular(5),
                                                      ),
                                                      color: Colors.white,
                                                    ),
                                                    scrollPadding:
                                                        EdgeInsets.all(5),
                                                    scrollbarTheme:
                                                        ScrollbarThemeData(
                                                      thickness:
                                                          MaterialStateProperty
                                                              .all<double>(6),
                                                      thumbVisibility:
                                                          MaterialStateProperty
                                                              .all<bool>(true),
                                                    ),
                                                  ),
                                                  menuItemStyleData:
                                                      MenuItemStyleData(
                                                    height: 30,
                                                    padding: EdgeInsets.only(
                                                        left: 9, right: 9),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  padding: EdgeInsets.fromLTRB(
                                                      0.5.w, 0, 1.w, 0),
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Color.fromRGBO(
                                                            183, 183, 183, 1)),
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(8),
                                                      topRight:
                                                          Radius.circular(0),
                                                      bottomLeft:
                                                          Radius.circular(8),
                                                      bottomRight:
                                                          Radius.circular(0),
                                                    ),
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      Image.asset(
                                                        'delivery-truck.png',
                                                        width: 50,
                                                        height: 50,
                                                      ),
                                                      Text('Tralia')
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              DropdownButtonHideUnderline(
                                                child: DropdownButton2<String>(
                                                  value:
                                                      dropdownValues, // Use value from the list
                                                  items: <String>[
                                                    'Trigger Bookings',
                                                    'Booking Manager',
                                                    'Contract',
                                                    'None'
                                                  ].map<
                                                          DropdownMenuItem<
                                                              String>>(
                                                      (String value) {
                                                    return DropdownMenuItem<
                                                        String>(
                                                      value: value,
                                                      child: Text(
                                                        value,
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            fontFamily:
                                                                'SegoeItalic',
                                                            color:
                                                                Colors.black),
                                                      ),
                                                    );
                                                  }).toList(),
                                                  onChanged:
                                                      (String? newValue) {
                                                    setState(() {
                                                      dropdownValues =
                                                          newValue!; // Update value in the list
                                                    });
                                                  },
                                                  buttonStyleData:
                                                      ButtonStyleData(
                                                    height: 50,
                                                    width: 15.w,
                                                    padding: EdgeInsets.only(
                                                        left: 9, right: 9),
                                                    decoration: BoxDecoration(
                                                      border: Border(
                                                        bottom: BorderSide(
                                                            color:
                                                                Color.fromRGBO(
                                                                    183,
                                                                    183,
                                                                    183,
                                                                    1)),
                                                        right: BorderSide(
                                                            color:
                                                                Color.fromRGBO(
                                                                    183,
                                                                    183,
                                                                    183,
                                                                    1)),
                                                        top: BorderSide(
                                                            color:
                                                                Color.fromRGBO(
                                                                    183,
                                                                    183,
                                                                    183,
                                                                    1)),
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(0),
                                                        topRight:
                                                            Radius.circular(8),
                                                        bottomLeft:
                                                            Radius.circular(0),
                                                        bottomRight:
                                                            Radius.circular(8),
                                                      ),
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  iconStyleData:
                                                      const IconStyleData(
                                                    icon: Icon(
                                                      Icons
                                                          .arrow_drop_down_sharp,
                                                    ),
                                                    iconSize: 25,
                                                    iconEnabledColor:
                                                        Colors.black,
                                                    iconDisabledColor: null,
                                                  ),
                                                  dropdownStyleData:
                                                      DropdownStyleData(
                                                    elevation: 0,
                                                    maxHeight: 200,
                                                    padding: EdgeInsets.all(3),
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Color.fromRGBO(
                                                              112,
                                                              112,
                                                              112,
                                                              1)),
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(0),
                                                        topRight:
                                                            Radius.circular(0),
                                                        bottomLeft:
                                                            Radius.circular(5),
                                                        bottomRight:
                                                            Radius.circular(5),
                                                      ),
                                                      color: Colors.white,
                                                    ),
                                                    scrollPadding:
                                                        EdgeInsets.all(5),
                                                    scrollbarTheme:
                                                        ScrollbarThemeData(
                                                      thickness:
                                                          MaterialStateProperty
                                                              .all<double>(6),
                                                      thumbVisibility:
                                                          MaterialStateProperty
                                                              .all<bool>(true),
                                                    ),
                                                  ),
                                                  menuItemStyleData:
                                                      MenuItemStyleData(
                                                    height: 30,
                                                    padding: EdgeInsets.only(
                                                        left: 9, right: 9),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  padding: EdgeInsets.fromLTRB(
                                                      0.5.w, 0, 1.w, 0),
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Color.fromRGBO(
                                                            183, 183, 183, 1)),
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(8),
                                                      topRight:
                                                          Radius.circular(0),
                                                      bottomLeft:
                                                          Radius.circular(8),
                                                      bottomRight:
                                                          Radius.circular(0),
                                                    ),
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      Image.asset(
                                                        'delivery-truck.png',
                                                        width: 50,
                                                        height: 50,
                                                      ),
                                                      Text('Tralia')
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              DropdownButtonHideUnderline(
                                                child: DropdownButton2<String>(
                                                  value:
                                                      dropdownValues, // Use value from the list
                                                  items: <String>[
                                                    'Trigger Bookings',
                                                    'Booking Manager',
                                                    'Contract',
                                                    'None'
                                                  ].map<
                                                          DropdownMenuItem<
                                                              String>>(
                                                      (String value) {
                                                    return DropdownMenuItem<
                                                        String>(
                                                      value: value,
                                                      child: Text(
                                                        value,
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            fontFamily:
                                                                'SegoeItalic',
                                                            color:
                                                                Colors.black),
                                                      ),
                                                    );
                                                  }).toList(),
                                                  onChanged:
                                                      (String? newValue) {
                                                    setState(() {
                                                      dropdownValues =
                                                          newValue!; // Update value in the list
                                                    });
                                                  },
                                                  buttonStyleData:
                                                      ButtonStyleData(
                                                    height: 50,
                                                    width: 15.w,
                                                    padding: EdgeInsets.only(
                                                        left: 9, right: 9),
                                                    decoration: BoxDecoration(
                                                      border: Border(
                                                        bottom: BorderSide(
                                                            color:
                                                                Color.fromRGBO(
                                                                    183,
                                                                    183,
                                                                    183,
                                                                    1)),
                                                        right: BorderSide(
                                                            color:
                                                                Color.fromRGBO(
                                                                    183,
                                                                    183,
                                                                    183,
                                                                    1)),
                                                        top: BorderSide(
                                                            color:
                                                                Color.fromRGBO(
                                                                    183,
                                                                    183,
                                                                    183,
                                                                    1)),
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(0),
                                                        topRight:
                                                            Radius.circular(8),
                                                        bottomLeft:
                                                            Radius.circular(0),
                                                        bottomRight:
                                                            Radius.circular(8),
                                                      ),
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  iconStyleData:
                                                      const IconStyleData(
                                                    icon: Icon(
                                                      Icons
                                                          .arrow_drop_down_sharp,
                                                    ),
                                                    iconSize: 25,
                                                    iconEnabledColor:
                                                        Colors.black,
                                                    iconDisabledColor: null,
                                                  ),
                                                  dropdownStyleData:
                                                      DropdownStyleData(
                                                    elevation: 0,
                                                    maxHeight: 200,
                                                    padding: EdgeInsets.all(3),
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Color.fromRGBO(
                                                              112,
                                                              112,
                                                              112,
                                                              1)),
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(0),
                                                        topRight:
                                                            Radius.circular(0),
                                                        bottomLeft:
                                                            Radius.circular(5),
                                                        bottomRight:
                                                            Radius.circular(5),
                                                      ),
                                                      color: Colors.white,
                                                    ),
                                                    scrollPadding:
                                                        EdgeInsets.all(5),
                                                    scrollbarTheme:
                                                        ScrollbarThemeData(
                                                      thickness:
                                                          MaterialStateProperty
                                                              .all<double>(6),
                                                      thumbVisibility:
                                                          MaterialStateProperty
                                                              .all<bool>(true),
                                                    ),
                                                  ),
                                                  menuItemStyleData:
                                                      MenuItemStyleData(
                                                    height: 30,
                                                    padding: EdgeInsets.only(
                                                        left: 9, right: 9),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  padding: EdgeInsets.fromLTRB(
                                                      0.5.w, 0, 1.w, 0),
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Color.fromRGBO(
                                                            183, 183, 183, 1)),
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(8),
                                                      topRight:
                                                          Radius.circular(0),
                                                      bottomLeft:
                                                          Radius.circular(8),
                                                      bottomRight:
                                                          Radius.circular(0),
                                                    ),
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      Image.asset(
                                                        'delivery-truck.png',
                                                        width: 50,
                                                        height: 50,
                                                      ),
                                                      Text('Tralia')
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              DropdownButtonHideUnderline(
                                                child: DropdownButton2<String>(
                                                  value:
                                                      dropdownValues, // Use value from the list
                                                  items: <String>[
                                                    'Trigger Bookings',
                                                    'Booking Manager',
                                                    'Contract',
                                                    'None'
                                                  ].map<
                                                          DropdownMenuItem<
                                                              String>>(
                                                      (String value) {
                                                    return DropdownMenuItem<
                                                        String>(
                                                      value: value,
                                                      child: Text(
                                                        value,
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            fontFamily:
                                                                'SegoeItalic',
                                                            color:
                                                                Colors.black),
                                                      ),
                                                    );
                                                  }).toList(),
                                                  onChanged:
                                                      (String? newValue) {
                                                    setState(() {
                                                      dropdownValues =
                                                          newValue!; // Update value in the list
                                                    });
                                                  },
                                                  buttonStyleData:
                                                      ButtonStyleData(
                                                    height: 50,
                                                    width: 15.w,
                                                    padding: EdgeInsets.only(
                                                        left: 9, right: 9),
                                                    decoration: BoxDecoration(
                                                      border: Border(
                                                        bottom: BorderSide(
                                                            color:
                                                                Color.fromRGBO(
                                                                    183,
                                                                    183,
                                                                    183,
                                                                    1)),
                                                        right: BorderSide(
                                                            color:
                                                                Color.fromRGBO(
                                                                    183,
                                                                    183,
                                                                    183,
                                                                    1)),
                                                        top: BorderSide(
                                                            color:
                                                                Color.fromRGBO(
                                                                    183,
                                                                    183,
                                                                    183,
                                                                    1)),
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(0),
                                                        topRight:
                                                            Radius.circular(8),
                                                        bottomLeft:
                                                            Radius.circular(0),
                                                        bottomRight:
                                                            Radius.circular(8),
                                                      ),
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  iconStyleData:
                                                      const IconStyleData(
                                                    icon: Icon(
                                                      Icons
                                                          .arrow_drop_down_sharp,
                                                    ),
                                                    iconSize: 25,
                                                    iconEnabledColor:
                                                        Colors.black,
                                                    iconDisabledColor: null,
                                                  ),
                                                  dropdownStyleData:
                                                      DropdownStyleData(
                                                    elevation: 0,
                                                    maxHeight: 200,
                                                    padding: EdgeInsets.all(3),
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Color.fromRGBO(
                                                              112,
                                                              112,
                                                              112,
                                                              1)),
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(0),
                                                        topRight:
                                                            Radius.circular(0),
                                                        bottomLeft:
                                                            Radius.circular(5),
                                                        bottomRight:
                                                            Radius.circular(5),
                                                      ),
                                                      color: Colors.white,
                                                    ),
                                                    scrollPadding:
                                                        EdgeInsets.all(5),
                                                    scrollbarTheme:
                                                        ScrollbarThemeData(
                                                      thickness:
                                                          MaterialStateProperty
                                                              .all<double>(6),
                                                      thumbVisibility:
                                                          MaterialStateProperty
                                                              .all<bool>(true),
                                                    ),
                                                  ),
                                                  menuItemStyleData:
                                                      MenuItemStyleData(
                                                    height: 30,
                                                    padding: EdgeInsets.only(
                                                        left: 9, right: 9),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  padding: EdgeInsets.fromLTRB(
                                                      0.5.w, 0, 1.w, 0),
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Color.fromRGBO(
                                                            183, 183, 183, 1)),
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(8),
                                                      topRight:
                                                          Radius.circular(0),
                                                      bottomLeft:
                                                          Radius.circular(8),
                                                      bottomRight:
                                                          Radius.circular(0),
                                                    ),
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      Image.asset(
                                                        'delivery-truck.png',
                                                        width: 50,
                                                        height: 50,
                                                      ),
                                                      Text('Tralia')
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              DropdownButtonHideUnderline(
                                                child: DropdownButton2<String>(
                                                  value:
                                                      dropdownValues, // Use value from the list
                                                  items: <String>[
                                                    'Trigger Bookings',
                                                    'Booking Manager',
                                                    'Contract',
                                                    'None'
                                                  ].map<
                                                          DropdownMenuItem<
                                                              String>>(
                                                      (String value) {
                                                    return DropdownMenuItem<
                                                        String>(
                                                      value: value,
                                                      child: Text(
                                                        value,
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            fontFamily:
                                                                'SegoeItalic',
                                                            color:
                                                                Colors.black),
                                                      ),
                                                    );
                                                  }).toList(),
                                                  onChanged:
                                                      (String? newValue) {
                                                    setState(() {
                                                      dropdownValues =
                                                          newValue!; // Update value in the list
                                                    });
                                                  },
                                                  buttonStyleData:
                                                      ButtonStyleData(
                                                    height: 50,
                                                    width: 15.w,
                                                    padding: EdgeInsets.only(
                                                        left: 9, right: 9),
                                                    decoration: BoxDecoration(
                                                      border: Border(
                                                        bottom: BorderSide(
                                                            color:
                                                                Color.fromRGBO(
                                                                    183,
                                                                    183,
                                                                    183,
                                                                    1)),
                                                        right: BorderSide(
                                                            color:
                                                                Color.fromRGBO(
                                                                    183,
                                                                    183,
                                                                    183,
                                                                    1)),
                                                        top: BorderSide(
                                                            color:
                                                                Color.fromRGBO(
                                                                    183,
                                                                    183,
                                                                    183,
                                                                    1)),
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(0),
                                                        topRight:
                                                            Radius.circular(8),
                                                        bottomLeft:
                                                            Radius.circular(0),
                                                        bottomRight:
                                                            Radius.circular(8),
                                                      ),
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  iconStyleData:
                                                      const IconStyleData(
                                                    icon: Icon(
                                                      Icons
                                                          .arrow_drop_down_sharp,
                                                    ),
                                                    iconSize: 25,
                                                    iconEnabledColor:
                                                        Colors.black,
                                                    iconDisabledColor: null,
                                                  ),
                                                  dropdownStyleData:
                                                      DropdownStyleData(
                                                    elevation: 0,
                                                    maxHeight: 200,
                                                    padding: EdgeInsets.all(3),
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Color.fromRGBO(
                                                              112,
                                                              112,
                                                              112,
                                                              1)),
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(0),
                                                        topRight:
                                                            Radius.circular(0),
                                                        bottomLeft:
                                                            Radius.circular(5),
                                                        bottomRight:
                                                            Radius.circular(5),
                                                      ),
                                                      color: Colors.white,
                                                    ),
                                                    scrollPadding:
                                                        EdgeInsets.all(5),
                                                    scrollbarTheme:
                                                        ScrollbarThemeData(
                                                      thickness:
                                                          MaterialStateProperty
                                                              .all<double>(6),
                                                      thumbVisibility:
                                                          MaterialStateProperty
                                                              .all<bool>(true),
                                                    ),
                                                  ),
                                                  menuItemStyleData:
                                                      MenuItemStyleData(
                                                    height: 30,
                                                    padding: EdgeInsets.only(
                                                        left: 9, right: 9),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  padding: EdgeInsets.fromLTRB(
                                                      0.5.w, 0, 1.w, 0),
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Color.fromRGBO(
                                                            183, 183, 183, 1)),
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(8),
                                                      topRight:
                                                          Radius.circular(0),
                                                      bottomLeft:
                                                          Radius.circular(8),
                                                      bottomRight:
                                                          Radius.circular(0),
                                                    ),
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      Image.asset(
                                                        'delivery-truck.png',
                                                        width: 50,
                                                        height: 50,
                                                      ),
                                                      Text('Tralia')
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              DropdownButtonHideUnderline(
                                                child: DropdownButton2<String>(
                                                  value:
                                                      dropdownValues, // Use value from the list
                                                  items: <String>[
                                                    'Trigger Bookings',
                                                    'Booking Manager',
                                                    'Contract',
                                                    'None'
                                                  ].map<
                                                          DropdownMenuItem<
                                                              String>>(
                                                      (String value) {
                                                    return DropdownMenuItem<
                                                        String>(
                                                      value: value,
                                                      child: Text(
                                                        value,
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            fontFamily:
                                                                'SegoeItalic',
                                                            color:
                                                                Colors.black),
                                                      ),
                                                    );
                                                  }).toList(),
                                                  onChanged:
                                                      (String? newValue) {
                                                    setState(() {
                                                      dropdownValues =
                                                          newValue!; // Update value in the list
                                                    });
                                                  },
                                                  buttonStyleData:
                                                      ButtonStyleData(
                                                    height: 50,
                                                    width: 15.w,
                                                    padding: EdgeInsets.only(
                                                        left: 9, right: 9),
                                                    decoration: BoxDecoration(
                                                      border: Border(
                                                        bottom: BorderSide(
                                                            color:
                                                                Color.fromRGBO(
                                                                    183,
                                                                    183,
                                                                    183,
                                                                    1)),
                                                        right: BorderSide(
                                                            color:
                                                                Color.fromRGBO(
                                                                    183,
                                                                    183,
                                                                    183,
                                                                    1)),
                                                        top: BorderSide(
                                                            color:
                                                                Color.fromRGBO(
                                                                    183,
                                                                    183,
                                                                    183,
                                                                    1)),
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(0),
                                                        topRight:
                                                            Radius.circular(8),
                                                        bottomLeft:
                                                            Radius.circular(0),
                                                        bottomRight:
                                                            Radius.circular(8),
                                                      ),
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  iconStyleData:
                                                      const IconStyleData(
                                                    icon: Icon(
                                                      Icons
                                                          .arrow_drop_down_sharp,
                                                    ),
                                                    iconSize: 25,
                                                    iconEnabledColor:
                                                        Colors.black,
                                                    iconDisabledColor: null,
                                                  ),
                                                  dropdownStyleData:
                                                      DropdownStyleData(
                                                    elevation: 0,
                                                    maxHeight: 200,
                                                    padding: EdgeInsets.all(3),
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Color.fromRGBO(
                                                              112,
                                                              112,
                                                              112,
                                                              1)),
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(0),
                                                        topRight:
                                                            Radius.circular(0),
                                                        bottomLeft:
                                                            Radius.circular(5),
                                                        bottomRight:
                                                            Radius.circular(5),
                                                      ),
                                                      color: Colors.white,
                                                    ),
                                                    scrollPadding:
                                                        EdgeInsets.all(5),
                                                    scrollbarTheme:
                                                        ScrollbarThemeData(
                                                      thickness:
                                                          MaterialStateProperty
                                                              .all<double>(6),
                                                      thumbVisibility:
                                                          MaterialStateProperty
                                                              .all<bool>(true),
                                                    ),
                                                  ),
                                                  menuItemStyleData:
                                                      MenuItemStyleData(
                                                    height: 30,
                                                    padding: EdgeInsets.only(
                                                        left: 9, right: 9),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                  child: CustomTextfieldGrey(
                                                text: 'Time',
                                              ))
                                            ],
                                          ),
                                          Row(
                                            children: [],
                                          ),
                                          Row(
                                            children: [],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 660,
                                    child: VerticalDivider(
                                      color: Colors.black,
                                      width: 1,
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(1.5.w, 0, 0, 0),
                                      child: Column(
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.all(8.0),
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Color.fromRGBO(
                                                        183,
                                                        183,
                                                        183,
                                                        1) // Specify the border width
                                                    ),
                                                color: Colors.white,
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(8),
                                                )),
                                            child: Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons.circle,
                                                      color: Colors.green,
                                                      size: 20,
                                                    ),
                                                    Text(
                                                      'Pick Up',
                                                      style: TabelText
                                                          .helvetica16black,
                                                    ),
                                                  ],
                                                ),
                                                Divider(
                                                    color: Color.fromRGBO(
                                                        183, 183, 183, 1)),
                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons.circle,
                                                      color: Colors.red,
                                                      size: 20,
                                                    ),
                                                    Text(
                                                      'Drop Point A',
                                                      style: TabelText
                                                          .helvetica16black,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Container(
                                            height: 200,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Color.fromRGBO(
                                                        183,
                                                        183,
                                                        183,
                                                        1) // Specify the border width
                                                    ),
                                                color: Color.fromARGB(
                                                    69, 112, 106, 106),
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(8),
                                                )),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          CustomButton(
                                            onPressed: () {},
                                            dynamicHeight: 40,
                                            text: 'Create Booking',
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ));
        } else {
          return Scaffold(
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(65),
                child: Material(
                  elevation: 3,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(5.w, 0, 8.w, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        PopupMenuButton<String>(
                          icon: Icon(Icons.menu),
                          onSelected: (String value) {
                            setState(() {
                              _selectedValue = value;
                            });
                          },
                          itemBuilder: (BuildContext context) => [
                            PopupMenuItem(
                              value: '1',
                              child: Text('User', style: TabelText.tableText),
                            ),
                            PopupMenuItem(
                              value: '2',
                              child:
                                  Text('Partner', style: TabelText.tableText),
                            ),
                            PopupMenuItem(
                              value: '3',
                              child: Text("Contact Us",
                                  style: TabelText.tableText),
                            ),
                          ],
                        ),
                        Image.asset(
                          'Naqli-final-logo.png',
                          width: 25.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Hello ", style: TabelText.helvetica11),
                            Text("Customer!", style: TabelText.usertext),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              body: SingleChildScrollView(
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          Column(
                            children: [
                              CarouselSlider(
                                options: CarouselOptions(
                                  height: 500,
                                ),
                                items: [
                                  Container(
                                    margin: EdgeInsets.all(6.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                      image: DecorationImage(
                                        image: AssetImage('truckslide.jpg'),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.all(6.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                      image: DecorationImage(
                                        image: AssetImage('truckslide.jpg'),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 450, right: 200, top: 200),
                                child: Container(
                                  height: 750,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                height: 400,
                                padding: EdgeInsets.all(16.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(1.0),
                                  color: Color.fromARGB(255, 232, 229,
                                      240), // Set the background color
                                ),
                              ),
                              Container(
                                height: 50,
                                color: Color.fromRGBO(13, 13, 255, 1),
                              ),
                            ],
                          ),
                          Positioned(
                            top: 350,
                            right: 7,
                            left: 7,
                            child: Container(
                              child: Column(
                                children: [
                                  Container(
                                    width: 450,
                                    height: 700,
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 232, 229, 240),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: ListView(
                                      // Use ListView instead of Column
                                      shrinkWrap: true,
                                      children: [
                                        SizedBox(height: 10),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              // Dropdown text field with location icon
                                              SizedBox(width: 10),
                                              // Vertical divider
                                              SizedBox(width: 10),
                                              // Location text
                                              Align(
                                                alignment: Alignment.topRight,
                                                child: Container(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 10),
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.black,
                                                        width: 1.0),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.0),
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      Icon(Icons
                                                          .location_on_outlined),
                                                      SizedBox(width: 5),
                                                      Container(
                                                        height: 30,
                                                        width: 1,
                                                        color: Colors.black,
                                                      ),
                                                      SizedBox(width: 5),
                                                      // Replace the below DropdownButton with your actual dropdown widget
                                                      DropdownButtonHideUnderline(
                                                        child: DropdownButton<
                                                            String>(
                                                          value: 'Location',
                                                          onChanged: (String?
                                                              newValue) {
                                                            // Handle dropdown value change
                                                          },
                                                          items: <String>[
                                                            'Location',
                                                            'Location1',
                                                            'Location2'
                                                          ].map<
                                                              DropdownMenuItem<
                                                                  String>>(
                                                            (String value) {
                                                              return DropdownMenuItem<
                                                                  String>(
                                                                value: value,
                                                                child: Text(
                                                                  value,
                                                                  style: TextStyle(
                                                                      fontFamily:
                                                                          'Colfax',
                                                                      fontSize:
                                                                          16),
                                                                ),
                                                              );
                                                            },
                                                          ).toList(),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  width: 145,
                                                  height: 180,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    border: Border.all(
                                                      color: Colors
                                                          .black, // Change border color as needed
                                                      width:
                                                          2.0, // Increase border width
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        Divider(
                                                          color: Colors.black,
                                                        ),
                                                        SizedBox(height: 2),
                                                        Text(
                                                          'Vehicle',
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'Colfax',
                                                              fontSize: 14),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 25,
                                                ),
                                                Container(
                                                  width: 145,
                                                  height: 180,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    border: Border.all(
                                                      color: Colors
                                                          .black, // Change border color as needed
                                                      width:
                                                          2.0, // Increase border width
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        Divider(
                                                          color: Colors.black,
                                                        ),
                                                        SizedBox(height: 2),
                                                        Text(
                                                          'Bus',
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'Colfax',
                                                              fontSize: 14),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 25),
                                            Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    width: 145,
                                                    height: 180,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      border: Border.all(
                                                        color: Colors
                                                            .black, // Change border color as needed
                                                        width:
                                                            2.0, // Increase border width
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          Divider(
                                                            color: Colors.black,
                                                          ),
                                                          SizedBox(height: 2),
                                                          Text(
                                                            'Equipment-2',
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    'Colfax',
                                                                fontSize: 14),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 25,
                                                  ),
                                                  Container(
                                                    width: 145,
                                                    height: 180,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      border: Border.all(
                                                        color: Colors
                                                            .black, // Change border color as needed
                                                        width:
                                                            2.0, // Increase border width
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          Divider(
                                                            color: Colors.black,
                                                          ),
                                                          SizedBox(height: 2),
                                                          Text(
                                                            'Special',
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    'Colfax',
                                                                fontSize: 14),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ]),
                                            SizedBox(height: 25),
                                            Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    width: 150,
                                                    height: 180,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      border: Border.all(
                                                        color: Colors
                                                            .black, // Change border color as needed
                                                        width:
                                                            2.0, // Increase border width
                                                      ),
                                                      color: Color.fromRGBO(
                                                          106,
                                                          102,
                                                          209,
                                                          1), // RGB color fill
                                                    ),
                                                    child: Align(
                                                      alignment:
                                                          Alignment.center,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              "Get an Estimate",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontFamily:
                                                                      'Colfax',
                                                                  fontSize: 14
                                                                  // Add other text style properties as needed
                                                                  ),
                                                            ),
                                                            SizedBox(
                                                                height: 20),
                                                            Image.asset(
                                                              'right-arrow.png',
                                                              width: 30,
                                                              height: 30,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ])
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 30),
                                            child: Image.asset(
                                              'Rectangle.png', // Replace with your image path
                                              width: 65,
                                              height: 120,
                                              color: Colors.grey,
                                            ),
                                          ),

                                          SizedBox(
                                              width:
                                                  5), // Adjust this space as needed
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Naqli For Individuals",
                                                style: TextStyle(
                                                  fontFamily: 'Colfax',
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(height: 5),
                                              SizedBox(
                                                height: 112,
                                                width: 250,
                                                child: Text(
                                                  "Lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua Ut enim ad mini veniam  quis nostrud exercitation ullamco laboris nisi ut aliquip ex eacommodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident sunt in culpa qui officia deserunt mollit anim id est laborum..",
                                                  style: TextStyle(
                                                      fontFamily: 'Colfax',
                                                      fontSize: 8),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      // Repeat the above structure for other rows without unnecessary SizedBox
                                      SizedBox(height: 2),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 30),
                                            child: Image.asset(
                                              'Rectangle.png', // Replace with your image path
                                              width: 65,
                                              height: 110,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          SizedBox(
                                              width:
                                                  5), // Adjust this space as needed
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                "Naqli For Business",
                                                style: TextStyle(
                                                  fontFamily: 'Colfax',
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(height: 5),
                                              SizedBox(
                                                height: 112,
                                                width: 250,
                                                child: Text(
                                                  "Lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua Ut enim ad mini veniam  quis nostrud exercitation ullamco laboris nisi ut aliquip ex eacommodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident sunt in culpa qui officia deserunt mollit anim id est laborum..",
                                                  style: TextStyle(
                                                      fontFamily: 'Colfax',
                                                      fontSize: 8),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 2),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 30),
                                            child: Image.asset(
                                              'Rectangle.png', // Replace with your image path
                                              width: 65,
                                              height: 110,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          SizedBox(
                                              width:
                                                  5), // Adjust this space as needed
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Naqli For Partner",
                                                style: TextStyle(
                                                  fontFamily: 'Colfax',
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(height: 5),
                                              SizedBox(
                                                height: 112,
                                                width: 250,
                                                child: Text(
                                                  "Lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua Ut enim ad mini veniam  quis nostrud exercitation ullamco laboris nisi ut aliquip ex eacommodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident sunt in culpa qui officia deserunt mollit anim id est laborum..",
                                                  style: TextStyle(
                                                      fontFamily: 'Colfax',
                                                      fontSize: 8),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        // First Column - Image

                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              'Phone.png', // Replace with your image path
                                              width: 160,
                                              height: 160,
                                            ),
                                          ],
                                        ),

                                        // Second Column - Text
                                        SizedBox(height: 10),

                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'How to get Naqli in Action',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'Colfax',
                                                  fontSize: 16),
                                            ),
                                          ],
                                        ),

                                        // Third Column - Text
                                        SizedBox(height: 10),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Lorem ipsum dolor sit amet,\n"
                                              "consectetur adipiscing elit, sed\n"
                                              "do eiusmod tempor incididunt ut\n"
                                              "labore et dolore magna aliqua.\n"
                                              "Ut enim ad minim veniam, quis\n"
                                              "nostrud exercitation ullamco\n"
                                              "laboris nisi ut aliquip ex ea\n"
                                              "commodo consequat. Duis aute\n"
                                              "irure dolor in",
                                              style: TextStyle(
                                                fontFamily: 'Colfax',
                                                fontSize: 10,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ));
        }
      });
    });
  }
}
