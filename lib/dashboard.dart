import 'dart:math';

import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

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
  SideMenuController sideMenu = SideMenuController();
  TextStyle myTextStyle = const TextStyle(
    fontFamily: 'Poppins',
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: Color.fromRGBO(128, 118, 118, 1),
  );
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
            padding:
                EdgeInsets.fromLTRB(w * 0.05, h * 0.005, w * 0.025, h * 0.005),
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
                          textScaleFactor: ScaleSize.textScaleFactor(context),
                          style: TextStyle(
                            fontSize: 12,
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
                          textScaleFactor: ScaleSize.textScaleFactor(context),
                          style: TextStyle(
                            fontSize: 12,
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
                          textScaleFactor: ScaleSize.textScaleFactor(context),
                          style: TextStyle(
                            fontSize: 12,
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
                            textScaleFactor: ScaleSize.textScaleFactor(context),
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
                          padding: const EdgeInsets.only(left: 13, top: 5),
                          child: Text(
                            "Hello Faizal!",
                            textScaleFactor: ScaleSize.textScaleFactor(context),
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
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            child: Row(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        height: 1420, // Adjust the height as needed
                        width: 400,
                        color: Color.fromRGBO(234, 232, 235, 1),
                        child: Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Container(
                            height: 300,
                            width: 450,
                            color: Color.fromRGBO(240, 237, 250, 1),
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                      30.0), // Adjust the radius as needed
                                  child: Image.asset(
                                    'Card.png',
                                    width: 550,
                                    height: 400, // Adjust the height as needed
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(
                                  width: 450,
                                  child: Card(
                                    elevation: 10,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    color: Color.fromRGBO(240, 237, 250, 1),
                                    child: SideMenu(
                                      controller: sideMenu,
                                      style: SideMenuStyle(
                                        displayMode: SideMenuDisplayMode.auto,
                                        selectedColor:
                                            Color.fromRGBO(98, 105, 254, 1),
                                        unselectedTitleTextStyle: myTextStyle,
                                        selectedTitleTextStyle: const TextStyle(
                                            fontFamily: 'Poppins',
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600),
                                        unselectedIconColor:
                                            Color.fromRGBO(128, 118, 118, 1),
                                        selectedIconColor: const Color.fromARGB(
                                            255, 64, 114, 61),
                                      ),
                                      items: [
                                        SideMenuItem(
                                          priority: 0,
                                          title: 'Dashboard',
                                          onTap: (page, _) {
                                            sideMenu.changePage(page);
                                          },
                                          icon:
                                              const Icon(Icons.login_outlined),
                                        ),
                                        SideMenuItem(
                                          priority: 1,
                                          title: 'Trigger Booking',
                                          onTap: (page, _) {
                                            sideMenu.changePage(page);
                                          },
                                          icon: const Icon(
                                              Icons.person_2_outlined),
                                        ),
                                        SideMenuItem(
                                          priority: 2,
                                          title: 'Bookings',
                                          onTap: (page, _) {
                                            sideMenu.changePage(page);
                                          },
                                          icon: const Icon(
                                              Icons.person_2_outlined),
                                        ),
                                        SideMenuItem(
                                          priority: 3,
                                          title: 'Payments',
                                          onTap: (page, _) {
                                            sideMenu.changePage(page);
                                          },
                                          icon: const Icon(
                                              Icons.mode_comment_outlined),
                                        ),
                                        SideMenuItem(
                                          priority: 4,
                                          title: 'Report an issue',
                                          onTap: (page, _) {
                                            sideMenu.changePage(page);
                                          },
                                          icon: const Icon(
                                              Icons.mode_comment_outlined),
                                        ),
                                        SideMenuItem(
                                          priority: 5,
                                          title: 'Help',
                                          onTap: (page, _) {
                                            sideMenu.changePage(page);
                                          },
                                          icon:
                                              const Icon(Icons.inbox_outlined),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                                // Add other widgets if needed below the image
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
