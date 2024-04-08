import 'package:flutter/material.dart';
import 'package:flutter_application_1/Widgets/formText.dart';

class Sample extends StatefulWidget {
  const Sample({Key? key}) : super(key: key);

  @override
  State<Sample> createState() => _SampleState();
}

class _SampleState extends State<Sample> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  double screenHeight = 0;
  double screenWidth = 0;
  double bottom = 0;
  bool expand = false;
  bool expand1 = false;
  bool expand2 = false;
  String selectedTypeName = 'Select Type';
  final List<Map<String, String>> unitNames = [
    {'image': 'Group1660.png', 'name': 'Compactors'},
    {'image': 'Group2052.png', 'name': 'Bulldozers'},
    {'image': 'Group2148.png', 'name': 'Graders'},
    {'image': 'Group2181.png', 'name': 'Dump truck'},
    {'image': 'Group2270.png', 'name': 'Forklift'},
    {'image': 'Group2271.png', 'name': 'Scissorlift'},
    {'image': 'Group2148.png', 'name': 'Graders'},
  ];

  Color blue = const Color(0xff8cccff);

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    bottom = MediaQuery.of(context).viewInsets.bottom;

    return WillPopScope(
      onWillPop: () {
        setState(() {
          expand = false;
        });
        return Future.value(true);
      },
      child: Scaffold(
        backgroundColor: blue,
        body: SizedBox(
          height: screenHeight,
          width: screenWidth,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.only(top: screenHeight / 8),
                  child: Column(
                    children: [
                      Text(
                        "JOIN US",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                      Text(
                        "Create an account today!",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                      Container(
                        width: 500,
                        child: Column(
                          children: [
                            Container(
                              height: 50,
                              width: 500,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Color.fromRGBO(183, 183, 183, 1)),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                                color: Colors.white,
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset(
                                    'delivery-truck.png',
                                    width: 50,
                                    height: 50,
                                  ),
                                  Text('Excavator',
                                      style: AvailableText.helvetica17black),
                                  SizedBox(
                                    height: double.infinity,
                                    child: VerticalDivider(),
                                  ),
                                  Text(
                                    selectedTypeName,
                                    style: AvailableText.helvetica,
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      Icons.arrow_drop_down,
                                      size: 25,
                                      color: Colors.black,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        expand = !expand;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Positioned(
                              top: 110, // Adjust this value as needed
                              child: expand
                                  ? Container(
                                      width: 500,
                                      height: 200,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(8),
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.5),
                                            blurRadius: 5,
                                            offset: Offset(0, 3),
                                          ),
                                        ],
                                      ),
                                      child: ListView.builder(
                                        itemCount: unitNames.length,
                                        itemBuilder: (context, index) {
                                          String image =
                                              unitNames[index]['image']!;
                                          String name =
                                              unitNames[index]['name']!;
                                          return ListTile(
                                            onTap: () {
                                              setState(() {
                                                selectedTypeName = name;
                                                expand = false;
                                              });
                                            },
                                            leading: Image.asset(
                                              image,
                                              width: 60,
                                              height: 60,
                                            ),
                                            title: Text(name),
                                          );
                                        },
                                      ),
                                    )
                                  : SizedBox(),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 500,
                        child: Column(
                          children: [
                            Container(
                              height: 50,
                              width: 500,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Color.fromRGBO(183, 183, 183, 1)),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                                color: Colors.white,
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset(
                                    'delivery-truck.png',
                                    width: 50,
                                    height: 50,
                                  ),
                                  Text('Excavator',
                                      style: AvailableText.helvetica17black),
                                  SizedBox(
                                    height: double.infinity,
                                    child: VerticalDivider(),
                                  ),
                                  Text(
                                    selectedTypeName,
                                    style: AvailableText.helvetica,
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      Icons.arrow_drop_down,
                                      size: 25,
                                      color: Colors.black,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        expand1 = !expand1;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Positioned(
                              top: 110, // Adjust this value as needed
                              child: expand1
                                  ? Container(
                                      width: 500,
                                      height: 200,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(8),
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.5),
                                            blurRadius: 5,
                                            offset: Offset(0, 3),
                                          ),
                                        ],
                                      ),
                                      child: ListView.builder(
                                        itemCount: unitNames.length,
                                        itemBuilder: (context, index) {
                                          String image =
                                              unitNames[index]['image']!;
                                          String name =
                                              unitNames[index]['name']!;
                                          return ListTile(
                                            onTap: () {
                                              setState(() {
                                                selectedTypeName = name;
                                                expand = false;
                                              });
                                            },
                                            leading: Image.asset(
                                              image,
                                              width: 60,
                                              height: 60,
                                            ),
                                            title: Text(name),
                                          );
                                        },
                                      ),
                                    )
                                  : SizedBox(),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 500,
                        child: Column(
                          children: [
                            Container(
                              height: 50,
                              width: 500,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Color.fromRGBO(183, 183, 183, 1)),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                                color: Colors.white,
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset(
                                    'delivery-truck.png',
                                    width: 50,
                                    height: 50,
                                  ),
                                  Text('Excavator',
                                      style: AvailableText.helvetica17black),
                                  SizedBox(
                                    height: double.infinity,
                                    child: VerticalDivider(),
                                  ),
                                  Text(
                                    selectedTypeName,
                                    style: AvailableText.helvetica,
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      Icons.arrow_drop_down,
                                      size: 25,
                                      color: Colors.black,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        expand2 = !expand2;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Positioned(
                              top: 110, // Adjust this value as needed
                              child: expand2
                                  ? Container(
                                      width: 500,
                                      height: 200,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(8),
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.5),
                                            blurRadius: 5,
                                            offset: Offset(0, 3),
                                          ),
                                        ],
                                      ),
                                      child: ListView.builder(
                                        itemCount: unitNames.length,
                                        itemBuilder: (context, index) {
                                          String image =
                                              unitNames[index]['image']!;
                                          String name =
                                              unitNames[index]['name']!;
                                          return ListTile(
                                            onTap: () {
                                              setState(() {
                                                selectedTypeName = name;
                                                expand = false;
                                              });
                                            },
                                            leading: Image.asset(
                                              image,
                                              width: 60,
                                              height: 60,
                                            ),
                                            title: Text(name),
                                          );
                                        },
                                      ),
                                    )
                                  : SizedBox(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
