import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Details extends StatefulWidget {
  String user;
  String? operName;
  String? pickup;
  String? dropoff;
  String? load;
  String? truck;
  String? labour;
  String? productValue;
  String? bookingid;
  String? date;
  String? time;

  Details(
      {required this.user,
      this.dropoff,
      this.labour,
      this.load,
      this.operName,
      this.pickup,
      this.productValue,
      this.truck,
      this.bookingid,
      this.date,
      this.time});
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return LayoutBuilder(
          builder: (BuildContext ctx, BoxConstraints constraints) {
        if (constraints.maxWidth >= 1180) {
          return Padding(
            padding: EdgeInsets.only(
              left: 20.w,
              right: 20.w,
              top: 15.3.h,
              bottom: 14.5.h,
            ),
            child: Card(
              elevation: 1,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(31),
                ),
                height: 770,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top: 15, right: 20),
                            child: ImageIcon(
                              AssetImage('cancel.png'),
                              color: Color.fromRGBO(112, 112, 112, 1),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 50),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                    backgroundImage:
                                        AssetImage('assets/Group 2251.png'),
                                    radius: 40,
                                  ),
                                  SizedBox(width: 5),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child:
                                            Text('Id  ${widget.user ?? '----'}',
                                                style: TextStyle(
                                                  fontFamily: 'Helvetica',
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  letterSpacing: 1,
                                                  fontSize: 19,
                                                )),
                                      ),
                                      SizedBox(height: 5),
                                      Row(
                                        children: [
                                          Container(
                                            width: 120,
                                            height: 25,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Colors
                                                    .black, // Border color
                                                width: 0.5, // Border width
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      15.0), // Border radius
                                            ),
                                            child: TextButton(
                                              onPressed: () {
                                                // Add your action here
                                              },
                                              child: Text(
                                                (widget.date != null &&
                                                        widget.time != null)
                                                    ? '${widget.date}, ${widget.time}'
                                                    : '---',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 9,
                                                    fontFamily: 'Helvetica'),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 30),
                            Padding(
                              padding: const EdgeInsets.only(left: 80),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: Colors.green,
                                        radius: 7,
                                      ),
                                      SizedBox(width: 10),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Pickup location',
                                              style: TextStyle(
                                                fontSize: 16.0,
                                                fontFamily: 'Helvetica',
                                                fontWeight: FontWeight.bold,
                                              )),
                                          SizedBox(height: 3),
                                          Text('${widget.pickup ?? '----'}',
                                              style: TextStyle(
                                                fontSize: 16.0,
                                                fontFamily: 'Helvetica',
                                                fontWeight: FontWeight.bold,
                                                color: Color.fromRGBO(
                                                    121, 121, 124, 1),
                                              )),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 90,
                                        child: VerticalDivider(
                                          color: Colors.black,
                                          thickness: 1,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        'assets/path 1514.png',
                                        width: 15,
                                        height: 15,
                                      ),
                                      SizedBox(width: 5),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Dropoff location',
                                              style: TextStyle(
                                                  fontSize: 16.0,
                                                  fontFamily: 'Helvetica',
                                                  fontWeight: FontWeight.bold)),
                                          SizedBox(height: 3),
                                          Text('${widget.dropoff ?? '----'}',
                                              style: TextStyle(
                                                  fontSize: 16.0,
                                                  fontFamily: 'Helvetica',
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromRGBO(
                                                      121, 121, 124, 1))),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 25),
                            Padding(
                              padding: const EdgeInsets.only(left: 60),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 300,
                                    child: Divider(
                                      thickness: 1,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 15),
                            Padding(
                              padding: EdgeInsets.only(left: 80),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text('User',
                                          style: TextStyle(
                                              fontSize: 19.0,
                                              fontFamily: 'Helvetica',
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromRGBO(
                                                  121, 121, 124, 1))),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CircleAvatar(
                                        radius: 18,
                                        backgroundColor: Colors.black,
                                        child: CircleAvatar(
                                          radius: 17.5,
                                          backgroundColor: Colors.white,
                                        ),
                                      ),
                                      SizedBox(width: 4),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text('${widget.user ?? '----'}',
                                              style: TextStyle(
                                                fontSize: 20.0,
                                                fontFamily: 'Helvetica',
                                              )),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Operator',
                                          style: TextStyle(
                                              fontSize: 19.0,
                                              fontFamily: 'Helvetica',
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromRGBO(
                                                  121, 121, 124, 1)))
                                    ],
                                  ),
                                  SizedBox(height: 5),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CircleAvatar(
                                        radius: 18,
                                        backgroundColor: Colors.black,
                                        child: CircleAvatar(
                                          radius: 17.5,
                                          backgroundColor: Colors.white,
                                        ),
                                      ),
                                      SizedBox(width: 4),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text('${widget.operName ?? '----'}',
                                              style: TextStyle(
                                                  fontSize: 20.0,
                                                  fontFamily: 'Helvetica')),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 10),
                        Padding(
                          padding: EdgeInsets.only(top: 2.h, bottom: 4.h),
                          child: Column(
                            children: [
                              Container(
                                height: 450,
                                child: VerticalDivider(
                                  color: Colors.black,
                                  thickness: 1,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 15),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 65),
                          child: Column(
                            children: [
                              Text("Shipment details",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: 'Helvetica',
                                      fontSize: 17,
                                      color: Colors.black)),
                              SizedBox(height: 10),
                              Padding(
                                padding: EdgeInsets.only(left: 2.w),
                                child: Container(
                                  height: 67,
                                  width: 320,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color:
                                            Color.fromRGBO(183, 183, 183, 1)),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                    color: Colors.white,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 4, left: 20),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text('Mode',
                                                    style: TextStyle(
                                                        fontSize: 15.0,
                                                        fontFamily: 'Helvetica',
                                                        color: Color.fromRGBO(
                                                                16, 3, 3, 1)
                                                            .withOpacity(0.3))),
                                              ],
                                            ),
                                            SizedBox(height: 5),
                                            Row(
                                              children: [
                                                Text(
                                                    '${widget.truck ?? '----'}',
                                                    style: TextStyle(
                                                        fontSize: 18.0,
                                                        fontFamily: 'Helvetica',
                                                        color: Colors.black)),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 10),
                                        child: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/Group 844.png'),
                                          radius: 25,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              Padding(
                                padding: EdgeInsets.only(left: 2.w),
                                child: Container(
                                  height: 67,
                                  width: 320,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color:
                                            Color.fromRGBO(183, 183, 183, 1)),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                    color: Colors.white,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20, top: 4),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text('Load',
                                                    style: TextStyle(
                                                        fontSize: 15.0,
                                                        fontFamily: 'Helvetica',
                                                        color: Color.fromRGBO(
                                                                16, 3, 3, 1)
                                                            .withOpacity(0.3))),
                                              ],
                                            ),
                                            SizedBox(height: 5),
                                            Row(
                                              children: [
                                                Text('${widget.load ?? '----'}',
                                                    style: TextStyle(
                                                        fontSize: 18.0,
                                                        fontFamily: 'Helvetica',
                                                        color: Colors.black)),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 10),
                                        child: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/Group 2242.png'),
                                          radius: 25,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              Padding(
                                padding: EdgeInsets.only(left: 2.w),
                                child: Container(
                                  height: 67,
                                  width: 320,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color:
                                            Color.fromRGBO(183, 183, 183, 1)),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                    color: Colors.white,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 4, left: 20),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text('Distance',
                                                    style: TextStyle(
                                                        fontSize: 15.0,
                                                        fontFamily: 'Helvetica',
                                                        color: Color.fromRGBO(
                                                            16, 3, 3, 1)
                                                          ..withOpacity(0.3))),
                                              ],
                                            ),
                                            SizedBox(height: 5),
                                            Row(
                                              children: [
                                                Text('50km',
                                                    style: TextStyle(
                                                        fontSize: 18.0,
                                                        fontFamily: 'Helvetica',
                                                        color: Colors.black)),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 10),
                                        child: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/Group 2243.png'),
                                          radius: 25,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              Padding(
                                padding: EdgeInsets.only(left: 2.w),
                                child: Container(
                                  height: 67,
                                  width: 320,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color:
                                            Color.fromRGBO(183, 183, 183, 1)),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                    color: Colors.white,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text('Additional',
                                                    style: TextStyle(
                                                        fontSize: 15.0,
                                                        fontFamily: 'Helvetica',
                                                        color: Color.fromRGBO(
                                                            16, 3, 3, 1)
                                                          ..withOpacity(0.3))),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text('Labour',
                                                    style: TextStyle(
                                                        fontSize: 15.0,
                                                        fontFamily: 'Helvetica',
                                                        color: Color.fromRGBO(
                                                                16, 3, 3, 1)
                                                            .withOpacity(0.3))),
                                              ],
                                            ),
                                            SizedBox(height: 2),
                                            Row(
                                              children: [
                                                Text(
                                                    '${widget.labour ?? '----'}',
                                                    style: TextStyle(
                                                        fontSize: 15.0,
                                                        fontFamily: 'Helvetica',
                                                        color: Colors.black)),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 10),
                                        child: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/Group 2244.png'),
                                          radius: 25,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              Padding(
                                padding: EdgeInsets.only(left: 2.w),
                                child: Container(
                                  height: 67,
                                  width: 320,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color:
                                            Color.fromRGBO(183, 183, 183, 1)),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                    color: Colors.white,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 4, left: 20),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text('value of the product',
                                                    style: TextStyle(
                                                        fontSize: 15.0,
                                                        fontFamily: 'Helvetica',
                                                        color: Color.fromRGBO(
                                                                16, 3, 3, 1)
                                                            .withOpacity(0.3))),
                                              ],
                                            ),
                                            SizedBox(height: 5),
                                            Row(
                                              children: [
                                                Text(
                                                    '${widget.productValue ?? '----'}',
                                                    style: TextStyle(
                                                        fontSize: 18.0,
                                                        fontFamily: 'Helvetica',
                                                        color: Colors.black)),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 10),
                                        child: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/Group 2250.png'),
                                          radius: 25,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 30),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 65),
                          child: Column(
                            children: [
                              Text("Quote Price",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: 'Helvetica',
                                      fontSize: 17,
                                      color: Colors.black)),
                              SizedBox(height: 10),
                              Container(
                                height: 370,
                                width: 290,
                                padding: EdgeInsets.only(
                                  left: 1.w,
                                  right: 1.w,
                                  top: 7.h,
                                  bottom: 2.h,
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Color.fromRGBO(183, 183, 183, 1)),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                  color: Colors.white,
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          children: [
                                            Text('Unit Fare :',
                                                style: TextStyle(
                                                  fontSize: 16.0,
                                                  fontFamily: 'Helvetica',
                                                  color: Colors.black,
                                                ))
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Container(
                                              width:
                                                  110, // Set the desired width
                                              height:
                                                  23, // Set the desired height
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: Colors
                                                      .black, // Set the border color here
                                                  width:
                                                      1.0, // Set the border width here
                                                ),
                                              ),
                                              child: TextField(
                                                decoration: InputDecoration(
                                                  hintText:
                                                      '', // Add any hint text if needed
                                                  border: InputBorder
                                                      .none, // Remove the border from the TextField itself
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          children: [
                                            Text('Additional Labour :',
                                                style: TextStyle(
                                                  fontSize: 16.0,
                                                  fontFamily: 'Helvetica',
                                                  color: Colors.black,
                                                ))
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Container(
                                              width:
                                                  110, // Set the desired width
                                              height:
                                                  23, // Set the desired height
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: Colors
                                                      .black, // Set the border color here
                                                  width:
                                                      1.0, // Set the border width here
                                                ),
                                              ),
                                              child: TextField(
                                                decoration: InputDecoration(
                                                  hintText:
                                                      '', // Add any hint text if needed
                                                  border: InputBorder
                                                      .none, // Remove the border from the TextField itself
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          children: [
                                            Text('Service Charge :',
                                                style: TextStyle(
                                                  fontSize: 16.0,
                                                  fontFamily: 'Helvetica',
                                                  color: Colors.black,
                                                )),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Text('XXXXX',
                                                style: TextStyle(
                                                  fontSize: 16.0,
                                                  fontFamily: 'Helvetica',
                                                  color: Colors.black,
                                                )),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 140),
                                    Padding(
                                      padding: EdgeInsets.only(left: 2.h),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            children: [
                                              Text('Total ',
                                                  style: TextStyle(
                                                      fontSize: 16.0,
                                                      fontFamily: 'Helvetica',
                                                      color: Color.fromRGBO(
                                                          124, 7, 145, 1))),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Text('XXXXX SAR',
                                                  style: TextStyle(
                                                      fontSize: 22.0,
                                                      fontFamily: 'Helvetica',
                                                      color: Color.fromRGBO(
                                                          124, 7, 145, 1))),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 33.h, bottom: 1.7.w),
                      child: Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              // Add your action for the first button
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromRGBO(99, 194, 109, 1),
                              foregroundColor: Colors.white,
                              minimumSize: Size(230, 55), // Set desired size
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text('Send Quote',
                                style: TextStyle(
                                    fontSize: 22.0, fontFamily: 'Helvetica')),
                          ),
                          SizedBox(width: 80),
                          ElevatedButton(
                            onPressed: () {
                              // Add your action for the second button
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromRGBO(227, 22, 22, 1),
                              foregroundColor: Colors.white,
                              minimumSize: Size(230, 55), // Set desired size
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text('Decline Booking',
                                style: TextStyle(
                                  fontSize: 22.0,
                                )),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
          return Container();
        }
      });
    });
  }
}
