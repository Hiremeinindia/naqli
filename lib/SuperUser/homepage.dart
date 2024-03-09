// ignore_for_file: dead_code

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_application_1/SuperUser/createAccount.dart';
import 'package:sizer/sizer.dart';

import 'loginPage.dart';

class superuserMyHomePage extends StatefulWidget {
  const superuserMyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<superuserMyHomePage> createState() => _superuserMyHomePageState();
}

class _superuserMyHomePageState extends State<superuserMyHomePage> {
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
                                      return superuserLoginPage();
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
                              ),
                              SizedBox(
                                height: 20,
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
                                      boxShadow: [
                                        BoxShadow(
                                          color:
                                              Color.fromRGBO(216, 216, 216, 1),
                                          offset: Offset(0, 1),
                                          blurRadius:
                                              0.1, // changes position of shadow
                                        ),
                                      ],
                                      color: Colors.white,
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
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Color.fromRGBO(
                                                          216, 216, 216, 1),
                                                      offset: Offset(0, 1),
                                                      blurRadius:
                                                          0.01, // changes position of shadow
                                                    )
                                                  ],
                                                  color: Color.fromRGBO(
                                                      247, 246, 255, 1),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Image.asset(
                                                        'Group68.png',
                                                        width: 150,
                                                        height: 139,
                                                      ),
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
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Color.fromRGBO(
                                                          216, 216, 216, 1),
                                                      offset: Offset(0, 1),
                                                      blurRadius:
                                                          0.01, // changes position of shadow
                                                    ),
                                                  ],
                                                  color: Color.fromRGBO(
                                                      247, 246, 255, 1),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Image.asset(
                                                        'bus.png',
                                                        width: 150,
                                                        height: 139,
                                                      ),
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
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Color.fromRGBO(
                                                          216, 216, 216, 1),
                                                      offset: Offset(0, 1),
                                                      blurRadius:
                                                          0.01, // changes position of shadow
                                                    ),
                                                  ],
                                                  color: Color.fromRGBO(
                                                      247, 246, 255, 1),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Image.asset(
                                                        'Group1496.png',
                                                        width: 150,
                                                        height: 139,
                                                      ),
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
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Color.fromRGBO(
                                                          216, 216, 216, 1),
                                                      offset: Offset(0, 1),
                                                      blurRadius:
                                                          0.01, // changes position of shadow
                                                    ),
                                                  ],
                                                  color: Color.fromRGBO(
                                                      247, 246, 255, 1),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Image.asset(
                                                        'Group1660.png',
                                                        width: 150,
                                                        height: 139,
                                                      ),
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
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Color.fromRGBO(
                                                          216, 216, 216, 1),
                                                      offset: Offset(0, 1),
                                                      blurRadius:
                                                          0.01, // changes position of shadow
                                                    ),
                                                  ],
                                                  color: Color.fromRGBO(
                                                      247, 246, 255, 1),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Image.asset(
                                                        'Group1716.png',
                                                        width: 150,
                                                        height: 139,
                                                      ),
                                                      Divider(
                                                        color: Colors.black,
                                                      ),
                                                      SizedBox(height: 2),
                                                      Text(
                                                        'Others',
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

                                                  color: Color.fromRGBO(96, 105,
                                                      255, 1), // RGB color fill
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
                                    return superuserLoginPage();
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
              body: Center(
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
                                                        onChanged:
                                                            (String? newValue) {
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
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Color.fromRGBO(
                                                              240, 240, 240, 1)
                                                          .withOpacity(0.1),
                                                      offset: Offset(0, 0),
                                                      spreadRadius: 2.0,
                                                      blurRadius:
                                                          0.01, // changes position of shadow
                                                    ),
                                                  ],
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
                                                    alignment: Alignment.center,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
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
                                              ])
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 10),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ));
        }
      });
    });
  }
}
