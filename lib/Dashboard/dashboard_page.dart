import 'dart:math';

import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Dashboard/dashboard.dart';
import 'package:flutter_application_1/Widgets/customRadio.dart';
import 'package:flutter_application_1/bookingdialog.dart';
import 'package:flutter_application_1/echarts_data.dart';
import 'package:flutter_application_1/homepage.dart';
import 'package:graphic/graphic.dart';
import 'package:flutter/gestures.dart';
import 'package:quiver/iterables.dart';
import 'package:sizer/sizer.dart';
import 'bookings.dart';
import 'payments.dart';
import 'trigger_booking.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<DashboardPage> {
  PageController page = PageController();
  SideMenuController sideMenu = SideMenuController();
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

  void handleRadioValueChanged(String? newValue) {
    setState(() {
      selectedValue = newValue;
    });
    print('Selected value: $selectedValue');
  }

  @override
  void initState() {
    sideMenu.addListener((p0) {
      page.jumpToPage(p0);
    });
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

  void tapOnPieChart(FlTouchEvent event, PieTouchResponse? response) {
    if (response != null) {
      final sectionIndex = response.touchedSection!.touchedSectionIndex;
      final value = response.touchedSection!.touchedSection!.value;
      if (sectionIndex == 0) {
        month = 'January - $value';
      } else if (sectionIndex == 1) {
        month = 'February - $value';
      } else if (sectionIndex == 2) {
        month = 'March - $value';
      } else if (sectionIndex == 3) {
        month = 'April - $value';
      } else if (sectionIndex == 4) {
        month = 'May - $value';
      }
      setState(() {});
      print('Tapped on section: $sectionIndex');
      // You can add your custom logic here to respond to the tap on the Pie Chart
    }
  }

  bool isAnyCheckboxSelected() {
    return checkbox1 || checkbox2 || checkbox3;
  }

  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return LayoutBuilder(
          builder: (BuildContext ctx, BoxConstraints constraints) {
        if (constraints.maxWidth >= 850) {
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(75),
              child: Material(
                elevation: 5,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(5.w, 0, 2.5.w, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        'Naqli-final-logo.png',
                        width: 10.w,
                        height: 8.h,
                      ),
                      Row(
                        children: [
                          TextButton(
                            onPressed: () {
                              // Handle the first button press
                            },
                            child: Text(
                              'User',
                              style: TextStyle(
                                fontSize: 24,
                                fontFamily: "Segoe UI",
                                color: Color.fromRGBO(112, 112, 112, 1),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                            child: VerticalDivider(
                              color: Color.fromRGBO(206, 203, 203, 1),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              // Handle the second button press
                            },
                            child: Text(
                              'Enterprise',
                              style: TextStyle(
                                fontSize: 24,
                                fontFamily: "Segoe UI",
                                color: Color.fromRGBO(206, 203, 203, 1),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
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
                                fontSize: 24,
                                fontFamily: "Segoe UI",
                                color: Color.fromRGBO(206, 203, 203, 1),
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
                                  style: TextStyle(
                                    fontFamily: 'Colfax',
                                    fontSize: 16,
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
                                  "Hello Faizal!",
                                  style: TextStyle(
                                    fontFamily: 'Colfax',
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            body: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: EdgeInsets.fromLTRB(6.w, 6.h, 6.w, 6.h),
                child: Container(
                    width: 1700,
                    color: Color.fromRGBO(240, 237, 250, 1),
                    child: Row(
                      children: [
                        Container(
                          height: 1000, // Adjust the height as needed
                          width: 400,
                          color: Color.fromRGBO(234, 232, 235, 1),
                          child: Padding(
                            padding: const EdgeInsets.all(30.0),
                            child: Column(
                              children: [
                                Container(
                                  height: 350,
                                  width: 400,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                        30.0), // Adjust the radius as needed
                                    child: Image.asset(
                                      'Circleavatar.png',
                                      width: 550,
                                      height:
                                          400, // Adjust the height as needed
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 500,
                                  height: 370,
                                  child: Card(
                                    elevation: 10,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    color: Color.fromRGBO(240, 237, 250, 1),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 30, top: 50),
                                      child: SideMenu(
                                        controller: sideMenu,
                                        style: SideMenuStyle(
                                          displayMode: SideMenuDisplayMode.auto,
                                          selectedColor:
                                              Color.fromRGBO(98, 105, 254, 1),
                                          unselectedTitleTextStyle:
                                              const TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: Color.fromRGBO(
                                                128, 118, 118, 1),
                                          ),
                                          selectedTitleTextStyle:
                                              const TextStyle(
                                                  fontFamily: 'Poppins',
                                                  color: Colors.white,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600),
                                          unselectedIconColor:
                                              Color.fromRGBO(128, 118, 118, 1),
                                          selectedIconColor:
                                              const Color.fromARGB(
                                                  255, 64, 114, 61),
                                        ),
                                        items: [
                                          SideMenuItem(
                                            title: 'Dashboard',
                                            onTap: (page, _) {
                                              sideMenu.changePage(page);
                                            },
                                            icon: const Icon(
                                                Icons.login_outlined),
                                          ),
                                          SideMenuItem(
                                            title: 'Trigger Booking',
                                            onTap: (page, _) {
                                              sideMenu.changePage(page);
                                            },
                                            icon: const Icon(
                                                Icons.person_2_outlined),
                                          ),
                                          SideMenuItem(
                                            title: 'Bookings',
                                            onTap: (page, _) {
                                              sideMenu.changePage(page);
                                            },
                                            icon: const Icon(
                                                Icons.person_2_outlined),
                                            // Set the style property to change the text size
                                          ),
                                          SideMenuItem(
                                            title: 'Payments',
                                            onTap: (page, _) {
                                              sideMenu.changePage(page);
                                            },
                                            icon: const Icon(
                                                Icons.mode_comment_outlined),
                                          ),
                                          SideMenuItem(
                                            title: 'Report an issue',
                                            onTap: (page, _) {
                                              sideMenu.changePage(page);
                                            },
                                            icon: const Icon(
                                                Icons.mode_comment_outlined),
                                          ),
                                          SideMenuItem(
                                            title: 'Help',
                                            onTap: (page, _) {
                                              sideMenu.changePage(page);
                                            },
                                            icon: const Icon(
                                                Icons.inbox_outlined),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                                // Add other widgets if needed below the image
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: PageView(controller: page, children: [
                            Dashboard(),
                            TriggerBooking(),
                            Bookings(),
                            Payments(),
                            Container(
                              color: Colors.pink,
                            ),
                            Container(
                              color: Colors.deepOrangeAccent,
                            ),
                          ]),
                        ),
                      ],
                    )),
              ),
            ),
          );
        } else {
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(75),
              child: Material(
                elevation: 5,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(5.w, 0, 2.5.w, 0),
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
                                style: TextStyle(
                                  fontSize: 24,
                                  fontFamily: "Segoe UI",
                                  color: Color.fromRGBO(112, 112, 112, 1),
                                ),
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
                                style: TextStyle(
                                  fontSize: 24,
                                  fontFamily: "Segoe UI",
                                  color: Color.fromRGBO(206, 203, 203, 1),
                                ),
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
                                style: TextStyle(
                                  fontSize: 24,
                                  fontFamily: "Segoe UI",
                                  color: Color.fromRGBO(206, 203, 203, 1),
                                ),
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
                                  style: TextStyle(
                                    fontFamily: 'Colfax',
                                    fontSize: 16,
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
                                  "Hello Faizal!",
                                  style: TextStyle(
                                    fontFamily: 'Colfax',
                                    fontSize: 16,
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
                ),
              ),
            ),
            body: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: EdgeInsets.fromLTRB(6.w, 6.h, 6.w, 6.h),
                child: Container(
                    width: 1700,
                    color: Color.fromRGBO(240, 237, 250, 1),
                    child: Row(
                      children: [
                        Container(
                          height: 1000, // Adjust the height as needed
                          width: 400,
                          color: Color.fromRGBO(234, 232, 235, 1),
                          child: Padding(
                            padding: const EdgeInsets.all(30.0),
                            child: Container(
                              height: 350,
                              width: 400,
                              color: Color.fromRGBO(240, 237, 250, 1),
                              child: Column(
                                children: [
                                  Container(
                                    height: 350,
                                    width: 400,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(
                                          30.0), // Adjust the radius as needed
                                      child: Image.asset(
                                        'Circleavatar.png',
                                        width: 550,
                                        height:
                                            400, // Adjust the height as needed
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 500,
                                    height: 370,
                                    child: Card(
                                      elevation: 10,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      color: Color.fromRGBO(240, 237, 250, 1),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 30, top: 50),
                                        child: SideMenu(
                                          controller: sideMenu,
                                          style: SideMenuStyle(
                                            displayMode:
                                                SideMenuDisplayMode.auto,
                                            selectedColor:
                                                Color.fromRGBO(98, 105, 254, 1),
                                            unselectedTitleTextStyle:
                                                const TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              color: Color.fromRGBO(
                                                  128, 118, 118, 1),
                                            ),
                                            selectedTitleTextStyle:
                                                const TextStyle(
                                                    fontFamily: 'Poppins',
                                                    color: Colors.white,
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w600),
                                            unselectedIconColor: Color.fromRGBO(
                                                128, 118, 118, 1),
                                            selectedIconColor:
                                                const Color.fromARGB(
                                                    255, 64, 114, 61),
                                          ),
                                          items: [
                                            SideMenuItem(
                                              title: 'Dashboard',
                                              onTap: (page, _) {
                                                sideMenu.changePage(page);
                                              },
                                              icon: const Icon(
                                                  Icons.login_outlined),
                                            ),
                                            SideMenuItem(
                                              title: 'Trigger Booking',
                                              onTap: (page, _) {
                                                sideMenu.changePage(page);
                                              },
                                              icon: const Icon(
                                                  Icons.person_2_outlined),
                                            ),
                                            SideMenuItem(
                                              title: 'Bookings',
                                              onTap: (page, _) {
                                                sideMenu.changePage(page);
                                              },
                                              icon: const Icon(
                                                  Icons.person_2_outlined),
                                              // Set the style property to change the text size
                                            ),
                                            SideMenuItem(
                                              title: 'Payments',
                                              onTap: (page, _) {
                                                sideMenu.changePage(page);
                                              },
                                              icon: const Icon(
                                                  Icons.mode_comment_outlined),
                                            ),
                                            SideMenuItem(
                                              title: 'Report an issue',
                                              onTap: (page, _) {
                                                sideMenu.changePage(page);
                                              },
                                              icon: const Icon(
                                                  Icons.mode_comment_outlined),
                                            ),
                                            SideMenuItem(
                                              title: 'Help',
                                              onTap: (page, _) {
                                                sideMenu.changePage(page);
                                              },
                                              icon: const Icon(
                                                  Icons.inbox_outlined),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                  // Add other widgets if needed below the image
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: PageView(controller: page, children: [
                            Dashboard(),
                            TriggerBooking(),
                            Bookings(),
                            Payments(),
                            Container(
                              color: Colors.pink,
                            ),
                            Container(
                              color: Colors.deepOrangeAccent,
                            ),
                          ]),
                        ),
                      ],
                    )),
              ),
            ),
          );
        }
      });
    });
  }
}
