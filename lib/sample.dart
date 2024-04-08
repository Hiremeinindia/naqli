import 'package:flutter/material.dart';
import 'package:flutter_application_1/Widgets/colorContainer.dart';
import 'package:flutter_application_1/Widgets/formText.dart';

enum Options { search, upload, copy, exit }

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
  String selectedTypeName1 = 'Select Type';
  String selectedTypeName2 = 'Select Type';
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
    var _popupMenuItemIndex = 0;
    Color _changeColorAccordingToMenuItem = Colors.red;
    var appBarHeight = AppBar().preferredSize.height;

    PopupMenuItem _buildPopupMenuItem(
        String title, IconData iconData, int position) {
      return PopupMenuItem(
        value: position,
        child: Container(
          width: 500,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(
                iconData,
                color: Colors.black,
              ),
              Text(title),
            ],
          ),
        ),
      );
    }

    _onMenuItemSelected(int value) {
      setState(() {
        _popupMenuItemIndex = value;
      });

      if (value == Options.search.index) {
        _changeColorAccordingToMenuItem = Colors.red;
      } else if (value == Options.upload.index) {
        _changeColorAccordingToMenuItem = Colors.green;
      } else if (value == Options.copy.index) {
        _changeColorAccordingToMenuItem = Colors.blue;
      } else {
        _changeColorAccordingToMenuItem = Colors.purple;
      }
    }

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
          child: Column(
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
                                    selectedTypeName1,
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
                            expand
                                ? ElevationContainer(
                                    width: 500,
                                    height: 200,
                                    child: ListView.builder(
                                      itemCount: unitNames.length,
                                      itemBuilder: (context, index) {
                                        String image =
                                            unitNames[index]['image']!;
                                        String name = unitNames[index]['name']!;
                                        return ListTile(
                                          onTap: () {
                                            setState(() {
                                              selectedTypeName1 = name;
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
                                      // setState(() {
                                      //   expand1 = !expand1;
                                      // });
                                      PopupMenuItem(
                                        child: ElevationContainer(
                                          width: 500,
                                          height: 200,
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
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            expand1
                                ? ElevationContainer(
                                    width: 500,
                                    height: 200,
                                    child: ListView.builder(
                                      itemCount: unitNames.length,
                                      itemBuilder: (context, index) {
                                        String image =
                                            unitNames[index]['image']!;
                                        String name = unitNames[index]['name']!;
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
                                    selectedTypeName2,
                                    style: AvailableText.helvetica,
                                  ),
                                  PopupMenuButton(
                                    onSelected: (value) {
                                      _onMenuItemSelected(value as int);
                                    },
                                    offset: Offset(0.0, appBarHeight),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(8.0),
                                        bottomRight: Radius.circular(8.0),
                                        topLeft: Radius.circular(8.0),
                                        topRight: Radius.circular(8.0),
                                      ),
                                    ),
                                    itemBuilder: (ctx) => [
                                      _buildPopupMenuItem('Search',
                                          Icons.search, Options.search.index),
                                      _buildPopupMenuItem('Upload',
                                          Icons.upload, Options.upload.index),
                                      _buildPopupMenuItem('Copy', Icons.copy,
                                          Options.copy.index),
                                      _buildPopupMenuItem(
                                          'Exit',
                                          Icons.exit_to_app,
                                          Options.exit.index),
                                    ],
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
                            expand2
                                ? ElevationContainer(
                                    width: 500,
                                    height: 200,
                                    child: ListView.builder(
                                      itemCount: unitNames.length,
                                      itemBuilder: (context, index) {
                                        String image =
                                            unitNames[index]['image']!;
                                        String name = unitNames[index]['name']!;
                                        return ListTile(
                                          onTap: () {
                                            setState(() {
                                              selectedTypeName2 = name;
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
                            expand1
                                ? ElevationContainer(
                                    width: 500,
                                    height: 200,
                                    child: ListView.builder(
                                      itemCount: unitNames.length,
                                      itemBuilder: (context, index) {
                                        String image =
                                            unitNames[index]['image']!;
                                        String name = unitNames[index]['name']!;
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
