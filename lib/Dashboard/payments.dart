import 'package:flutter/material.dart';
import 'package:flutter_application_1/Widgets/formText.dart';
import 'package:sizer/sizer.dart';

class Payments extends StatefulWidget {
  Payments();
  @override
  State<Payments> createState() => _PaymentsState();
}

class _PaymentsState extends State<Payments> {
  DataTable _createDataTable() {
    return DataTable(
        headingRowHeight: 65,
        dataRowHeight: 60,
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
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text('Booking ID', style: TabelText.headerText),
          ),
        ),
      ),
      DataColumn(
        label: Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Center(child: Text('Booking Type', style: TabelText.headerText)),
        ),
      ),
      DataColumn(
        label: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Text('Contract', style: TabelText.headerText),
          ),
        ),
      ),
      DataColumn(
        label: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text('Status', style: TabelText.headerText),
          ),
        ),
      ),
      DataColumn(
        label: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text('Payment Made', style: TabelText.headerText),
          ),
        ),
      ),
      DataColumn(
        label: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text('Pending Payment', style: TabelText.headerText),
          ),
        ),
      ),
    ];
  }

  List<DataRow> _payments() {
    return [
      DataRow(cells: [
        DataCell(
          Text(
            'NAQBOOK***',
            style: TabelText.tableText1,
          ),
        ),
        DataCell(
          Center(child: Text('Single', style: TabelText.tableText1)),
        ),
        DataCell(Center(child: Text('_', style: TabelText.tableText1))),
        DataCell(
          Center(
            child: Image.asset(
              'Group353.png',
              width: 50,
              height: 30,
            ),
          ),
        ),
        DataCell(Center(child: Text('SAR XXXX', style: TabelText.headerText1))),
        DataCell(
            Center(child: Text('Completed', style: TabelText.headerText2))),
      ]),
      DataRow(cells: [
        DataCell(Text(
          'NAQBOOK***',
          style: TabelText.tableText1,
        )),
        DataCell(Center(child: Text('Contract', style: TabelText.tableText1))),
        DataCell(Center(
          child: Column(
            children: [
              Text('SAR 3000', style: TabelText.tableText1),
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Text('Per Month-August 2024', style: TabelText.text4),
              ),
            ],
          ),
        )),
        DataCell(
          Center(
            child: Image.asset(
              'Group268.png',
              width: 50,
              height: 30,
            ),
          ),
        ),
        DataCell(Center(child: Text('SAR XXXX', style: TabelText.headerText1))),
        DataCell(
          Center(
            child: SizedBox(
              width: 95,
              height: 30,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  side: BorderSide(
                    color: Color.fromRGBO(92, 85, 67, 1),
                  ),
                ),
                child: Text(
                  'Running',
                  style: TextStyle(
                    color: Color.fromRGBO(92, 85, 67, 1),
                    fontSize: 12,
                    fontFamily: "Helvetica",
                  ),
                ),
              ),
            ),
          ),
        ),
      ]),
      DataRow(cells: [
        DataCell(Text(
          'NAQBOOK***',
          style: TabelText.tableText1,
        )),
        DataCell(Center(child: Text('Single', style: TabelText.tableText1))),
        DataCell(Center(child: Text('_', style: TabelText.tableText1))),
        DataCell(
          Center(
            child: Image.asset(
              'Group353.png',
              width: 50,
              height: 30,
            ),
          ),
        ),
        DataCell(Center(child: Text('SAR XXXX', style: TabelText.headerText1))),
        DataCell(
          Center(
            child: SizedBox(
              width: 95,
              height: 30,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(110, 90, 234, 1),
                  side: BorderSide(
                    color: Color.fromRGBO(110, 90, 234, 1),
                  ),
                ),
                child: Text(
                  'Pay Pal',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontFamily: "Helvetica",
                  ),
                ),
              ),
            ),
          ),
        ),
      ]),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return LayoutBuilder(
          builder: (BuildContext ctx, BoxConstraints constraints) {
        if (constraints.maxWidth >= 850) {
          return Padding(
            padding: const EdgeInsets.only(left: 10, top: 30),
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Container(
                height: 300,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey,
                        blurRadius: 0.1 // changes position of shadow
                        ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            height: 50,
                            width: 193,
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: 'All',
                                onChanged: (String? newValue) {
                                  // Handle dropdown value change
                                },
                                items: <String>[
                                  'All',
                                  'Completed',
                                  'Incomplete Booking',
                                  'Pending Payment',
                                ].map<DropdownMenuItem<String>>(
                                  (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                        style: TextStyle(
                                            fontFamily: 'Colfax', fontSize: 16),
                                      ),
                                    );
                                  },
                                ).toList(),
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
                                Container(
                                    height: 300,
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.white,
                                            blurRadius:
                                                2.0 // changes position of shadow
                                            ),
                                      ],
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: SizedBox(
                                      height: 220,
                                      child: ListView(
                                        children: [_createDataTable()],
                                      ),
                                    )),
                                SizedBox(
                                  height: 150,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 110),
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Container(
                                      height: 10, // Adjust the height as needed
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
              ),
            ),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.only(left: 90, top: 90),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 110),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: 50,
                        width: 193,
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: 'All',
                            onChanged: (String? newValue) {
                              // Handle dropdown value change
                            },
                            items: <String>[
                              'All',
                              'Completed',
                              'Incomplete Booking',
                              'Pending Payment',
                            ].map<DropdownMenuItem<String>>(
                              (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: TextStyle(
                                        fontFamily: 'Colfax', fontSize: 16),
                                  ),
                                );
                              },
                            ).toList(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 110),
                            child: Expanded(
                              child: Container(
                                height: 420,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Table(
                                  border: TableBorder(
                                    horizontalInside: BorderSide(
                                        width: 0.1,
                                        color: Color.fromRGBO(80, 69, 74, 1),
                                        style: BorderStyle.solid),
                                  ),
                                  // textDirection: TextDirection.rtl,
                                  // defaultVerticalAlignment: TableCellVerticalAlignment.bottom,
                                  // border:TableBorder.all(width: 2.0,color: Colors.red),
                                  children: [
                                    TableRow(children: [
                                      Container(
                                        height: 60,
                                        color: Color.fromRGBO(
                                            75, 61, 82, 1), // Brown color
                                        child: Center(
                                          child: Text(
                                            "Booking ID",
                                            textScaleFactor: 1.5,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 10,
                                                fontFamily: "SFProText"),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 60,
                                        color: Color.fromRGBO(75, 61, 82, 1),
                                        child: Center(
                                          child: Text(
                                            "Type",
                                            textScaleFactor: 1.5,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 10,
                                                fontFamily: "SFProText"),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 60,
                                        color: Color.fromRGBO(75, 61, 82, 1),
                                        child: Center(
                                          child: Text(
                                            "Booking Status",
                                            textScaleFactor: 1.5,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 10,
                                                fontFamily: "SFProText"),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 60,
                                        color: Color.fromRGBO(75, 61, 82, 1),
                                        child: Center(
                                          child: Text(
                                            "Payment Made",
                                            textScaleFactor: 1.5,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 10,
                                                fontFamily: "SFProText"),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 60,
                                        color: Color.fromRGBO(75, 61, 82, 1),
                                        child: Center(
                                          child: Text(
                                            "Pending Payment",
                                            textScaleFactor: 1.5,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 10,
                                                fontFamily: "SFProText"),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 60,
                                        color: Color.fromRGBO(75, 61, 82, 1),
                                        child: Center(
                                          child: Text(
                                            "Actions",
                                            textScaleFactor: 1.5,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 10,
                                                fontFamily: "SFProText"),
                                          ),
                                        ),
                                      ),
                                    ]),
                                    TableRow(children: [
                                      Container(
                                        height: 50,
                                        child: Center(
                                          child: Text(
                                            "#8734562315",
                                            textScaleFactor: 1.5,
                                            style: TextStyle(
                                                color:
                                                    Color.fromRGBO(3, 1, 1, 1),
                                                fontSize: 9,
                                                fontFamily: "SFProText"),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 50,
                                        child: Center(
                                          child: Text(
                                            "Single",
                                            textScaleFactor: 1.5,
                                            style: TextStyle(
                                                color:
                                                    Color.fromRGBO(3, 1, 1, 1),
                                                fontSize: 9,
                                                fontFamily: "SFProText"),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 50,
                                        child: Center(
                                          child: Image.asset(
                                            'Group353.png',
                                            width: 50,
                                            height: 30,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 50,
                                        child: Center(
                                          child: Text(
                                            "XXXXX SAR",
                                            textScaleFactor: 1.5,
                                            style: TextStyle(
                                                color:
                                                    Color.fromRGBO(3, 1, 1, 1),
                                                fontSize: 9,
                                                fontFamily: "SFProText"),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 50,
                                        child: Center(
                                          child: Text(
                                            "Paid",
                                            textScaleFactor: 1.5,
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    46, 173, 11, 1),
                                                fontSize: 9,
                                                fontFamily: "SFProText"),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 50,
                                        child: Center(
                                          child: Text(
                                            "Completed",
                                            textScaleFactor: 1.5,
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    124, 115, 115, 1),
                                                fontSize: 9,
                                                fontFamily: "SFProText"),
                                          ),
                                        ),
                                      ),
                                    ]),
                                    TableRow(children: [
                                      Container(
                                        height: 50,
                                        child: Center(
                                          child: Text(
                                            "#8734562315",
                                            textScaleFactor: 1.5,
                                            style: TextStyle(
                                                color:
                                                    Color.fromRGBO(3, 1, 1, 1),
                                                fontSize: 9,
                                                fontFamily: "SFProText"),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 50,
                                        child: Center(
                                          child: Text(
                                            "Contract",
                                            textScaleFactor: 1.5,
                                            style: TextStyle(
                                                color:
                                                    Color.fromRGBO(3, 1, 1, 1),
                                                fontSize: 9,
                                                fontFamily: "SFProText"),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 50,
                                        child: Center(
                                          child: Image.asset(
                                            'Group268.png',
                                            width: 50,
                                            height: 30,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 50,
                                        child: Center(
                                          child: Text(
                                            "XXXXX SAR",
                                            textScaleFactor: 1.5,
                                            style: TextStyle(
                                                color:
                                                    Color.fromRGBO(3, 1, 1, 1),
                                                fontSize: 9,
                                                fontFamily: "SFProText"),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 50,
                                        child: Center(
                                          child: Text(
                                            "XXXXX SAR",
                                            textScaleFactor: 1.5,
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    228, 18, 17, 1),
                                                fontSize: 9,
                                                fontFamily: "SFProText"),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 50,
                                        child: Center(
                                          child: SizedBox(
                                            width: 95,
                                            height: 30,
                                            child: ElevatedButton(
                                              onPressed: () {},
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Color.fromRGBO(
                                                    110, 90, 234, 1),
                                                side: BorderSide(
                                                  color: Color.fromRGBO(
                                                      110, 90, 234, 1),
                                                ),
                                              ),
                                              child: Text(
                                                'Pay Pal',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12,
                                                  fontFamily: "Helvetica",
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ]),
                                    TableRow(children: [
                                      Container(
                                        height: 50,
                                        child: Center(
                                          child: Text(
                                            "#8867034541",
                                            textScaleFactor: 1.5,
                                            style: TextStyle(
                                                color:
                                                    Color.fromRGBO(3, 1, 1, 1),
                                                fontSize: 9,
                                                fontFamily: "SFProText"),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 50,
                                        child: Center(
                                          child: Text(
                                            "Single",
                                            textScaleFactor: 1.5,
                                            style: TextStyle(
                                                color:
                                                    Color.fromRGBO(3, 1, 1, 1),
                                                fontSize: 9,
                                                fontFamily: "SFProText"),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 50,
                                        child: Center(
                                          child: Image.asset(
                                            'Group353.png',
                                            width: 50,
                                            height: 30,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 50,
                                        child: Center(
                                          child: Text(
                                            "XXXXX SAR",
                                            textScaleFactor: 1.5,
                                            style: TextStyle(
                                                color:
                                                    Color.fromRGBO(3, 1, 1, 1),
                                                fontSize: 9,
                                                fontFamily: "SFProText"),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 50,
                                        child: Center(
                                          child: Text(
                                            "Paid",
                                            textScaleFactor: 1.5,
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    46, 173, 11, 1),
                                                fontSize: 9,
                                                fontFamily: "SFProText"),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 50,
                                        child: Center(
                                          child: Text(
                                            "Completed",
                                            textScaleFactor: 1.5,
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    124, 115, 115, 1),
                                                fontSize: 9,
                                                fontFamily: "SFProText"),
                                          ),
                                        ),
                                      ),
                                    ]),
                                    TableRow(children: [
                                      Container(
                                        height: 50,
                                        child: Center(
                                          child: Text(
                                            "#8439841362",
                                            textScaleFactor: 1.5,
                                            style: TextStyle(
                                                color:
                                                    Color.fromRGBO(3, 1, 1, 1),
                                                fontSize: 9,
                                                fontFamily: "SFProText"),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 50,
                                        child: Center(
                                          child: Text(
                                            "Contract",
                                            textScaleFactor: 1.5,
                                            style: TextStyle(
                                                color:
                                                    Color.fromRGBO(3, 1, 1, 1),
                                                fontSize: 9,
                                                fontFamily: "SFProText"),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 50,
                                        child: Center(
                                          child: Image.asset(
                                            'Group353.png',
                                            width: 50,
                                            height: 30,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 50,
                                        child: Center(
                                          child: Text(
                                            "XXXXX SAR",
                                            textScaleFactor: 1.5,
                                            style: TextStyle(
                                                color:
                                                    Color.fromRGBO(3, 1, 1, 1),
                                                fontSize: 9,
                                                fontFamily: "SFProText"),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 50,
                                        child: Center(
                                          child: Text(
                                            "Paid",
                                            textScaleFactor: 1.5,
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    46, 173, 11, 1),
                                                fontSize: 9,
                                                fontFamily: "SFProText"),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 50,
                                        child: Center(
                                          child: SizedBox(
                                            width: 95,
                                            height: 30,
                                            child: ElevatedButton(
                                              onPressed: () {},
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.white,
                                                side: BorderSide(
                                                    color: Colors.white),
                                              ),
                                              child: Text(
                                                'Running',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 12,
                                                  fontFamily: "Helvetica",
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ]),
                                    TableRow(children: [
                                      Container(
                                        height: 50,
                                        child: Center(
                                          child: Text(
                                            "#8081408245",
                                            textScaleFactor: 1.5,
                                            style: TextStyle(
                                                color:
                                                    Color.fromRGBO(3, 1, 1, 1),
                                                fontSize: 9,
                                                fontFamily: "SFProText"),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 50,
                                        child: Center(
                                          child: Text(
                                            "Single",
                                            textScaleFactor: 1.5,
                                            style: TextStyle(
                                                color:
                                                    Color.fromRGBO(3, 1, 1, 1),
                                                fontSize: 9,
                                                fontFamily: "SFProText"),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 50,
                                        child: Center(
                                          child: Image.asset(
                                            'Group268.png',
                                            width: 50,
                                            height: 30,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 50,
                                        child: Center(
                                          child: Text(
                                            "XXXXX SAR",
                                            textScaleFactor: 1.5,
                                            style: TextStyle(
                                                color:
                                                    Color.fromRGBO(3, 1, 1, 1),
                                                fontSize: 9,
                                                fontFamily: "SFProText"),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 50,
                                        child: Center(
                                          child: Text(
                                            "XXXXX SAR",
                                            textScaleFactor: 1.5,
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    228, 18, 17, 1),
                                                fontSize: 9,
                                                fontFamily: "SFProText"),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 50,
                                        child: Center(
                                          child: SizedBox(
                                            width: 95,
                                            height: 30,
                                            child: ElevatedButton(
                                              onPressed: () {},
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Color.fromRGBO(
                                                    110, 90, 234, 1),
                                                side: BorderSide(
                                                  color: Color.fromRGBO(
                                                      110, 90, 234, 1),
                                                ),
                                              ),
                                              child: Text(
                                                'Pay Pal',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12,
                                                  fontFamily: "Helvetica",
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ]),
                                    TableRow(children: [
                                      Container(
                                        height: 50,
                                        child: Center(
                                          child: Text(
                                            "#8285746149",
                                            textScaleFactor: 1.5,
                                            style: TextStyle(
                                                color:
                                                    Color.fromRGBO(3, 1, 1, 1),
                                                fontSize: 9,
                                                fontFamily: "SFProText"),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 50,
                                        child: Center(
                                          child: Text(
                                            "Contract",
                                            textScaleFactor: 1.5,
                                            style: TextStyle(
                                                color:
                                                    Color.fromRGBO(3, 1, 1, 1),
                                                fontSize: 9,
                                                fontFamily: "SFProText"),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 50,
                                        child: Center(
                                          child: Image.asset(
                                            'Group353.png',
                                            width: 50,
                                            height: 30,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 50,
                                        child: Center(
                                          child: Text(
                                            "XXXXX SAR",
                                            textScaleFactor: 1.5,
                                            style: TextStyle(
                                                color:
                                                    Color.fromRGBO(3, 1, 1, 1),
                                                fontSize: 9,
                                                fontFamily: "SFProText"),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 50,
                                        child: Center(
                                          child: Text(
                                            "Paid",
                                            textScaleFactor: 1.5,
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    46, 173, 11, 1),
                                                fontSize: 9,
                                                fontFamily: "SFProText"),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 50,
                                        child: Center(
                                          child: Text(
                                            "Completed",
                                            textScaleFactor: 1.5,
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    124, 115, 115, 1),
                                                fontSize: 9,
                                                fontFamily: "SFProText"),
                                          ),
                                        ),
                                      ),
                                    ]),
                                    TableRow(children: [
                                      Container(
                                        height: 50,
                                        child: Center(
                                          child: Text(
                                            "#8189472734",
                                            textScaleFactor: 1.5,
                                            style: TextStyle(
                                                color:
                                                    Color.fromRGBO(3, 1, 1, 1),
                                                fontSize: 9,
                                                fontFamily: "SFProText"),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 50,
                                        child: Center(
                                          child: Text(
                                            "Contract",
                                            textScaleFactor: 1.5,
                                            style: TextStyle(
                                                color:
                                                    Color.fromRGBO(3, 1, 1, 1),
                                                fontSize: 9,
                                                fontFamily: "SFProText"),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 50,
                                        child: Center(
                                          child: Image.asset(
                                            'Group268.png',
                                            width: 50,
                                            height: 30,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 50,
                                        child: Center(
                                          child: Text(
                                            "XXXXX SAR",
                                            textScaleFactor: 1.5,
                                            style: TextStyle(
                                                color:
                                                    Color.fromRGBO(3, 1, 1, 1),
                                                fontSize: 9,
                                                fontFamily: "SFProText"),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 50,
                                        child: Center(
                                          child: Text(
                                            "XXXXX SAR",
                                            textScaleFactor: 1.5,
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    228, 18, 17, 1),
                                                fontSize: 9,
                                                fontFamily: "SFProText"),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 50,
                                        child: Center(
                                          child: SizedBox(
                                            width: 95,
                                            height: 30,
                                            child: ElevatedButton(
                                              onPressed: () {},
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Color.fromRGBO(
                                                    110, 90, 234, 1),
                                                side: BorderSide(
                                                  color: Color.fromRGBO(
                                                      110, 90, 234, 1),
                                                ),
                                              ),
                                              child: Text(
                                                'Pay Pal',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12,
                                                  fontFamily: "Helvetica",
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ]),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 100,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 110),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Container(
                                height: 10, // Adjust the height as needed
                                width:
                                    1100, // Set the desired length of the scroll bar
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
          );
        }
      });
    });
  }
}
