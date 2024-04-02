import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/DialogBox/bookingdialog.dart';

import 'package:sizer/sizer.dart';
import '../../Widgets/customButton.dart';
import '../../Widgets/formText.dart';
import '../../classes/language.dart';
import '../../classes/language_constants.dart';
import '../../main.dart';
import 'Users/SingleUser/bookingHistory.dart';
import 'Users/SingleUser/bookings.dart';
import 'Users/SingleUser/dashboard.dart';
import 'Users/SingleUser/payments.dart';

class Sample extends StatefulWidget {
  const Sample();

  @override
  State<Sample> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Sample> {
  String bookingDetails = "Some booking details";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Page'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SecondPage(bookingDetails),
                  ),
                );

                if (result != null) {
                  setState(() {
                    bookingDetails = result;
                  });
                }
              },
              child: Text('Go to Second Page'),
            ),
            Text('$bookingDetails' ?? 'dsfsdf')
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  final String bookingDetails;

  SecondPage(this.bookingDetails);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Booking Details:',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              bookingDetails,
              style: TextStyle(fontSize: 16),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, "Updated booking details");
              },
              child: Text('Update Booking Details and Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}
