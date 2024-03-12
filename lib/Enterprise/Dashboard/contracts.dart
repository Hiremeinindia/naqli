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
        dataRowHeight: 70,
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
            child: Text('6 months', style: TabelText.tableText3),
          )),
        ),
        DataCell(Text('XXXX SAR', style: TabelText.tableText3)),
        DataCell(Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('XXXX SAR', style: TabelText.tableText3),
              Text("Per Day", style: TabelText.tableText4)
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
            child: Text('9 months', style: TabelText.tableText3),
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
            child: Text('2 years', style: TabelText.tableText3),
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
          return Container(
            height: 67.h,
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
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 60, top: 25),
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
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(0),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  padding: EdgeInsets.fromLTRB(3.w, 3.h, 3.w, 3.h),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 25),
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
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.add,
                                      size: 19,
                                    ),
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
                                      height: 340,
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
          );
        } else {
          return SingleChildScrollView(
            child: Container(
              height: 682,
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
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(0),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 120, top: 25),
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
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(0),
                        topRight: Radius.circular(0),
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    padding: EdgeInsets.fromLTRB(3.w, 3.h, 3.w, 3.h),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
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
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.add,
                                      size: 19,
                                    ),
                                    Text("New Contract"),
                                  ],
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
                                        height: 340,
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
