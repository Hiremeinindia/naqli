import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:easy_sidemenu/easy_sidemenu.dart';

import 'package:sizer/sizer.dart';

class SingleUserPayment extends StatefulWidget {
  SingleUserPayment();

  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<SingleUserPayment> {
  PageController page = PageController();
  SideMenuController sideMenu = SideMenuController();
  ScrollController _scrollController = ScrollController();

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
        if (constraints.maxWidth >= 1380) {
          return Padding(
            padding: EdgeInsets.fromLTRB(3.w, 3.h, 3.w, 3.h),
            child: Container(
              color: Color.fromRGBO(245, 243, 255, 1).withOpacity(0.5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(6.w, 6.h, 6.w, 6.h),
                    child: Container(
                      width: 1200,
                      height: 100, // Increased height to accommodate button
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Booking ID  XXXXX',
                            style: TextStyle(
                                fontSize: 20.0,
                                fontFamily: 'SFPRo Text-regular'),
                          ),
                          Text(
                            'Booking Value : SAR xxxxxx',
                            style: TextStyle(
                                fontSize: 20.0,
                                fontFamily: 'SFPRo Text-regular'),
                          ),
                          Text(
                            'Paid : SAR xxxxx',
                            style: TextStyle(
                                fontSize: 20.0,
                                fontFamily: 'SFPRo Text-regular'),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Balance',
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontFamily: 'SFPRo Text-regular'),
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
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                child: Text('XXXXX SAR',
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontFamily: 'SFPRo Text-regular')),
                              ),
                            ],
                          )
                        ],
                      ),

                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(width: 0.5),
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(199, 199, 199, 1)
                                .withOpacity(0.5),
                            blurRadius: 1,
                            spreadRadius: 4,
                            offset: Offset(0, 0.5), // Bottom side shadow
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  Padding(
                    padding: EdgeInsets.fromLTRB(3.w, 3.h, 3.w, 3.h),
                    child: Container(
                      width: MediaQuery.of(context).size.width -
                          40, // Set width to match screen width
                      decoration: BoxDecoration(
                        border: Border.all(width: 0.5),
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(199, 199, 199, 1)
                                .withOpacity(0.5),
                            blurRadius: 1,
                            spreadRadius: 4,
                            offset: Offset(0, 0.5), // Bottom side shadow
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
                        headingRowColor: MaterialStateColor.resolveWith(
                            (states) => Color.fromRGBO(75, 61, 82, 1)),
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
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontFamily: 'SFproText-Regular'),
                            textAlign: TextAlign.center,
                          ))),
                          DataColumn(
                              label: Expanded(
                                  child: Text(
                            'Booking Id',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontFamily: 'SFproText-Regular'),
                            textAlign: TextAlign.center,
                          ))),
                          DataColumn(
                              label: Expanded(
                                  child: Text(
                            'Date',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontFamily: 'SFproText-Regular'),
                            textAlign: TextAlign.center,
                          ))),
                          DataColumn(
                              label: Expanded(
                                  child: Text(
                            'Unit Type',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontFamily: 'SFproText-Regular'),
                            textAlign: TextAlign.center,
                          ))),
                          DataColumn(
                              label: Expanded(
                                  child: Text(
                            'Payment',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontFamily: 'SFproText-Regular'),
                            textAlign: TextAlign.center,
                          ))),
                          DataColumn(
                              label: Expanded(
                                  child: Text(
                            'Payment Status',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontFamily: 'SFproText-Regular'),
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
                                'Xxx SAR',
                                'Completed'
                              ])
                                DataCell(
                                  Container(
                                    height: 65, // Adjust height as needed
                                    alignment: Alignment.center,
                                    child: Text(item,
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontFamily: 'SFproText-Regular')),
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
                                'Xxx SAR',
                                'Completed'
                              ])
                                DataCell(
                                  Container(
                                    height: 65, // Adjust height as needed
                                    alignment: Alignment.center,
                                    child: Text(item,
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontFamily: 'SFproText-Regular')),
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
                                'Xxx SAR',
                                'Completed'
                              ])
                                DataCell(
                                  Container(
                                    height: 65, // Adjust height as needed
                                    alignment: Alignment.center,
                                    child: Text(
                                      item,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontFamily: 'SFproText-Regular'),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return Padding(
            padding: EdgeInsets.fromLTRB(3.w, 3.h, 3.w, 3.h),
            child: Container(
              color: Color.fromRGBO(245, 243, 255, 1).withOpacity(0.5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(3.w, 3.h, 3.w, 3.h),
                    child: Container(
                      width: 1200,
                      height: 100, // Increased height to accommodate button
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Booking ID  XXXXX',
                            style: TextStyle(
                                fontSize: 20.0,
                                fontFamily: 'SFPRo Text-regular'),
                          ),
                          Text(
                            'Booking Value : SAR xxxxxx',
                            style: TextStyle(
                                fontSize: 20.0,
                                fontFamily: 'SFPRo Text-regular'),
                          ),
                          Text(
                            'Paid : SAR xxxxx',
                            style: TextStyle(
                                fontSize: 20.0,
                                fontFamily: 'SFPRo Text-regular'),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Balance',
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontFamily: 'SFPRo Text-regular'),
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
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                child: Text('XXXXX SAR',
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontFamily: 'SFPRo Text-regular')),
                              ),
                            ],
                          )
                        ],
                      ),

                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(width: 0.5),
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(199, 199, 199, 1)
                                .withOpacity(0.5),
                            blurRadius: 1,
                            spreadRadius: 4,
                            offset: Offset(0, 0.5), // Bottom side shadow
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  Padding(
                    padding: EdgeInsets.fromLTRB(3.w, 3.h, 3.w, 3.h),
                    child: Container(
                      width: MediaQuery.of(context).size.width -
                          40, // Set width to match screen width
                      decoration: BoxDecoration(
                        border: Border.all(width: 0.5),
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(199, 199, 199, 1)
                                .withOpacity(0.5),
                            blurRadius: 1,
                            spreadRadius: 4,
                            offset: Offset(0, 0.5), // Bottom side shadow
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
                        headingRowColor: MaterialStateColor.resolveWith(
                            (states) => Color.fromRGBO(75, 61, 82, 1)),
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
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontFamily: 'SFproText-Regular'),
                            textAlign: TextAlign.center,
                          ))),
                          DataColumn(
                              label: Expanded(
                                  child: Text(
                            'Booking Id',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontFamily: 'SFproText-Regular'),
                            textAlign: TextAlign.center,
                          ))),
                          DataColumn(
                              label: Expanded(
                                  child: Text(
                            'Date',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontFamily: 'SFproText-Regular'),
                            textAlign: TextAlign.center,
                          ))),
                          DataColumn(
                              label: Expanded(
                                  child: Text(
                            'Unit Type',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontFamily: 'SFproText-Regular'),
                            textAlign: TextAlign.center,
                          ))),
                          DataColumn(
                              label: Expanded(
                                  child: Text(
                            'Payment',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontFamily: 'SFproText-Regular'),
                            textAlign: TextAlign.center,
                          ))),
                          DataColumn(
                              label: Expanded(
                                  child: Text(
                            'Payment Status',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontFamily: 'SFproText-Regular'),
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
                                'Xxx SAR',
                                'Completed'
                              ])
                                DataCell(
                                  Container(
                                    height: 65, // Adjust height as needed
                                    alignment: Alignment.center,
                                    child: Text(item,
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontFamily: 'SFproText-Regular')),
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
                                'Xxx SAR',
                                'Completed'
                              ])
                                DataCell(
                                  Container(
                                    height: 65, // Adjust height as needed
                                    alignment: Alignment.center,
                                    child: Text(item,
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontFamily: 'SFproText-Regular')),
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
                                'Xxx SAR',
                                'Completed'
                              ])
                                DataCell(
                                  Container(
                                    height: 65, // Adjust height as needed
                                    alignment: Alignment.center,
                                    child: Text(
                                      item,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontFamily: 'SFproText-Regular'),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      });
    });
  }
}
