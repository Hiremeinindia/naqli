import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:dropdown_model_list/dropdown_model_list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/Controllers/allUsersFormController.dart';
import 'package:flutter_application_1/DialogBox/SingleTimeUser/bookingIDDialog.dart';
import 'package:flutter_application_1/Users/SingleTimeUser/bookingDetails.dart';
import 'package:flutter_application_1/Users/SingleUser/dashboard_page.dart';
import 'package:flutter_application_1/Widgets/customButton.dart';
import 'package:flutter_application_1/Widgets/customTextField.dart';
import 'package:flutter_application_1/Widgets/unitsContainer.dart';
import 'package:flutter_application_1/classes/language.dart';
import 'package:flutter_application_1/classes/language_constants.dart';
import 'package:sizer/sizer.dart';

import 'Widgets/formText.dart';
import 'main.dart';

class AvailableVehicle extends StatefulWidget {
  final String? user;

  const AvailableVehicle({this.user});

  @override
  State<AvailableVehicle> createState() => _AvailableVehicleState();
}

class _AvailableVehicleState extends State<AvailableVehicle> {
  String _selectedValue = '1';
  String categoryValue = '1';
  bool value = false;
  int? groupValue = 1;
  bool checkbox1 = false;
  final ScrollController _Scroll1 = ScrollController();
  final ScrollController _Scroll2 = ScrollController();
  GlobalKey? _buttonKey1;
  GlobalKey? _buttonKey2;
  GlobalKey? _buttonKey3;
  GlobalKey? _buttonKey4;
  GlobalKey? _buttonKey5;
  GlobalKey? _buttonKey6;
  GlobalKey? _buttonKey7;
  String selectedTypeName1 = 'Select Type';
  String selectedTypeName2 = 'Select Type';
  String selectedTypeName3 = 'Select Type';
  String selectedTypeName4 = 'Select Type';
  String selectedTypeName5 = 'Select Type';
  String selectedTypeName6 = 'Select Type';
  String selectedTypeName7 = 'Select Type';
  final List<Map<String, String>> loadList = [];

  AllUsersFormController controller = AllUsersFormController();
  void initState() {
    super.initState();
    _buttonKey1 = GlobalKey();
    _buttonKey2 = GlobalKey();
    _buttonKey3 = GlobalKey();
    _buttonKey4 = GlobalKey();
    _buttonKey5 = GlobalKey();
    _buttonKey6 = GlobalKey();
    _buttonKey7 = GlobalKey();
  }

