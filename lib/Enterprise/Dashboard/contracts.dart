import 'package:flutter/material.dart';
import 'package:flutter_application_1/Widgets/formText.dart';
import 'package:sizer/sizer.dart';

class Contracts extends StatefulWidget {
  Contracts();
  @override
  State<Contracts> createState() => _PaymentsState();
}

class _PaymentsState extends State<Contracts> {
  final ScrollController _paymentScroll = ScrollController();
  DataTable _createDataTable() {
    return DataTable(
        headingRowHeight: 65,
        dataRowHeight: 80,
        headingRowColor: MaterialStateColor.resolveWith(
          (states) => Color.fromRGBO(75, 61, 82, 1),
        ),
        columns: _createColumns(),
        rows: _payments());
  }

  List<DataColumn> _createColumns() {
    return [
      DataColumn(
        label: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('Booking ID', style: TabelText.headerText),
        ),
      ),
      DataColumn(
        label: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('Contract ID', style: TabelText.headerText),
        ),
      ),
      DataColumn(
        label: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('Tenure period', style: TabelText.headerText),
        ),
      ),
      DataColumn(
        label: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('Total value', style: TabelText.headerText),
        ),
      ),
      DataColumn(
        label: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('Recurring charge', style: TabelText.headerText),
        ),
      ),
    ];
  }

  List<DataRow> _payments() {
    return [
      DataRow(cells: [
        DataCell(
          Text(
            '#2341456721',
            style: TabelText.tableText3,
          ),
        ),
        DataCell(
          Text('#1568943128', style: TabelText.tableText3),
        ),
        DataCell(
          Center(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('1 year', style: TabelText.tableText3),
          )),
        ),
        DataCell(Text('XXXX SAR', style: TabelText.tableText3)),
        DataCell(Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('XXXX SAR', style: TabelText.tableText3),
              Text("Per month", style: TabelText.tableText4)
            ],
          ),
        )),
      ]),
      DataRow(cells: [
        DataCell(
          Text(
            '#2341456721',
            style: TabelText.tableText3,
          ),
        ),
        DataCell(
          Text('#1568943128', style: TabelText.tableText3),
        ),
        DataCell(
          Center(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('1 year', style: TabelText.tableText3),
          )),
        ),
        DataCell(Text('XXXX SAR', style: TabelText.tableText3)),
        DataCell(Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('XXXX SAR', style: TabelText.tableText3),
              Text("Per month", style: TabelText.tableText4)
            ],
          ),
        )),
      ]),
      DataRow(cells: [
        DataCell(
          Text(
            '#2341456721',
            style: TabelText.tableText3,
          ),
        ),
        DataCell(
          Text('#1568943128', style: TabelText.tableText3),
        ),
        DataCell(
          Center(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('1 year', style: TabelText.tableText3),
          )),
        ),
        DataCell(Text('XXXX SAR', style: TabelText.tableText3)),
        DataCell(Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('XXXX SAR', style: TabelText.tableText3),
              Text("Per month", style: TabelText.tableText4)
            ],
          ),
        )),
      ]),
      DataRow(cells: [
        DataCell(
          Text(
            '#2341456721',
            style: TabelText.tableText3,
          ),
        ),
        DataCell(
          Text('#1568943128', style: TabelText.tableText3),
        ),
        DataCell(
          Center(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('1 year', style: TabelText.tableText3),
          )),
        ),
        DataCell(Text('XXXX SAR', style: TabelText.tableText3)),
        DataCell(Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('XXXX SAR', style: TabelText.tableText3),
              Text("Per month", style: TabelText.tableText4)
            ],
          ),
        )),
      ]),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return LayoutBuilder(
          builder: (BuildContext ctx, BoxConstraints constraints) {
        if (constraints.maxWidth >= 850) {
          return SingleChildScrollView(
            child: Container(
              height: 691,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Color.fromRGBO(255, 255, 255, 0.925),
              ),
              // padding: EdgeInsets.fromLTRB(3.w, 3.h, 3.w, 3.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 1250,
                    height: 92,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(75, 61, 82, 1),
                      border: Border.all(
                        width: 1.0,
                        color: Color.fromRGBO(75, 61, 82, 1),
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 70, top: 25),
                      child: Text(
                        "Contracts",
                        style: TextStyle(
                            fontFamily: "Helvetica",
                            fontSize: 30,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 70),
                              child: Container(
                                height: 50,
                                width: 160,
                                padding: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(Icons.add),
                                      Text("New Contract"),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Scrollbar(
                                    controller: _paymentScroll,
                                    thumbVisibility:
                                        true, // Set to true to always show the scrollbar
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      controller: _paymentScroll,
                                      child: Container(
                                        height: 300,
                                        width: 1100,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.withOpacity(
                                                  0.5), // Adjust the shadow color and opacity
                                              blurRadius:
                                                  5.0, // Adjust the blur radius for a more visible shadow
                                            ),
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        child: SizedBox(
                                          height: 220,
                                          child: ListView(
                                            children: [_createDataTable()],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 150,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 110),
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Container(
                                        height:
                                            10, // Adjust the height as needed
                                        // Set the desired length of the scroll bar
                                        color: Colors
                                            .grey, // Background color of the scrollable area
                                      ),
                                    ),
                                  ),
                                ],
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
          );
        } else {
          return SingleChildScrollView(
            child: Container(
              height: 691,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Color.fromRGBO(255, 255, 255, 0.925),
              ),
              // padding: EdgeInsets.fromLTRB(3.w, 3.h, 3.w, 3.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 1250,
                    height: 92,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(75, 61, 82, 1),
                      border: Border.all(
                        width: 1.0,
                        color: Color.fromRGBO(75, 61, 82, 1),
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 70, top: 25),
                      child: Text(
                        "Contracts",
                        style: TextStyle(
                            fontFamily: "Helvetica",
                            fontSize: 30,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 70),
                              child: Container(
                                height: 50,
                                width: 160,
                                padding: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(Icons.add),
                                      Text("New Contract"),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Scrollbar(
                                    controller: _paymentScroll,
                                    thumbVisibility:
                                        true, // Set to true to always show the scrollbar
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      controller: _paymentScroll,
                                      child: Container(
                                        height: 300,
                                        width: 1100,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.withOpacity(
                                                  0.5), // Adjust the shadow color and opacity
                                              blurRadius:
                                                  5.0, // Adjust the blur radius for a more visible shadow
                                            ),
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        child: SizedBox(
                                          height: 220,
                                          child: ListView(
                                            children: [_createDataTable()],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 150,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 110),
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Container(
                                        height:
                                            10, // Adjust the height as needed
                                        // Set the desired length of the scroll bar
                                        color: Colors
                                            .grey, // Background color of the scrollable area
                                      ),
                                    ),
                                  ),
                                ],
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
          );
        }
      });
    });
  }
}
