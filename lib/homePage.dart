// ignore_for_file: dead_code

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/classes/language.dart';
import 'package:flutter_application_1/classes/language_constants.dart';
import 'package:flutter_application_1/main.dart';
import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';
import 'package:sizer/sizer.dart';

import 'Widgets/formText.dart';
import 'loginPage.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _selectedValue = '1';
  String categoryValue = '1';
  String dropdownValues = 'None';
  final ScrollController _Scroll = ScrollController();
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return LayoutBuilder(
          builder: (BuildContext ctx, BoxConstraints constraints) {
        if (constraints.maxWidth >= 680) {
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            DropdownButtonHideUnderline(
                              child: DropdownButton2<Language>(
                                hint: Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Row(
                                    children: [
                                      Text(
                                        translation(context).english,
                                        style: TabelText.helvetica11,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Icon(
                                        Icons.arrow_drop_down,
                                        color: Colors.black,
                                        size: 25,
                                      )
                                    ],
                                  ),
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
                                        child: Text(
                                          e.langname,
                                          style: TabelText.helvetica11,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        //  Row(
                                        //   mainAxisAlignment:
                                        //       MainAxisAlignment.spaceAround,
                                        //   children: <Widget>[
                                        //     Text(
                                        //       e.flag,
                                        //       style: TabelText.helvetica11,
                                        //       overflow: TextOverflow.ellipsis,
                                        //     ),
                                        //     Text(
                                        //       e.langname,
                                        //       style: TabelText.helvetica11,
                                        //       overflow: TextOverflow.ellipsis,
                                        //     )
                                        //   ],
                                        // ),
                                      ),
                                    )
                                    .toList(),
                                buttonStyleData: ButtonStyleData(
                                  height: 25,
                                  width: 103,
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
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              onTap: () {
                                showDialog(
                                  barrierColor: Colors.grey.withOpacity(0.5),
                                  context: context,
                                  builder: (context) {
                                    return LoginPage();
                                  },
                                );
                              },
                              child: Text('Log in', style: TabelText.helvetica),
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          Column(
                            children: [
                              CarouselSlider(
                                options: CarouselOptions(
                                  autoPlay: true,
                                  viewportFraction: 1.0,
                                  autoPlayAnimationDuration:
                                      Durations.extralong4,
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
                                height: 20,
                              ),
                            ],
                          ),
                          Positioned(
                            top: 310,
                            left: 14.w,
                            right: 14.w,
                            child: Card(
                              elevation: 4,
                              shadowColor: Color.fromRGBO(216, 216, 216, 1)
                                  .withOpacity(0.5),
                              child: Container(
                                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                width: 1250,
                                height: 350,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Color.fromRGBO(112, 112, 112, 1)
                                          .withOpacity(0.1)),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Column(
                                  // Use ListView instead of Column
                                  children: [
                                    SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        // Location text
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.black,
                                                width: 1.0),
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                          child: Row(
                                            children: [
                                              Icon(Icons.location_on_outlined),
                                              SizedBox(width: 5),
                                              Container(
                                                height: 30,
                                                width: 1,
                                                color: Colors.black,
                                              ),
                                              SizedBox(width: 5),
                                              // SizedBox(
                                              //   height: 200,
                                              //   width: 200,
                                              //   child: OpenStreetMapSearchAndPick(
                                              //       buttonColor: Colors.blue,
                                              //       buttonText:
                                              //           'Set Current Location',
                                              //       onPicked: (pickedData) {}),
                                              // )
                                              // Replace the below DropdownButton with your actual dropdown widget
                                              DropdownButtonHideUnderline(
                                                child: DropdownButton<String>(
                                                  value: 'Location',
                                                  onChanged:
                                                      (String? newValue) {
                                                    // Handle dropdown value change
                                                  },
                                                  items: <String>[
                                                    'Location',
                                                    'Location1',
                                                    'Location2'
                                                  ].map<
                                                      DropdownMenuItem<String>>(
                                                    (String value) {
                                                      return DropdownMenuItem<
                                                          String>(
                                                        value: value,
                                                        child: Text(
                                                          value,
                                                          style: HomepageText
                                                              .helvetica16black,
                                                        ),
                                                      );
                                                    },
                                                  ).toList(),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Scrollbar(
                                      controller: _Scroll,
                                      thumbVisibility:
                                          true, // Set to true to always show the scrollbar
                                      child: SingleChildScrollView(
                                        controller: _Scroll,
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Card(
                                              elevation: 5.5,
                                              shadowColor: Color.fromRGBO(
                                                      216, 216, 216, 1)
                                                  .withOpacity(0.6),
                                              child: Container(
                                                width: 200,
                                                height: 200,
                                                decoration: BoxDecoration(
                                                  color: Color.fromRGBO(
                                                      247, 246, 255, 1),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Image.asset(
                                                        'Group68.png',
                                                        width: 150,
                                                        height: 139,
                                                      ),
                                                      Divider(
                                                        color: Colors.black,
                                                      ),
                                                      SizedBox(height: 2),
                                                      Text('Vehicle',
                                                          style: HomepageText
                                                              .helvetica16black),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 15,
                                            ),
                                            Card(
                                              elevation: 5.5,
                                              shadowColor: Color.fromRGBO(
                                                      216, 216, 216, 1)
                                                  .withOpacity(0.6),
                                              child: Container(
                                                width: 200,
                                                height: 200,
                                                decoration: BoxDecoration(
                                                  color: Color.fromRGBO(
                                                      247, 246, 255, 1),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Image.asset(
                                                        'bus.png',
                                                        width: 150,
                                                        height: 139,
                                                      ),
                                                      Divider(
                                                        color: Colors.black,
                                                      ),
                                                      SizedBox(height: 2),
                                                      Text(
                                                        'Bus',
                                                        style: HomepageText
                                                            .helvetica16black,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 15,
                                            ),
                                            Card(
                                              elevation: 5.5,
                                              shadowColor: Color.fromRGBO(
                                                      216, 216, 216, 1)
                                                  .withOpacity(0.6),
                                              child: Container(
                                                width: 200,
                                                height: 200,
                                                decoration: BoxDecoration(
                                                  color: Color.fromRGBO(
                                                      247, 246, 255, 1),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Image.asset(
                                                        'Group1496.png',
                                                        width: 150,
                                                        height: 139,
                                                      ),
                                                      Divider(
                                                        color: Colors.black,
                                                      ),
                                                      SizedBox(height: 2),
                                                      Text(
                                                        'Equipment-2',
                                                        style: HomepageText
                                                            .helvetica16black,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 15,
                                            ),
                                            Card(
                                              elevation: 5.5,
                                              shadowColor: Color.fromRGBO(
                                                      216, 216, 216, 1)
                                                  .withOpacity(0.6),
                                              child: Container(
                                                width: 200,
                                                height: 200,
                                                decoration: BoxDecoration(
                                                  color: Color.fromRGBO(
                                                      247, 246, 255, 1),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Image.asset(
                                                        'Group1660.png',
                                                        width: 150,
                                                        height: 139,
                                                      ),
                                                      Divider(
                                                        color: Colors.black,
                                                      ),
                                                      SizedBox(height: 2),
                                                      Text(
                                                        'Special',
                                                        style: HomepageText
                                                            .helvetica16black,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 15,
                                            ),
                                            Card(
                                              elevation: 5.5,
                                              shadowColor: Color.fromRGBO(
                                                      216, 216, 216, 1)
                                                  .withOpacity(0.6),
                                              child: Container(
                                                width: 200,
                                                height: 200,
                                                decoration: BoxDecoration(
                                                  color: Color.fromRGBO(
                                                      247, 246, 255, 1),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Image.asset(
                                                        'Group1716.png',
                                                        width: 150,
                                                        height: 139,
                                                      ),
                                                      Divider(
                                                        color: Colors.black,
                                                      ),
                                                      SizedBox(height: 2),
                                                      Text(
                                                        'Others',
                                                        style: HomepageText
                                                            .helvetica16black,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 15,
                                            ),
                                            Card(
                                              elevation: 5.5,
                                              shadowColor: Color.fromRGBO(
                                                      216, 216, 216, 1)
                                                  .withOpacity(0.6),
                                              child: Container(
                                                width: 200,
                                                height: 200,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),

                                                  color: Color.fromRGBO(96, 105,
                                                      255, 1), // RGB color fill
                                                ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text("Get an Estimate",
                                                          style: HomepageText
                                                              .helvetica16bold),
                                                      SizedBox(height: 20),
                                                      Image.asset(
                                                        'right-arrow.png',
                                                        width: 30,
                                                        height: 30,
                                                        color: Colors.white,
                                                      ),
                                                    ],
                                                  ),
                                                ),
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
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ));
        } else {
          return Scaffold(
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(65),
                child: Material(
                  elevation: 3,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(5.w, 0, 8.w, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        PopupMenuButton<String>(
                          icon: Icon(Icons.menu),
                          onSelected: (String value) {
                            setState(() {
                              _selectedValue = value;
                            });
                          },
                          itemBuilder: (BuildContext context) => [
                            PopupMenuItem(
                              value: '1',
                              child: Text('User', style: TabelText.tableText),
                            ),
                            PopupMenuItem(
                              value: '2',
                              child:
                                  Text('Partner', style: TabelText.tableText),
                            ),
                            PopupMenuItem(
                              value: '3',
                              child: Text("Contact Us",
                                  style: TabelText.tableText),
                            ),
                            PopupMenuItem(
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton2<Language>(
                                  hint: Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Row(
                                      children: [
                                        Text(
                                          translation(context).english,
                                          style: TabelText.helvetica11,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        Icon(
                                          Icons.arrow_drop_down,
                                          color: Colors.black,
                                          size: 25,
                                        )
                                      ],
                                    ),
                                  ),
                                  onChanged: (Language? language) async {
                                    if (language != null) {
                                      Locale _locale = await setLocale(
                                          language.languageCode);
                                      MyApp.setLocale(context, _locale);
                                    } else {
                                      language;
                                    }
                                  },
                                  items: Language.languageList()
                                      .map<DropdownMenuItem<Language>>(
                                        (e) => DropdownMenuItem<Language>(
                                          value: e,
                                          child: Text(
                                            e.langname,
                                            style: TabelText.helvetica11,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          //  Row(
                                          //   mainAxisAlignment:
                                          //       MainAxisAlignment.spaceAround,
                                          //   children: <Widget>[
                                          //     Text(
                                          //       e.flag,
                                          //       style: TabelText.helvetica11,
                                          //       overflow: TextOverflow.ellipsis,
                                          //     ),
                                          //     Text(
                                          //       e.langname,
                                          //       style: TabelText.helvetica11,
                                          //       overflow: TextOverflow.ellipsis,
                                          //     )
                                          //   ],
                                          // ),
                                        ),
                                      )
                                      .toList(),
                                  buttonStyleData: ButtonStyleData(
                                    height: 25,
                                    width: 103,
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
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        Image.asset(
                          'naqlilogo.png',
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return LoginPage();
                                  },
                                );
                              },
                              child: Text('Log in', style: TabelText.helvetica),
                            ),
                            SizedBox(
                              width: 2,
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
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Column(
                        children: [
                          CarouselSlider(
                            options: CarouselOptions(
                              height: 500,
                            ),
                            items: [
                              Container(
                                margin: EdgeInsets.all(6.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  image: DecorationImage(
                                    image: AssetImage('truckslide.jpg'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.all(6.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  image: DecorationImage(
                                    image: AssetImage('truckslide.jpg'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: 355,
                            width: 100,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                      Positioned(
                        top: 310,
                        left: 15.w,
                        right: 15.w,
                        child: Card(
                          elevation: 4,
                          shadowColor:
                              Color.fromRGBO(216, 216, 216, 1).withOpacity(0.5),
                          child: Container(
                            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                            width: 300,
                            height: 550,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Column(
                              // Use ListView instead of Column
                              children: [
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    // Location text
                                    Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.black, width: 1.0),
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      child: Row(
                                        children: [
                                          Icon(Icons.location_on_outlined),
                                          SizedBox(width: 5),
                                          Container(
                                            height: 30,
                                            width: 1,
                                            color: Colors.black,
                                          ),
                                          SizedBox(width: 5),
                                          // Replace the below DropdownButton with your actual dropdown widget
                                          DropdownButtonHideUnderline(
                                            child: DropdownButton<String>(
                                              value: 'Location',
                                              onChanged: (String? newValue) {
                                                // Handle dropdown value change
                                              },
                                              items: <String>[
                                                'Location',
                                                'Location1',
                                                'Location2'
                                              ].map<DropdownMenuItem<String>>(
                                                (String value) {
                                                  return DropdownMenuItem<
                                                      String>(
                                                    value: value,
                                                    child: Text(
                                                      value,
                                                      style: HomepageText
                                                          .helvetica16black,
                                                    ),
                                                  );
                                                },
                                              ).toList(),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  width: 300,
                                  height: 450,
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Card(
                                          elevation: 5.5,
                                          shadowColor:
                                              Color.fromRGBO(216, 216, 216, 1)
                                                  .withOpacity(0.6),
                                          child: Container(
                                            width: 200,
                                            height: 200,
                                            decoration: BoxDecoration(
                                              color: Color.fromRGBO(
                                                  247, 246, 255, 1),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Image.asset(
                                                    'Group68.png',
                                                    width: 150,
                                                    height: 139,
                                                  ),
                                                  Divider(
                                                    color: Colors.black,
                                                  ),
                                                  SizedBox(height: 2),
                                                  Text('Vehicle',
                                                      style: HomepageText
                                                          .helvetica16black),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Card(
                                          elevation: 5.5,
                                          shadowColor:
                                              Color.fromRGBO(216, 216, 216, 1)
                                                  .withOpacity(0.6),
                                          child: Container(
                                            width: 200,
                                            height: 200,
                                            decoration: BoxDecoration(
                                              color: Color.fromRGBO(
                                                  247, 246, 255, 1),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Image.asset(
                                                    'bus.png',
                                                    width: 150,
                                                    height: 139,
                                                  ),
                                                  Divider(
                                                    color: Colors.black,
                                                  ),
                                                  SizedBox(height: 2),
                                                  Text('Bus',
                                                      style: HomepageText
                                                          .helvetica16black),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Card(
                                          elevation: 5.5,
                                          shadowColor:
                                              Color.fromRGBO(216, 216, 216, 1)
                                                  .withOpacity(0.6),
                                          child: Container(
                                            width: 200,
                                            height: 200,
                                            decoration: BoxDecoration(
                                              color: Color.fromRGBO(
                                                  247, 246, 255, 1),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Image.asset(
                                                    'Group1496.png',
                                                    width: 150,
                                                    height: 139,
                                                  ),
                                                  Divider(
                                                    color: Colors.black,
                                                  ),
                                                  SizedBox(height: 2),
                                                  Text('Equipment-2',
                                                      style: HomepageText
                                                          .helvetica16black),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Card(
                                          elevation: 5.5,
                                          shadowColor:
                                              Color.fromRGBO(216, 216, 216, 1)
                                                  .withOpacity(0.6),
                                          child: Container(
                                            width: 200,
                                            height: 200,
                                            decoration: BoxDecoration(
                                              color: Color.fromRGBO(
                                                  247, 246, 255, 1),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Image.asset(
                                                    'Group1660.png',
                                                    width: 150,
                                                    height: 139,
                                                  ),
                                                  Divider(
                                                    color: Colors.black,
                                                  ),
                                                  SizedBox(height: 2),
                                                  Text('Special',
                                                      style: HomepageText
                                                          .helvetica16black),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Card(
                                          elevation: 5.5,
                                          shadowColor:
                                              Color.fromRGBO(216, 216, 216, 1)
                                                  .withOpacity(0.6),
                                          child: Container(
                                            width: 200,
                                            height: 200,
                                            decoration: BoxDecoration(
                                              color: Color.fromRGBO(
                                                  247, 246, 255, 1),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Image.asset(
                                                    'Group1716.png',
                                                    width: 150,
                                                    height: 139,
                                                  ),
                                                  Divider(
                                                    color: Colors.black,
                                                  ),
                                                  SizedBox(height: 2),
                                                  Text('Others',
                                                      style: HomepageText
                                                          .helvetica16black),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Card(
                                          elevation: 5.5,
                                          shadowColor:
                                              Color.fromRGBO(216, 216, 216, 1)
                                                  .withOpacity(0.6),
                                          child: Container(
                                            width: 200,
                                            height: 200,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),

                                              color: Color.fromRGBO(96, 105,
                                                  255, 1), // RGB color fill
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text("Get an Estimate",
                                                      style: HomepageText
                                                          .helvetica16bold),
                                                  SizedBox(height: 20),
                                                  Image.asset(
                                                    'right-arrow.png',
                                                    width: 30,
                                                    height: 30,
                                                    color: Colors.white,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 15,
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
                    ],
                  ),
                ],
              ));
        }
      });
    });
  }
}
