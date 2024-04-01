import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/Widgets/customButton.dart';
import 'package:flutter_application_1/Widgets/customRadio.dart';
import 'package:flutter_application_1/Widgets/formText.dart';
import 'package:flutter_application_1/homePage.dart';
import 'package:flutter_application_1/test.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sizer/sizer.dart';

import '../../DialogBox/SingleTimeUser/bookingConfirmDialog.dart';

class Bookings extends StatefulWidget {
  Bookings();
  @override
  State<Bookings> createState() => _BookingsState();
}

class _BookingsState extends State<Bookings> {
  GoogleMapController? mapController;
  List<Marker> _markers = [];
  bool isButtonEnabled = false;
  bool isButtonEnabled1 = false;
  bool isButtonEnabled2 = false;
  bool showmaps = true;
  int? selectedRadioValue;
  int? selectedRadioValue1;
  int? selectedRadioValue2;

  final LatLng _center = const LatLng(45.521563, -122.677433);
  final ScrollController _book1Scroll = ScrollController();
  final ScrollController _book2Scroll = ScrollController();
  final ScrollController _book3Scroll = ScrollController();
  final ScrollController _scrollController = ScrollController();
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  void initState() {
    super.initState();

    if (_markers.isNotEmpty) {
      _markers.add(const Marker(
        markerId: MarkerId("Mylocation"),
        position: LatLng(59.948680, 11.010630),
      ));
      setState(() {
        showmaps = true;
      });
    }
  }

  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return LayoutBuilder(
          builder: (BuildContext ctx, BoxConstraints constraints) {
        if (constraints.maxWidth >= 950) {
          return SingleChildScrollView(
            child: Container(
              height: 680,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Color.fromRGBO(255, 255, 255, 0.925),
              ),
              padding: EdgeInsets.fromLTRB(6.w, 10.h, 4.w, 10.h),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(right: 3.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                'Group1787.png',
                                width: 62,
                                height: 61,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text("Booking Id #1345789345",
                                  style: BookingText.helvetica21),
                            ],
                          ),
                          Container(
                            height: 380,
                            width: 700,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12)),
                            child: GoogleMap(
                                onMapCreated: (controller) {
                                  setState(() {
                                    mapController = controller;
                                  });
                                },
                                markers: Set<Marker>.of(_markers),
                                mapType: MapType.normal,
                                initialCameraPosition: CameraPosition(
                                    target: LatLng(24.755562, 46.589584),
                                    zoom: 13)),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                right: 4.w, left: 4.w, top: 1.w, bottom: 2.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Text("Pick up truck",
                                        style: DialogText.helvetica25black),
                                    Text("Toyota Hilux",
                                        style: BookingText.helveticablack)
                                  ],
                                ),
                                SizedBox(
                                  height: 63,
                                  child: VerticalDivider(
                                    color: Color.fromRGBO(112, 112, 112, 1),
                                    thickness: 2,
                                  ),
                                ),
                                Column(
                                  children: [
                                    Text("Load",
                                        style: BookingText.helveticablack),
                                    Text("Woods",
                                        style: HomepageText.helvetica16black)
                                  ],
                                ),
                                SizedBox(
                                  child: Column(
                                    children: [
                                      Text("Size",
                                          style: BookingText.helveticablack),
                                      Text(" 1 to 1.5",
                                          style: HomepageText.helvetica16black)
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  VerticalDivider(
                    color: Color.fromRGBO(204, 195, 195, 1),
                    thickness: 1,
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(3.w, 8.h, 0, 8.h),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomRadio1(
                            onChanged: (val) {
                              setState(() {
                                selectedRadioValue =
                                    val; // Unselect if already selected
                                isButtonEnabled = true;
                              });
                            },
                            groupValue: selectedRadioValue,
                            value: 1,
                            text1: 'Vendor 1',
                            colors: Colors.white,
                            text2: "XXXX SAR",
                          ),
                          CustomRadio1(
                            onChanged: (val) {
                              setState(() {
                                selectedRadioValue =
                                    val; // Unselect if already selected
                                isButtonEnabled = true;
                              });
                            },
                            groupValue: selectedRadioValue,
                            value: 2,
                            text1: 'Vendor 2',
                            colors: Colors.white,
                            text2: "XXXX SAR",
                          ),
                          CustomRadio1(
                            onChanged: (val) {
                              setState(() {
                                selectedRadioValue =
                                    val; // Unselect if already selected
                                isButtonEnabled = true;
                              });
                            },
                            groupValue: selectedRadioValue,
                            value: 3,
                            text1: 'Vendor 3',
                            colors: Colors.white,
                            text2: "XXXX SAR",
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  showDialog(
                                    barrierColor: Colors.grey.withOpacity(0.5),
                                    context: context,
                                    builder: (context) {
                                      return Padding(
                                        padding:
                                            const EdgeInsets.only(left: 335),
                                        child: BookingConfirmationDialog(),
                                      );
                                    },
                                  );
                                },
                                child: Text("Cancel Request",
                                    style: DialogText.purplehelveticabold),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 90,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: CustomButton2(
                                  onPressed: () {},
                                  text1: 'Pay Advance: ',
                                  text2: 'XXXX',
                                ),
                              ),
                              SizedBox(
                                width: 1.w,
                              ),
                              Expanded(
                                child: CustomButton2(
                                  onPressed: () {
                                    showDialog(
                                      barrierColor:
                                          Color.fromRGBO(59, 57, 57, 1)
                                              .withOpacity(0.5),
                                      context: context,
                                      builder: (context) {
                                        return Padding(
                                          padding: const EdgeInsets.only(
                                              left: 380, top: 40),
                                          child: BookingConfirmDialog(),
                                        );
                                      },
                                    );
                                  },
                                  text1: 'Pay: ',
                                  text2: 'XXXX',
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return Container(
            height: 680,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Color.fromRGBO(255, 255, 255, 0.925),
            ),
            padding: EdgeInsets.fromLTRB(6.w, 10.h, 6.w, 10.h),
            child: Expanded(
              child: SingleChildScrollView(
                child: Container(
                  height: 900,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'Group1787.png',
                            width: 62,
                            height: 61,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text("Booking Id #1345789345",
                              style: BookingText.helvetica21),
                        ],
                      ),
                      Container(
                        height: 380,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12)),
                        child: GoogleMap(
                            onMapCreated: (controller) {
                              setState(() {
                                mapController = controller;
                              });
                            },
                            markers: Set<Marker>.of(_markers),
                            mapType: MapType.normal,
                            initialCameraPosition: CameraPosition(
                                target: LatLng(24.755562, 46.589584),
                                zoom: 13)),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text("Pick up truck",
                                  style: DialogText.helvetica25black),
                              Text("Toyota Hilux",
                                  style: BookingText.helveticablack)
                            ],
                          ),
                          SizedBox(
                            height: 63,
                            child: VerticalDivider(
                              color: Color.fromRGBO(112, 112, 112, 1),
                              thickness: 2,
                            ),
                          ),
                          Column(
                            children: [
                              Text("Load", style: BookingText.helveticablack),
                              Text("Woods",
                                  style: HomepageText.helvetica16black)
                            ],
                          ),
                          SizedBox(
                            child: Column(
                              children: [
                                Text("Size", style: BookingText.helveticablack),
                                Text(" 1 to 1.5",
                                    style: HomepageText.helvetica16black)
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomRadio1(
                        onChanged: (val) {
                          setState(() {
                            selectedRadioValue =
                                val; // Unselect if already selected
                            isButtonEnabled = true;
                          });
                        },
                        groupValue: selectedRadioValue,
                        value: 1,
                        text1: 'Vendor 1',
                        colors: Colors.white,
                        text2: "XXXX SAR",
                      ),
                      CustomRadio1(
                        onChanged: (val) {
                          setState(() {
                            selectedRadioValue =
                                val; // Unselect if already selected
                            isButtonEnabled = true;
                          });
                        },
                        groupValue: selectedRadioValue,
                        value: 2,
                        text1: 'Vendor 2',
                        colors: Colors.white,
                        text2: "XXXX SAR",
                      ),
                      CustomRadio1(
                        onChanged: (val) {
                          setState(() {
                            selectedRadioValue =
                                val; // Unselect if already selected
                            isButtonEnabled = true;
                          });
                        },
                        groupValue: selectedRadioValue,
                        value: 3,
                        text1: 'Vendor 3',
                        colors: Colors.white,
                        text2: "XXXX SAR",
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              showDialog(
                                barrierColor: Colors.grey.withOpacity(0.5),
                                context: context,
                                builder: (context) {
                                  return Padding(
                                    padding: const EdgeInsets.only(left: 335),
                                    child: BookingConfirmationDialog(),
                                  );
                                },
                              );
                            },
                            child: Text("Cancel Request",
                                style: DialogText.purplehelveticabold),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: CustomButton2(
                              onPressed: () {},
                              text1: 'Pay Advance: ',
                              text2: 'XXXX',
                            ),
                          ),
                          SizedBox(
                            width: 1.w,
                          ),
                          Expanded(
                            child: CustomButton2(
                              onPressed: () {
                                showDialog(
                                  barrierColor: Color.fromRGBO(59, 57, 57, 1)
                                      .withOpacity(0.5),
                                  context: context,
                                  builder: (context) {
                                    return Padding(
                                      padding: const EdgeInsets.only(
                                          left: 380, top: 40),
                                      child: BookingConfirmDialog(),
                                    );
                                  },
                                );
                              },
                              text1: 'Pay: ',
                              text2: 'XXXX',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
      });
    });
  }
}
