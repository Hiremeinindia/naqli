import 'package:flutter/material.dart';

class AvailabeTruckList extends StatefulWidget {
  AvailabeTruckList();

  @override
  State<AvailabeTruckList> createState() => _AvailabeTruckList();
}

class _AvailabeTruckList extends State<AvailabeTruckList> {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(96.0),
          child: Padding(
            padding: const EdgeInsets.only(left: 100, right: 100, top: 20),
            child: AppBar(
              automaticallyImplyLeading: false,
              centerTitle: false,
              elevation: 0.0,
              title: Image.asset(
                'Naqli-final-logo.png',
                width: 140,
                height: 140,
              ),
              actions: [
                Row(
                  children: [
                    Text(
                      'Contact us',
                      style: TextStyle(
                        fontFamily: 'Colfax',
                        fontSize: 16,
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
                      width: 10,
                    ),
                    Text(
                      'Hello Customer!',
                      style: TextStyle(
                        fontFamily: 'Colfax',
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(width: 40),
                    SizedBox(width: 8.0),
                  ],
                ),
              ],
            ),
          ),
        ),
        body: Stack(
          children: [
            Container(
              height: 474,
              width: double.infinity,
              color: Color.fromARGB(255, 128, 123, 229),
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    'Available Vehicle',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Colfax',
                        fontSize: 25,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 360,
              bottom: 100,
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(31))),
                width: 800,
                height: 750,
              ),
            ),
          ],
        ));
  }
}
