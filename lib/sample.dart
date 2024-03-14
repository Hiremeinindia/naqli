import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:easy_sidemenu/easy_sidemenu.dart';

import 'package:sizer/sizer.dart';

class bookinghistory extends StatefulWidget {
  const bookinghistory({Key? key}) : super(key: key);
  @override
  _bookinghistoryState createState() => _bookinghistoryState();
}

class _bookinghistoryState extends State<bookinghistory> {
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
                elevation: 3,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(5.w, 0, 2.5.w, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        'Naqli-final-logo.png',
                        width: 10.w,
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
                                fontSize: 20,
                                fontFamily: "HelveticaNeue",
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
                              // Handle the third button press
                            },
                            child: Text(
                              'Partner',
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: "HelveticaNeue",
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
            body: Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(6.w, 6.h, 6.w, 6.h),
                child: Container(
                  color: Color.fromRGBO(245, 243, 255, 1).withOpacity(0.5),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0.1.h),
                        height: 850,
                        width: 340,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color.fromARGB(255, 216, 214, 214)
                                .withOpacity(0.5),
                          ),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              color: Color.fromARGB(255, 199, 198, 198)
                                  .withOpacity(0.5),
                              blurRadius: 10,
                              spreadRadius: 4,
                              offset: Offset(0, 0.5), // Bottom side shadow
                            ),
                            BoxShadow(
                              color: Color.fromARGB(255, 255, 255, 255)
                                  .withOpacity(0.1),
                              blurRadius: 1,
                              spreadRadius: 0, // Bottom side shadow
                            ),
                          ],
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                            topRight: Radius.circular(0),
                            bottomRight: Radius.circular(10),
                          ),
                          color: Color.fromRGBO(236, 233, 250, 1),
                        ),
                        child: Column(
                          children: [
                            Container(
                              width: double.infinity,
                              height: 350,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(255, 255, 255, 1),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(7),
                                  bottomLeft: Radius.circular(7),
                                  topRight: Radius.circular(0),
                                  bottomRight: Radius.circular(7),
                                ),
                              ),
                              child: Image.asset(
                                'Circleavatar.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 1.5, top: 20),
                              child: SizedBox(
                                height: 300,
                                child: SideMenu(
                                  controller: sideMenu,
                                  style: SideMenuStyle(
                                    displayMode: SideMenuDisplayMode.auto,
                                    selectedColor:
                                        Color.fromRGBO(98, 105, 254, 1),
                                    unselectedTitleTextStyle: const TextStyle(
                                      fontFamily: 'SFProText',
                                      fontSize: 15,
                                      color: Color.fromRGBO(128, 118, 118, 1),
                                    ),
                                    selectedTitleTextStyle: const TextStyle(
                                      fontFamily: 'SFProText',
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                                    unselectedIconColor:
                                        Color.fromRGBO(128, 118, 118, 1),
                                    selectedIconColor: Colors.white,
                                  ),
                                  items: [
                                    SideMenuItem(
                                      title: 'Current Booking',
                                      onTap: (page, _) {
                                        sideMenu.changePage(page);
                                      },
                                      icon: Icon(Icons.login_outlined),
                                    ),
                                    SideMenuItem(
                                      title: 'Booking History',
                                      onTap: (page, _) {
                                        sideMenu.changePage(page);
                                      },
                                      icon: Icon(Icons.person_2_outlined),
                                    ),
                                    SideMenuItem(
                                      title: 'Payment',
                                      onTap: (page, _) {
                                        sideMenu.changePage(page);
                                      },
                                      icon: Icon(Icons.person_2_outlined),
                                      // Set the style property to change the text size
                                    ),
                                    SideMenuItem(
                                      title: 'Report',
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
                                      icon: Icon(Icons.inbox_outlined),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(4.w, 4.5.h, 3.w, 2.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 80,
                                child: Text('Booking history',
                                    style: TextStyle(
                                        fontSize: 35,
                                        color: Colors.brown[100])),
                              ),
                              SizedBox(height: 10),
                              Container(
                                width: MediaQuery.of(context).size.width -
                                    40, // Set width to match screen width
                                decoration: BoxDecoration(
                                  border: Border.all(width: 0.5),
                                  borderRadius: BorderRadius.circular(5),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color.fromRGBO(199, 199, 199, 1)
                                          .withOpacity(0.5),
                                      blurRadius: 10,
                                      spreadRadius: 4,
                                      offset:
                                          Offset(0, 0.5), // Bottom side shadow
                                    ),
                                  ],
                                ),
                                child: DataTable(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(5),
                                      topRight: Radius.circular(5),
                                    ),
                                  ),
                                  headingRowColor:
                                      MaterialStateColor.resolveWith((states) =>
                                          Color.fromRGBO(75, 61, 82, 1)),
                                  dataRowColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.white),
                                  showBottomBorder: true,
                                  dividerThickness: 1.0,
                                  dataRowHeight: 65,
                                  columns: <DataColumn>[
                                    DataColumn(
                                        label: Expanded(
                                            child: Text(
                                      'Mode',
                                      style: TextStyle(color: Colors.white),
                                      textAlign: TextAlign.center,
                                    ))),
                                    DataColumn(
                                        label: Expanded(
                                            child: Text(
                                      'Booking Id',
                                      style: TextStyle(color: Colors.white),
                                      textAlign: TextAlign.center,
                                    ))),
                                    DataColumn(
                                        label: Expanded(
                                            child: Text(
                                      'Date',
                                      style: TextStyle(color: Colors.white),
                                      textAlign: TextAlign.center,
                                    ))),
                                    DataColumn(
                                        label: Expanded(
                                            child: Text(
                                      'Unit Type',
                                      style: TextStyle(color: Colors.white),
                                      textAlign: TextAlign.center,
                                    ))),
                                    DataColumn(
                                        label: Expanded(
                                            child: Text(
                                      'Payment',
                                      style: TextStyle(color: Colors.white),
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
                                          'Xxx SAR'
                                        ])
                                          DataCell(
                                            Container(
                                              height:
                                                  65, // Adjust height as needed
                                              alignment: Alignment.center,
                                              child: Text(item),
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
                                          'Xxx SAR'
                                        ])
                                          DataCell(
                                            Container(
                                              height:
                                                  65, // Adjust height as needed
                                              alignment: Alignment.center,
                                              child: Text(item),
                                            ),
                                          ),
                                      ],
                                    ),
                                    DataRow(
                                      cells: <DataCell>[
                                        for (var item in [
                                          'Equipment Hire',
                                          '#456789231',
                                          '12.5.2022',
                                          'Crane',
                                          'Xxx SAR'
                                        ])
                                          DataCell(
                                            Container(
                                              height:
                                                  65, // Adjust height as needed
                                              alignment: Alignment.center,
                                              child: Text(item),
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
                ),
              ),
            ),
          );
        } else {
          return Container();
        }
      });
    });
  }
}
