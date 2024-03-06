// ignore_for_file: dead_code

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_application_1/createAccount.dart';
import 'package:sizer/sizer.dart';

import 'loginPage.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return LayoutBuilder(
          builder: (BuildContext ctx, BoxConstraints constraints) {
        if (constraints.maxWidth >= 650) {
          return Scaffold(
              appBar: PreferredSize(
                  preferredSize: Size.fromHeight(100.0),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 40, right: 100),
                    child: AppBar(
                      automaticallyImplyLeading: false,
                      centerTitle: false,
                      elevation: 0.0,
                      title: Container(
                        padding: const EdgeInsets.only(left: 150),
                        child: Image.asset(
                          'Naqli-final-logo.png',
                          width: 150,
                          height: 150,
                        ),
                      ),
                      actions: [
                        Padding(
                          padding: EdgeInsets.only(right: 248.0, top: 10),
                          child: Row(
                            children: [
                              const SizedBox(
                                height: 30,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 100, top: 5),
                                  child: Text(
                                    "Contact Us",
                                    style: TextStyle(
                                        fontFamily: 'Colfax', fontSize: 16),
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
                              InkWell(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return LoginPage();
                                    },
                                  );
                                },
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                      fontFamily: 'Colfax', fontSize: 16),
                                ),
                              ),
                              SizedBox(width: 40),
                              SizedBox(width: 8.0),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )),
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
                            top: 310,
                            left: 15.w,
                            right: 15.w,
                            child: Container(
                              child: Column(
                                children: [
                                  Container(
                                    width: 1170,
                                    height: 350,
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
                                          height: 30,
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: 30,
                                            ),
                                            Expanded(
                                              child: Container(
                                                width: 200,
                                                height: 200,
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
                                                      const EdgeInsets.all(8.0),
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
                                                            fontSize: 16),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Expanded(
                                              child: Container(
                                                width: 200,
                                                height: 200,
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
                                                      const EdgeInsets.all(8.0),
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
                                                            fontSize: 16),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Expanded(
                                              child: Container(
                                                width: 200,
                                                height: 200,
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
                                                      const EdgeInsets.all(8.0),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
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
                                                            fontSize: 16),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Expanded(
                                              child: Container(
                                                width: 200,
                                                height: 200,
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
                                                      const EdgeInsets.all(8.0),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
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
                                                            fontSize: 16),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Expanded(
                                              child: Container(
                                                width: 200,
                                                height: 200,
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
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        "Get an Estimate",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontFamily:
                                                                'Colfax',
                                                            fontSize: 16
                                                            // Add other text style properties as needed
                                                            ),
                                                      ),
                                                      SizedBox(height: 20),
                                                      Image.asset(
                                                        'right-arrow.png',
                                                        width: 30,
                                                        height: 30,
                                                        color: Colors.white,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 9.h),
                                  Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(left: 6.5.w),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Image.asset(
                                              'Rectangle.png', // Replace with your image path
                                              width: 19.w,
                                              height: 12.h,
                                              color: Colors.grey,
                                            ),
                                            SizedBox(
                                                width: 4.5
                                                    .w), // Adjust this space as needed
                                            Container(
                                              height: 25.h,
                                              width: 40.w,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Naqli For Individuals",
                                                    style: TextStyle(
                                                      fontFamily: 'Colfax',
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  SizedBox(height: 1.h),
                                                  SizedBox(
                                                    width: 620,
                                                    child: Text(
                                                      "Lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua Ut enim ad mini veniam  quis nostrud exercitation ullamco laboris nisi ut aliquip ex eacommodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident sunt in culpa qui officia deserunt mollit anim id est laborum..",
                                                      style: TextStyle(
                                                          fontFamily: 'Colfax',
                                                          fontSize: 12),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                          height: 2
                                              .h), // Repeat the above structure for other rows without unnecessary SizedBox
                                      Padding(
                                        padding: EdgeInsets.only(
                                          left: 6.5.w,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Image.asset(
                                              'Rectangle.png', // Replace with your image path
                                              width: 19.w,
                                              height: 14.h,
                                              color: Colors.grey,
                                            ),
                                            SizedBox(
                                                width: 4.5
                                                    .w), // Adjust this space as needed
                                            Container(
                                              height: 25.h,
                                              width: 40.w,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Naqli For Business",
                                                    style: TextStyle(
                                                      fontFamily: 'Colfax',
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  SizedBox(height: 1.h),
                                                  SizedBox(
                                                    width: 620,
                                                    child: Text(
                                                      "Lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua Ut enim ad mini veniam  quis nostrud exercitation ullamco laboris nisi ut aliquip ex eacommodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident sunt in culpa qui officia deserunt mollit anim id est laborum..",
                                                      style: TextStyle(
                                                          fontFamily: 'Colfax',
                                                          fontSize: 12),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 2.h),
                                      Padding(
                                        padding: EdgeInsets.only(left: 6.5.w),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Image.asset(
                                              'Rectangle.png', // Replace with your image path
                                              width: 19.w,
                                              height: 14.h,
                                              color: Colors.grey,
                                            ),
                                            SizedBox(
                                                width: 4.5
                                                    .w), // Adjust this space as needed
                                            Container(
                                              height: 25.h,
                                              width: 40.w,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Naqli For Partner",
                                                    style: TextStyle(
                                                      fontFamily: 'Colfax',
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  SizedBox(height: 1.h),
                                                  SizedBox(
                                                    width: 620,
                                                    child: Text(
                                                      "Lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua Ut enim ad mini veniam  quis nostrud exercitation ullamco laboris nisi ut aliquip ex eacommodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident sunt in culpa qui officia deserunt mollit anim id est laborum..",
                                                      style: TextStyle(
                                                          fontFamily: 'Colfax',
                                                          fontSize: 12),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 65,
                                  ),
                                  Container(
                                    child: Row(
                                      children: [
                                        // First Column - Image
                                        Image.asset(
                                          'Phone.png', // Replace with your image path
                                          width: 25.w,
                                          height: 25.h,
                                        ),
                                        // Adjust the width as needed

                                        // Second Column - Text

                                        SizedBox(
                                          width: 11.5.w,
                                          child: Text(
                                            'How to get Naqli in Action',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Colfax',
                                                fontSize: 15),
                                          ),
                                        ),

                                        // Spacer for even distribution
                                        SizedBox(width: 5.5.w),
                                        // Third Column - Text

                                        SizedBox(
                                          width: 19.5.w,
                                          child: Text(
                                            "Lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua Ut enim ad mini veniam  quis nostrud exercitation ullamco laboris nisi ut aliquip ex eacommodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident sunt in culpa qui officia deserunt mollit anim id est laborum..",
                                            style: TextStyle(
                                                fontFamily: 'Colfax',
                                                fontSize: 9),
                                          ),
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
        } else {
          return Scaffold(
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(100.0),
                child: Padding(
                  padding: const EdgeInsets.only(top: 5, right: 5, left: 5),
                  child: AppBar(
                    automaticallyImplyLeading: false,
                    centerTitle: false,
                    elevation: 0.0,
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 70,
                          width: 70,
                          child: Image.asset(
                            'Naqli-final-logo.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              "Contact Us",
                              style:
                                  TextStyle(fontFamily: 'Colfax', fontSize: 15),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            SizedBox(
                              height: 30,
                              child: VerticalDivider(
                                color: Colors.black,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return LoginPage();
                                  },
                                );
                              },
                              child: Text(
                                'Login',
                                style: TextStyle(
                                    fontFamily: 'Colfax', fontSize: 16),
                              ),
                            ),
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
