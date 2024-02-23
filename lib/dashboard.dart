import 'dart:math';

import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/echarts_data.dart';
import 'package:flutter_application_1/homepage.dart';
import 'package:graphic/graphic.dart';
import 'package:flutter/gestures.dart';
import 'package:quiver/iterables.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Dashboard> {
  PageController page = PageController();
  SideMenuController sideMenu = SideMenuController();
  bool value = false;
  bool checkbox1 = false;
  bool checkbox2 = false;
  bool checkbox3 = false;
  bool isButtonEnabled = false;
  int? selectedRadioValue;
  bool payNowButtonEnabled = false;

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

  String month = '';
  @override
  void initState() {
    sideMenu.addListener((p0) {
      page.jumpToPage(p0);
    });
    super.initState();
  }

  TextStyle myTextStyle = const TextStyle(
    fontFamily: 'Poppins',
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: Color.fromRGBO(128, 118, 118, 1),
  );

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

  Widget buildVendorContainer(int value, String vendorName, String amount) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 165,
        height: 50,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              spreadRadius: 1,
              blurRadius: 2, // changes position of shadow
            ),
          ],
          color: getVendorContainerColor(value),
          borderRadius: BorderRadius.circular(25.0),
          border: Border.all(color: Color.fromARGB(246, 245, 242, 242)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 5),
                Radio(
                  value: value,
                  fillColor:
                      MaterialStateColor.resolveWith((states) => Colors.white),
                  groupValue: selectedRadioValue,
                  onChanged: (val) {
                    setState(() {
                      selectedRadioValue = val as int;
                      isButtonEnabled = true;
                    });
                  },
                  activeColor: Colors.white,
                ),
                SizedBox(width: 5),
                Text(vendorName,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 9,
                        color: Color.fromRGBO(128, 118, 118, 1))),
                SizedBox(width: 10),
                Text(
                  amount,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 8,
                      color: Color.fromRGBO(127, 106, 255, 1)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Color getVendorContainerColor(int value) {
    // Provide the color based on the vendor value or any other logic you prefer
    if (value == 1) {
      return Color.fromRGBO(200, 251, 253, 1);
    } else if (value == 2) {
      return Color.fromRGBO(224, 253, 200, 1);
    } else if (value == 3) {
      return Color.fromRGBO(245, 253, 200, 1);
    }
    return Colors.white; // Default color
  }

  bool isAnyCheckboxSelected() {
    return checkbox1 || checkbox2 || checkbox3;
  }

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
        child: Flexible(
          fit: FlexFit.tight,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Padding(
              padding: EdgeInsets.only(left: 80),
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
                                          displayMode: SideMenuDisplayMode.auto,
                                          selectedColor:
                                              Color.fromRGBO(98, 105, 254, 1),
                                          unselectedTitleTextStyle: myTextStyle,
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
                                            priority: 0,
                                            title: 'Dashboard',
                                            onTap: (page, _) {
                                              sideMenu.changePage(page);
                                            },
                                            icon: const Icon(
                                                Icons.login_outlined),
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
                                            // Set the style property to change the text size
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
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                              width: 1200,
                              color: Color.fromRGBO(240, 237, 250, 0.9),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 90, top: 30),
                                    child: Row(
                                      children: [
                                        Text("No of Bookings  "),
                                        Text(
                                          "103",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 90, top: 10),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          margin:
                                              const EdgeInsets.only(top: 10),
                                          width: 350,
                                          height: 250,
                                          child: Stack(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 10,
                                                        horizontal: 80),
                                                child: PieChart(
                                                  swapAnimationDuration:
                                                      const Duration(
                                                          seconds: 1),
                                                  swapAnimationCurve:
                                                      Curves.easeInOutQuint,
                                                  PieChartData(
                                                    pieTouchData: PieTouchData(
                                                      touchCallback:
                                                          tapOnPieChart,
                                                    ),
                                                    sections: [
                                                      PieChartSectionData(
                                                          color: Colors.orange),
                                                      PieChartSectionData(
                                                          color: Colors.grey),
                                                      PieChartSectionData(
                                                          color: Colors.green),
                                                      PieChartSectionData(
                                                          color: Colors.red),
                                                      PieChartSectionData(
                                                          color: Colors.yellow),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Positioned.fill(
                                                child: Center(
                                                  child: Column(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Text(
                                                          '29% Completed Successfully',
                                                          style: TextStyle(
                                                            fontSize: 10,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.black,
                                                          ),
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
                                          width: 50,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          margin:
                                              const EdgeInsets.only(top: 10),
                                          width: 400,
                                          height: 250,
                                          child: Chart(
                                            data: lineMarkerData,
                                            variables: {
                                              'day': Variable(
                                                accessor: (Map datum) =>
                                                    datum['day'] as String,
                                                scale:
                                                    OrdinalScale(inflate: true),
                                              ),
                                              'value': Variable(
                                                accessor: (Map datum) =>
                                                    datum['value'] as num,
                                                scale: LinearScale(
                                                  max: 15,
                                                  min: -3,
                                                  tickCount: 7,
                                                  formatter: (v) =>
                                                      '${v.toInt()} ℃',
                                                ),
                                              ),
                                              'group': Variable(
                                                accessor: (Map datum) =>
                                                    datum['group'] as String,
                                              ),
                                            },
                                            marks: [
                                              LineMark(
                                                position: Varset('day') *
                                                    Varset('value') /
                                                    Varset('group'),
                                                color: ColorEncode(
                                                  variable: 'group',
                                                  values: [
                                                    const Color(0xff5470c6),
                                                    const Color(0xff91cc75),
                                                  ],
                                                ),
                                              ),
                                            ],
                                            axes: [
                                              Defaults.horizontalAxis,
                                              Defaults.verticalAxis,
                                            ],
                                            selections: {
                                              'tooltipMouse':
                                                  PointSelection(on: {
                                                GestureType.hover,
                                              }, devices: {
                                                PointerDeviceKind.mouse
                                              }, variable: 'day', dim: Dim.x),
                                              'tooltipTouch':
                                                  PointSelection(on: {
                                                GestureType.scaleUpdate,
                                                GestureType.tapDown,
                                                GestureType.longPressMoveUpdate
                                              }, devices: {
                                                PointerDeviceKind.touch
                                              }, variable: 'day', dim: Dim.x),
                                            },
                                            tooltip: TooltipGuide(
                                              followPointer: [true, true],
                                              align: Alignment.topLeft,
                                              variables: ['group', 'value'],
                                            ),
                                            crosshair: CrosshairGuide(
                                              followPointer: [false, true],
                                            ),
                                            annotations: [
                                              LineAnnotation(
                                                dim: Dim.y,
                                                value: 6.14,
                                                style: PaintStyle(
                                                  strokeColor:
                                                      const Color(0xff5470c6)
                                                          .withAlpha(100),
                                                  dash: [2],
                                                ),
                                              ),
                                              LineAnnotation(
                                                dim: Dim.y,
                                                value: 3.57,
                                                style: PaintStyle(
                                                  strokeColor:
                                                      const Color(0xff91cc75)
                                                          .withAlpha(100),
                                                  dash: [2],
                                                ),
                                              ),
                                              CustomAnnotation(
                                                  renderer: (offset, _) => [
                                                        CircleElement(
                                                            center: offset,
                                                            radius: 5,
                                                            style: PaintStyle(
                                                                fillColor:
                                                                    const Color(
                                                                        0xff5470c6)))
                                                      ],
                                                  values: ['Mar', -3]),
                                              CustomAnnotation(
                                                  renderer: (offset, _) => [
                                                        CircleElement(
                                                            center: offset,
                                                            radius: 5,
                                                            style: PaintStyle(
                                                                fillColor:
                                                                    const Color(
                                                                        0xff5470c6)))
                                                      ],
                                                  values: ['Jul', -7]),
                                              CustomAnnotation(
                                                  renderer: (offset, _) => [
                                                        CircleElement(
                                                            center: offset,
                                                            radius: 5,
                                                            style: PaintStyle(
                                                                fillColor:
                                                                    const Color(
                                                                        0xff91cc75)))
                                                      ],
                                                  values: ['Feb', 2]),
                                              CustomAnnotation(
                                                  renderer: (offset, _) => [
                                                        CircleElement(
                                                            center: offset,
                                                            radius: 5,
                                                            style: PaintStyle(
                                                                fillColor:
                                                                    const Color(
                                                                        0xff91cc75)))
                                                      ],
                                                  values: ['Apr', -5]),
                                              TagAnnotation(
                                                label: Label(
                                                    '13',
                                                    LabelStyle(
                                                      textStyle:
                                                          Defaults.textStyle,
                                                      offset:
                                                          const Offset(0, -10),
                                                    )),
                                                values: ['Mar', -13],
                                              ),
                                              TagAnnotation(
                                                label: Label(
                                                    '9',
                                                    LabelStyle(
                                                      textStyle:
                                                          Defaults.textStyle,
                                                      offset:
                                                          const Offset(0, -10),
                                                    )),
                                                values: ['July', -9],
                                              ),
                                              TagAnnotation(
                                                label: Label(
                                                    '-2',
                                                    LabelStyle(
                                                      textStyle:
                                                          Defaults.textStyle,
                                                      offset:
                                                          const Offset(0, -10),
                                                    )),
                                                values: ['Feb', -2],
                                              ),
                                              TagAnnotation(
                                                label: Label(
                                                    '5',
                                                    LabelStyle(
                                                      textStyle:
                                                          Defaults.textStyle,
                                                      offset:
                                                          const Offset(0, -10),
                                                    )),
                                                values: ['Apr', -5],
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 50,
                                        ),
                                        Container(
                                          height: 250,
                                          width: 163,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          child: Column(
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  // Navigate to a different screen when the brown container is pressed
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          MyHomePage(),
                                                    ),
                                                  );
                                                },
                                                child: Container(
                                                  height: 70,

                                                  color: Color.fromRGBO(75, 61,
                                                      82, 1), // Brown color
                                                  child: Center(
                                                    child: Text(
                                                      'New Booking',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 8.0,
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          MyHomePage(),
                                                    ),
                                                  );
                                                },
                                                child: Container(
                                                  height: 70,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: ColorFiltered(
                                                      colorFilter:
                                                          ColorFilter.mode(
                                                        Color.fromRGBO(
                                                            183, 174, 185, 1),
                                                        BlendMode.srcIn,
                                                      ),
                                                      child:
                                                          Transform.translate(
                                                        offset: Offset(0,
                                                            50), // Adjust the Y offset as needed
                                                        child: Image.asset(
                                                          'add.png',
                                                          width: 120,
                                                          height: 170,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 60,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 90,
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 292,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          width: 350,
                                          child: Column(
                                            children: [
                                              Container(
                                                height: 70,
                                                color: Color.fromRGBO(75, 61,
                                                    82, 1), // Brown color
                                                child: Center(
                                                  child: Row(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Text(
                                                          'Bookings',
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                left: 180),
                                                        child: Text(
                                                          "view all",
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 15,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 6.0,
                                              ), // Add spacing between the brown container and the white container
                                              Container(
                                                height: 215,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                ),
                                                child: ListView(
                                                  children: [
                                                    SizedBox(
                                                      height: 60,
                                                      width: 100,
                                                      child: ListTile(
                                                        leading: CircleAvatar(),
                                                        title: Text(
                                                          'Trip 1',
                                                          style:
                                                              const TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 12,
                                                          ),
                                                        ),
                                                        subtitle: Text(
                                                          '18.02.2022',
                                                          style: TextStyle(
                                                              fontSize: 10),
                                                        ),
                                                        trailing: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            Row(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .end,
                                                              children: [
                                                                Text("Truck"),
                                                              ],
                                                            ),
                                                            SizedBox(
                                                                width:
                                                                    30), // Add some space between "Truck" and "View" button
                                                            GestureDetector(
                                                              onTap: () {
                                                                // Add your View button functionality here
                                                                print(
                                                                    'View button pressed');
                                                              },
                                                              child: Container(
                                                                height: 43,
                                                                width: 80,
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(8),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  boxShadow: [
                                                                    BoxShadow(
                                                                      color: Colors
                                                                          .grey,
                                                                      spreadRadius:
                                                                          1,
                                                                      blurRadius:
                                                                          2, // changes position of shadow
                                                                    ),
                                                                  ],
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          245,
                                                                          243,
                                                                          255,
                                                                          1),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5),
                                                                ),
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(
                                                                          8.0),
                                                                  child: Center(
                                                                    child: Text(
                                                                      'View',
                                                                      style:
                                                                          TextStyle(
                                                                        color: Color.fromRGBO(
                                                                            127,
                                                                            106,
                                                                            255,
                                                                            1),
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                        fontSize:
                                                                            10,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Divider(
                                                      thickness: 1,
                                                      color: Color.fromRGBO(
                                                          206, 203, 203, 1),
                                                    ),
                                                    SizedBox(
                                                      height: 60,
                                                      width: 100,
                                                      child: ListTile(
                                                        leading: CircleAvatar(),
                                                        title: Text(
                                                          'Equipment Hire',
                                                          style:
                                                              const TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 11,
                                                          ),
                                                        ),
                                                        subtitle: Text(
                                                          '10.02.2022',
                                                          style: TextStyle(
                                                              fontSize: 10),
                                                        ),
                                                        trailing: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .end,
                                                              children: [
                                                                Text("Heavy"),
                                                                Text(
                                                                    "Equipment"),
                                                              ],
                                                            ),

                                                            SizedBox(
                                                                width:
                                                                    30), // Add some space between "Truck" and "View" button
                                                            GestureDetector(
                                                              onTap: () {
                                                                // Add your View button functionality here
                                                                print(
                                                                    'View button pressed');
                                                              },
                                                              child: Container(
                                                                height: 43,
                                                                width: 80,
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(8),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  boxShadow: [
                                                                    BoxShadow(
                                                                      color: Colors
                                                                          .grey,
                                                                      spreadRadius:
                                                                          1,
                                                                      blurRadius:
                                                                          2, // changes position of shadow
                                                                    ),
                                                                  ],
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          245,
                                                                          243,
                                                                          255,
                                                                          1),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5),
                                                                ),
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(
                                                                          8.0),
                                                                  child: Center(
                                                                    child: Text(
                                                                      'View',
                                                                      style:
                                                                          TextStyle(
                                                                        color: Color.fromRGBO(
                                                                            127,
                                                                            106,
                                                                            255,
                                                                            1),
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                        fontSize:
                                                                            10,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Divider(
                                                      thickness: 1,
                                                      color: Color.fromRGBO(
                                                          206, 203, 203, 1),
                                                    ),
                                                    SizedBox(
                                                      height: 60,
                                                      width: 100,
                                                      child: ListTile(
                                                        leading: CircleAvatar(),
                                                        title: Text(
                                                          'Fletch Skinner',
                                                          style:
                                                              const TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 12,
                                                          ),
                                                        ),
                                                        subtitle: Text(
                                                          '07.02.2022',
                                                          style: TextStyle(
                                                              fontSize: 10),
                                                        ),
                                                        trailing: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            Row(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .end,
                                                              children: [
                                                                Text("Trailer"),
                                                              ],
                                                            ),
                                                            SizedBox(
                                                                width:
                                                                    30), // Add some space between "Truck" and "View" button
                                                            GestureDetector(
                                                              onTap: () {
                                                                // Add your View button functionality here
                                                                print(
                                                                    'View button pressed');
                                                              },
                                                              child: Container(
                                                                height: 43,
                                                                width: 80,
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(8),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  boxShadow: [
                                                                    BoxShadow(
                                                                      color: Colors
                                                                          .grey,
                                                                      spreadRadius:
                                                                          1,
                                                                      blurRadius:
                                                                          2, // changes position of shadow
                                                                    ),
                                                                  ],
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          245,
                                                                          243,
                                                                          255,
                                                                          1),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5),
                                                                ),
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(
                                                                          8.0),
                                                                  child: Center(
                                                                    child: Text(
                                                                      'View',
                                                                      style:
                                                                          TextStyle(
                                                                        color: Color.fromRGBO(
                                                                            127,
                                                                            106,
                                                                            255,
                                                                            1),
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                        fontSize:
                                                                            10,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    // Add more cards with your data as needed
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 50,
                                        ),
                                        Container(
                                          height: 294,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          width: 613,
                                          child: Column(
                                            children: [
                                              Container(
                                                height: 70,
                                                color: Color.fromRGBO(75, 61,
                                                    82, 1), // Brown color
                                                child: Center(
                                                  child: Row(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Text(
                                                          'Pending Booking Approvals',
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                left: 300),
                                                        child: Text(
                                                          "view all",
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 15,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              // Add spacing between the brown container and the white container
                                              Container(
                                                height: 224,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  // Set a common borderRadius for all containers
                                                ),
                                                child: Row(
                                                  children: [
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            SizedBox(
                                                              width: 10,
                                                            ),
                                                            Column(
                                                              children: [
                                                                SizedBox(
                                                                  width: 10,
                                                                ),
                                                                CircleAvatar(),
                                                              ],
                                                            ),
                                                            SizedBox(width: 10),
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  'Trip1',
                                                                  style:
                                                                      const TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontSize:
                                                                        12,
                                                                  ),
                                                                ),
                                                                Text(
                                                                    "Booking ID Xxxxxx")
                                                              ],
                                                            )
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          width: 20,
                                                        ),
                                                        SizedBox(
                                                          width: 220,
                                                          child: Divider(
                                                            color:
                                                                Color.fromRGBO(
                                                                    206,
                                                                    203,
                                                                    203,
                                                                    1),
                                                          ),
                                                        ),
                                                        Row(
                                                          children: [
                                                            SizedBox(
                                                              width: 10,
                                                            ),
                                                            Column(
                                                              children: [
                                                                SizedBox(
                                                                  width: 10,
                                                                ),
                                                                CircleAvatar(),
                                                              ],
                                                            ),
                                                            SizedBox(width: 10),
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  'Equipment Hire',
                                                                  style:
                                                                      const TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontSize:
                                                                        12,
                                                                  ),
                                                                ),
                                                                Text(
                                                                    "Booking ID Xxxxxx")
                                                              ],
                                                            )
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          width: 20,
                                                        ),
                                                        SizedBox(
                                                          width: 220,
                                                          child: Divider(
                                                            color:
                                                                Color.fromRGBO(
                                                                    206,
                                                                    203,
                                                                    203,
                                                                    1),
                                                          ),
                                                        ),
                                                        Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            SizedBox(
                                                              width: 10,
                                                            ),
                                                            Column(
                                                              children: [
                                                                SizedBox(
                                                                  width: 10,
                                                                ),
                                                                CircleAvatar(),
                                                              ],
                                                            ),
                                                            SizedBox(width: 10),
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  'Bus Trip',
                                                                  style:
                                                                      const TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontSize:
                                                                        12,
                                                                  ),
                                                                ),
                                                                Text(
                                                                    "Booking ID Xxxxxx")
                                                              ],
                                                            )
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    Expanded(
                                                      child: Container(
                                                        height: 250,
                                                        width: 400,
                                                        color: Color.fromARGB(
                                                            246, 245, 242, 242),
                                                        child: Row(
                                                          children: [
                                                            Container(
                                                              width: 130,
                                                              decoration: BoxDecoration(
                                                                  boxShadow: [
                                                                    BoxShadow(
                                                                      color: Colors
                                                                          .grey,
                                                                      spreadRadius:
                                                                          1,
                                                                      blurRadius:
                                                                          2, // changes position of shadow
                                                                    ),
                                                                  ],
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          245,
                                                                          243,
                                                                          255,
                                                                          1),
                                                                  border: Border.all(
                                                                      color: Color.fromARGB(
                                                                          246,
                                                                          245,
                                                                          242,
                                                                          242))),
                                                              child: Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceEvenly,
                                                                children: [
                                                                  Padding(
                                                                    padding:
                                                                        const EdgeInsets
                                                                            .all(
                                                                            8.0),
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          120,
                                                                      height:
                                                                          30,
                                                                      decoration: BoxDecoration(
                                                                          boxShadow: [
                                                                            BoxShadow(
                                                                              color: Colors.grey,
                                                                              spreadRadius: 1,
                                                                              blurRadius: 2, // changes position of shadow
                                                                            ),
                                                                          ],
                                                                          color: Color.fromRGBO(
                                                                              200,
                                                                              251,
                                                                              253,
                                                                              1),
                                                                          borderRadius: BorderRadius.circular(
                                                                              12.0),
                                                                          border:
                                                                              Border.all(color: Color.fromARGB(246, 245, 242, 242))),
                                                                      child:
                                                                          Padding(
                                                                        padding: const EdgeInsets
                                                                            .all(
                                                                            8.0),
                                                                        child:
                                                                            Center(
                                                                          child:
                                                                              Row(
                                                                            children: [
                                                                              Text("Vendor 1", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 9, color: Color.fromRGBO(128, 118, 118, 1))),
                                                                              SizedBox(
                                                                                width: 10,
                                                                              ),
                                                                              Text(
                                                                                "Xxxxx SAR",
                                                                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 8, color: Color.fromRGBO(127, 106, 255, 1)),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    height: 10,
                                                                  ),
                                                                  Padding(
                                                                    padding:
                                                                        const EdgeInsets
                                                                            .all(
                                                                            8.0),
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          150,
                                                                      height:
                                                                          30,
                                                                      decoration: BoxDecoration(
                                                                          boxShadow: [
                                                                            BoxShadow(
                                                                              color: Colors.grey,
                                                                              spreadRadius: 1,
                                                                              blurRadius: 2, // changes position of shadow
                                                                            ),
                                                                          ],
                                                                          color: Color.fromRGBO(
                                                                              200,
                                                                              251,
                                                                              253,
                                                                              1),
                                                                          borderRadius: BorderRadius.circular(
                                                                              12.0),
                                                                          border:
                                                                              Border.all(color: Color.fromARGB(246, 245, 242, 242))),
                                                                      child:
                                                                          Padding(
                                                                        padding: const EdgeInsets
                                                                            .all(
                                                                            8.0),
                                                                        child:
                                                                            Center(
                                                                          child:
                                                                              Row(
                                                                            children: [
                                                                              Text("Vendor 1", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 9, color: Color.fromRGBO(128, 118, 118, 1))),
                                                                              SizedBox(
                                                                                width: 10,
                                                                              ),
                                                                              Text(
                                                                                "Xxxxx SAR",
                                                                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 8, color: Color.fromRGBO(127, 106, 255, 1)),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    height: 10,
                                                                  ),
                                                                  Padding(
                                                                    padding:
                                                                        const EdgeInsets
                                                                            .all(
                                                                            8.0),
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          120,
                                                                      height:
                                                                          30,
                                                                      decoration: BoxDecoration(
                                                                          boxShadow: [
                                                                            BoxShadow(
                                                                              color: Colors.grey,
                                                                              spreadRadius: 1,
                                                                              blurRadius: 2, // changes position of shadow
                                                                            ),
                                                                          ],
                                                                          color: Color.fromRGBO(
                                                                              200,
                                                                              251,
                                                                              253,
                                                                              1),
                                                                          borderRadius: BorderRadius.circular(
                                                                              12.0),
                                                                          border:
                                                                              Border.all(color: Color.fromARGB(246, 245, 242, 242))),
                                                                      child:
                                                                          Padding(
                                                                        padding: const EdgeInsets
                                                                            .all(
                                                                            8.0),
                                                                        child:
                                                                            Center(
                                                                          child:
                                                                              Row(
                                                                            children: [
                                                                              Text("Vendor 1", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 9, color: Color.fromRGBO(128, 118, 118, 1))),
                                                                              SizedBox(
                                                                                width: 10,
                                                                              ),
                                                                              Text(
                                                                                "Xxxxx SAR",
                                                                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 8, color: Color.fromRGBO(127, 106, 255, 1)),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              width: 130,
                                                              decoration: BoxDecoration(
                                                                  boxShadow: [
                                                                    BoxShadow(
                                                                      color: Colors
                                                                          .grey,
                                                                      spreadRadius:
                                                                          1,
                                                                      blurRadius:
                                                                          2, // changes position of shadow
                                                                    ),
                                                                  ],
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          245,
                                                                          243,
                                                                          255,
                                                                          1),
                                                                  border: Border.all(
                                                                      color: Color.fromARGB(
                                                                          246,
                                                                          245,
                                                                          242,
                                                                          242))),
                                                              child: Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceEvenly,
                                                                children: [
                                                                  Padding(
                                                                    padding:
                                                                        const EdgeInsets
                                                                            .all(
                                                                            8.0),
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          120,
                                                                      height:
                                                                          30,
                                                                      decoration: BoxDecoration(
                                                                          boxShadow: [
                                                                            BoxShadow(
                                                                              color: Colors.grey,
                                                                              spreadRadius: 1,
                                                                              blurRadius: 2, // changes position of shadow
                                                                            ),
                                                                          ],
                                                                          color: Color.fromRGBO(
                                                                              224,
                                                                              253,
                                                                              200,
                                                                              1),
                                                                          borderRadius: BorderRadius.circular(
                                                                              12.0),
                                                                          border:
                                                                              Border.all(color: Color.fromARGB(246, 245, 242, 242))),
                                                                      child:
                                                                          Padding(
                                                                        padding: const EdgeInsets
                                                                            .all(
                                                                            8.0),
                                                                        child:
                                                                            Center(
                                                                          child:
                                                                              Row(
                                                                            children: [
                                                                              Text("Vendor 2", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 9, color: Color.fromRGBO(128, 118, 118, 1))),
                                                                              SizedBox(
                                                                                width: 10,
                                                                              ),
                                                                              Text(
                                                                                "Xxxxx SAR",
                                                                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 8, color: Color.fromRGBO(127, 106, 255, 1)),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    height: 10,
                                                                  ),
                                                                  Padding(
                                                                    padding:
                                                                        const EdgeInsets
                                                                            .all(
                                                                            8.0),
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          120,
                                                                      height:
                                                                          30,
                                                                      decoration: BoxDecoration(
                                                                          boxShadow: [
                                                                            BoxShadow(
                                                                              color: Colors.grey,
                                                                              spreadRadius: 1,
                                                                              blurRadius: 2, // changes position of shadow
                                                                            ),
                                                                          ],
                                                                          color: Color.fromRGBO(
                                                                              224,
                                                                              253,
                                                                              200,
                                                                              1),
                                                                          borderRadius: BorderRadius.circular(
                                                                              12.0),
                                                                          border:
                                                                              Border.all(color: Color.fromARGB(246, 245, 242, 242))),
                                                                      child:
                                                                          Padding(
                                                                        padding: const EdgeInsets
                                                                            .all(
                                                                            8.0),
                                                                        child:
                                                                            Center(
                                                                          child:
                                                                              Row(
                                                                            children: [
                                                                              Text("Vendor 2", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 9, color: Color.fromRGBO(128, 118, 118, 1))),
                                                                              SizedBox(
                                                                                width: 10,
                                                                              ),
                                                                              Text(
                                                                                "Xxxxx SAR",
                                                                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 8, color: Color.fromRGBO(127, 106, 255, 1)),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    height: 10,
                                                                  ),
                                                                  Padding(
                                                                    padding:
                                                                        const EdgeInsets
                                                                            .all(
                                                                            8.0),
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          120,
                                                                      height:
                                                                          30,
                                                                      decoration: BoxDecoration(
                                                                          boxShadow: [
                                                                            BoxShadow(
                                                                              color: Colors.grey,
                                                                              spreadRadius: 1,
                                                                              blurRadius: 2, // changes position of shadow
                                                                            ),
                                                                          ],
                                                                          color: Color.fromRGBO(
                                                                              224,
                                                                              253,
                                                                              200,
                                                                              1),
                                                                          borderRadius: BorderRadius.circular(
                                                                              12.0),
                                                                          border:
                                                                              Border.all(color: Color.fromARGB(246, 245, 242, 242))),
                                                                      child:
                                                                          Padding(
                                                                        padding: const EdgeInsets
                                                                            .all(
                                                                            8.0),
                                                                        child:
                                                                            Center(
                                                                          child:
                                                                              Row(
                                                                            children: [
                                                                              Text("Vendor 2", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 9, color: Color.fromRGBO(128, 118, 118, 1))),
                                                                              SizedBox(
                                                                                width: 10,
                                                                              ),
                                                                              Text(
                                                                                "Xxxxx SAR",
                                                                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 8, color: Color.fromRGBO(127, 106, 255, 1)),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              width: 130,
                                                              decoration: BoxDecoration(
                                                                  boxShadow: [
                                                                    BoxShadow(
                                                                      color: Colors
                                                                          .grey,
                                                                      spreadRadius:
                                                                          1,
                                                                      blurRadius:
                                                                          2, // changes position of shadow
                                                                    ),
                                                                  ],
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          245,
                                                                          243,
                                                                          255,
                                                                          1),
                                                                  border: Border.all(
                                                                      color: Color.fromARGB(
                                                                          246,
                                                                          245,
                                                                          242,
                                                                          242))),
                                                              child: Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceEvenly,
                                                                children: [
                                                                  Padding(
                                                                    padding:
                                                                        const EdgeInsets
                                                                            .all(
                                                                            8.0),
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          120,
                                                                      height:
                                                                          30,
                                                                      decoration: BoxDecoration(
                                                                          boxShadow: [
                                                                            BoxShadow(
                                                                              color: Colors.grey,
                                                                              spreadRadius: 1,
                                                                              blurRadius: 2, // changes position of shadow
                                                                            ),
                                                                          ],
                                                                          color: Color.fromRGBO(
                                                                              245,
                                                                              253,
                                                                              200,
                                                                              1),
                                                                          borderRadius: BorderRadius.circular(
                                                                              12.0),
                                                                          border:
                                                                              Border.all(color: Color.fromARGB(246, 245, 242, 242))),
                                                                      child:
                                                                          Padding(
                                                                        padding: const EdgeInsets
                                                                            .all(
                                                                            8.0),
                                                                        child:
                                                                            Center(
                                                                          child:
                                                                              Row(
                                                                            children: [
                                                                              Text("Vendor 3", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 9, color: Color.fromRGBO(128, 118, 118, 1))),
                                                                              SizedBox(
                                                                                width: 10,
                                                                              ),
                                                                              Text(
                                                                                "Xxxxx SAR",
                                                                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 8, color: Color.fromRGBO(127, 106, 255, 1)),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    height: 10,
                                                                  ),
                                                                  Padding(
                                                                    padding:
                                                                        const EdgeInsets
                                                                            .all(
                                                                            8.0),
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          120,
                                                                      height:
                                                                          30,
                                                                      decoration: BoxDecoration(
                                                                          boxShadow: [
                                                                            BoxShadow(
                                                                              color: Colors.grey,
                                                                              spreadRadius: 1,
                                                                              blurRadius: 2, // changes position of shadow
                                                                            ),
                                                                          ],
                                                                          color: Color.fromRGBO(
                                                                              245,
                                                                              253,
                                                                              200,
                                                                              1),
                                                                          borderRadius: BorderRadius.circular(
                                                                              12.0),
                                                                          border:
                                                                              Border.all(color: Color.fromARGB(246, 245, 242, 242))),
                                                                      child:
                                                                          Padding(
                                                                        padding: const EdgeInsets
                                                                            .all(
                                                                            8.0),
                                                                        child:
                                                                            Center(
                                                                          child:
                                                                              Row(
                                                                            children: [
                                                                              Text("Vendor 3", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 9, color: Color.fromRGBO(128, 118, 118, 1))),
                                                                              SizedBox(
                                                                                width: 10,
                                                                              ),
                                                                              Text(
                                                                                "Xxxxx SAR",
                                                                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 8, color: Color.fromRGBO(127, 106, 255, 1)),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    height: 10,
                                                                  ),
                                                                  Padding(
                                                                    padding:
                                                                        const EdgeInsets
                                                                            .all(
                                                                            8.0),
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          120,
                                                                      height:
                                                                          30,
                                                                      decoration: BoxDecoration(
                                                                          boxShadow: [
                                                                            BoxShadow(
                                                                              color: Colors.grey,
                                                                              spreadRadius: 1,
                                                                              blurRadius: 2, // changes position of shadow
                                                                            ),
                                                                          ],
                                                                          color: Color.fromRGBO(
                                                                              245,
                                                                              253,
                                                                              200,
                                                                              1),
                                                                          borderRadius: BorderRadius.circular(
                                                                              12.0),
                                                                          border:
                                                                              Border.all(color: Color.fromARGB(246, 245, 242, 242))),
                                                                      child:
                                                                          Padding(
                                                                        padding: const EdgeInsets
                                                                            .all(
                                                                            8.0),
                                                                        child:
                                                                            Center(
                                                                          child:
                                                                              Row(
                                                                            children: [
                                                                              Text("Vendor 3", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 9, color: Color.fromRGBO(128, 118, 118, 1))),
                                                                              SizedBox(
                                                                                width: 10,
                                                                              ),
                                                                              Text(
                                                                                "Xxxxx SAR",
                                                                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 8, color: Color.fromRGBO(127, 106, 255, 1)),
                                                                              ),
                                                                            ],
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
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Center(
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Container(
                                        height:
                                            10, // Adjust the height as needed
                                        width:
                                            1200, // Set the desired length of the scroll bar
                                        color: Colors
                                            .grey, // Background color of the scrollable area
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  SizedBox(
                                    width: 150,
                                    height: 50,
                                    child: Flexible(
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(right: 33.5),
                                        child: ElevatedButton(
                                          onPressed: () {
                                            // Handle button press
                                            print('Elevated Button Pressed!');
                                          },
                                          style: ElevatedButton.styleFrom(
                                            primary:
                                                Color.fromRGBO(98, 105, 254, 1),
                                            side: BorderSide(
                                              color: Color.fromRGBO(
                                                  98, 105, 254, 1),
                                            ),
                                          ),
                                          child: Text(
                                            'Book New',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(30.0),
                            child: Container(
                              height: 1000,
                              color: Color.fromRGBO(240, 237, 250, 1),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Container(
                                        width: 1200,
                                        color:
                                            Color.fromRGBO(240, 237, 250, 0.9),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 60,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  height: 316,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                  ),
                                                  width: 1200,
                                                  child: Column(
                                                    children: [
                                                      Container(
                                                        height: 70,
                                                        color: Color.fromRGBO(
                                                            75,
                                                            61,
                                                            82,
                                                            1), // Brown color
                                                        child: Center(
                                                          child: Row(
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                        left:
                                                                            60),
                                                                child: Text(
                                                                  'Trigger Booking',
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        23,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                        left:
                                                                            800),
                                                                child: Text(
                                                                  "Actions",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          20,
                                                                      fontFamily:
                                                                          "Helvetica",
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),

                                                      // Add spacing between the brown container and the white container
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Container(
                                                          height: 230,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            // Set a common borderRadius for all containers
                                                          ),
                                                          child: Row(
                                                            children: [
                                                              Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceEvenly,
                                                                children: [
                                                                  Row(
                                                                    children: [
                                                                      SizedBox(
                                                                        width:
                                                                            10,
                                                                      ),
                                                                      Column(
                                                                        children: [
                                                                          SizedBox(
                                                                            width:
                                                                                10,
                                                                          ),
                                                                          Transform
                                                                              .scale(
                                                                            scale:
                                                                                1.0,
                                                                            child:
                                                                                Checkbox(
                                                                              value: checkbox1,
                                                                              onChanged: (bool? value) {
                                                                                setState(() {
                                                                                  checkbox1 = value ?? false;
                                                                                  if (checkbox1) {
                                                                                    // If checkbox1 is selected, disable the other checkboxes
                                                                                    checkbox2 = false;
                                                                                    checkbox3 = false;
                                                                                    // You can add additional logic or actions here
                                                                                    enablePayNowButton();
                                                                                  } else {
                                                                                    disablePayNowButton();
                                                                                  }
                                                                                });
                                                                              },
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      SizedBox(
                                                                          width:
                                                                              10),
                                                                      Column(
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Text(
                                                                            'Trip 1',
                                                                            style:
                                                                                const TextStyle(
                                                                              fontWeight: FontWeight.bold,
                                                                              fontSize: 16,
                                                                            ),
                                                                          ),
                                                                          SizedBox(
                                                                            height:
                                                                                3,
                                                                          ),
                                                                          Text(
                                                                            "Booking ID Xxxxxx",
                                                                            style:
                                                                                TextStyle(fontFamily: "SFProText", fontSize: 14),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      SizedBox(
                                                                        width:
                                                                            100,
                                                                      ),
                                                                      Row(
                                                                        children: [
                                                                          buildVendorContainer(
                                                                              1,
                                                                              "Vendor 1",
                                                                              "Xxxxx SAR"),
                                                                          buildVendorContainer(
                                                                              2,
                                                                              "Vendor 2",
                                                                              "Xxxxx SAR"),
                                                                          buildVendorContainer(
                                                                              3,
                                                                              "Vendor 3",
                                                                              "Xxxxx SAR"),
                                                                        ],
                                                                      ),
                                                                      SizedBox(
                                                                        width:
                                                                            20,
                                                                      ),
                                                                      Row(
                                                                        children: [
                                                                          IconButton(
                                                                            padding:
                                                                                EdgeInsets.zero,
                                                                            constraints:
                                                                                BoxConstraints(),
                                                                            onPressed:
                                                                                null,
                                                                            icon:
                                                                                Icon(
                                                                              Icons.edit_document,
                                                                              color: Color.fromRGBO(74, 60, 81, 1),
                                                                            ),
                                                                          ),
                                                                          IconButton(
                                                                            padding:
                                                                                EdgeInsets.zero,
                                                                            onPressed:
                                                                                null,
                                                                            icon:
                                                                                Icon(Icons.delete),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      SizedBox(
                                                                        width:
                                                                            20,
                                                                      ),
                                                                      SizedBox(
                                                                        width:
                                                                            150,
                                                                        height:
                                                                            50,
                                                                        child:
                                                                            ElevatedButton(
                                                                          onPressed: isButtonEnabled
                                                                              ? () {
                                                                                  // Handle button press only if any radio button is selected
                                                                                  print('Elevated Button Pressed!');
                                                                                }
                                                                              : null,
                                                                          style:
                                                                              ElevatedButton.styleFrom(
                                                                            primary: isButtonEnabled
                                                                                ? Color.fromRGBO(98, 105, 254, 1)
                                                                                : Colors.grey,
                                                                            side:
                                                                                BorderSide(
                                                                              color: isButtonEnabled ? Color.fromRGBO(98, 105, 254, 1) : Colors.grey,
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Text(
                                                                            'Pay Now',
                                                                            style:
                                                                                TextStyle(
                                                                              color: Colors.white,
                                                                              fontSize: 16,
                                                                              fontFamily: "Helvetica",
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  SizedBox(
                                                                    width: 20,
                                                                  ),
                                                                  SizedBox(
                                                                    width: 1184,
                                                                    child:
                                                                        Divider(
                                                                      color: Color.fromRGBO(
                                                                          206,
                                                                          203,
                                                                          203,
                                                                          1),
                                                                    ),
                                                                  ),
                                                                  Row(
                                                                    children: [
                                                                      SizedBox(
                                                                        width:
                                                                            10,
                                                                      ),
                                                                      Column(
                                                                        children: [
                                                                          SizedBox(
                                                                            width:
                                                                                10,
                                                                          ),
                                                                          Checkbox(
                                                                              value: checkbox2,
                                                                              onChanged: (bool? value) {
                                                                                setState(() {
                                                                                  checkbox2 = value ?? false;
                                                                                  if (checkbox2) {
                                                                                    // If checkbox1 is selected, disable the other checkboxes
                                                                                    checkbox1 = false;
                                                                                    checkbox3 = false;
                                                                                    // You can add additional logic or actions here
                                                                                  }
                                                                                });
                                                                              }),
                                                                        ],
                                                                      ),
                                                                      SizedBox(
                                                                          width:
                                                                              10),
                                                                      Column(
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Text(
                                                                            'Equipment Hire',
                                                                            style:
                                                                                const TextStyle(
                                                                              fontWeight: FontWeight.bold,
                                                                              fontSize: 16,
                                                                            ),
                                                                          ),
                                                                          SizedBox(
                                                                            height:
                                                                                3,
                                                                          ),
                                                                          Text(
                                                                            "Booking ID Xxxxxx",
                                                                            style:
                                                                                TextStyle(fontFamily: "SFProText", fontSize: 14),
                                                                          )
                                                                        ],
                                                                      ),
                                                                      SizedBox(
                                                                        width:
                                                                            100,
                                                                      ),
                                                                      Row(
                                                                        children: [
                                                                          Padding(
                                                                            padding:
                                                                                const EdgeInsets.all(8.0),
                                                                            child:
                                                                                Container(
                                                                              width: 165,
                                                                              height: 50,
                                                                              decoration: BoxDecoration(boxShadow: [
                                                                                BoxShadow(
                                                                                  color: Colors.grey,
                                                                                  spreadRadius: 1,
                                                                                  blurRadius: 2, // changes position of shadow
                                                                                ),
                                                                              ], color: Color.fromRGBO(200, 251, 253, 1), borderRadius: BorderRadius.circular(25.0), border: Border.all(color: Color.fromARGB(246, 245, 242, 242))),
                                                                              child: Padding(
                                                                                padding: const EdgeInsets.all(8.0),
                                                                                child: Center(
                                                                                  child: Row(
                                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                                    children: [
                                                                                      SizedBox(
                                                                                        width: 5,
                                                                                      ),
                                                                                      Radio(
                                                                                        value: 1,
                                                                                        fillColor: MaterialStateColor.resolveWith((states) => Colors.white),
                                                                                        groupValue: selectedRadioValue,
                                                                                        onChanged: (value) {
                                                                                          setState(() {
                                                                                            selectedRadioValue = value;
                                                                                          });
                                                                                        },
                                                                                        activeColor: Colors.white, // Set the background color when the radio button is selected
                                                                                      ),
                                                                                      SizedBox(
                                                                                        width: 5,
                                                                                      ),
                                                                                      Text("Vendor 1", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 9, color: Color.fromRGBO(128, 118, 118, 1))),
                                                                                      SizedBox(width: 10),
                                                                                      Text(
                                                                                        "Xxxxx SAR",
                                                                                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 8, color: Color.fromRGBO(127, 106, 255, 1)),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding:
                                                                                const EdgeInsets.all(8.0),
                                                                            child:
                                                                                Container(
                                                                              width: 165,
                                                                              height: 50,
                                                                              decoration: BoxDecoration(boxShadow: [
                                                                                BoxShadow(
                                                                                  color: Colors.grey,
                                                                                  spreadRadius: 1,
                                                                                  blurRadius: 2, // changes position of shadow
                                                                                ),
                                                                              ], color: Color.fromRGBO(224, 253, 200, 1), borderRadius: BorderRadius.circular(25.0), border: Border.all(color: Color.fromARGB(246, 245, 242, 242))),
                                                                              child: Padding(
                                                                                padding: const EdgeInsets.all(8.0),
                                                                                child: Center(
                                                                                  child: Row(
                                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                                    children: [
                                                                                      SizedBox(
                                                                                        width: 5,
                                                                                      ),
                                                                                      Radio(
                                                                                        value: 1,
                                                                                        fillColor: MaterialStateColor.resolveWith((states) => Colors.white),
                                                                                        groupValue: selectedRadioValue,
                                                                                        onChanged: (value) {
                                                                                          setState(() {
                                                                                            selectedRadioValue = value;
                                                                                          });
                                                                                        },
                                                                                        activeColor: Colors.white, // Set the background color when the radio button is selected
                                                                                      ),
                                                                                      SizedBox(
                                                                                        width: 5,
                                                                                      ),
                                                                                      Text("Vendor 2", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 9, color: Color.fromRGBO(128, 118, 118, 1))),
                                                                                      SizedBox(width: 10),
                                                                                      Text(
                                                                                        "Xxxxx SAR",
                                                                                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 8, color: Color.fromRGBO(127, 106, 255, 1)),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding:
                                                                                const EdgeInsets.all(8.0),
                                                                            child:
                                                                                Container(
                                                                              width: 165,
                                                                              height: 50,
                                                                              decoration: BoxDecoration(boxShadow: [
                                                                                BoxShadow(
                                                                                  color: Colors.grey,
                                                                                  spreadRadius: 1,
                                                                                  blurRadius: 2, // changes position of shadow
                                                                                ),
                                                                              ], color: Color.fromRGBO(245, 253, 200, 1), borderRadius: BorderRadius.circular(25.0), border: Border.all(color: Color.fromARGB(246, 245, 242, 242))),
                                                                              child: Padding(
                                                                                padding: const EdgeInsets.all(8.0),
                                                                                child: Center(
                                                                                  child: Row(
                                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                                    children: [
                                                                                      SizedBox(
                                                                                        width: 5,
                                                                                      ),
                                                                                      Radio(
                                                                                        value: 1,
                                                                                        fillColor: MaterialStateColor.resolveWith((states) => Colors.white),
                                                                                        groupValue: selectedRadioValue,
                                                                                        onChanged: (value) {
                                                                                          setState(() {
                                                                                            selectedRadioValue = value;
                                                                                          });
                                                                                        },
                                                                                        activeColor: Colors.white, // Set the background color when the radio button is selected
                                                                                      ),
                                                                                      SizedBox(
                                                                                        width: 5,
                                                                                      ),
                                                                                      Text("Vendor 3", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 9, color: Color.fromRGBO(128, 118, 118, 1))),
                                                                                      SizedBox(width: 10),
                                                                                      Text(
                                                                                        "Xxxxx SAR",
                                                                                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 8, color: Color.fromRGBO(127, 106, 255, 1)),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      SizedBox(
                                                                        width:
                                                                            20,
                                                                      ),
                                                                      Row(
                                                                        children: [
                                                                          IconButton(
                                                                              padding: EdgeInsets.zero,
                                                                              constraints: BoxConstraints(),
                                                                              onPressed: null,
                                                                              icon: Icon(
                                                                                Icons.edit_document,
                                                                                color: Color.fromRGBO(74, 60, 81, 1),
                                                                              )),
                                                                          IconButton(
                                                                              padding: EdgeInsets.zero,
                                                                              // constraints:
                                                                              //     BoxConstraints(),
                                                                              onPressed: null,
                                                                              icon: Icon(Icons.delete)),
                                                                        ],
                                                                      ),
                                                                      SizedBox(
                                                                        width:
                                                                            20,
                                                                      ),
                                                                      SizedBox(
                                                                        width:
                                                                            150,
                                                                        height:
                                                                            50,
                                                                        child:
                                                                            ElevatedButton(
                                                                          onPressed:
                                                                              () {
                                                                            // Handle button press
                                                                            print('Elevated Button Pressed!');
                                                                          },
                                                                          style:
                                                                              ElevatedButton.styleFrom(
                                                                            primary: Color.fromRGBO(
                                                                                98,
                                                                                105,
                                                                                254,
                                                                                1),
                                                                            side:
                                                                                BorderSide(
                                                                              color: Color.fromRGBO(98, 105, 254, 1),
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Text(
                                                                            'Pay Now',
                                                                            style: TextStyle(
                                                                                color: Colors.white,
                                                                                fontSize: 16,
                                                                                fontFamily: "Helvetica"),
                                                                          ),
                                                                        ),
                                                                      )
                                                                    ],
                                                                  ),
                                                                  SizedBox(
                                                                    width: 20,
                                                                  ),
                                                                  SizedBox(
                                                                    width: 1184,
                                                                    child:
                                                                        Divider(
                                                                      color: Color.fromRGBO(
                                                                          206,
                                                                          203,
                                                                          203,
                                                                          1),
                                                                    ),
                                                                  ),
                                                                  Row(
                                                                    children: [
                                                                      SizedBox(
                                                                        width:
                                                                            10,
                                                                      ),
                                                                      Column(
                                                                        children: [
                                                                          SizedBox(
                                                                            width:
                                                                                10,
                                                                          ),
                                                                          Checkbox(
                                                                              value: checkbox3,
                                                                              onChanged: (bool? value) {
                                                                                setState(() {
                                                                                  checkbox3 = value ?? false;
                                                                                  if (checkbox3) {
                                                                                    // If checkbox1 is selected, disable the other checkboxes
                                                                                    checkbox1 = false;
                                                                                    checkbox2 = false;
                                                                                    // You can add additional logic or actions here
                                                                                  }
                                                                                });
                                                                              }),
                                                                        ],
                                                                      ),
                                                                      SizedBox(
                                                                          width:
                                                                              10),
                                                                      Column(
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Text(
                                                                            'Bus Trip',
                                                                            style:
                                                                                const TextStyle(
                                                                              fontWeight: FontWeight.bold,
                                                                              fontSize: 16,
                                                                            ),
                                                                          ),
                                                                          SizedBox(
                                                                            height:
                                                                                3,
                                                                          ),
                                                                          Text(
                                                                            "Booking ID Xxxxxx",
                                                                            style:
                                                                                TextStyle(fontFamily: "SFProText", fontSize: 14),
                                                                          )
                                                                        ],
                                                                      ),
                                                                      SizedBox(
                                                                        width:
                                                                            100,
                                                                      ),
                                                                      Row(
                                                                        children: [
                                                                          Padding(
                                                                            padding:
                                                                                const EdgeInsets.all(8.0),
                                                                            child:
                                                                                Container(
                                                                              width: 165,
                                                                              height: 50,
                                                                              decoration: BoxDecoration(boxShadow: [
                                                                                BoxShadow(
                                                                                  color: Colors.grey,
                                                                                  spreadRadius: 1,
                                                                                  blurRadius: 2, // changes position of shadow
                                                                                ),
                                                                              ], color: Color.fromRGBO(200, 251, 253, 1), borderRadius: BorderRadius.circular(25.0), border: Border.all(color: Color.fromARGB(246, 245, 242, 242))),
                                                                              child: Padding(
                                                                                padding: const EdgeInsets.all(8.0),
                                                                                child: Center(
                                                                                  child: Row(
                                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                                    children: [
                                                                                      SizedBox(
                                                                                        width: 5,
                                                                                      ),
                                                                                      Radio(
                                                                                        value: 1,
                                                                                        fillColor: MaterialStateColor.resolveWith((states) => Colors.white),
                                                                                        groupValue: selectedRadioValue,
                                                                                        onChanged: (value) {
                                                                                          setState(() {
                                                                                            selectedRadioValue = value;
                                                                                          });
                                                                                        },
                                                                                        activeColor: Colors.white, // Set the background color when the radio button is selected
                                                                                      ),
                                                                                      SizedBox(
                                                                                        width: 5,
                                                                                      ),
                                                                                      Text("Vendor 1", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 9, color: Color.fromRGBO(128, 118, 118, 1))),
                                                                                      SizedBox(width: 10),
                                                                                      Text(
                                                                                        "Xxxxx SAR",
                                                                                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 8, color: Color.fromRGBO(127, 106, 255, 1)),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding:
                                                                                const EdgeInsets.all(8.0),
                                                                            child:
                                                                                Container(
                                                                              width: 165,
                                                                              height: 50,
                                                                              decoration: BoxDecoration(boxShadow: [
                                                                                BoxShadow(
                                                                                  color: Colors.grey,
                                                                                  spreadRadius: 1,
                                                                                  blurRadius: 2, // changes position of shadow
                                                                                ),
                                                                              ], color: Color.fromRGBO(224, 253, 200, 1), borderRadius: BorderRadius.circular(25.0), border: Border.all(color: Color.fromARGB(246, 245, 242, 242))),
                                                                              child: Padding(
                                                                                padding: const EdgeInsets.all(8.0),
                                                                                child: Center(
                                                                                  child: Row(
                                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                                    children: [
                                                                                      SizedBox(
                                                                                        width: 5,
                                                                                      ),
                                                                                      Radio(
                                                                                        value: 1,
                                                                                        fillColor: MaterialStateColor.resolveWith((states) => Colors.white),
                                                                                        groupValue: selectedRadioValue,
                                                                                        onChanged: (value) {
                                                                                          setState(() {
                                                                                            selectedRadioValue = value;
                                                                                          });
                                                                                        },
                                                                                        activeColor: Colors.white, // Set the background color when the radio button is selected
                                                                                      ),
                                                                                      SizedBox(
                                                                                        width: 5,
                                                                                      ),
                                                                                      Text("Vendor 2", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 9, color: Color.fromRGBO(128, 118, 118, 1))),
                                                                                      SizedBox(width: 10),
                                                                                      Text(
                                                                                        "Xxxxx SAR",
                                                                                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 8, color: Color.fromRGBO(127, 106, 255, 1)),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding:
                                                                                const EdgeInsets.all(8.0),
                                                                            child:
                                                                                Container(
                                                                              width: 165,
                                                                              height: 50,
                                                                              decoration: BoxDecoration(boxShadow: [
                                                                                BoxShadow(
                                                                                  color: Colors.grey,
                                                                                  spreadRadius: 1,
                                                                                  blurRadius: 2, // changes position of shadow
                                                                                ),
                                                                              ], color: Color.fromRGBO(245, 253, 200, 1), borderRadius: BorderRadius.circular(25.0), border: Border.all(color: Color.fromARGB(246, 245, 242, 242))),
                                                                              child: Padding(
                                                                                padding: const EdgeInsets.all(8.0),
                                                                                child: Center(
                                                                                  child: Row(
                                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                                    children: [
                                                                                      SizedBox(
                                                                                        width: 5,
                                                                                      ),
                                                                                      Radio(
                                                                                        value: 1,
                                                                                        fillColor: MaterialStateColor.resolveWith((states) => Colors.white),
                                                                                        groupValue: selectedRadioValue,
                                                                                        onChanged: (value) {
                                                                                          setState(() {
                                                                                            selectedRadioValue = value;
                                                                                          });
                                                                                        },
                                                                                        activeColor: Colors.white, // Set the background color when the radio button is selected
                                                                                      ),
                                                                                      SizedBox(
                                                                                        width: 5,
                                                                                      ),
                                                                                      Text("Vendor 3", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 9, color: Color.fromRGBO(128, 118, 118, 1))),
                                                                                      SizedBox(width: 10),
                                                                                      Text(
                                                                                        "Xxxxx SAR",
                                                                                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 8, color: Color.fromRGBO(127, 106, 255, 1)),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      SizedBox(
                                                                        width:
                                                                            20,
                                                                      ),
                                                                      Row(
                                                                        children: [
                                                                          IconButton(
                                                                              padding: EdgeInsets.zero,
                                                                              constraints: BoxConstraints(),
                                                                              onPressed: null,
                                                                              icon: Icon(
                                                                                Icons.edit_document,
                                                                                color: Color.fromRGBO(74, 60, 81, 1),
                                                                              )),
                                                                          IconButton(
                                                                              padding: EdgeInsets.zero,
                                                                              // constraints:
                                                                              //     BoxConstraints(),
                                                                              onPressed: null,
                                                                              icon: Icon(Icons.delete)),
                                                                        ],
                                                                      ),
                                                                      SizedBox(
                                                                        width:
                                                                            20,
                                                                      ),
                                                                      SizedBox(
                                                                        width:
                                                                            150,
                                                                        height:
                                                                            50,
                                                                        child:
                                                                            ElevatedButton(
                                                                          onPressed:
                                                                              () {
                                                                            // Handle button press
                                                                            print('Elevated Button Pressed!');
                                                                          },
                                                                          style:
                                                                              ElevatedButton.styleFrom(
                                                                            primary: Color.fromRGBO(
                                                                                98,
                                                                                105,
                                                                                254,
                                                                                1),
                                                                            side:
                                                                                BorderSide(
                                                                              color: Color.fromRGBO(98, 105, 254, 1),
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Text(
                                                                            'Pay Now',
                                                                            style: TextStyle(
                                                                                color: Colors.white,
                                                                                fontSize: 16,
                                                                                fontFamily: "Helvetica"),
                                                                          ),
                                                                        ),
                                                                      )
                                                                    ],
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
                                              ],
                                            ),
                                            SizedBox(
                                              height: 200,
                                            ),
                                            SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Container(
                                                height:
                                                    10, // Adjust the height as needed
                                                width:
                                                    1200, // Set the desired length of the scroll bar
                                                color: Colors
                                                    .grey, // Background color of the scrollable area
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 40,
                                      ),
                                      SizedBox(
                                        width: 150,
                                        height: 50,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            // Handle button press
                                            print('Elevated Button Pressed!');
                                          },
                                          style: ElevatedButton.styleFrom(
                                            primary:
                                                Color.fromRGBO(98, 105, 254, 1),
                                            side: BorderSide(
                                              color: Color.fromRGBO(
                                                  98, 105, 254, 1),
                                            ),
                                          ),
                                          child: Text(
                                            'Confirm Booking',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 13.4,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            color: Colors.black,
                          ),
                          Container(
                            color: Colors.amber,
                          ),
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
        ),
      ),
    );
  }
}