  Future<void> createNewBooking(
    String truck,
    String load,
    String size,
    String adminUid,
  ) async {
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;

      // Reference to the user's document
      DocumentReference userDocRef = firestore.collection('user').doc(adminUid);

      // Reference to the subcollection 'userBooking' under the user's document
      CollectionReference userBookingCollectionRef =
          userDocRef.collection('userBooking');

      // Add document to subcollection and get the document reference
      DocumentReference newBookingDocRef = await userBookingCollectionRef.add({
        'load': load,
        'truck': truck,
        'size': size,
        'createdTime': Timestamp.now(),
      });

      // Store the auto-generated ID
      String newBookingId = newBookingDocRef.id;

      // Update the document with the stored ID
      await newBookingDocRef.update({'id': newBookingId});

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
                        top: 2.h,
                        child: Column(
                          children: [
                            Text(
                              'Available Vehicle Units',
                              style: AvailableText.helvetica30white,
                            ),
                            SizedBox(
                              height: 2.h,
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
                                                      'image': 'img24.png',
                                                      'name': 'Short Sides'
                                                    },
                                                    {
                                                      'image': 'img25.png',
                                                      'name': 'Curtain'
                                                    },
                                                    {
                                                      'image': 'img26.png',
                                                      'name': 'Refrigerator'
                                                    },
                                                    {
                                                      'image': 'img28.png',
                                                      'name': 'Flatbed'
                                                    },
                                                    {
                                                      'image': 'img29.png',
                                                      'name': 'High Sides '
                                                    },
                                                    {
                                                      'image': 'img30.png',
                                                      'name': 'Freezer'
                                                    },
                                                  ],
                                                  buttonText: 'Tralia',
                                                  selectedTypeName: controller
                                                      .selectedTypeName1.text,
                                                  buttonKey: _buttonKey1!,
                                                ),
                                                UnitsContainer(
                                                  unitNames: [
                                                    {
                                                      'image': 'img5.png',
                                                      'name': 'Sides'
                                                    },
                                                    {
                                                      'image': 'img6.png',
                                                      'name': 'Refrigerator'
                                                    },
                                                  ],
                                                  buttonText: 'Six',
                                                  selectedTypeName: controller
                                                      .selectedTypeName2.text,
                                                  buttonKey: _buttonKey2!,
                                                ),
                                                UnitsContainer(
                                                  unitNames: [
                                                    {
                                                      'image': 'img7.png',
                                                      'name': 'Sides'
                                                    },
                                                  ],
                                                  buttonText: 'Lorry 7 Metres',
                                                  selectedTypeName: controller
                                                      .selectedTypeName3.text,
                                                  buttonKey: _buttonKey3!,
                                                ),
                                                UnitsContainer(
                                                  unitNames: [
                                                    {
                                                      'image': 'img10.png',
                                                      'name': 'Sides'
                                                    },
                                                    {
                                                      'image': 'img11.png',
                                                      'name': 'Closed'
                                                    },
                                                    {
                                                      'image': 'img12.png',
                                                      'name': 'Referigerator'
                                                    },
                                                    {
                                                      'image': 'img13.png',
                                                      'name': 'Crane 5 TON'
                                                    },
                                                    {
                                                      'image': 'img14.png',
                                                      'name': 'Crane 7 TON'
                                                    },
                                                    {
                                                      'image': 'img15.png',
                                                      'name': 'Freezer'
                                                    },
                                                  ],
                                                  buttonText: 'Lorry',
                                                  selectedTypeName: controller
                                                      .selectedTypeName4.text,
                                                  buttonKey: _buttonKey4!,
                                                ),
                                                UnitsContainer(
                                                  unitNames: [
                                                    {
                                                      'image': 'img16.png',
                                                      'name': 'Closed'
                                                    },
                                                    {
                                                      'image': 'img17.png',
                                                      'name': 'Crane'
                                                    },
                                                    {
                                                      'image': 'img18.png',
                                                      'name': 'Referigerator'
                                                    },
                                                    {
                                                      'image': 'img19.png',
                                                      'name': 'Sides'
                                                    },
                                                    {
                                                      'image': 'img20.png',
                                                      'name': 'Freezer'
                                                    },
                                                  ],
                                                  buttonText: 'Diana',
                                                  selectedTypeName: controller
                                                      .selectedTypeName5.text,
                                                  buttonKey: _buttonKey5!,
                                                ),
                                                UnitsContainer(
                                                  unitNames: [
                                                    {
                                                      'image': 'img21.png',
                                                      'name': 'Pickup'
                                                    },
                                                  ],
                                                  buttonText: 'Pick Up',
                                                  selectedTypeName: controller
                                                      .selectedTypeName6.text,
                                                  buttonKey: _buttonKey6!,
                                                ),
                                                UnitsContainer(
                                                  unitNames: [
                                                    {
                                                      'image': 'img22.png',
                                                      'name': 'Regular'
                                                    },
                                                    {
                                                      'image': 'img23.png',
                                                      'name': 'Hydraulic'
                                                    },
                                                  ],
                                                  buttonText: 'Tow Truck',
                                                  selectedTypeName: controller
                                                      .selectedTypeName7.text,
                                                  buttonKey: _buttonKey7!,
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
                                                                      .text
                                                                      .isNotEmpty
                                                                  ? controller
                                                                      .load.text
                                                                  : 'Load Type', // Use value from the list
                                                              items: <String>[
                                                                'Food Items',
                                                                'Electronics',
                                                                'Woods',
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
                                                    onPressed: () async {
                                                      try {
                                                        String truck =
                                                            controller
                                                                .truck.text;
                                                        String size = controller
                                                            .size.text;
                                                        String load = controller
                                                            .load.text;

                                                        // Call functions to create documents in collection and subcollection
                                                        await createNewBooking(
                                                            truck,
                                                            size,
                                                            load,
                                                            widget.user!);
                                                      } catch (e) {
                                                        print(
                                                            "Error creating user: $e");
                                                      }
                                                      // showDialog(
                                                      //   barrierColor:
                                                      //       Color.fromRGBO(59,
                                                      //               57, 57, 1)
                                                      //           .withOpacity(
                                                      //               0.5),
                                                      //   context: context,
                                                      //   builder: (context) {
                                                      //     return BookingIDDialog();
                                                      //   },
                                                      // );
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                SingleUserDashboardPage(
                                                                  user: widget
                                                                      .user,
                                                                )),
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
              // drawer: Drawer(
              //   child: ListView(
              //       padding: EdgeInsets.only(
              //         top: 3.h,
              //       ),
              //       children: <Widget>[
              //         Container(
              //           decoration: BoxDecoration(
              //             color: Colors.white,
              //             borderRadius: BorderRadius.circular(12.0),
              //           ),
              //           child: ClipRRect(
              //             borderRadius: BorderRadius.circular(
              //                 30.0), // Adjust the radius as needed
              //             child: Image.asset(
              //               'Circleavatar.png',
              //               width: 550, // Adjust the height as needed
              //               fit: BoxFit.cover,
              //             ),
              //           ),
              //         ),
              //         SizedBox(
              //           height: 2.h,
              //         ),
              //         ListTile(
              //             hoverColor: Colors.indigo.shade100,
              //             title: Text(
              //               'Booking',
              //               style: TextStyle(color: Colors.black),
              //             ),
              //             onTap: () {
              //               setState(() {
              //                 _currentContent = Bookings();
              //               });
              //               Navigator.pop(context);
              //             }),
              //         SizedBox(
              //           height: 2.h,
              //         ),
              //         ListTile(
              //             hoverColor: Colors.indigo.shade100,
              //             title: Text(
              //               'Booking History',
              //               style: TextStyle(color: Colors.black),
              //             ),
              //             onTap: () {
              //               setState(() {
              //                 _currentContent = BookingHistroy();
              //               });
              //               Navigator.pop(context);
              //             }),
              //         SizedBox(
              //           height: 2.h,
              //         ),
              //         ListTile(
              //             hoverColor: Colors.indigo.shade100,
              //             title: Text(
              //               'Payments',
              //               style: TextStyle(color: Colors.black),
              //             ),
              //             onTap: () {
              //               setState(() {
              //                 _currentContent = SingleUserPayment();
              //               });
              //               Navigator.pop(context);
              //             }),
              //         SizedBox(
              //           height: 2.h,
              //         ),
              //         ListTile(
              //             hoverColor: Colors.indigo.shade100,
              //             title: Text(
              //               'Report',
              //               style: TextStyle(color: Colors.black),
              //             ),
              //             onTap: () {
              //               setState(() {
              //                 _currentContent = SingleUserPayment();
              //               });
              //               Navigator.pop(context);
              //             }),
              //         SizedBox(
              //           height: 2.h,
              //         ),
              //         ListTile(
              //             hoverColor: Colors.indigo.shade100,
              //             title: Text(
              //               'Help',
              //               style: TextStyle(color: Colors.black),
              //             ),
              //             onTap: () {
              //               setState(() {
              //                 _currentContent = Dashboard();
              //               });
              //               Navigator.pop(context);
              //             }),
              //       ]),
              // ),
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(60),
                child: Container(
                  height: 60,
                  child: Material(
                    elevation: 3,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(2.5.w, 0, 2.5.w, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Builder(
                              builder: (context) => IconButton(
                                    onPressed: () {
                                      Scaffold.of(context).openDrawer();
                                    },
                                    icon: Icon(
                                      Icons.menu_rounded,
                                      color: Colors.indigo.shade900,
                                    ),
                                  )),
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
                                fontSize: 16,
                                fontFamily: "HelveticaNeueRegular",
                                color: Color.fromRGBO(206, 203, 203, 1),
                              ),
                            ),
                          ),
                        ],
                      ),
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
                        top: 2.h,
                        child: Column(
                          children: [
                            Text(
                              'Available Vehicle Units',
                              style: AvailableText.helvetica30white,
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Card(
                              elevation: 3,
                              shadowColor: Colors.grey,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(31))),
                              child: Expanded(
                                child: Container(
                                  height: 740,
                                  child: SingleChildScrollView(
                                    child: Container(
                                      padding: EdgeInsets.fromLTRB(
                                          4.w, 6.h, 4.w, 3.h),
                                      decoration: const BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(31))),
                                      height: 1150,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
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
                                            buttonText: 'Tralia',
                                            selectedTypeName: controller
                                                .selectedTypeName1.text,
                                            buttonKey: _buttonKey1!,
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
                                            buttonText: 'Six',
                                            selectedTypeName: controller
                                                .selectedTypeName2.text,
                                            buttonKey: _buttonKey2!,
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
                                            buttonText: 'Lorry 7 Metres',
                                            selectedTypeName: controller
                                                .selectedTypeName3.text,
                                            buttonKey: _buttonKey3!,
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
                                            buttonText: 'Lorry',
                                            selectedTypeName: controller
                                                .selectedTypeName4.text,
                                            buttonKey: _buttonKey4!,
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
                                            buttonText: 'Diana',
                                            selectedTypeName: controller
                                                .selectedTypeName5.text,
                                            buttonKey: _buttonKey5!,
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
                                            buttonText: 'Pick Up',
                                            selectedTypeName: controller
                                                .selectedTypeName6.text,
                                            buttonKey: _buttonKey6!,
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
                                            buttonText: 'Tow Truck',
                                            selectedTypeName: controller
                                                .selectedTypeName7.text,
                                            buttonKey: _buttonKey7!,
                                          ),
                                          CustomTextfieldGrey(
                                            text: 'Time',
                                          ),
                                          CustomTextfieldGrey(
                                            text: 'Value of the Product',
                                          ),
                                          Row(
                                            children: [
                                              Checkbox(
                                                value: checkbox1,
                                                onChanged: (bool? newValue) {
                                                  setState(() {
                                                    value = newValue!;
                                                  });
                                                },
                                              ),
                                              Text('Need Additional Labour',
                                                  style:
                                                      AvailableText.helvetica),
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
                                                        return Color.fromRGBO(
                                                            183, 183, 183, 1);
                                                      }
                                                      return Color.fromRGBO(
                                                          208, 205, 205, 1);
                                                    }),
                                                    hoverColor: Color.fromRGBO(
                                                            183, 183, 183, 1)
                                                        .withOpacity(.8),
                                                    value: 1,
                                                    groupValue: groupValue,
                                                    onChanged: (int? value) {
                                                      setState(() {
                                                        groupValue = value;
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
                                                        return Color.fromRGBO(
                                                            183, 183, 183, 1);
                                                      }
                                                      return Color.fromRGBO(
                                                          208, 205, 205, 1);
                                                    }),
                                                    hoverColor: Color.fromRGBO(
                                                            183, 183, 183, 1)
                                                        .withOpacity(.8),
                                                    value: 2,
                                                    groupValue: groupValue,
                                                    onChanged: (int? value) {
                                                      setState(() {
                                                        groupValue = value;
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
                                                        return Color.fromRGBO(
                                                            183, 183, 183, 1);
                                                      }
                                                      return Color.fromRGBO(
                                                          208, 205, 205, 1);
                                                    }),
                                                    hoverColor: Color.fromRGBO(
                                                            183, 183, 183, 1)
                                                        .withOpacity(.8),
                                                    value: 3,
                                                    groupValue: groupValue,
                                                    onChanged: (int? value) {
                                                      setState(() {
                                                        groupValue = value;
                                                      });
                                                    }),
                                              ),
                                              Text('3',
                                                  style: AvailableText
                                                      .helveticablack),
                                            ],
                                          ),
                                          Container(
                                            padding: const EdgeInsets.all(8.0),
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Color.fromRGBO(
                                                        183,
                                                        183,
                                                        183,
                                                        1) // Specify the border width
                                                    ),
                                                color: Colors.white,
                                                borderRadius: BorderRadius.all(
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
                                                        183, 183, 183, 1)),
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
                                          Container(
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
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(8),
                                                )),
                                          ),
                                          SizedBox(
                                            width: double.infinity,
                                            height: 47,
                                            child: CustomButton(
                                              onPressed: () {
                                                showDialog(
                                                  barrierColor: Color.fromRGBO(
                                                          59, 57, 57, 1)
                                                      .withOpacity(0.5),
                                                  context: context,
                                                  builder: (context) {
                                                    return BookingIDDialog();
                                                  },
                                                );
                                              },
                                              text: 'Create Booking',
                                            ),
                                          ),
                                        ],
                                      ),
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
