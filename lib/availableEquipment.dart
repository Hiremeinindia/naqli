// ignore_for_file: dead_code

import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/Controllers/allUsersFormController.dart';
import 'package:flutter_application_1/Controllers/allUsersFormController.dart';
import 'package:flutter_application_1/DialogBox/SingleTimeUser/bookingIDDialog.dart';
import 'package:flutter_application_1/Users/SingleTimeUser/bookingDetails.dart';
import 'package:flutter_application_1/Users/SingleUser/dashboard_page.dart';
import 'package:flutter_application_1/Widgets/customButton.dart';
import 'package:flutter_application_1/Widgets/customTextField.dart';
import 'package:flutter_application_1/Widgets/unitsContainer.dart';
import 'package:flutter_application_1/classes/language.dart';
import 'package:flutter_application_1/classes/language_constants.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_calendar_week/flutter_calendar_week.dart';
import 'package:sizer/sizer.dart';
import 'package:table_calendar/table_calendar.dart';
import 'Widgets/formText.dart';
import 'package:intl/intl.dart';

class AvailableEquipment extends StatefulWidget {
  final String? user;
  AvailableEquipment({
    this.user,
  });

  @override
  State<AvailableEquipment> createState() => _AvailableEquipmentState();
}

class _AvailableEquipmentState extends State<AvailableEquipment> {
  final CalendarWeekController _controller = CalendarWeekController();
  String _selectedValue = '1';
  String categoryValue = '1';
  late String bookingID;
  bool value = false;
  bool checkbox = false;
  String loadtype = '';
  int? groupValue1;
  int? groupValue = 1;
  bool checkbox1 = false;
  DateTime? _pickedDate;
  final ScrollController _Scroll1 = ScrollController();
  final ScrollController _Scroll2 = ScrollController();
  AllUsersFormController controller = AllUsersFormController();
  String dropdownValues = 'Load Type';
  late GlobalKey<CustomContainerState> _equipKey1;
  late GlobalKey<CustomContainerState> _equipKey2;
  late GlobalKey<CustomContainerState> _equipKey3;
  late GlobalKey<CustomContainerState> _equipKey4;
  String selectedTypeName1 = 'Select Type';
  String selectedTypeName2 = 'Select Type';
  String selectedTypeName3 = 'Select Type';
  String selectedTypeName4 = 'Select Type';
  int? selectedContainerIndex;
  void initState() {
    super.initState();
    bookingID = _generateBookingID();
    _equipKey1 = GlobalKey<CustomContainerState>();
    _equipKey2 = GlobalKey<CustomContainerState>();
    _equipKey3 = GlobalKey<CustomContainerState>();
    _equipKey4 = GlobalKey<CustomContainerState>();
  }

