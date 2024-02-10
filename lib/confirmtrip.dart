import 'package:flutter/material.dart';

class ConfirmTrip extends StatefulWidget {
  const ConfirmTrip({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<ConfirmTrip> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ConfirmTrip> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(96.0),
        child: Padding(
          padding: const EdgeInsets.only(top: 30),
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
                    Icon(
                      Icons.notifications,
                      color: Color.fromRGBO(106, 102, 209, 1),
                    ),
                    const SizedBox(
                      height: 30,
                      child: Padding(
                        padding: EdgeInsets.only(left: 15, top: 5),
                        child: Text(
                          "Contact Us",
                          style: TextStyle(fontFamily: 'Colfax', fontSize: 16),
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
                          "Hello Customer!",
                          style: TextStyle(fontFamily: 'Colfax', fontSize: 16),
                        ),
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
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Column(
                    children: [
                      Container(
                        height: 500,
                        color: Color.fromRGBO(106, 102, 209, 1),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.topCenter,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 50),
                                child: Text(
                                  'Confirm the trip',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                    fontFamily: 'Colfax',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 500,
                      )
                    ],
                  ),
                  Positioned(
                    top: 200,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: Material(
                        elevation: 5, // Adjust the elevation for the shadow
                        borderRadius: BorderRadius.circular(12.0),
                        child: Container(
                          width: 800,
                          height: 600,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'delivery-truck.png',
                                      width: 300,
                                      height: 300,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 50,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Vehicle 1",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 19,
                                          fontFamily: 'Colfax',
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "Upto 500 kg / Good for Small Parcels",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 13,
                                          fontFamily: 'Colfax',
                                        ),
                                      ),
                                      Text(
                                        "Starting_from_XXX",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 13,
                                          fontFamily: 'Colfax',
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        "Best for Sending",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 19,
                                          fontFamily: 'Colfax',
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text("1. Goods"),
                                      SizedBox(
                                        height: 2,
                                      ),
                                      Text("2. Goods"),
                                      SizedBox(
                                        height: 2,
                                      ),
                                      Text("3. Goods"),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Text("Additional Labour"),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
