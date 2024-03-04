import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Dashboard/dashboard_page.dart';
import 'package:sizer/sizer.dart';

import '../Widgets/customRadio.dart';
import '../bookingdialog.dart';
import '../homepage.dart';
import 'bookings.dart';
import 'dashboard.dart';
import 'payments.dart';
import 'trigger_booking.dart';

class SideDrawer extends StatefulWidget {
  SideDrawer();

  @override
  State<SideDrawer> createState() => _SideDrawerState();
}

class _SideDrawerState extends State<SideDrawer> {
  SideMenuController sideMenu = SideMenuController();
  bool value = false;
  bool isButtonEnabled = false;
  bool isButtonEnabled1 = false;
  bool isButtonEnabled2 = false;
  int? selectedRadioValue;
  int? selectedRadioValue1;
  int? selectedRadioValue2;
  bool checkbox1 = false;
  bool checkbox2 = false;
  bool checkbox3 = false;
  final PageController pageElse = PageController();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
          padding: EdgeInsets.only(
            top: 3.h,
          ),
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: ClipRRect(
                borderRadius:
                    BorderRadius.circular(30.0), // Adjust the radius as needed
                child: Image.asset(
                  'Circleavatar.png',
                  width: 550, // Adjust the height as needed
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            ListTile(
              hoverColor: Colors.indigo.shade100,
              title: Text(
                'Dashboard',
                style: TextStyle(color: Colors.black),
              ),
              onTap: () {
                Navigator.pop(context);
                pageElse.jumpToPage(0);
              },
            ),
            SizedBox(
              height: 2.h,
            ),
            ListTile(
              hoverColor: Colors.indigo.shade100,
              title: Text(
                'Trigger Booking',
                style: TextStyle(color: Colors.black),
              ),
              onTap: () {
                Navigator.pop(context);
                pageElse.jumpToPage(1); // Close the drawer
              },
            ),
            SizedBox(
              height: 2.h,
            ),
            ListTile(
              hoverColor: Colors.indigo.shade100,
              title: Text(
                'Bookings',
                style: TextStyle(color: Colors.black),
              ),
              onTap: () {
                Navigator.pop(context);
                pageElse.jumpToPage(2);
              },
            ),
            SizedBox(
              height: 2.h,
            ),
            ListTile(
              hoverColor: Colors.indigo.shade100,
              title: Text(
                'Payments',
                style: TextStyle(color: Colors.black),
              ),
              onTap: () {
                Navigator.pop(context);
                pageElse.jumpToPage(3);
              },
            ),
            SizedBox(
              height: 2.h,
            ),
            ListTile(
              hoverColor: Colors.indigo.shade100,
              title: Text(
                'Report an issue',
                style: TextStyle(color: Colors.black),
              ),
              onTap: () {
                Navigator.pop(context);
                pageElse.jumpToPage(4);
              },
            ),
            SizedBox(
              height: 2.h,
            ),
            ListTile(
              hoverColor: Colors.indigo.shade100,
              title: Text(
                'Help',
                style: TextStyle(color: Colors.black),
              ),
              onTap: () {
                Navigator.pop(context);
                pageElse.jumpToPage(5);
              },
            ),
            SizedBox(
              height: 30,
              width: 170,
              child: Padding(
                padding: const EdgeInsets.only(left: 13, top: 5),
                child: Text(
                  "Hello Faizal!",
                  style: TextStyle(
                    fontFamily: 'Colfax',
                    fontSize: 16,
                  ),
                ),
              ),
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
                ],
              ),
            ),
          ]),
    );
  }
}