  Future<void> _showDatePicker(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2025),
    );

    if (pickedDate != null) {
      setState(() {
        _pickedDate = pickedDate;
        controller.date.text = DateFormat('dd/MM/yyyy').format(_pickedDate!);
      });
    }
  }
  // Future<void> createNewBooking(
  //   String book1,
  //   String adminUid,
  // ) async {
  //   try {
  //     FirebaseFirestore firestore = FirebaseFirestore.instance;

  //     // Reference to the user's document
  //     DocumentReference userDocRef =
  //         firestore.collection('superuser').doc(adminUid);

  //     // Reference to the subcollection 'userBooking' under the user's document
  //     CollectionReference userBookingCollectionRef =
  //         userDocRef.collection('superuserBookings');

  //     // Add document to subcollection and get the document reference
  //     DocumentReference newBookingDocRef = await userBookingCollectionRef.add({
  //       'book1': book1,
  //     });

  //     // Store the auto-generated ID
  //     String newBookingId = newBookingDocRef.id;

  //     // // Update the document with the stored ID
  //     // await newBookingDocRef.update({'id': newBookingId});

  //     print('New booking added successfully with ID: $newBookingId');
  //   } catch (error) {
  //     print('Error creating new booking: $error');
  //   }
  // }
  String _generateBookingID() {
    Random random = Random();

    String bookingID = '';
    for (int i = 0; i < 10; i++) {
      bookingID += random.nextInt(10).toString();
    }
    return bookingID;
  }

  Future<void> createNewBooking(
    String truck,
    String size,
    String load,
    String time,
    String bookingid,
    String date,
    String adminUid,
  ) async {
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;

      // Reference to the user's document
      DocumentReference userDocRef = firestore.collection('user').doc(adminUid);

      // Reference to the subcollection 'userBooking' under the user's document
      CollectionReference userBookingCollectionRef =
          userDocRef.collection('equipmentBookings');

      // Add document to subcollection and get the document reference
      DocumentReference newBookingDocRef = await userBookingCollectionRef.add({
        'truck': truck,
        'size': size,
        'load': load,
        'time': time,
        'bookingid': bookingid,
        'date': date,
      });

      // Store the auto-generated ID
      String newBookingId = newBookingDocRef.id;

      // Update the document with the stored ID
      // await newBookingDocRef.update({'id': newBookingId});

      print('New booking added successfully with ID: $newBookingId');
    } catch (error) {
      print('Error creating new booking: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return LayoutBuilder(
          builder: (BuildContext ctx, BoxConstraints constraints) {
        if (constraints.maxWidth >= 1350) {
          return Scaffold(
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(90),
                child: Material(
                  elevation: 3,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(13.w, 0, 15.w, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 12, bottom: 6),
                          child: Image.asset(
                            'naqlilogo.png',
                          ),
                        ),
                        Row(
                          children: [
                            TextButton(
                              onPressed: () {
                                // Handle the first button press
                              },
                              child: Text(
                                'User',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: "HelveticaNeueRegular",
                                  color: Color.fromRGBO(112, 112, 112, 1),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                              child: VerticalDivider(
                                color: Color.fromRGBO(206, 203, 203, 1),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                // Handle the third button press
                              },
                              child: Text(
                                'Partner',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: "HelveticaNeueRegular",
                                  color: Color.fromRGBO(206, 203, 203, 1),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            DropdownButtonHideUnderline(
                              child: DropdownButton2<Language>(
                                isExpanded: true,
                                hint: Row(
                                  children: [
                                    Text(
                                      translation(context).english,
                                      style: TabelText.helvetica11,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Expanded(child: SizedBox()),
                                    Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.black,
                                      size: 25,
                                    )
                                  ],
                                ),
                                onChanged: (Language? language) async {
                                  if (language != null) {
                                    Locale _locale =
                                        await setLocale(language.languageCode);
                                    MyApp.setLocale(context, _locale);
                                  } else {
                                    language;
                                  }
                                },
                                items: Language.languageList()
                                    .map<DropdownMenuItem<Language>>(
                                      (e) => DropdownMenuItem<Language>(
                                        value: e,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: <Widget>[
                                            Text(
                                              e.flag,
                                              style: TabelText.helvetica11,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            Text(
                                              e.langname,
                                              style: TabelText.helvetica11,
                                              overflow: TextOverflow.ellipsis,
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                    .toList(),
                                buttonStyleData: ButtonStyleData(
                                  height: 30,
                                  width: 130,
                                  padding: const EdgeInsets.only(
                                      left: 14, right: 14),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: Colors.black26,
                                    ),
                                    color: Colors.white,
                                  ),
                                ),
                                iconStyleData: const IconStyleData(
                                  icon: Icon(
                                    Icons.arrow_drop_down_sharp,
                                  ),
                                  iconSize: 25,
                                  iconEnabledColor: Colors.white,
                                  iconDisabledColor: null,
                                ),
                                dropdownStyleData: DropdownStyleData(
                                  maxHeight: 210,
                                  padding: EdgeInsets.only(
                                      left: 10, right: 10, top: 5, bottom: 15),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(color: Colors.black26),
                                    color: Colors.white,
                                  ),
                                  scrollPadding: EdgeInsets.all(5),
                                  scrollbarTheme: ScrollbarThemeData(
                                    thickness:
                                        MaterialStateProperty.all<double>(6),
                                    thumbVisibility:
                                        MaterialStateProperty.all<bool>(true),
                                  ),
                                ),
                                menuItemStyleData: const MenuItemStyleData(
                                  height: 25,
                                  padding: EdgeInsets.only(left: 14, right: 14),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              height: 40,
                              child: VerticalDivider(
                                color: Colors.black,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 5,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Hello Faizal!",
                                      style: TabelText.helvetica11),
                                  Text("Admin", style: TabelText.usertext),
                                  Text("Faizal industries",
                                      style: TabelText.usertext),
                                ],
                              ),
                            ),
                            Icon(
                              Icons.notifications,
                              color: Color.fromRGBO(106, 102, 209, 1),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              body: SingleChildScrollView(
                child: Center(
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          CarouselSlider(
                            options: CarouselOptions(
                              autoPlay: true,
                              viewportFraction: 1.0,
                              autoPlayAnimationDuration: Durations.extralong4,
                              height: 500,
                            ),
                            items: [
                              Image(
                                width: double.infinity,
                                fit: BoxFit.cover,
                                image: AssetImage('truckslide.jpg'),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 450, right: 200, top: 200),
                          ),
                          SizedBox(
                            height: 150,
                          ),
                        ],
                      ),
                      Positioned(
                        left: 19.w,
                        right: 19.w,
                        top: 3.h,
                        child: Column(
                          children: [
                            Text(
                              'Available Equipment Units',
                              style: AvailableText.helvetica30white,
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                            Scrollbar(
                              controller: _Scroll1,
                              thumbVisibility: true,
                              child: SingleChildScrollView(
                                controller: _Scroll1,
                                scrollDirection: Axis.vertical,
                                child: Card(
                                  elevation: 3,
                                  shadowColor: Colors.grey,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(31))),
                                  child: Container(
                                    padding:
                                        EdgeInsets.fromLTRB(2.w, 6.h, 2.w, 3.h),
                                    decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(25))),
                                    height: 740,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                0, 0, 1.5.w, 0),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                UnitsContainer(
                                                  unitNames: [
                                                    {
                                                      'image': 'Group4128.png',
                                                      'name': 'Excavator'
                                                    },
                                                  ],
                                                  buttonText: 'Excavator',
                                                  selectedTypeName:
                                                      selectedContainerIndex ==
                                                              1
                                                          ? controller
                                                              .selectedTypeName
                                                              .text
                                                          : 'Select Type',
                                                  buttonKey: _equipKey1,
                                                  onSelectionChanged: (value) {
                                                    setState(() {
                                                      loadtype = value;
                                                      controller
                                                          .selectedTypeName
                                                          .text = value;
                                                      selectedContainerIndex =
                                                          1;
                                                    });
                                                  },
                                                ),
                                                UnitsContainer(
                                                  unitNames: [
                                                    {
                                                      'image': 'Group3071.png',
                                                      'name': 'Back hoe'
                                                    },
                                                    {
                                                      'image': 'Group2052.png',
                                                      'name': 'Front hoe'
                                                    },
                                                    {
                                                      'image': 'Group4137.png',
                                                      'name': 'Skid steer'
                                                    },
                                                  ],
                                                  buttonText: 'Loaders',
                                                  selectedTypeName:
                                                      selectedContainerIndex ==
                                                              2
                                                          ? controller
                                                              .selectedTypeName1
                                                              .text
                                                          : 'Select Type',
                                                  buttonKey: _equipKey2,
                                                  onSelectionChanged: (value) {
                                                    setState(() {
                                                      loadtype = value;
                                                      controller
                                                          .selectedTypeName1
                                                          .text = value;
                                                      selectedContainerIndex =
                                                          2;
                                                    });
                                                  },
                                                ),
                                                UnitsContainer(
                                                  unitNames: [
                                                    {
                                                      'image': 'Group2271.png',
                                                      'name': 'Crawler crane'
                                                    },
                                                    {
                                                      'image': 'Group4240.png',
                                                      'name': 'Mobile crane'
                                                    },
                                                  ],
                                                  buttonText: 'Cranes',
                                                  selectedTypeName:
                                                      selectedContainerIndex ==
                                                              3
                                                          ? controller
                                                              .selectedTypeName2
                                                              .text
                                                          : 'Select Type',
                                                  buttonKey: _equipKey3,
                                                  onSelectionChanged: (value) {
                                                    setState(() {
                                                      loadtype = value;
                                                      controller
                                                          .selectedTypeName2
                                                          .text = value;
                                                      selectedContainerIndex =
                                                          3;
                                                    });
                                                  },
                                                ),
                                                UnitsContainer(
                                                  unitNames: [
                                                    {
                                                      'image': 'Group2270.png',
                                                      'name': 'Compactors'
                                                    },
                                                    {
                                                      'image': 'Group2236.png',
                                                      'name': 'Bulldozers'
                                                    },
                                                    {
                                                      'image': 'Group4225.png',
                                                      'name': 'Graders'
                                                    },
                                                    {
                                                      'image': 'Group2148.png',
                                                      'name': 'Dump truck'
                                                    },
                                                    {
                                                      'image': 'Group2181.png',
                                                      'name': 'Forklift'
                                                    },
                                                    {
                                                      'image': 'Group4239.png',
                                                      'name': 'Scissorlift'
                                                    },
                                                  ],
                                                  buttonText: 'Others',
                                                  selectedTypeName:
                                                      selectedContainerIndex ==
                                                              4
                                                          ? controller
                                                              .selectedTypeName3
                                                              .text
                                                          : 'Select Type',
                                                  buttonKey: _equipKey4,
                                                  onSelectionChanged: (value) {
                                                    setState(() {
                                                      loadtype = value;
                                                      controller
                                                          .selectedTypeName3
                                                          .text = value;
                                                      selectedContainerIndex =
                                                          4;
                                                    });
                                                  },
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                  children: [
                                                    Expanded(
                                                      child: Column(
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Flexible(
                                                                child:
                                                                    CustomTextfieldGrey(
                                                                  controller:
                                                                      controller
                                                                          .time,
                                                                  text: 'Time',
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            height: 15,
                                                          ),
                                                          Row(
                                                            children: [
                                                              Flexible(
                                                                child:
                                                                    CustomTextfieldGrey(
                                                                  controller:
                                                                      controller
                                                                          .size,
                                                                  text:
                                                                      'Value of the Product',
                                                                ),
                                                              ),
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 15,
                                                    ),
                                                    Expanded(
                                                      child: Column(
                                                        children: [
                                                          GestureDetector(
                                                            child: Container(
                                                              padding:
                                                                  EdgeInsets
                                                                      .fromLTRB(
                                                                          0.5.w,
                                                                          0,
                                                                          1.w,
                                                                          0),
                                                              height: 50,
                                                              decoration:
                                                                  BoxDecoration(
                                                                border: Border.all(
                                                                    color: Color
                                                                        .fromRGBO(
                                                                            183,
                                                                            183,
                                                                            183,
                                                                            1)),
                                                                color: Colors
                                                                    .white,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          8),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          8),
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          8),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          8),
                                                                ),
                                                              ),
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  IconButton(
                                                                    icon: Icon(
                                                                        Icons
                                                                            .calendar_today,
                                                                        size:
                                                                            25,
                                                                        color: Color.fromRGBO(
                                                                            183,
                                                                            183,
                                                                            183,
                                                                            1)),
                                                                    onPressed:
                                                                        () {
                                                                      _showDatePicker(
                                                                          context);
                                                                    },
                                                                  ),
                                                                  SizedBox(
                                                                    width: 10,
                                                                  ),
                                                                  VerticalDivider(
                                                                    width: 0.2,
                                                                    color: Color
                                                                        .fromRGBO(
                                                                            183,
                                                                            183,
                                                                            183,
                                                                            1),
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                        TextFormField(
                                                                      controller:
                                                                          controller
                                                                              .date,
                                                                      style: AvailableText
                                                                          .helvetica,
                                                                      readOnly:
                                                                          true,
                                                                      onTap:
                                                                          () {
                                                                        _showDatePicker(
                                                                            context);
                                                                      },
                                                                      decoration:
                                                                          InputDecoration(
                                                                        contentPadding:
                                                                            EdgeInsets.only(left: 12),
                                                                        border:
                                                                            InputBorder.none,
                                                                        hintStyle:
                                                                            AvailableText.helvetica,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 15,
                                                          ),
                                                          DropdownButtonHideUnderline(
                                                            child:
                                                                DropdownButton2<
                                                                    String>(
                                                              value: controller
                                                                      .load
                                                                      .text
                                                                      .isNotEmpty
                                                                  ? controller
                                                                      .load.text
                                                                  : 'Load Type', // Use value from the list
                                                              items: <String>[
                                                                'Trigger Bookings',
                                                                'Booking Manager',
                                                                'Contract',
                                                                'Load Type',
                                                                'None'
                                                              ].map<
                                                                  DropdownMenuItem<
                                                                      String>>((String
                                                                  value) {
                                                                return DropdownMenuItem<
                                                                    String>(
                                                                  value: value,
                                                                  child: Text(
                                                                      value,
                                                                      style: AvailableText
                                                                          .helvetica),
                                                                );
                                                              }).toList(),
                                                              onChanged: (String?
                                                                  newValue) {
                                                                setState(() {
                                                                  controller
                                                                          .load
                                                                          .text =
                                                                      newValue!; // Update value in the list
                                                                });
                                                              },
                                                              buttonStyleData:
                                                                  ButtonStyleData(
                                                                height: 50,
                                                                width: 15.w,
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        left: 9,
                                                                        right:
                                                                            5),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  border: Border.all(
                                                                      color: Color.fromRGBO(
                                                                          183,
                                                                          183,
                                                                          183,
                                                                          1)),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .only(
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            8),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            8),
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            8),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            8),
                                                                  ),
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                              ),
                                                              iconStyleData:
                                                                  const IconStyleData(
                                                                icon: Icon(
                                                                  Icons
                                                                      .arrow_drop_down_sharp,
                                                                ),
                                                                iconSize: 25,
                                                                iconEnabledColor:
                                                                    Colors
                                                                        .black,
                                                                iconDisabledColor:
                                                                    null,
                                                              ),
                                                              dropdownStyleData:
                                                                  DropdownStyleData(
                                                                elevation: 0,
                                                                maxHeight: 200,
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(3),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  border: Border.all(
                                                                      color: Color.fromRGBO(
                                                                          112,
                                                                          112,
                                                                          112,
                                                                          1)),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .only(
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            5),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            5),
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            5),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            5),
                                                                  ),
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                                scrollPadding:
                                                                    EdgeInsets
                                                                        .all(5),
                                                                scrollbarTheme:
                                                                    ScrollbarThemeData(
                                                                  thickness:
                                                                      MaterialStateProperty
                                                                          .all<double>(
                                                                              6),
                                                                  thumbVisibility:
                                                                      MaterialStateProperty.all<
                                                                              bool>(
                                                                          true),
                                                                ),
                                                              ),
                                                              menuItemStyleData:
                                                                  MenuItemStyleData(
                                                                height: 30,
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        left: 9,
                                                                        right:
                                                                            5),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                  children: [
                                                    Checkbox(
                                                      value: checkbox1,
                                                      onChanged:
                                                          (bool? newValue) {
                                                        setState(() {
                                                          checkbox1 = newValue!;
                                                          if (!checkbox1) {
                                                            groupValue =
                                                                null; // Disable all radio buttons
                                                          }
                                                        });
                                                      },
                                                    ),
                                                    Text(
                                                      'Need Additional Labour',
                                                      style: AvailableText
                                                          .helveticablack,
                                                    ),
                                                    for (int i = 1; i <= 3; i++)
                                                      Row(
                                                        children: [
                                                          Transform.scale(
                                                            scale: 0.7,
                                                            child: Radio<int?>(
                                                              splashRadius: 5,
                                                              fillColor: MaterialStateProperty
                                                                  .resolveWith(
                                                                      (states) {
                                                                if (states.contains(
                                                                    MaterialState
                                                                        .selected)) {
                                                                  return Color
                                                                      .fromRGBO(
                                                                          183,
                                                                          183,
                                                                          183,
                                                                          1);
                                                                }
                                                                return Color
                                                                    .fromRGBO(
                                                                        208,
                                                                        205,
                                                                        205,
                                                                        1);
                                                              }),
                                                              hoverColor: Color
                                                                      .fromRGBO(
                                                                          183,
                                                                          183,
                                                                          183,
                                                                          1)
                                                                  .withOpacity(
                                                                      .8),
                                                              value: i,
                                                              groupValue: checkbox1
                                                                  ? groupValue
                                                                  : null, // Enable/disable based on checkbox state
                                                              onChanged: checkbox1
                                                                  ? (int? value) {
                                                                      setState(
                                                                          () {
                                                                        groupValue =
                                                                            value;
                                                                      });
                                                                    }
                                                                  : null, // Set onChanged to null if checkbox is unchecked
                                                            ),
                                                          ),
                                                          Text(
                                                            '$i',
                                                            style: AvailableText
                                                                .helveticablack,
                                                          ),
                                                        ],
                                                      ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        VerticalDivider(
                                          color:
                                              Color.fromRGBO(183, 183, 183, 1),
                                          width: 1,
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                1.5.w, 0, 0, 0),
                                            child: Column(
                                              children: [
                                                Container(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Color.fromRGBO(
                                                              183,
                                                              183,
                                                              183,
                                                              1) // Specify the border width
                                                          ),
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(8),
                                                      )),
                                                  child: Column(
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Icon(
                                                            Icons.circle,
                                                            color: Colors.green,
                                                            size: 20,
                                                          ),
                                                          SizedBox(
                                                            width: 10,
                                                          ),
                                                          Text(
                                                            'Pick Up',
                                                            style: AvailableText
                                                                .helvetica17grey,
                                                          ),
                                                        ],
                                                      ),
                                                      Divider(
                                                          color: Color.fromRGBO(
                                                              183,
                                                              183,
                                                              183,
                                                              1)),
                                                      Row(
                                                        children: [
                                                          Icon(
                                                            Icons.circle,
                                                            color: Colors.red,
                                                            size: 20,
                                                          ),
                                                          SizedBox(
                                                            width: 10,
                                                          ),
                                                          Text(
                                                            'Drop Point A',
                                                            style: AvailableText
                                                                .helvetica17grey,
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    height: 200,
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: Color.fromRGBO(
                                                                183,
                                                                183,
                                                                183,
                                                                1) // Specify the border width
                                                            ),
                                                        color: Color.fromARGB(
                                                            69, 112, 106, 106),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                          Radius.circular(8),
                                                        )),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                SizedBox(
                                                  width: double.infinity,
                                                  height: 47,
                                                  child: CustomButton(
                                                    onPressed: () async {
                                                      try {
                                                        print(
                                                            '$selectedContainerIndex');
                                                        String truck = '';

                                                        if (controller
                                                            .selectedTypeName
                                                            .text
                                                            .isNotEmpty) {
                                                          truck = controller
                                                              .selectedTypeName
                                                              .text;
                                                        } else if (controller
                                                            .selectedTypeName1
                                                            .text
                                                            .isNotEmpty) {
                                                          truck = controller
                                                              .selectedTypeName1
                                                              .text;
                                                        } else if (controller
                                                            .selectedTypeName2
                                                            .text
                                                            .isNotEmpty) {
                                                          truck = controller
                                                              .selectedTypeName2
                                                              .text;
                                                        } else if (controller
                                                            .selectedTypeName3
                                                            .text
                                                            .isNotEmpty) {
                                                          truck = controller
                                                              .selectedTypeName3
                                                              .text;
                                                        }
                                                        String truck1 = truck;
                                                        String size = controller
                                                            .size.text;
                                                        String load = controller
                                                            .load.text;
                                                        String time = controller
                                                            .time.text;
                                                        String bookingid =
                                                            bookingID;
                                                        String date = controller
                                                            .date.text;
                                                        await createNewBooking(
                                                            truck1,
                                                            size,
                                                            load,
                                                            time,
                                                            bookingid,
                                                            date,
                                                            widget.user!);
                                                      } catch (e) {
                                                        print(
                                                            "Error creating user: $e");
                                                      }
                                                      showDialog(
                                                        barrierColor:
                                                            Color.fromRGBO(59,
                                                                    57, 57, 1)
                                                                .withOpacity(
                                                                    0.5),
                                                        context: context,
                                                        builder: (context) {
                                                          return Dialog(
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10.0),
                                                            ),
                                                            child: Container(
                                                              height: 280,
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.5,
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10.0),
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                    offset:
                                                                        Offset(
                                                                            0,
                                                                            1),
                                                                    blurRadius:
                                                                        0.1, // changes position of shadow
                                                                  ),
                                                                ],
                                                              ),
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: <Widget>[
                                                                  Container(
                                                                    height: 50,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius: BorderRadius.only(
                                                                          topLeft: Radius.circular(
                                                                              10.0),
                                                                          topRight:
                                                                              Radius.circular(10.0)),
                                                                      color: Color.fromRGBO(
                                                                          98,
                                                                          105,
                                                                          254,
                                                                          1),
                                                                    ),
                                                                    child: Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        Expanded(
                                                                          child:
                                                                              Center(
                                                                            child:
                                                                                Padding(
                                                                              padding: const EdgeInsets.only(left: 8.0),
                                                                              child: Text(
                                                                                'Booking ID ${bookingID}',
                                                                                style: DialogText.helvetica21,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        IconButton(
                                                                          padding:
                                                                              EdgeInsets.only(right: 2),
                                                                          icon:
                                                                              Icon(Icons.close),
                                                                          onPressed:
                                                                              () {
                                                                            String
                                                                                unitType =
                                                                                'Equipment';
                                                                            Navigator.push(
                                                                              context,
                                                                              MaterialPageRoute(
                                                                                  builder: (context) => SingleUserDashboardPage(
                                                                                        unitType: unitType,
                                                                                        user: widget.user,
                                                                                        bookingId: bookingID,
                                                                                      )),
                                                                            );
                                                                          },
                                                                          color:
                                                                              Colors.white, // Setting icon color
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Center(
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          230,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        borderRadius: BorderRadius.only(
                                                                            bottomLeft:
                                                                                Radius.circular(10.0),
                                                                            bottomRight: Radius.circular(10.0)),
                                                                        color: Colors
                                                                            .white,
                                                                      ),
                                                                      child:
                                                                          Center(
                                                                        child: Text(
                                                                            'Booking Generated',
                                                                            style:
                                                                                DialogText.helvetica40),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    },
                                                    text: 'Create Booking',
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ));
        } else {
          return Scaffold(
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(90),
                child: Material(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(13.w, 0, 15.w, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 12, bottom: 6),
                          child: Image.asset(
                            'naqlilogo.png',
                          ),
                        ),
                        Row(
                          children: [
                            TextButton(
                              onPressed: () {
                                // Handle the first button press
                              },
                              child: Text(
                                'User',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: "HelveticaNeueRegular",
                                  color: Color.fromRGBO(112, 112, 112, 1),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                              child: VerticalDivider(
                                thickness: 2,
                                color: Color.fromRGBO(206, 203, 203, 1),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                // Handle the third button press
                              },
                              child: Text(
                                'Partner',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: "HelveticaNeueRegular",
                                  color: Color.fromRGBO(206, 203, 203, 1),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.notifications,
                              color: Color.fromRGBO(106, 102, 209, 1),
                            ),
                            SizedBox(
                              width: 0.1.w,
                            ),
                            Text("Contact Us ",
                                style: HomepageText.helvetica16black),
                            SizedBox(
                              height: 30,
                              child: VerticalDivider(
                                color: Colors.black,
                              ),
                            ),
                            Text("Hello Customer!",
                                style: HomepageText.helvetica16black),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              body: SingleChildScrollView(
                child: Center(
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          CarouselSlider(
                            options: CarouselOptions(
                              autoPlay: true,
                              viewportFraction: 1.0,
                              autoPlayAnimationDuration: Durations.extralong4,
                              height: 500,
                            ),
                            items: [
                              Image(
                                width: double.infinity,
                                fit: BoxFit.cover,
                                image: AssetImage('truckslide.jpg'),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 450, right: 200, top: 200),
                          ),
                          SizedBox(
                            height: 150,
                          ),
                        ],
                      ),
                      Positioned(
                        left: 19.w,
                        right: 19.w,
                        top: 3.h,
                        child: Column(
                          children: [
                            Text(
                              'Available Units',
                              style: AvailableText.helvetica30white,
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                            Scrollbar(
                              controller: _Scroll1,
                              thumbVisibility: true,
                              child: SingleChildScrollView(
                                controller: _Scroll1,
                                scrollDirection: Axis.vertical,
                                child: Card(
                                  elevation: 3,
                                  shadowColor: Colors.grey,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(31))),
                                  child: Container(
                                    padding:
                                        EdgeInsets.fromLTRB(2.w, 6.h, 2.w, 3.h),
                                    decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(25))),
                                    height: 740,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                0, 0, 1.5.w, 0),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                UnitsContainer(
                                                  unitNames: [
                                                    {
                                                      'image': 'Group2181.png',
                                                      'name': 'Dump truck'
                                                    },
                                                    {
                                                      'image': 'Group2270.png',
                                                      'name': 'Forklift'
                                                    },
                                                    {
                                                      'image': 'Group2271.png',
                                                      'name': 'Scissorlift'
                                                    },
                                                  ],
                                                  buttonText: 'Excavator',
                                                  selectedTypeName: controller
                                                          .selectedTypeName1
                                                          .text
                                                          .isNotEmpty
                                                      ? controller
                                                          .selectedTypeName1
                                                          .text
                                                      : 'Select Type',
                                                  buttonKey: _equipKey1,
                                                  onSelectionChanged: (value) {
                                                    setState(() {
                                                      controller
                                                          .selectedTypeName1
                                                          .text = value;
                                                    });
                                                  },
                                                ),
                                                UnitsContainer(
                                                  unitNames: [
                                                    {
                                                      'image': 'Group2181.png',
                                                      'name': 'Dump truck'
                                                    },
                                                    {
                                                      'image': 'Group2270.png',
                                                      'name': 'Forklift'
                                                    },
                                                    {
                                                      'image': 'Group2271.png',
                                                      'name': 'Scissorlift'
                                                    },
                                                  ],
                                                  buttonText: 'Loaders',
                                                  selectedTypeName: controller
                                                          .selectedTypeName2
                                                          .text
                                                          .isNotEmpty
                                                      ? controller
                                                          .selectedTypeName2
                                                          .text
                                                      : 'Select Type',
                                                  buttonKey: _equipKey2,
                                                  onSelectionChanged: (value) {
                                                    setState(() {
                                                      controller
                                                          .selectedTypeName2
                                                          .text = value;
                                                    });
                                                  },
                                                ),
                                                UnitsContainer(
                                                  unitNames: [
                                                    {
                                                      'image': 'Group2181.png',
                                                      'name': 'Dump truck'
                                                    },
                                                    {
                                                      'image': 'Group2270.png',
                                                      'name': 'Forklift'
                                                    },
                                                    {
                                                      'image': 'Group2271.png',
                                                      'name': 'Scissorlift'
                                                    },
                                                  ],
                                                  buttonText: 'Cranes',
                                                  selectedTypeName: controller
                                                          .selectedTypeName3
                                                          .text
                                                          .isNotEmpty
                                                      ? controller
                                                          .selectedTypeName2
                                                          .text
                                                      : 'Select Type',
                                                  buttonKey: _equipKey3,
                                                  onSelectionChanged: (value) {
                                                    setState(() {
                                                      controller
                                                          .selectedTypeName3
                                                          .text = value;
                                                    });
                                                  },
                                                ),
                                                UnitsContainer(
                                                  unitNames: [
                                                    {
                                                      'image': 'Group2181.png',
                                                      'name': 'Dump truck'
                                                    },
                                                    {
                                                      'image': 'Group2270.png',
                                                      'name': 'Forklift'
                                                    },
                                                    {
                                                      'image': 'Group2271.png',
                                                      'name': 'Scissorlift'
                                                    },
                                                  ],
                                                  buttonText: 'Others',
                                                  selectedTypeName: controller
                                                          .selectedTypeName4
                                                          .text
                                                          .isNotEmpty
                                                      ? controller
                                                          .selectedTypeName4
                                                          .text
                                                      : 'Select Type',
                                                  buttonKey: _equipKey4,
                                                  onSelectionChanged: (value) {
                                                    setState(() {
                                                      controller
                                                          .selectedTypeName4
                                                          .text = value;
                                                    });
                                                  },
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                  children: [
                                                    Expanded(
                                                      child: Column(
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Flexible(
                                                                child:
                                                                    CustomTextfieldGrey(
                                                                  text: 'Time',
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            height: 15,
                                                          ),
                                                          Row(
                                                            children: [
                                                              Flexible(
                                                                child:
                                                                    CustomTextfieldGrey(
                                                                  controller:
                                                                      controller
                                                                          .size,
                                                                  text:
                                                                      'Value of the Product',
                                                                ),
                                                              ),
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 15,
                                                    ),
                                                    Expanded(
                                                      child: Column(
                                                        children: [
                                                          Container(
                                                            padding: EdgeInsets
                                                                .fromLTRB(0.5.w,
                                                                    0, 1.w, 0),
                                                            height: 50,
                                                            decoration:
                                                                BoxDecoration(
                                                              border: Border.all(
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          183,
                                                                          183,
                                                                          183,
                                                                          1)),
                                                              color:
                                                                  Colors.white,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        8),
                                                                topRight: Radius
                                                                    .circular(
                                                                        8),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        8),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            8),
                                                              ),
                                                            ),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Icon(
                                                                    Icons
                                                                        .calendar_today,
                                                                    color: Color
                                                                        .fromRGBO(
                                                                            183,
                                                                            183,
                                                                            183,
                                                                            1)),
                                                                SizedBox(
                                                                  width: 10,
                                                                ),
                                                                VerticalDivider(
                                                                  width: 0.2,
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          183,
                                                                          183,
                                                                          183,
                                                                          1),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 15,
                                                          ),
                                                          DropdownButtonHideUnderline(
                                                            child:
                                                                DropdownButton2<
                                                                    String>(
                                                              value: controller
                                                                  .load
                                                                  .text, // Use value from the list
                                                              items: <String>[
                                                                'Trigger Bookings',
                                                                'Booking Manager',
                                                                'Contract',
                                                                'Load Type',
                                                                'None'
                                                              ].map<
                                                                  DropdownMenuItem<
                                                                      String>>((String
                                                                  value) {
                                                                return DropdownMenuItem<
                                                                    String>(
                                                                  value: value,
                                                                  child: Text(
                                                                      value,
                                                                      style: AvailableText
                                                                          .helvetica),
                                                                );
                                                              }).toList(),
                                                              onChanged: (String?
                                                                  newValue) {
                                                                setState(() {
                                                                  dropdownValues =
                                                                      newValue!; // Update value in the list
                                                                });
                                                              },
                                                              buttonStyleData:
                                                                  ButtonStyleData(
                                                                height: 50,
                                                                width: 15.w,
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        left: 9,
                                                                        right:
                                                                            5),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  border: Border.all(
                                                                      color: Color.fromRGBO(
                                                                          183,
                                                                          183,
                                                                          183,
                                                                          1)),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .only(
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            8),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            8),
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            8),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            8),
                                                                  ),
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                              ),
                                                              iconStyleData:
                                                                  const IconStyleData(
                                                                icon: Icon(
                                                                  Icons
                                                                      .arrow_drop_down_sharp,
                                                                ),
                                                                iconSize: 25,
                                                                iconEnabledColor:
                                                                    Colors
                                                                        .black,
                                                                iconDisabledColor:
                                                                    null,
                                                              ),
                                                              dropdownStyleData:
                                                                  DropdownStyleData(
                                                                elevation: 0,
                                                                maxHeight: 200,
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(3),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  border: Border.all(
                                                                      color: Color.fromRGBO(
                                                                          112,
                                                                          112,
                                                                          112,
                                                                          1)),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .only(
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            5),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            5),
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            5),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            5),
                                                                  ),
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                                scrollPadding:
                                                                    EdgeInsets
                                                                        .all(5),
                                                                scrollbarTheme:
                                                                    ScrollbarThemeData(
                                                                  thickness:
                                                                      MaterialStateProperty
                                                                          .all<double>(
                                                                              6),
                                                                  thumbVisibility:
                                                                      MaterialStateProperty.all<
                                                                              bool>(
                                                                          true),
                                                                ),
                                                              ),
                                                              menuItemStyleData:
                                                                  MenuItemStyleData(
                                                                height: 30,
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        left: 9,
                                                                        right:
                                                                            5),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                  children: [
                                                    Checkbox(
                                                      value: checkbox1,
                                                      onChanged:
                                                          (bool? newValue) {
                                                        setState(() {
                                                          value = newValue!;
                                                        });
                                                      },
                                                    ),
                                                    Text(
                                                        'Need Additional Labour',
                                                        style: AvailableText
                                                            .helveticablack),
                                                    Transform.scale(
                                                      scale: 0.7,
                                                      child: Radio<int?>(
                                                          splashRadius: 5,
                                                          fillColor:
                                                              MaterialStateProperty
                                                                  .resolveWith(
                                                                      (states) {
                                                            if (states.contains(
                                                                MaterialState
                                                                    .selected)) {
                                                              return Color
                                                                  .fromRGBO(
                                                                      183,
                                                                      183,
                                                                      183,
                                                                      1);
                                                            }
                                                            return Color
                                                                .fromRGBO(
                                                                    208,
                                                                    205,
                                                                    205,
                                                                    1);
                                                          }),
                                                          hoverColor:
                                                              Color.fromRGBO(
                                                                      183,
                                                                      183,
                                                                      183,
                                                                      1)
                                                                  .withOpacity(
                                                                      .8),
                                                          value: 1,
                                                          groupValue:
                                                              groupValue,
                                                          onChanged:
                                                              (int? value) {
                                                            setState(() {
                                                              groupValue =
                                                                  value;
                                                            });
                                                          }),
                                                    ),
                                                    Text('1',
                                                        style: AvailableText
                                                            .helveticablack),
                                                    Transform.scale(
                                                      scale: 0.7,
                                                      child: Radio<int?>(
                                                          splashRadius: 5,
                                                          fillColor:
                                                              MaterialStateProperty
                                                                  .resolveWith(
                                                                      (states) {
                                                            if (states.contains(
                                                                MaterialState
                                                                    .selected)) {
                                                              return Color
                                                                  .fromRGBO(
                                                                      183,
                                                                      183,
                                                                      183,
                                                                      1);
                                                            }
                                                            return Color
                                                                .fromRGBO(
                                                                    208,
                                                                    205,
                                                                    205,
                                                                    1);
                                                          }),
                                                          hoverColor:
                                                              Color.fromRGBO(
                                                                      183,
                                                                      183,
                                                                      183,
                                                                      1)
                                                                  .withOpacity(
                                                                      .8),
                                                          value: 2,
                                                          groupValue:
                                                              groupValue,
                                                          onChanged:
                                                              (int? value) {
                                                            setState(() {
                                                              groupValue =
                                                                  value;
                                                            });
                                                          }),
                                                    ),
                                                    Text('2',
                                                        style: AvailableText
                                                            .helveticablack),
                                                    Transform.scale(
                                                      scale: 0.7,
                                                      child: Radio<int?>(
                                                          splashRadius: 5,
                                                          fillColor:
                                                              MaterialStateProperty
                                                                  .resolveWith(
                                                                      (states) {
                                                            if (states.contains(
                                                                MaterialState
                                                                    .selected)) {
                                                              return Color
                                                                  .fromRGBO(
                                                                      183,
                                                                      183,
                                                                      183,
                                                                      1);
                                                            }
                                                            return Color
                                                                .fromRGBO(
                                                                    208,
                                                                    205,
                                                                    205,
                                                                    1);
                                                          }),
                                                          hoverColor:
                                                              Color.fromRGBO(
                                                                      183,
                                                                      183,
                                                                      183,
                                                                      1)
                                                                  .withOpacity(
                                                                      .8),
                                                          value: 3,
                                                          groupValue:
                                                              groupValue,
                                                          onChanged:
                                                              (int? value) {
                                                            setState(() {
                                                              groupValue =
                                                                  value;
                                                            });
                                                          }),
                                                    ),
                                                    Text('3',
                                                        style: AvailableText
                                                            .helveticablack),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        VerticalDivider(
                                          color:
                                              Color.fromRGBO(183, 183, 183, 1),
                                          width: 1,
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                1.5.w, 0, 0, 0),
                                            child: Column(
                                              children: [
                                                Container(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Color.fromRGBO(
                                                              183,
                                                              183,
                                                              183,
                                                              1) // Specify the border width
                                                          ),
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(8),
                                                      )),
                                                  child: Column(
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Icon(
                                                            Icons.circle,
                                                            color: Colors.green,
                                                            size: 20,
                                                          ),
                                                          SizedBox(
                                                            width: 10,
                                                          ),
                                                          Text(
                                                            'Pick Up',
                                                            style: AvailableText
                                                                .helvetica17grey,
                                                          ),
                                                        ],
                                                      ),
                                                      Divider(
                                                          color: Color.fromRGBO(
                                                              183,
                                                              183,
                                                              183,
                                                              1)),
                                                      Row(
                                                        children: [
                                                          Icon(
                                                            Icons.circle,
                                                            color: Colors.red,
                                                            size: 20,
                                                          ),
                                                          SizedBox(
                                                            width: 10,
                                                          ),
                                                          Text(
                                                            'Drop Point A',
                                                            style: AvailableText
                                                                .helvetica17grey,
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    height: 200,
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: Color.fromRGBO(
                                                                183,
                                                                183,
                                                                183,
                                                                1) // Specify the border width
                                                            ),
                                                        color: Color.fromARGB(
                                                            69, 112, 106, 106),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                          Radius.circular(8),
                                                        )),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                SizedBox(
                                                  width: double.infinity,
                                                  height: 47,
                                                  child: CustomButton(
                                                    onPressed: () {
                                                      showDialog(
                                                        barrierColor:
                                                            Color.fromRGBO(59,
                                                                    57, 57, 1)
                                                                .withOpacity(
                                                                    0.5),
                                                        context: context,
                                                        builder: (context) {
                                                          return BookingIDDialog();
                                                        },
                                                      );
                                                    },
                                                    text: 'Create Booking',
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ));
        }
      });
    });
  }
}
