import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/Widgets/formText.dart';
import 'package:sizer/sizer.dart';

class newContracts extends StatefulWidget {
  newContracts();
  @override
  State<newContracts> createState() => _PaymentsState();
}

class _PaymentsState extends State<newContracts> {
  String selectedValue1 = 'Option A';
  String selectedValue2 = 'Option B';
  String selectedValue3 = 'Option C';
  String? selectedCity;
  String? selectedType;
  String? selectedOption;
  List<String> cities = ['City 1', 'City 2', 'City 3', 'City 4'];

  final ScrollController _paymentScroll = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return LayoutBuilder(
          builder: (BuildContext ctx, BoxConstraints constraints) {
        if (constraints.maxWidth >= 850) {
          return Container(
            height: 67.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Color.fromRGBO(255, 255, 255, 0.925),
            ),
            // padding: EdgeInsets.fromLTRB(3.w, 3.h, 3.w, 3.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 1250,
                  height: 92,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(106, 102, 209, 1),
                    border: Border.all(
                      width: 1.0,
                      color: Color.fromRGBO(106, 102, 209, 1),
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 60, top: 25),
                    child: Text(
                      "New Contracts",
                      style: TextStyle(
                          fontFamily: "Helvetica",
                          fontSize: 30,
                          color: Colors.white),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(0),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      Container(
                        height: 340,
                        width: 1000,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40.0),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(
                                  0.5), // Adjust the shadow color and opacity
                              blurRadius:
                                  5.0, // Adjust the blur radius for a more visible shadow
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 48),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "Mode",
                                  ),
                                  Text(
                                    "From",
                                  ),
                                  Text(
                                    "To",
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 30),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  height: 45,
                                  width: 160,
                                  child: DropdownButtonFormField(
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.all(5.0),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15)),
                                      ),
                                    ),
                                    value: selectedCity,
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        selectedCity = newValue;
                                      });
                                    },
                                    items: cities.map<DropdownMenuItem<String>>(
                                        (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                  ),
                                ),
                                SizedBox(
                                  height: 45,
                                  width: 160,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      hintStyle: TextStyle(fontSize: 16),
                                      hintText: 'DD/MM/YYYY',
                                      contentPadding: EdgeInsets.all(5.0),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15)),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 45,
                                  width: 160,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      hintStyle: TextStyle(fontSize: 16),
                                      hintText: 'DD/MM/YYYY',
                                      contentPadding: EdgeInsets.all(5.0),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15)),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 50, left: 20),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 90,
                                        child: Text(
                                          "Mode Classification",
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      SizedBox(
                                        height: 45,
                                        width: 160,
                                        child: DropdownButtonFormField(
                                          decoration: InputDecoration(
                                            contentPadding: EdgeInsets.all(5.0),
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(15)),
                                            ),
                                          ),
                                          value: selectedCity,
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              selectedCity = newValue;
                                            });
                                          },
                                          items: cities
                                              .map<DropdownMenuItem<String>>(
                                                  (String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(value),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  Row(
                                    children: [
                                      Image.asset(
                                        'Group1827.png',
                                        width: 50,
                                        height: 90,
                                      ),
                                      SizedBox(
                                        height: 45,
                                        width: 250,
                                        child: TextFormField(
                                          decoration: InputDecoration(
                                            hintStyle: TextStyle(fontSize: 16),
                                            hintText: 'Enter your location',
                                            contentPadding: EdgeInsets.all(5.0),
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(15)),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Image.asset(
                                        'Group1826.png',
                                        width: 50,
                                        height: 90,
                                      ),
                                      SizedBox(
                                        height: 45,
                                        width: 250,
                                        child: TextFormField(
                                          decoration: InputDecoration(
                                            hintStyle: TextStyle(fontSize: 16),
                                            hintText: 'Enter your location',
                                            contentPadding: EdgeInsets.all(5.0),
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(15)),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 30),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Contract Type",
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    SizedBox(
                                      height: 45,
                                      width: 160,
                                      child: DropdownButtonFormField(
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.all(5.0),
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15)),
                                          ),
                                        ),
                                        value: selectedCity,
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            selectedCity = newValue;
                                          });
                                        },
                                        items: cities
                                            .map<DropdownMenuItem<String>>(
                                                (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      height: 45,
                                      width: 250,
                                      child: DropdownButtonFormField(
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.all(5.0),
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15)),
                                          ),
                                        ),
                                        value: selectedCity,
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            selectedCity = newValue;
                                          });
                                        },
                                        items: cities
                                            .map<DropdownMenuItem<String>>(
                                                (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      height: 45,
                                      width: 250,
                                      child: DropdownButtonFormField(
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.all(5.0),
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15)),
                                          ),
                                        ),
                                        value: selectedCity,
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            selectedCity = newValue;
                                          });
                                        },
                                        items: cities
                                            .map<DropdownMenuItem<String>>(
                                                (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        } else {
          return SingleChildScrollView(
            child: Container(
              height: 682,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Color.fromRGBO(255, 255, 255, 0.925),
              ),
              // padding: EdgeInsets.fromLTRB(3.w, 3.h, 3.w, 3.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 1250,
                    height: 92,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(75, 61, 82, 1),
                      border: Border.all(
                        width: 1.0,
                        color: Color.fromRGBO(75, 61, 82, 1),
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(0),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 120, top: 25),
                      child: Text(
                        "Contracts",
                        style: TextStyle(
                            fontFamily: "Helvetica",
                            fontSize: 30,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(0),
                        topRight: Radius.circular(0),
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    padding: EdgeInsets.fromLTRB(3.w, 3.h, 3.w, 3.h),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 50,
                              width: 160,
                              padding: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.add,
                                      size: 19,
                                    ),
                                    Text("New Contract"),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Scrollbar(
                                    controller: _paymentScroll,
                                    thumbVisibility:
                                        true, // Set to true to always show the scrollbar
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      controller: _paymentScroll,
                                      child: Container(
                                        height: 340,
                                        width: 1100,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.withOpacity(
                                                  0.5), // Adjust the shadow color and opacity
                                              blurRadius:
                                                  5.0, // Adjust the blur radius for a more visible shadow
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      });
    });
  }
}
