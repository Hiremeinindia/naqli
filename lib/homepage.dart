import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: Padding(
          padding: const EdgeInsets.only(top: 40),
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
                    const SizedBox(
                      height: 30,
                      child: Padding(
                        padding: EdgeInsets.only(left: 15, top: 5),
                        child: Text("Contact Us"),
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
                        child: Text("Login"),
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
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 450, right: 200, top: 200),
                        child: Container(
                          height: 750,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 400,
                        padding: EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(1.0),
                          color: Color.fromARGB(
                              255, 232, 229, 240), // Set the background color
                        ),
                      ),
                      Container(
                        height: 50,
                        color: Color.fromRGBO(13, 13, 255, 1),
                      ),
                    ],
                  ),
                  Positioned(
                    top: 350,
                    left: 360,
                    child: Container(
                      child: Column(
                        children: [
                          Container(
                            width: 1200,
                            height: 350,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 232, 229, 240),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: ListView(
                              // Use ListView instead of Column
                              shrinkWrap: true,
                              children: [
                                SizedBox(height: 10),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      // Dropdown text field with location icon
                                      SizedBox(width: 10),
                                      // Vertical divider
                                      SizedBox(width: 10),
                                      // Location text
                                      Align(
                                        alignment: Alignment.topRight,
                                        child: Container(
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
                                                        child: Text(value),
                                                      );
                                                    },
                                                  ).toList(),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 30,
                                    ),
                                    Container(
                                      width: 200,
                                      height: 200,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        border: Border.all(
                                          color: Colors
                                              .black, // Change border color as needed
                                          width: 2.0, // Increase border width
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Divider(
                                              color: Colors.black,
                                            ),
                                            SizedBox(height: 2),
                                            Text('Vehicle'),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    Container(
                                      width: 200,
                                      height: 200,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        border: Border.all(
                                          color: Colors
                                              .black, // Change border color as needed
                                          width: 2.0, // Increase border width
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Divider(
                                              color: Colors.black,
                                            ),
                                            SizedBox(height: 2),
                                            Text('Bus'),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    Container(
                                      width: 200,
                                      height: 200,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        border: Border.all(
                                          color: Colors
                                              .black, // Change border color as needed
                                          width: 2.0, // Increase border width
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Divider(
                                              color: Colors.black,
                                            ),
                                            SizedBox(height: 2),
                                            Text('Equipment-2'),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    Container(
                                      width: 200,
                                      height: 200,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        border: Border.all(
                                          color: Colors
                                              .black, // Change border color as needed
                                          width: 2.0, // Increase border width
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Divider(
                                              color: Colors.black,
                                            ),
                                            SizedBox(height: 2),
                                            Text('Special'),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    Container(
                                      width: 200,
                                      height: 200,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        border: Border.all(
                                          color: Colors
                                              .black, // Change border color as needed
                                          width: 2.0, // Increase border width
                                        ),
                                        color: Color.fromRGBO(
                                            106, 102, 209, 1), // RGB color fill
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Get an Estimate",
                                              style: TextStyle(
                                                color: Colors.white,
                                                // Add other text style properties as needed
                                              ),
                                            ),
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
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Image.asset(
                                      'Rectangle.png', // Replace with your image path
                                      width: 500,
                                      height: 270,
                                      color: Colors.grey,
                                    ),
                                    SizedBox(
                                        width:
                                            40), // Adjust this space as needed
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Naqli For Individuals",
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          "Lorem_ipsum_dolor_sit_amet_consectetur_adipiscing_elit_sed_do_eiusmod\n"
                                          "tempor_incididunt_ut_labore_et_dolore_magna_aliqua.Ut_enim_ad_minim\n"
                                          "veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea\n"
                                          "commodo consequat. Duis aute irure dolor in reprehenderit in voluptate\n"
                                          "velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat\n"
                                          "cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est\n"
                                          "laborum.",
                                          style: TextStyle(
                                            fontSize: 12,
                                          ),
                                          textAlign: TextAlign.justify,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                // Repeat the above structure for other rows without unnecessary SizedBox
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Image.asset(
                                      'Rectangle.png', // Replace with your image path
                                      width: 500,
                                      height: 270,
                                      color: Colors.grey,
                                    ),
                                    SizedBox(
                                        width:
                                            40), // Adjust this space as needed
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Naqli For Business",
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          "Lorem_ipsum_dolor_sit_amet_consectetur_adipiscing_elit_sed_do_eiusmod\n"
                                          "tempor_incididunt_ut_labore_et_dolore_magna_aliqua.Ut_enim_ad_minim\n"
                                          "veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea\n"
                                          "commodo consequat. Duis aute irure dolor in reprehenderit in voluptate\n"
                                          "velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat\n"
                                          "cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est\n"
                                          "laborum.",
                                          style: TextStyle(
                                            fontSize: 12,
                                          ),
                                          textAlign: TextAlign.justify,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Image.asset(
                                      'Rectangle.png', // Replace with your image path
                                      width: 500,
                                      height: 270,
                                      color: Colors.grey,
                                    ),
                                    SizedBox(
                                        width:
                                            40), // Adjust this space as needed
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Naqli For Partner",
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          "Lorem_ipsum_dolor_sit_amet_consectetur_adipiscing_elit_sed_do_eiusmod\n"
                                          "tempor_incididunt_ut_labore_et_dolore_magna_aliqua.Ut_enim_ad_minim\n"
                                          "veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea\n"
                                          "commodo consequat. Duis aute irure dolor in reprehenderit in voluptate\n"
                                          "velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat\n"
                                          "cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est\n"
                                          "laborum.",
                                          style: TextStyle(
                                            fontSize: 12,
                                          ),
                                          textAlign: TextAlign.justify,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // First Column - Image
                                Padding(
                                  padding: const EdgeInsets.only(right: 100),
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        'Phone.png', // Replace with your image path
                                        width: 350,
                                        height: 300,
                                      ),
                                    ],
                                  ),
                                ),
                                // Second Column - Text
                                Padding(
                                  padding: const EdgeInsets.only(right: 150),
                                  child: Column(
                                    children: [
                                      Text(
                                        'How to get Naqli in Action',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 30,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                // Third Column - Text
                                Column(
                                  children: [
                                    Text(
                                      "Lorem ipsum dolor sit amet,\n"
                                      "consectetur adipiscing elit, sed\n"
                                      "do eiusmod tempor incididunt ut\n"
                                      "labore et dolore magna aliqua.\n"
                                      "Ut enim ad minim veniam, quis\n"
                                      "nostrud exercitation ullamco\n"
                                      "laboris nisi ut aliquip ex ea\n"
                                      "commodo consequat. Duis aute\n"
                                      "irure dolor in",
                                      style: TextStyle(
                                        color: Colors.black,
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
