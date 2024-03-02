import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../Widgets/customRadio.dart';
import '../bookingdialog.dart';
import '../homepage.dart';

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
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        // Adjust the height as needed
        width: 400,
        color: Color.fromRGBO(234, 232, 235, 1),
        child: Padding(
          padding: EdgeInsets.fromLTRB(2.w, 4.h, 2.w, 4.h),
          child: Card(
            elevation: 1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            color: Color.fromARGB(255, 240, 237, 250),
            child: Expanded(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                          30.0), // Adjust the radius as needed
                      child: Image.asset(
                        'Circleavatar.png',
                        width: 550, // Adjust the height as needed
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 1.5, top: 20),
                    child: SizedBox(
                      height: 30.h,
                      child: SideMenu(
                        controller: sideMenu,
                        style: SideMenuStyle(
                          displayMode: SideMenuDisplayMode.auto,
                          selectedColor: Color.fromRGBO(98, 105, 254, 1),
                          unselectedTitleTextStyle: const TextStyle(
                            fontFamily: 'SFProText',
                            fontSize: 14,
                            color: Color.fromRGBO(128, 118, 118, 1),
                          ),
                          selectedTitleTextStyle: const TextStyle(
                              fontFamily: 'SFProText',
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                          unselectedIconColor: Color.fromRGBO(128, 118, 118, 1),
                          selectedIconColor: Colors.white,
                        ),
                        items: [
                          SideMenuItem(
                            title: 'Dashboard',
                            onTap: (page, _) {
                              sideMenu.changePage(page);
                            },
                            icon: const Icon(Icons.login_outlined),
                          ),
                          SideMenuItem(
                            title: 'Trigger Booking',
                            onTap: (page, _) {
                              sideMenu.changePage(page);
                            },
                            icon: const Icon(Icons.person_2_outlined),
                          ),
                          SideMenuItem(
                            title: 'Bookings',
                            onTap: (page, _) {
                              sideMenu.changePage(page);
                            },
                            icon: const Icon(Icons.person_2_outlined),
                            // Set the style property to change the text size
                          ),
                          SideMenuItem(
                            title: 'Payments',
                            onTap: (page, _) {
                              sideMenu.changePage(page);
                            },
                            icon: const Icon(Icons.mode_comment_outlined),
                          ),
                          SideMenuItem(
                            title: 'Report an issue',
                            onTap: (page, _) {
                              sideMenu.changePage(page);
                            },
                            icon: const Icon(Icons.mode_comment_outlined),
                          ),
                          SideMenuItem(
                            title: 'Help',
                            onTap: (page, _) {
                              sideMenu.changePage(page);
                            },
                            icon: const Icon(Icons.inbox_outlined),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
