import 'package:flutter/material.dart';

import '../main.dart';

// ignore: must_be_immutable
class LoginPage extends StatefulWidget {
  const LoginPage();
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      // The Dialog widget provides a full-page overlay
      child: Padding(
        padding:
            const EdgeInsets.only(left: 80.0, right: 80, top: 50, bottom: 50),
        child: Container(
          height: 1000,
          width: 1500,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [],
          ),
        ),
      ),
    );
  }
}
