import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: Padding(
          padding: const EdgeInsets.only(top: 40),
          child: AppBar(
            automaticallyImplyLeading: false,
            centerTitle: false,
            elevation: 0.0,
            title: Container(
              padding: const EdgeInsets.only(left: 400),
              child: Image.asset(
                'Naqli-final-logo.png',
                width: 140,
                height: 140,
              ),
            ),
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 300.0, top: 10),
                child: Row(
                  children: [
                    const SizedBox(
                      height: 30,
                      child: Padding(
                        padding: EdgeInsets.only(left: 15, top: 5),
                        child: Text("Contact Us"),
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
                        child: Text("Login"),
                      ),
                    ),
                    SizedBox(width: 40),
                    SizedBox(width: 8.0),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
