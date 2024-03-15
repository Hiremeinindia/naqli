import 'package:flutter/material.dart';
import 'bookings.dart';
import 'dashboard.dart';
import 'page_view_container.dart';
import 'payments.dart';
import 'bookingHistory.dart';

// Class for handling PageView
class PageViewContainer extends StatefulWidget {
  @override
  _PageViewContainerState createState() => _PageViewContainerState();
}

class _PageViewContainerState extends State<PageViewContainer> {
  late PageController pageElse;

  @override
  void initState() {
    super.initState();
    pageElse = PageController();
  }

  @override
  void dispose() {
    pageElse.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageElse,
      children: [
        Dashboard(),
        BookingHistory(),
        SingleUserPayment(),
        Container(
          color: Colors.pink,
        ),
        Container(
          color: Colors.deepOrangeAccent,
        ),
      ],
    );
  }
}
