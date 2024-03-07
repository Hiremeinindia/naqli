import 'dart:ui';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pieChart/app_colors.dart';
import 'package:flutter_application_1/pieChart/indicator.dart';
import 'package:flutter_application_1/Widgets/customButton.dart';
import 'package:flutter_application_1/echarts_data.dart';
import 'package:graphic/graphic.dart';
import 'package:sizer/sizer.dart';

import '../Widgets/formText.dart';
import '../homepage.dart';

class Dashboard extends StatefulWidget {
  Dashboard();
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String month = '';
  int touchedIndex = -1;
  List<PieChartSectionData> showingSections() {
    return List.generate(4, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: AppColors.contentColorBlue,
            value: 40,
            title: '40%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: AppColors.mainTextColor1,
              shadows: shadows,
            ),
          );
        case 1:
          return PieChartSectionData(
            color: AppColors.contentColorYellow,
            value: 30,
            title: '30%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: AppColors.mainTextColor1,
              shadows: shadows,
            ),
          );
        case 2:
          return PieChartSectionData(
            color: AppColors.contentColorPurple,
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: AppColors.mainTextColor1,
              shadows: shadows,
            ),
          );
        case 3:
          return PieChartSectionData(
            color: AppColors.contentColorGreen,
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: AppColors.mainTextColor1,
              shadows: shadows,
            ),
          );
        default:
          throw Error();
      }
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

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return LayoutBuilder(
          builder: (BuildContext ctx, BoxConstraints constraints) {
        if (constraints.maxWidth >= 850) {
          return SingleChildScrollView(
              child: Container(
                  color: Color.fromRGBO(255, 255, 255, 200),
                  padding: EdgeInsets.fromLTRB(3.w, 7.h, 3.w, 2.5.h),
                  child: Column(children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(3.w, 3.h, 3.w, 3.h),
                      color: Color.fromRGBO(255, 255, 255, 157),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              Text("No of Bookings  "),
                              Text(
                                "103",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  margin: const EdgeInsets.only(top: 10),
                                  width: 350,
                                  height: 250,
                                  child: Stack(
                                    children: [
                                      AspectRatio(
                                        aspectRatio: 1.3,
                                        child: Row(
                                          children: <Widget>[
                                            const SizedBox(
                                              height: 18,
                                            ),
                                            Expanded(
                                              child: AspectRatio(
                                                aspectRatio: 1,
                                                child: PieChart(
                                                  PieChartData(
                                                    pieTouchData: PieTouchData(
                                                      touchCallback:
                                                          (FlTouchEvent event,
                                                              pieTouchResponse) {
                                                        setState(() {
                                                          if (!event
                                                                  .isInterestedForInteractions ||
                                                              pieTouchResponse ==
                                                                  null ||
                                                              pieTouchResponse
                                                                      .touchedSection ==
                                                                  null) {
                                                            touchedIndex = -1;
                                                            return;
                                                          }
                                                          touchedIndex =
                                                              pieTouchResponse
                                                                  .touchedSection!
                                                                  .touchedSectionIndex;
                                                        });
                                                      },
                                                    ),
                                                    borderData: FlBorderData(
                                                      show: false,
                                                    ),
                                                    sectionsSpace: 0,
                                                    centerSpaceRadius: 40,
                                                    sections: showingSections(),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Indicator(
                                                  color: AppColors
                                                      .contentColorBlue,
                                                  text: 'First',
                                                  isSquare: true,
                                                  textStyle: TextStyle(
                                                    fontSize:
                                                        5, // Adjust the font size as needed
                                                    // Add more styling options if necessary
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 4,
                                                ),
                                                Indicator(
                                                  color: AppColors
                                                      .contentColorYellow,
                                                  text: 'Second',
                                                  isSquare: true,
                                                  textStyle: TextStyle(
                                                    fontSize:
                                                        5, // Adjust the font size as needed
                                                    // Add more styling options if necessary
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 4,
                                                ),
                                                Indicator(
                                                  color: AppColors
                                                      .contentColorGreen,
                                                  text: 'Third',
                                                  isSquare: true,
                                                  textStyle: TextStyle(
                                                    fontSize:
                                                        5, // Adjust the font size as needed
                                                    // Add more styling options if necessary
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 4,
                                                ),
                                                Indicator(
                                                  color: AppColors
                                                      .contentColorPurple,
                                                  text: 'Fourth',
                                                  isSquare: true,
                                                  textStyle: TextStyle(
                                                    fontSize:
                                                        5, // Adjust the font size as needed
                                                    // Add more styling options if necessary
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 18,
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              width: 28,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  height: 220,
                                  child: Chart(
                                    data: lineMarkerData,
                                    variables: {
                                      'day': Variable(
                                        accessor: (Map datum) =>
                                            datum['day'] as String,
                                        scale: OrdinalScale(inflate: true),
                                      ),
                                      'value': Variable(
                                        accessor: (Map datum) =>
                                            datum['value'] as num,
                                        scale: LinearScale(
                                          max: 15,
                                          min: -3,
                                          tickCount: 7,
                                          formatter: (v) => '${v.toInt()} ℃',
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
                                      'tooltipMouse': PointSelection(on: {
                                        GestureType.hover,
                                      }, devices: {
                                        PointerDeviceKind.mouse
                                      }, variable: 'day', dim: Dim.x),
                                      'tooltipTouch': PointSelection(on: {
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
                                          strokeColor: const Color(0xff5470c6)
                                              .withAlpha(100),
                                          dash: [2],
                                        ),
                                      ),
                                      LineAnnotation(
                                        dim: Dim.y,
                                        value: 3.57,
                                        style: PaintStyle(
                                          strokeColor: const Color(0xff91cc75)
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
                                                        fillColor: const Color(
                                                            0xff5470c6)))
                                              ],
                                          values: ['Mar', -3]),
                                      CustomAnnotation(
                                          renderer: (offset, _) => [
                                                CircleElement(
                                                    center: offset,
                                                    radius: 5,
                                                    style: PaintStyle(
                                                        fillColor: const Color(
                                                            0xff5470c6)))
                                              ],
                                          values: ['Jul', -7]),
                                      CustomAnnotation(
                                          renderer: (offset, _) => [
                                                CircleElement(
                                                    center: offset,
                                                    radius: 5,
                                                    style: PaintStyle(
                                                        fillColor: const Color(
                                                            0xff91cc75)))
                                              ],
                                          values: ['Feb', 2]),
                                      CustomAnnotation(
                                          renderer: (offset, _) => [
                                                CircleElement(
                                                    center: offset,
                                                    radius: 5,
                                                    style: PaintStyle(
                                                        fillColor: const Color(
                                                            0xff91cc75)))
                                              ],
                                          values: ['Apr', -5]),
                                      TagAnnotation(
                                        label: Label(
                                            '13',
                                            LabelStyle(
                                              textStyle: Defaults.textStyle,
                                              offset: const Offset(0, -10),
                                            )),
                                        values: ['Mar', -13],
                                      ),
                                      TagAnnotation(
                                        label: Label(
                                            '9',
                                            LabelStyle(
                                              textStyle: Defaults.textStyle,
                                              offset: const Offset(0, -10),
                                            )),
                                        values: ['July', -9],
                                      ),
                                      TagAnnotation(
                                        label: Label(
                                            '-2',
                                            LabelStyle(
                                              textStyle: Defaults.textStyle,
                                              offset: const Offset(0, -10),
                                            )),
                                        values: ['Feb', -2],
                                      ),
                                      TagAnnotation(
                                        label: Label(
                                            '5',
                                            LabelStyle(
                                              textStyle: Defaults.textStyle,
                                              offset: const Offset(0, -10),
                                            )),
                                        values: ['Apr', -5],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Expanded(
                                child: Container(
                                  height: 250,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12.0),
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
                                          height: 55,

                                          color: Color.fromRGBO(
                                              75, 61, 82, 1), // Brown color
                                          child: Center(
                                            child: Text(
                                              'New Booking',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
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
                                                BorderRadius.circular(12.0),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: ColorFiltered(
                                              colorFilter: ColorFilter.mode(
                                                Color.fromRGBO(
                                                    183, 174, 185, 1),
                                                BlendMode.srcIn,
                                              ),
                                              child: Transform.translate(
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
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(0),
                                        topRight: Radius.circular(0),
                                        bottomLeft: Radius.circular(12),
                                        bottomRight: Radius.circular(12)),
                                  ),
                                  child: Expanded(
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 55,
                                          color: Color.fromRGBO(
                                              75, 61, 82, 1), // Brown color
                                          child: Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                1.5.w, 1.5.h, 1.5.w, 1.5.h),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text('Bookings',
                                                    style:
                                                        TabelText.headerText),
                                                Row(
                                                  children: [
                                                    Text("View all",
                                                        style: TabelText.text3),
                                                    IconButton(
                                                      icon: Icon(
                                                        Icons.arrow_forward_ios,
                                                        color: Colors.white,
                                                        size: 15,
                                                      ),
                                                      onPressed: () {},
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        // Add spacing between the brown container and the white container

                                        SizedBox(
                                          height: 200,
                                          child: ListView(
                                            children: [_booking1Table()],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 4.5.w,
                              ),
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(0),
                                        topRight: Radius.circular(0),
                                        bottomLeft: Radius.circular(12),
                                        bottomRight: Radius.circular(12)),
                                  ),
                                  child: Expanded(
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 55,
                                          color: Color.fromRGBO(
                                              75, 61, 82, 1), // Brown color
                                          child: Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                1.5.w, 1.5.h, 1.5.w, 1.5.h),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text('Booking 2',
                                                    style:
                                                        TabelText.headerText),
                                                Row(
                                                  children: [
                                                    Text("Booking iD XXXXXX",
                                                        style: TabelText.text3),
                                                    IconButton(
                                                      icon: Icon(
                                                        Icons.arrow_forward_ios,
                                                        color: Colors.white,
                                                        size: 15,
                                                      ),
                                                      onPressed: () {},
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        // Add spacing between the brown container and the white container

                                        SizedBox(
                                          height: 200,
                                          child: ListView(
                                            children: [_pendingbookTable()],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Center(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Container(
                                height: 10, // Adjust the height as needed
                                width:
                                    1200, // Set the desired length of the scroll bar
                                color: Colors
                                    .grey, // Background color of the scrollable area
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 150,
                      height: 50,
                      child: Flexible(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 33.5),
                          child: ElevatedButton(
                            onPressed: () {
                              // Handle button press
                              print('Elevated Button Pressed!');
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromRGBO(98, 105, 254, 1),
                              side: BorderSide(
                                color: Color.fromRGBO(98, 105, 254, 1),
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
                  ])));
        } else {
          return SingleChildScrollView(
              child: Container(
                  color: Color.fromRGBO(255, 255, 255, 200),
                  padding: EdgeInsets.fromLTRB(3.w, 7.h, 3.w, 2.5.h),
                  child: Column(children: [
                    Container(
                      color: Color.fromRGBO(255, 255, 255, 157),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 90, top: 30),
                            child: Row(
                              children: [
                                Text("No of Bookings  "),
                                Text(
                                  "103",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 90, top: 10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  margin: const EdgeInsets.only(top: 10),
                                  width: 350,
                                  height: 250,
                                  child: Stack(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 80),
                                        child: PieChart(
                                          swapAnimationDuration:
                                              const Duration(seconds: 1),
                                          swapAnimationCurve:
                                              Curves.easeInOutQuint,
                                          PieChartData(
                                            pieTouchData: PieTouchData(
                                              touchCallback: tapOnPieChart,
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
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  '29% Completed Successfully',
                                                  style: TextStyle(
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.bold,
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
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  margin: const EdgeInsets.only(top: 10),
                                  width: 400,
                                  height: 250,
                                  child: Chart(
                                    data: lineMarkerData,
                                    variables: {
                                      'day': Variable(
                                        accessor: (Map datum) =>
                                            datum['day'] as String,
                                        scale: OrdinalScale(inflate: true),
                                      ),
                                      'value': Variable(
                                        accessor: (Map datum) =>
                                            datum['value'] as num,
                                        scale: LinearScale(
                                          max: 15,
                                          min: -3,
                                          tickCount: 7,
                                          formatter: (v) => '${v.toInt()} ℃',
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
                                      'tooltipMouse': PointSelection(on: {
                                        GestureType.hover,
                                      }, devices: {
                                        PointerDeviceKind.mouse
                                      }, variable: 'day', dim: Dim.x),
                                      'tooltipTouch': PointSelection(on: {
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
                                          strokeColor: const Color(0xff5470c6)
                                              .withAlpha(100),
                                          dash: [2],
                                        ),
                                      ),
                                      LineAnnotation(
                                        dim: Dim.y,
                                        value: 3.57,
                                        style: PaintStyle(
                                          strokeColor: const Color(0xff91cc75)
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
                                                        fillColor: const Color(
                                                            0xff5470c6)))
                                              ],
                                          values: ['Mar', -3]),
                                      CustomAnnotation(
                                          renderer: (offset, _) => [
                                                CircleElement(
                                                    center: offset,
                                                    radius: 5,
                                                    style: PaintStyle(
                                                        fillColor: const Color(
                                                            0xff5470c6)))
                                              ],
                                          values: ['Jul', -7]),
                                      CustomAnnotation(
                                          renderer: (offset, _) => [
                                                CircleElement(
                                                    center: offset,
                                                    radius: 5,
                                                    style: PaintStyle(
                                                        fillColor: const Color(
                                                            0xff91cc75)))
                                              ],
                                          values: ['Feb', 2]),
                                      CustomAnnotation(
                                          renderer: (offset, _) => [
                                                CircleElement(
                                                    center: offset,
                                                    radius: 5,
                                                    style: PaintStyle(
                                                        fillColor: const Color(
                                                            0xff91cc75)))
                                              ],
                                          values: ['Apr', -5]),
                                      TagAnnotation(
                                        label: Label(
                                            '13',
                                            LabelStyle(
                                              textStyle: Defaults.textStyle,
                                              offset: const Offset(0, -10),
                                            )),
                                        values: ['Mar', -13],
                                      ),
                                      TagAnnotation(
                                        label: Label(
                                            '9',
                                            LabelStyle(
                                              textStyle: Defaults.textStyle,
                                              offset: const Offset(0, -10),
                                            )),
                                        values: ['July', -9],
                                      ),
                                      TagAnnotation(
                                        label: Label(
                                            '-2',
                                            LabelStyle(
                                              textStyle: Defaults.textStyle,
                                              offset: const Offset(0, -10),
                                            )),
                                        values: ['Feb', -2],
                                      ),
                                      TagAnnotation(
                                        label: Label(
                                            '5',
                                            LabelStyle(
                                              textStyle: Defaults.textStyle,
                                              offset: const Offset(0, -10),
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
                                    borderRadius: BorderRadius.circular(12.0),
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

                                          color: Color.fromRGBO(
                                              75, 61, 82, 1), // Brown color
                                          child: Center(
                                            child: Text(
                                              'New Booking',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
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
                                                BorderRadius.circular(12.0),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: ColorFiltered(
                                              colorFilter: ColorFilter.mode(
                                                Color.fromRGBO(
                                                    183, 174, 185, 1),
                                                BlendMode.srcIn,
                                              ),
                                              child: Transform.translate(
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
                            height: 40,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 135,
                            ),
                            child: Row(
                              children: [
                                Container(
                                  height: 292,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color.fromRGBO(216, 216, 216, 1),
                                        offset: Offset(0, 1),
                                        blurRadius:
                                            0.1, // changes position of shadow
                                      ),
                                    ],
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  width: 350,
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 70,
                                        color: Color.fromRGBO(
                                            75, 61, 82, 1), // Brown color
                                        child: Center(
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10),
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
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 170),
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
                                              BorderRadius.circular(12.0),
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
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12,
                                                  ),
                                                ),
                                                subtitle: Text(
                                                  '18.02.2022',
                                                  style:
                                                      TextStyle(fontSize: 10),
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
                                                        Text("Truck11"),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                        width:
                                                            30), // Add some space between "Truck" and "View" button
                                                    InkWell(
                                                      onTap: () {
                                                        // Add your View button functionality here
                                                        print(
                                                            'View button pressed');
                                                      },
                                                      child: Container(
                                                        height: 30,
                                                        width: 81,
                                                        decoration:
                                                            BoxDecoration(
                                                          boxShadow: [
                                                            BoxShadow(
                                                              color: Color
                                                                  .fromRGBO(
                                                                      216,
                                                                      216,
                                                                      216,
                                                                      1),
                                                              offset:
                                                                  Offset(0, 1),
                                                              blurRadius:
                                                                  0.1, // changes position of shadow
                                                            ),
                                                          ],
                                                          color: Color.fromRGBO(
                                                              245, 243, 255, 1),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                        ),
                                                        child: Center(
                                                          child: Text(
                                                            'View',
                                                            style: TextStyle(
                                                              color: Color
                                                                  .fromRGBO(
                                                                      127,
                                                                      106,
                                                                      255,
                                                                      1),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 10,
                                                              fontFamily:
                                                                  "SFProText",
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
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 10.3,
                                                  ),
                                                ),
                                                subtitle: Text(
                                                  '10.02.2022',
                                                  style:
                                                      TextStyle(fontSize: 10),
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
                                                        Text("Equipment"),
                                                      ],
                                                    ),

                                                    SizedBox(
                                                        width:
                                                            30), // Add some space between "Truck" and "View" button
                                                    InkWell(
                                                      onTap: () {
                                                        // Add your View button functionality here
                                                        print(
                                                            'View button pressed');
                                                      },
                                                      child: Container(
                                                        height: 30,
                                                        width: 81,
                                                        decoration:
                                                            BoxDecoration(
                                                          boxShadow: [
                                                            BoxShadow(
                                                              color: Color
                                                                  .fromRGBO(
                                                                      216,
                                                                      216,
                                                                      216,
                                                                      1),
                                                              offset:
                                                                  Offset(0, 1),
                                                              blurRadius:
                                                                  0.1, // changes position of shadow
                                                            ),
                                                          ],
                                                          color: Color.fromRGBO(
                                                              245, 243, 255, 1),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                        ),
                                                        child: Center(
                                                          child: Text(
                                                            'View',
                                                            style: TextStyle(
                                                              color: Color
                                                                  .fromRGBO(
                                                                      127,
                                                                      106,
                                                                      255,
                                                                      1),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 10,
                                                              fontFamily:
                                                                  "SFProText",
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
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12,
                                                  ),
                                                ),
                                                subtitle: Text(
                                                  '07.02.2022',
                                                  style:
                                                      TextStyle(fontSize: 10),
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
                                                    InkWell(
                                                      onTap: () {
                                                        // Add your View button functionality here
                                                        print(
                                                            'View button pressed');
                                                      },
                                                      child: Container(
                                                        height: 30,
                                                        width: 81,
                                                        decoration:
                                                            BoxDecoration(
                                                          boxShadow: [
                                                            BoxShadow(
                                                              color: Color
                                                                  .fromRGBO(
                                                                      216,
                                                                      216,
                                                                      216,
                                                                      1),
                                                              offset:
                                                                  Offset(0, 1),
                                                              blurRadius:
                                                                  0.1, // changes position of shadow
                                                            ),
                                                          ],
                                                          color: Color.fromRGBO(
                                                              245, 243, 255, 1),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                        ),
                                                        child: Center(
                                                          child: Text(
                                                            'View',
                                                            style: TextStyle(
                                                              color: Color
                                                                  .fromRGBO(
                                                                      127,
                                                                      106,
                                                                      255,
                                                                      1),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 10,
                                                              fontFamily:
                                                                  "SFProText",
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
                                  height: 290,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color.fromRGBO(216, 216, 216, 1),
                                        offset: Offset(0, 1),
                                        blurRadius:
                                            0.1, // changes position of shadow
                                      ),
                                    ],
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  width: 610,
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 70,
                                        color: Color.fromRGBO(
                                            75, 61, 82, 1), // Brown color
                                        child: Center(
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10),
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
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 290),
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
                                                  MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
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
                                                                FontWeight.bold,
                                                            fontSize: 12,
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
                                                    color: Color.fromRGBO(
                                                        206, 203, 203, 1),
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
                                                                FontWeight.bold,
                                                            fontSize: 12,
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
                                                    color: Color.fromRGBO(
                                                        206, 203, 203, 1),
                                                  ),
                                                ),
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
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
                                                                FontWeight.bold,
                                                            fontSize: 12,
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
                                                              color: Color
                                                                  .fromRGBO(
                                                                      216,
                                                                      216,
                                                                      216,
                                                                      1),
                                                              offset:
                                                                  Offset(0, 1),
                                                              blurRadius:
                                                                  0.1, // changes position of shadow
                                                            ),
                                                          ],
                                                          color: Color.fromRGBO(
                                                              245, 243, 255, 1),
                                                          border: Border.all(
                                                              color: Color
                                                                  .fromARGB(
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
                                                                    .all(8.0),
                                                            child: Container(
                                                              width: 120,
                                                              height: 30,
                                                              decoration: BoxDecoration(
                                                                  boxShadow: [
                                                                    BoxShadow(
                                                                      color: Color.fromRGBO(
                                                                          216,
                                                                          216,
                                                                          216,
                                                                          1),
                                                                      offset:
                                                                          Offset(
                                                                              0,
                                                                              1),
                                                                      blurRadius:
                                                                          0.1, // changes position of shadow
                                                                    ),
                                                                  ],
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          200,
                                                                          251,
                                                                          253,
                                                                          1),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              12.0),
                                                                  border: Border.all(
                                                                      color: Color.fromARGB(
                                                                          246,
                                                                          245,
                                                                          242,
                                                                          242))),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(
                                                                        8.0),
                                                                child: Center(
                                                                  child: Row(
                                                                    children: [
                                                                      Text(
                                                                          "Vendor 1",
                                                                          style: const TextStyle(
                                                                              fontWeight: FontWeight.bold,
                                                                              fontSize: 9,
                                                                              color: Color.fromRGBO(128, 118, 118, 1))),
                                                                      SizedBox(
                                                                        width:
                                                                            10,
                                                                      ),
                                                                      Text(
                                                                        "Xxxxx SAR",
                                                                        style: const TextStyle(
                                                                            fontWeight: FontWeight
                                                                                .bold,
                                                                            fontSize:
                                                                                8,
                                                                            color: Color.fromRGBO(
                                                                                127,
                                                                                106,
                                                                                255,
                                                                                1)),
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
                                                                    .all(8.0),
                                                            child: Container(
                                                              width: 150,
                                                              height: 30,
                                                              decoration: BoxDecoration(
                                                                  boxShadow: [
                                                                    BoxShadow(
                                                                      color: Color.fromRGBO(
                                                                          216,
                                                                          216,
                                                                          216,
                                                                          1),
                                                                      offset:
                                                                          Offset(
                                                                              0,
                                                                              1),
                                                                      blurRadius:
                                                                          0.1, // changes position of shadow
                                                                    ),
                                                                  ],
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          200,
                                                                          251,
                                                                          253,
                                                                          1),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              12.0),
                                                                  border: Border.all(
                                                                      color: Color.fromARGB(
                                                                          246,
                                                                          245,
                                                                          242,
                                                                          242))),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(
                                                                        8.0),
                                                                child: Center(
                                                                  child: Row(
                                                                    children: [
                                                                      Text(
                                                                          "Vendor 1",
                                                                          style: const TextStyle(
                                                                              fontWeight: FontWeight.bold,
                                                                              fontSize: 9,
                                                                              color: Color.fromRGBO(128, 118, 118, 1))),
                                                                      SizedBox(
                                                                        width:
                                                                            10,
                                                                      ),
                                                                      Text(
                                                                        "Xxxxx SAR",
                                                                        style: const TextStyle(
                                                                            fontWeight: FontWeight
                                                                                .bold,
                                                                            fontSize:
                                                                                8,
                                                                            color: Color.fromRGBO(
                                                                                127,
                                                                                106,
                                                                                255,
                                                                                1)),
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
                                                                    .all(8.0),
                                                            child: Container(
                                                              width: 120,
                                                              height: 30,
                                                              decoration: BoxDecoration(
                                                                  boxShadow: [
                                                                    BoxShadow(
                                                                      color: Color.fromRGBO(
                                                                          216,
                                                                          216,
                                                                          216,
                                                                          1),
                                                                      offset:
                                                                          Offset(
                                                                              0,
                                                                              1),
                                                                      blurRadius:
                                                                          0.1, // changes position of shadow
                                                                    ),
                                                                  ],
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          200,
                                                                          251,
                                                                          253,
                                                                          1),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              12.0),
                                                                  border: Border.all(
                                                                      color: Color.fromARGB(
                                                                          246,
                                                                          245,
                                                                          242,
                                                                          242))),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(
                                                                        8.0),
                                                                child: Center(
                                                                  child: Row(
                                                                    children: [
                                                                      Text(
                                                                          "Vendor 1",
                                                                          style: const TextStyle(
                                                                              fontWeight: FontWeight.bold,
                                                                              fontSize: 9,
                                                                              color: Color.fromRGBO(128, 118, 118, 1))),
                                                                      SizedBox(
                                                                        width:
                                                                            10,
                                                                      ),
                                                                      Text(
                                                                        "Xxxxx SAR",
                                                                        style: const TextStyle(
                                                                            fontWeight: FontWeight
                                                                                .bold,
                                                                            fontSize:
                                                                                8,
                                                                            color: Color.fromRGBO(
                                                                                127,
                                                                                106,
                                                                                255,
                                                                                1)),
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
                                                              color: Color
                                                                  .fromRGBO(
                                                                      216,
                                                                      216,
                                                                      216,
                                                                      1),
                                                              offset:
                                                                  Offset(0, 1),
                                                              blurRadius:
                                                                  0.1, // changes position of shadow
                                                            ),
                                                          ],
                                                          color: Color.fromRGBO(
                                                              245, 243, 255, 1),
                                                          border: Border.all(
                                                              color: Color
                                                                  .fromARGB(
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
                                                                    .all(8.0),
                                                            child: Container(
                                                              width: 120,
                                                              height: 30,
                                                              decoration: BoxDecoration(
                                                                  boxShadow: [
                                                                    BoxShadow(
                                                                      color: Color.fromRGBO(
                                                                          216,
                                                                          216,
                                                                          216,
                                                                          1),
                                                                      offset:
                                                                          Offset(
                                                                              0,
                                                                              1),
                                                                      blurRadius:
                                                                          0.1, // changes position of shadow
                                                                    ),
                                                                  ],
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          224,
                                                                          253,
                                                                          200,
                                                                          1),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              12.0),
                                                                  border: Border.all(
                                                                      color: Color.fromARGB(
                                                                          246,
                                                                          245,
                                                                          242,
                                                                          242))),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(
                                                                        8.0),
                                                                child: Center(
                                                                  child: Row(
                                                                    children: [
                                                                      Text(
                                                                          "Vendor 2",
                                                                          style: const TextStyle(
                                                                              fontWeight: FontWeight.bold,
                                                                              fontSize: 9,
                                                                              color: Color.fromRGBO(128, 118, 118, 1))),
                                                                      SizedBox(
                                                                        width:
                                                                            10,
                                                                      ),
                                                                      Text(
                                                                        "Xxxxx SAR",
                                                                        style: const TextStyle(
                                                                            fontWeight: FontWeight
                                                                                .bold,
                                                                            fontSize:
                                                                                8,
                                                                            color: Color.fromRGBO(
                                                                                127,
                                                                                106,
                                                                                255,
                                                                                1)),
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
                                                                    .all(8.0),
                                                            child: Container(
                                                              width: 120,
                                                              height: 30,
                                                              decoration: BoxDecoration(
                                                                  boxShadow: [
                                                                    BoxShadow(
                                                                      color: Color.fromRGBO(
                                                                          216,
                                                                          216,
                                                                          216,
                                                                          1),
                                                                      offset:
                                                                          Offset(
                                                                              0,
                                                                              1),
                                                                      blurRadius:
                                                                          0.1, // changes position of shadow
                                                                    ),
                                                                  ],
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          224,
                                                                          253,
                                                                          200,
                                                                          1),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              12.0),
                                                                  border: Border.all(
                                                                      color: Color.fromARGB(
                                                                          246,
                                                                          245,
                                                                          242,
                                                                          242))),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(
                                                                        8.0),
                                                                child: Center(
                                                                  child: Row(
                                                                    children: [
                                                                      Text(
                                                                          "Vendor 2",
                                                                          style: const TextStyle(
                                                                              fontWeight: FontWeight.bold,
                                                                              fontSize: 9,
                                                                              color: Color.fromRGBO(128, 118, 118, 1))),
                                                                      SizedBox(
                                                                        width:
                                                                            10,
                                                                      ),
                                                                      Text(
                                                                        "Xxxxx SAR",
                                                                        style: const TextStyle(
                                                                            fontWeight: FontWeight
                                                                                .bold,
                                                                            fontSize:
                                                                                8,
                                                                            color: Color.fromRGBO(
                                                                                127,
                                                                                106,
                                                                                255,
                                                                                1)),
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
                                                                    .all(8.0),
                                                            child: Container(
                                                              width: 120,
                                                              height: 30,
                                                              decoration: BoxDecoration(
                                                                  boxShadow: [
                                                                    BoxShadow(
                                                                      color: Color.fromRGBO(
                                                                          216,
                                                                          216,
                                                                          216,
                                                                          1),
                                                                      offset:
                                                                          Offset(
                                                                              0,
                                                                              1),
                                                                      blurRadius:
                                                                          0.1, // changes position of shadow
                                                                    ),
                                                                  ],
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          224,
                                                                          253,
                                                                          200,
                                                                          1),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              12.0),
                                                                  border: Border.all(
                                                                      color: Color.fromARGB(
                                                                          246,
                                                                          245,
                                                                          242,
                                                                          242))),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(
                                                                        8.0),
                                                                child: Center(
                                                                  child: Row(
                                                                    children: [
                                                                      Text(
                                                                          "Vendor 2",
                                                                          style: const TextStyle(
                                                                              fontWeight: FontWeight.bold,
                                                                              fontSize: 9,
                                                                              color: Color.fromRGBO(128, 118, 118, 1))),
                                                                      SizedBox(
                                                                        width:
                                                                            10,
                                                                      ),
                                                                      Text(
                                                                        "Xxxxx SAR",
                                                                        style: const TextStyle(
                                                                            fontWeight: FontWeight
                                                                                .bold,
                                                                            fontSize:
                                                                                8,
                                                                            color: Color.fromRGBO(
                                                                                127,
                                                                                106,
                                                                                255,
                                                                                1)),
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
                                                              color: Color
                                                                  .fromRGBO(
                                                                      216,
                                                                      216,
                                                                      216,
                                                                      1),
                                                              offset:
                                                                  Offset(0, 1),
                                                              blurRadius:
                                                                  0.1, // changes position of shadow
                                                            ),
                                                          ],
                                                          color: Color.fromRGBO(
                                                              245, 243, 255, 1),
                                                          border: Border.all(
                                                              color: Color
                                                                  .fromARGB(
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
                                                                    .all(8.0),
                                                            child: Container(
                                                              width: 120,
                                                              height: 30,
                                                              decoration: BoxDecoration(
                                                                  boxShadow: [
                                                                    BoxShadow(
                                                                      color: Color.fromRGBO(
                                                                          216,
                                                                          216,
                                                                          216,
                                                                          1),
                                                                      offset:
                                                                          Offset(
                                                                              0,
                                                                              1),
                                                                      blurRadius:
                                                                          0.1, // changes position of shadow
                                                                    ),
                                                                  ],
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          245,
                                                                          253,
                                                                          200,
                                                                          1),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              12.0),
                                                                  border: Border.all(
                                                                      color: Color.fromARGB(
                                                                          246,
                                                                          245,
                                                                          242,
                                                                          242))),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(
                                                                        8.0),
                                                                child: Center(
                                                                  child: Row(
                                                                    children: [
                                                                      Text(
                                                                          "Vendor 3",
                                                                          style: const TextStyle(
                                                                              fontWeight: FontWeight.bold,
                                                                              fontSize: 9,
                                                                              color: Color.fromRGBO(128, 118, 118, 1))),
                                                                      SizedBox(
                                                                        width:
                                                                            10,
                                                                      ),
                                                                      Text(
                                                                        "Xxxxx SAR",
                                                                        style: const TextStyle(
                                                                            fontWeight: FontWeight
                                                                                .bold,
                                                                            fontSize:
                                                                                8,
                                                                            color: Color.fromRGBO(
                                                                                127,
                                                                                106,
                                                                                255,
                                                                                1)),
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
                                                                    .all(8.0),
                                                            child: Container(
                                                              width: 120,
                                                              height: 30,
                                                              decoration: BoxDecoration(
                                                                  boxShadow: [
                                                                    BoxShadow(
                                                                      color: Color.fromRGBO(
                                                                          216,
                                                                          216,
                                                                          216,
                                                                          1),
                                                                      offset:
                                                                          Offset(
                                                                              0,
                                                                              1),
                                                                      blurRadius:
                                                                          0.1, // changes position of shadow
                                                                    ),
                                                                  ],
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          245,
                                                                          253,
                                                                          200,
                                                                          1),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              12.0),
                                                                  border: Border.all(
                                                                      color: Color.fromARGB(
                                                                          246,
                                                                          245,
                                                                          242,
                                                                          242))),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(
                                                                        8.0),
                                                                child: Center(
                                                                  child: Row(
                                                                    children: [
                                                                      Text(
                                                                          "Vendor 3",
                                                                          style: const TextStyle(
                                                                              fontWeight: FontWeight.bold,
                                                                              fontSize: 9,
                                                                              color: Color.fromRGBO(128, 118, 118, 1))),
                                                                      SizedBox(
                                                                        width:
                                                                            10,
                                                                      ),
                                                                      Text(
                                                                        "Xxxxx SAR",
                                                                        style: const TextStyle(
                                                                            fontWeight: FontWeight
                                                                                .bold,
                                                                            fontSize:
                                                                                8,
                                                                            color: Color.fromRGBO(
                                                                                127,
                                                                                106,
                                                                                255,
                                                                                1)),
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
                                                                    .all(8.0),
                                                            child: Container(
                                                              width: 120,
                                                              height: 30,
                                                              decoration: BoxDecoration(
                                                                  boxShadow: [
                                                                    BoxShadow(
                                                                      color: Color.fromRGBO(
                                                                          216,
                                                                          216,
                                                                          216,
                                                                          1),
                                                                      offset:
                                                                          Offset(
                                                                              0,
                                                                              1),
                                                                      blurRadius:
                                                                          0.1, // changes position of shadow
                                                                    ),
                                                                  ],
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          245,
                                                                          253,
                                                                          200,
                                                                          1),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              12.0),
                                                                  border: Border.all(
                                                                      color: Color.fromARGB(
                                                                          246,
                                                                          245,
                                                                          242,
                                                                          242))),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(
                                                                        8.0),
                                                                child: Center(
                                                                  child: Row(
                                                                    children: [
                                                                      Text(
                                                                          "Vendor 3",
                                                                          style: const TextStyle(
                                                                              fontWeight: FontWeight.bold,
                                                                              fontSize: 9,
                                                                              color: Color.fromRGBO(128, 118, 118, 1))),
                                                                      SizedBox(
                                                                        width:
                                                                            10,
                                                                      ),
                                                                      Text(
                                                                        "Xxxxx SAR",
                                                                        style: const TextStyle(
                                                                            fontWeight: FontWeight
                                                                                .bold,
                                                                            fontSize:
                                                                                8,
                                                                            color: Color.fromRGBO(
                                                                                127,
                                                                                106,
                                                                                255,
                                                                                1)),
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
                                height: 10, // Adjust the height as needed
                                width:
                                    1200, // Set the desired length of the scroll bar
                                color: Colors
                                    .grey, // Background color of the scrollable area
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          CustomButton(
                            onPressed: () {},
                            text: 'Book New',
                          )
                        ],
                      ),
                    ),
                  ])));
        }
      });
    });
  }

  DataTable _booking1Table() {
    return DataTable(
        columnSpacing: 15,
        dataRowHeight: 65,
        headingRowHeight: 0,
        columns: _booking1Columns(),
        rows: _booking1Rows());
  }

  List<DataColumn> _booking1Columns() {
    return [
      DataColumn(
        label: SizedBox(),
        numeric: true,
      ),
      DataColumn(label: SizedBox(), numeric: false),
      DataColumn(label: SizedBox(), numeric: false),
      DataColumn(label: SizedBox(), numeric: true),
    ];
  }

  // List<DataRow> _createRows() {
  //   return _books
  //       .map((book) => DataRow(cells: [
  //             DataCell(Text('#' + book['id'].toString())),
  //             DataCell(Text(book['title'])),
  //             DataCell(Text(book['author']))
  //           ]))
  //       .toList();
  // }
  List<DataRow> _booking1Rows() {
    return [
      DataRow(cells: [
        DataCell(
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: SizedBox(
              width: 35,
              height: 35,
              child: SizedBox(
                width: 35,
                height: 35,
                child: CircleAvatar(),
              ),
            ),
          ),
        ),
        DataCell(
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Trip 1', style: TabelText.text1),
                SizedBox(height: 3),
                Text("18.02.2022", style: TabelText.text2),
              ],
            ),
          ),
        ),
        DataCell(
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: Text("Truck", style: TabelText.text2),
          ),
        ),
        DataCell(
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: ViewButton(
              text: 'View',
              onPressed: () {},
              colors: Color.fromRGBO(245, 243, 255, 1),
            ),
          ),
        ),
      ]),
      DataRow(cells: [
        DataCell(
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: SizedBox(
              width: 35,
              height: 35,
              child: SizedBox(
                width: 35,
                height: 35,
                child: CircleAvatar(),
              ),
            ),
          ),
        ),
        DataCell(
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Equipment Hire', style: TabelText.text1),
                SizedBox(height: 3),
                Text("10.02.2022", style: TabelText.text2),
              ],
            ),
          ),
        ),
        DataCell(
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Heavy', style: TabelText.text2),
                SizedBox(height: 3),
                Text("Equipment", style: TabelText.text2),
              ],
            ),
          ),
        ),
        DataCell(
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: ViewButton(
              text: 'View',
              onPressed: () {},
              colors: Color.fromRGBO(245, 243, 255, 1),
            ),
          ),
        ),
      ]),
      DataRow(cells: [
        DataCell(
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: SizedBox(
              width: 35,
              height: 35,
              child: SizedBox(
                width: 35,
                height: 35,
                child: CircleAvatar(),
              ),
            ),
          ),
        ),
        DataCell(
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Fletch Skinner', style: TabelText.text1),
                SizedBox(height: 3),
                Text("07.02.2022", style: TabelText.text2),
              ],
            ),
          ),
        ),
        DataCell(
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: Text("Truck", style: TabelText.text2),
          ),
        ),
        DataCell(
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: ViewButton(
              text: 'View',
              onPressed: () {},
              colors: Color.fromRGBO(245, 243, 255, 1),
            ),
          ),
        ),
      ]),
    ];
  }

  DataTable _pendingbookTable() {
    return DataTable(
        columnSpacing: 15,
        dataRowHeight: 65,
        headingRowHeight: 0,
        columns: _pendingbookColumns(),
        rows: _pendingbookRows());
  }

  List<DataColumn> _pendingbookColumns() {
    return [
      DataColumn(
        label: SizedBox(),
        numeric: true,
      ),
      DataColumn(label: SizedBox(), numeric: false),
      DataColumn(label: SizedBox(), numeric: true),
      DataColumn(label: SizedBox(), numeric: true),
      DataColumn(label: SizedBox(), numeric: true),
    ];
  }

  // List<DataRow> _createRows() {
  //   return _books
  //       .map((book) => DataRow(cells: [
  //             DataCell(Text('#' + book['id'].toString())),
  //             DataCell(Text(book['title'])),
  //             DataCell(Text(book['author']))
  //           ]))
  //       .toList();
  // }
  List<DataRow> _pendingbookRows() {
    return [
      DataRow(cells: [
        DataCell(
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: SizedBox(
              width: 35,
              height: 35,
              child: SizedBox(
                width: 35,
                height: 35,
                child: CircleAvatar(),
              ),
            ),
          ),
        ),
        DataCell(
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Truck', style: TabelText.text1),
                SizedBox(height: 3),
                Text("Booking ID XXXXXX", style: TabelText.text2),
              ],
            ),
          ),
        ),
        DataCell(
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: ViewButton(
              text: 'View',
              onPressed: () {},
              colors: Color.fromRGBO(245, 243, 255, 1),
            ),
          ),
        ),
      ]),
      DataRow(cells: [
        DataCell(
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: SizedBox(
              width: 35,
              height: 35,
              child: SizedBox(
                width: 35,
                height: 35,
                child: CircleAvatar(),
              ),
            ),
          ),
        ),
        DataCell(
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Equipment Hire', style: TabelText.text1),
                SizedBox(height: 3),
                Text("Booking ID XXXXXX", style: TabelText.text2),
              ],
            ),
          ),
        ),
        DataCell(
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: ViewButton(
              text: 'View',
              onPressed: () {},
              colors: Color.fromRGBO(245, 243, 255, 1),
            ),
          ),
        ),
      ]),
      DataRow(cells: [
        DataCell(
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: SizedBox(
              width: 35,
              height: 35,
              child: SizedBox(
                width: 35,
                height: 35,
                child: CircleAvatar(),
              ),
            ),
          ),
        ),
        DataCell(
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Bus Trip', style: TabelText.text1),
                SizedBox(height: 3),
                Text("Booking ID XXXXXX", style: TabelText.text2),
              ],
            ),
          ),
        ),
        DataCell(
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: ViewButton(
              text: 'View',
              onPressed: () {},
              colors: Color.fromRGBO(245, 243, 255, 1),
            ),
          ),
        ),
      ]),
    ];
  }
}
