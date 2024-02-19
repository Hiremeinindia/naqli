import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String month = '';

// Function to handle tap on the Pie Chart
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
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('29% Completed Successfully'),
              Text(month),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 80),
            child: PieChart(
                swapAnimationDuration: const Duration(seconds: 1),
                swapAnimationCurve: Curves.easeInOutQuint,
                PieChartData(
                    pieTouchData: PieTouchData(
                      touchCallback: tapOnPieChart,
                    ),
                    sections: [
                      PieChartSectionData(value: 45, color: Colors.orange),
                      PieChartSectionData(value: 20, color: Colors.grey),
                      PieChartSectionData(value: 25, color: Colors.green),
                      PieChartSectionData(value: 10, color: Colors.red),
                      PieChartSectionData(value: 15, color: Colors.yellow),
                    ])),
          ),
        ],
      ),
    );
  }
}
