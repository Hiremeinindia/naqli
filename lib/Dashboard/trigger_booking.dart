import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../Widgets/customRadio.dart';
import '../bookingdialog.dart';
import '../homepage.dart';

class TriggerBooking extends StatefulWidget {
  TriggerBooking();
  @override
  State<TriggerBooking> createState() => _TriggerBookingState();
}

class _TriggerBookingState extends State<TriggerBooking> {
  bool value = false;
  bool isButtonEnabled = false;
  bool isButtonEnabled1 = false;
  bool isButtonEnabled2 = false;
  int? selectedRadioValue;
  int? selectedRadioValue1;
  int? selectedRadioValue2;
  bool checkbox1 = false;
  bool checkbox2 = false;
  bool checkbox3 = false;
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return LayoutBuilder(
          builder: (BuildContext ctx, BoxConstraints constraints) {
        if (constraints.maxWidth >= 850) {
          return Padding(
            padding: const EdgeInsets.all(30.0),
            child: Container(
              height: 1000,
              color: Color.fromRGBO(240, 237, 250, 1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    width: 1200,
                    color: Color.fromRGBO(240, 237, 250, 0.9),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 60,
                        ),
                        Container(
                          height: 316,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          width: 1200,
                          child: Column(
                            children: [
                              Container(
                                height: 70,
                                color: Color.fromRGBO(
                                    75, 61, 82, 1), // Brown color
                                child: Center(
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 60),
                                        child: Text(
                                          'Trigger Booking',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 23,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 800),
                                        child: Text(
                                          "Actions",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontFamily: "Helvetica",
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              // Add spacing between the brown container and the white container
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 230,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    // Set a common borderRadius for all containers
                                  ),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        // Row(
                                        //   children: [
                                        //     SizedBox(
                                        //       width: 5,
                                        //     ),
                                        //     Column(
                                        //       children: [
                                        //         Transform
                                        //             .scale(
                                        //           scale:
                                        //               1.0,
                                        //           child:
                                        //               Checkbox(
                                        //             value:
                                        //                 checkbox1,
                                        //             onChanged:
                                        //                 (bool?
                                        //                     value) {
                                        //               setState(
                                        //                   () {
                                        //                 checkbox1 =
                                        //                     value ?? false;
                                        //                 if (checkbox1) {
                                        //                   // If checkbox1 is selected, disable the other checkboxes
                                        //                   checkbox2 = false;
                                        //                   checkbox3 = false;
                                        //                   // You can add additional logic or actions here
                                        //                   enablePayNowButton();
                                        //                 } else {
                                        //                   disablePayNowButton();
                                        //                 }
                                        //               });
                                        //             },
                                        //           ),
                                        //         ),
                                        //       ],
                                        //     ),
                                        //     SizedBox(
                                        //         width: 10),
                                        //     Column(
                                        //       crossAxisAlignment:
                                        //           CrossAxisAlignment
                                        //               .start,
                                        //       children: [
                                        //         Text(
                                        //           'Trip 1',
                                        //           style:
                                        //               const TextStyle(
                                        //             fontWeight:
                                        //                 FontWeight.bold,
                                        //             fontSize:
                                        //                 16,
                                        //           ),
                                        //         ),
                                        //         SizedBox(
                                        //           height: 3,
                                        //         ),
                                        //         Text(
                                        //           "Booking ID Xxxxxx",
                                        //           style: TextStyle(
                                        //               fontFamily:
                                        //                   "SFProText",
                                        //               fontSize:
                                        //                   14),
                                        //         ),
                                        //       ],
                                        //     ),
                                        //     SizedBox(
                                        //       width: 100,
                                        //     ),
                                        //     Row(
                                        //       children: [
                                        //         buildVendorContainer(
                                        //           1,
                                        //           "Vendor 1",
                                        //           "Xxxxx SAR",
                                        //         ),
                                        //         buildVendorContainer1(
                                        //           2,
                                        //           "Vendor 1",
                                        //           "Xxxxx SAR",
                                        //         ),
                                        //         buildVendorContainer2(
                                        //           3,
                                        //           "Vendor 1",
                                        //           "Xxxxx SAR",
                                        //         ),
                                        //       ],
                                        //     ),
                                        //     SizedBox(
                                        //       width: 20,
                                        //     ),
                                        //     Row(
                                        //       children: [
                                        //         IconButton(
                                        //           padding:
                                        //               EdgeInsets
                                        //                   .zero,
                                        //           constraints:
                                        //               BoxConstraints(),
                                        //           onPressed:
                                        //               null,
                                        //           icon:
                                        //               Icon(
                                        //             Icons
                                        //                 .edit_document,
                                        //             color: Color.fromRGBO(
                                        //                 74,
                                        //                 60,
                                        //                 81,
                                        //                 1),
                                        //           ),
                                        //         ),
                                        //         IconButton(
                                        //           padding:
                                        //               EdgeInsets
                                        //                   .zero,
                                        //           onPressed:
                                        //               null,
                                        //           icon: Icon(
                                        //               Icons
                                        //                   .delete),
                                        //         ),
                                        //       ],
                                        //     ),
                                        //     SizedBox(
                                        //       width: 20,
                                        //     ),
                                        //     SizedBox(
                                        //       width: 130,
                                        //       height: 40,
                                        //       child:
                                        //           ElevatedButton(
                                        //         onPressed:
                                        //             isButtonEnabled
                                        //                 ? () {
                                        //                     showDialog(
                                        //                       barrierDismissible: false,
                                        //                       context: context,
                                        //                       builder: (context) {
                                        //                         return BookingDialog();
                                        //                       },
                                        //                     );
                                        //                     print('Elevated Button Pressed!');
                                        //                   }
                                        //                 : null,
                                        //         style: ElevatedButton
                                        //             .styleFrom(
                                        //           primary: isButtonEnabled
                                        //               ? Color.fromRGBO(
                                        //                   98,
                                        //                   105,
                                        //                   254,
                                        //                   1)
                                        //               : Colors
                                        //                   .grey,
                                        //           side:
                                        //               BorderSide(
                                        //             color: isButtonEnabled
                                        //                 ? Color.fromRGBO(
                                        //                     98,
                                        //                     105,
                                        //                     254,
                                        //                     1)
                                        //                 : Colors.grey,
                                        //           ),
                                        //         ),
                                        //         child: Text(
                                        //           'Pay Now',
                                        //           style:
                                        //               TextStyle(
                                        //             color: Colors
                                        //                 .white,
                                        //             fontSize:
                                        //                 16,
                                        //             fontFamily:
                                        //                 "Helvetica",
                                        //           ),
                                        //         ),
                                        //       ),
                                        //     ),
                                        //   ],
                                        // ),
                                        Row(
                                          children: [
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
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Trip 1',
                                                      style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 16,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 3,
                                                    ),
                                                    Text(
                                                      "Booking ID Xxxxxx",
                                                      style: TextStyle(
                                                          fontFamily:
                                                              "SFProText",
                                                          fontSize: 14),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                CustomRadio(
                                                    onChanged: (val) {
                                                      // setState(
                                                      //     () {
                                                      //   if (selectedRadioValue ==
                                                      //       val) {
                                                      //     // Disable button
                                                      //   } else {
                                                      //     selectedRadioValue =
                                                      //         val as int?;
                                                      //     isButtonEnabled1 =
                                                      //         true; // Enable button
                                                      //   }
                                                      // });
                                                      setState(() {
                                                        selectedRadioValue =
                                                            null; // Unselect if already selected
                                                        isButtonEnabled = true;
                                                      });
                                                    },
                                                    groupValue:
                                                        selectedRadioValue,
                                                    value: 1,
                                                    colors: Color.fromRGBO(
                                                        200, 251, 253, 1),
                                                    text1: 'vendor1',
                                                    textcolor1: Colors.black54,
                                                    text2: "Xxxxx SAR",
                                                    textcolor2: Colors.black38),
                                                CustomRadio(
                                                    onChanged: (val) {
                                                      setState(() {
                                                        selectedRadioValue =
                                                            null; // Unselect if already selected
                                                        isButtonEnabled = true;
                                                      });
                                                    },
                                                    groupValue:
                                                        selectedRadioValue,
                                                    value: 2,
                                                    colors: Color.fromRGBO(
                                                        224, 253, 200, 1),
                                                    text1: 'vendor1',
                                                    textcolor1: Colors.black54,
                                                    text2: "Xxxxx SAR",
                                                    textcolor2: Colors.black38),
                                                CustomRadio(
                                                    onChanged: (val) {
                                                      setState(() {
                                                        selectedRadioValue =
                                                            null; // Unselect if already selected
                                                        isButtonEnabled = true;
                                                      });
                                                    },
                                                    groupValue:
                                                        selectedRadioValue,
                                                    value: 3,
                                                    colors: Color.fromRGBO(
                                                        245, 253, 200, 1),
                                                    text1: 'vendor3',
                                                    textcolor1: Colors.black54,
                                                    text2: "Xxxxx SAR",
                                                    textcolor2: Colors.black38),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                IconButton(
                                                  padding: EdgeInsets.zero,
                                                  constraints: BoxConstraints(),
                                                  onPressed: null,
                                                  icon: Icon(
                                                    Icons.edit_document,
                                                    color: Color.fromRGBO(
                                                        74, 60, 81, 1),
                                                  ),
                                                ),
                                                IconButton(
                                                  padding: EdgeInsets.zero,
                                                  onPressed: null,
                                                  icon: Icon(Icons.delete),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              width: 130,
                                              height: 40,
                                              child: ElevatedButton(
                                                onPressed: isButtonEnabled
                                                    ? () {
                                                        showDialog(
                                                          barrierDismissible:
                                                              false,
                                                          context: context,
                                                          builder: (context) {
                                                            return BookingDialog();
                                                          },
                                                        );
                                                        print(
                                                            'Elevated Button Pressed!');
                                                      }
                                                    : null,
                                                style: ElevatedButton.styleFrom(
                                                  primary: isButtonEnabled
                                                      ? Color.fromRGBO(
                                                          98, 105, 254, 1)
                                                      : Colors.grey,
                                                  side: BorderSide(
                                                    color: isButtonEnabled
                                                        ? Color.fromRGBO(
                                                            98, 105, 254, 1)
                                                        : Colors.grey,
                                                  ),
                                                ),
                                                child: Text(
                                                  'Pay Now',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                    fontFamily: "Helvetica",
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        SizedBox(
                                          width: 1184,
                                          child: Divider(
                                            color: Color.fromRGBO(
                                                206, 203, 203, 1),
                                          ),
                                        ),
                                        // Row(
                                        //   children: [
                                        //     SizedBox(
                                        //       width: 5,
                                        //     ),
                                        //     Column(
                                        //       children: [
                                        //         Checkbox(
                                        //             value:
                                        //                 checkbox2,
                                        //             onChanged:
                                        //                 (bool?
                                        //                     value) {
                                        //               setState(
                                        //                   () {
                                        //                 checkbox2 =
                                        //                     value ?? false;
                                        //                 if (checkbox2) {
                                        //                   // If checkbox1 is selected, disable the other checkboxes
                                        //                   checkbox1 = false;
                                        //                   checkbox3 = false;
                                        //                   // You can add additional logic or actions here
                                        //                 }
                                        //               });
                                        //             }),
                                        //       ],
                                        //     ),
                                        //     SizedBox(
                                        //         width: 10),
                                        //     Column(
                                        //       crossAxisAlignment:
                                        //           CrossAxisAlignment
                                        //               .start,
                                        //       children: [
                                        //         Text(
                                        //           'Equipment Hire',
                                        //           style:
                                        //               const TextStyle(
                                        //             fontWeight:
                                        //                 FontWeight.bold,
                                        //             fontSize:
                                        //                 16,
                                        //           ),
                                        //         ),
                                        //         SizedBox(
                                        //           height: 3,
                                        //         ),
                                        //         Text(
                                        //           "Booking ID Xxxxxx",
                                        //           style: TextStyle(
                                        //               fontFamily:
                                        //                   "SFProText",
                                        //               fontSize:
                                        //                   14),
                                        //         )
                                        //       ],
                                        //     ),
                                        //     SizedBox(
                                        //       width: 100,
                                        //     ),
                                        //     Row(
                                        //       children: [
                                        //         buildVendorContainer(
                                        //           1,
                                        //           "Vendor 1",
                                        //           "Xxxxx SAR",
                                        //         ),
                                        //         buildVendorContainer1(
                                        //           2,
                                        //           "Vendor 1",
                                        //           "Xxxxx SAR",
                                        //         ),
                                        //         buildVendorContainer2(
                                        //           3,
                                        //           "Vendor 1",
                                        //           "Xxxxx SAR",
                                        //         ),
                                        //       ],
                                        //     ),
                                        //     SizedBox(
                                        //       width: 20,
                                        //     ),
                                        //     Row(
                                        //       children: [
                                        //         IconButton(
                                        //           padding:
                                        //               EdgeInsets
                                        //                   .zero,
                                        //           constraints:
                                        //               BoxConstraints(),
                                        //           onPressed:
                                        //               null,
                                        //           icon:
                                        //               Icon(
                                        //             Icons
                                        //                 .edit_document,
                                        //             color: Color.fromRGBO(
                                        //                 74,
                                        //                 60,
                                        //                 81,
                                        //                 1),
                                        //           ),
                                        //         ),
                                        //         IconButton(
                                        //           padding:
                                        //               EdgeInsets
                                        //                   .zero,
                                        //           onPressed:
                                        //               null,
                                        //           icon: Icon(
                                        //               Icons
                                        //                   .delete),
                                        //         ),
                                        //       ],
                                        //     ),
                                        //     SizedBox(
                                        //       width: 20,
                                        //     ),
                                        //     SizedBox(
                                        //       width: 130,
                                        //       height: 40,
                                        //       child:
                                        //           ElevatedButton(
                                        //         onPressed:
                                        //             isButtonEnabled1
                                        //                 ? () {
                                        //                     // Handle button press only if any radio button is selected
                                        //                     print('Elevated Button Pressed!');
                                        //                   }
                                        //                 : null,
                                        //         style: ElevatedButton
                                        //             .styleFrom(
                                        //           primary: isButtonEnabled1
                                        //               ? Color.fromRGBO(
                                        //                   98,
                                        //                   105,
                                        //                   254,
                                        //                   1)
                                        //               : Colors
                                        //                   .grey,
                                        //           side:
                                        //               BorderSide(
                                        //             color: isButtonEnabled1
                                        //                 ? Color.fromRGBO(
                                        //                     98,
                                        //                     105,
                                        //                     254,
                                        //                     1)
                                        //                 : Colors.grey,
                                        //           ),
                                        //         ),
                                        //         child: Text(
                                        //           'Pay Now',
                                        //           style:
                                        //               TextStyle(
                                        //             color: Colors
                                        //                 .white,
                                        //             fontSize:
                                        //                 16,
                                        //             fontFamily:
                                        //                 "Helvetica",
                                        //           ),
                                        //         ),
                                        //       ),
                                        //     ),
                                        //   ],
                                        // ),
                                        Row(
                                          children: [
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
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Trip 1',
                                                      style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 16,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 3,
                                                    ),
                                                    Text(
                                                      "Booking ID Xxxxxx",
                                                      style: TextStyle(
                                                          fontFamily:
                                                              "SFProText",
                                                          fontSize: 14),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                CustomRadio(
                                                    onChanged: (val) {
                                                      setState(() {
                                                        selectedRadioValue1 =
                                                            null; // Unselect if already selected
                                                        isButtonEnabled1 = true;
                                                      });
                                                    },
                                                    groupValue:
                                                        selectedRadioValue1,
                                                    value: 1,
                                                    colors: Color.fromRGBO(
                                                        200, 251, 253, 1),
                                                    text1: 'vendor1',
                                                    textcolor1: Colors.black54,
                                                    text2: "Xxxxx SAR",
                                                    textcolor2: Colors.black38),
                                                CustomRadio(
                                                    onChanged: (val) {
                                                      setState(() {
                                                        selectedRadioValue1 =
                                                            null; // Unselect if already selected
                                                        isButtonEnabled1 = true;
                                                      });
                                                    },
                                                    groupValue:
                                                        selectedRadioValue1,
                                                    value: 2,
                                                    colors: Color.fromRGBO(
                                                        224, 253, 200, 1),
                                                    text1: 'vendor1',
                                                    textcolor1: Colors.black54,
                                                    text2: "Xxxxx SAR",
                                                    textcolor2: Colors.black38),
                                                CustomRadio(
                                                    onChanged: (val) {
                                                      setState(() {
                                                        selectedRadioValue1 =
                                                            null; // Unselect if already selected
                                                        isButtonEnabled1 = true;
                                                      });
                                                    },
                                                    groupValue:
                                                        selectedRadioValue1,
                                                    value: 3,
                                                    colors: Color.fromRGBO(
                                                        245, 253, 200, 1),
                                                    text1: 'vendor3',
                                                    textcolor1: Colors.black54,
                                                    text2: "Xxxxx SAR",
                                                    textcolor2: Colors.black38),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                IconButton(
                                                  padding: EdgeInsets.zero,
                                                  constraints: BoxConstraints(),
                                                  onPressed: null,
                                                  icon: Icon(
                                                    Icons.edit_document,
                                                    color: Color.fromRGBO(
                                                        74, 60, 81, 1),
                                                  ),
                                                ),
                                                IconButton(
                                                  padding: EdgeInsets.zero,
                                                  onPressed: null,
                                                  icon: Icon(Icons.delete),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              width: 130,
                                              height: 40,
                                              child: ElevatedButton(
                                                onPressed: isButtonEnabled1
                                                    ? () {
                                                        showDialog(
                                                          barrierDismissible:
                                                              false,
                                                          context: context,
                                                          builder: (context) {
                                                            return BookingDialog();
                                                          },
                                                        );
                                                        print(
                                                            'Elevated Button Pressed!');
                                                      }
                                                    : null,
                                                style: ElevatedButton.styleFrom(
                                                  primary: isButtonEnabled1
                                                      ? Color.fromRGBO(
                                                          98, 105, 254, 1)
                                                      : Colors.grey,
                                                  side: BorderSide(
                                                    color: isButtonEnabled
                                                        ? Color.fromRGBO(
                                                            98, 105, 254, 1)
                                                        : Colors.grey,
                                                  ),
                                                ),
                                                child: Text(
                                                  'Pay Now',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                    fontFamily: "Helvetica",
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        SizedBox(
                                          width: 1184,
                                          child: Divider(
                                            color: Color.fromRGBO(
                                                206, 203, 203, 1),
                                          ),
                                        ),
                                        Row(
                                          children: [
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
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Trip 1',
                                                      style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 16,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 3,
                                                    ),
                                                    Text(
                                                      "Booking ID Xxxxxx",
                                                      style: TextStyle(
                                                          fontFamily:
                                                              "SFProText",
                                                          fontSize: 14),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                CustomRadio(
                                                    onChanged: (val) {
                                                      setState(() {
                                                        selectedRadioValue2 =
                                                            null; // Unselect if already selected
                                                        isButtonEnabled2 = true;
                                                      });
                                                    },
                                                    groupValue:
                                                        selectedRadioValue2,
                                                    value: 1,
                                                    colors: Color.fromRGBO(
                                                        200, 251, 253, 1),
                                                    text1: 'vendor1',
                                                    textcolor1: Colors.black54,
                                                    text2: "Xxxxx SAR",
                                                    textcolor2: Colors.black38),
                                                CustomRadio(
                                                    onChanged: (val) {
                                                      setState(() {
                                                        selectedRadioValue2 =
                                                            null; // Unselect if already selected
                                                        isButtonEnabled2 = true;
                                                      });
                                                    },
                                                    groupValue:
                                                        selectedRadioValue2,
                                                    value: 2,
                                                    colors: Color.fromRGBO(
                                                        224, 253, 200, 1),
                                                    text1: 'vendor1',
                                                    textcolor1: Colors.black54,
                                                    text2: "Xxxxx SAR",
                                                    textcolor2: Colors.black38),
                                                CustomRadio(
                                                    onChanged: (val) {
                                                      setState(() {
                                                        selectedRadioValue2 =
                                                            null; // Unselect if already selected
                                                        isButtonEnabled2 = true;
                                                      });
                                                    },
                                                    groupValue:
                                                        selectedRadioValue2,
                                                    value: 3,
                                                    colors: Color.fromRGBO(
                                                        245, 253, 200, 1),
                                                    text1: 'vendor3',
                                                    textcolor1: Colors.black54,
                                                    text2: "Xxxxx SAR",
                                                    textcolor2: Colors.black38),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                IconButton(
                                                  padding: EdgeInsets.zero,
                                                  constraints: BoxConstraints(),
                                                  onPressed: null,
                                                  icon: Icon(
                                                    Icons.edit_document,
                                                    color: Color.fromRGBO(
                                                        74, 60, 81, 1),
                                                  ),
                                                ),
                                                IconButton(
                                                  padding: EdgeInsets.zero,
                                                  onPressed: null,
                                                  icon: Icon(Icons.delete),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              width: 130,
                                              height: 40,
                                              child: ElevatedButton(
                                                onPressed: isButtonEnabled2
                                                    ? () {
                                                        showDialog(
                                                          barrierDismissible:
                                                              false,
                                                          context: context,
                                                          builder: (context) {
                                                            return BookingDialog();
                                                          },
                                                        );
                                                        print(
                                                            'Elevated Button Pressed!');
                                                      }
                                                    : null,
                                                style: ElevatedButton.styleFrom(
                                                  primary: isButtonEnabled2
                                                      ? Color.fromRGBO(
                                                          98, 105, 254, 1)
                                                      : Colors.grey,
                                                  side: BorderSide(
                                                    color: isButtonEnabled2
                                                        ? Color.fromRGBO(
                                                            98, 105, 254, 1)
                                                        : Colors.grey,
                                                  ),
                                                ),
                                                child: Text(
                                                  'Pay Now',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                    fontFamily: "Helvetica",
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ]),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 200,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Container(
                            height: 10, // Adjust the height as needed
                            width:
                                1200, // Set the desired length of the scroll bar
                            color: Colors
                                .grey, // Background color of the scrollable area
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                    width: 150,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle button press
                        print('Elevated Button Pressed!');
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(98, 105, 254, 1),
                        side: BorderSide(
                          color: Color.fromRGBO(98, 105, 254, 1),
                        ),
                      ),
                      child: Text(
                        'Confirm Booking',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13.4,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.all(30.0),
            child: Container(
              height: 1000,
              color: Color.fromRGBO(240, 237, 250, 1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    width: 1200,
                    color: Color.fromRGBO(240, 237, 250, 0.9),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 60,
                        ),
                        Container(
                          height: 316,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          width: 1200,
                          child: Column(
                            children: [
                              Container(
                                height: 70,
                                color: Color.fromRGBO(
                                    75, 61, 82, 1), // Brown color
                                child: Center(
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 60),
                                        child: Text(
                                          'Trigger Booking',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 23,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 800),
                                        child: Text(
                                          "Actions",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontFamily: "Helvetica",
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              // Add spacing between the brown container and the white container
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 230,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    // Set a common borderRadius for all containers
                                  ),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        // Row(
                                        //   children: [
                                        //     SizedBox(
                                        //       width: 5,
                                        //     ),
                                        //     Column(
                                        //       children: [
                                        //         Transform
                                        //             .scale(
                                        //           scale:
                                        //               1.0,
                                        //           child:
                                        //               Checkbox(
                                        //             value:
                                        //                 checkbox1,
                                        //             onChanged:
                                        //                 (bool?
                                        //                     value) {
                                        //               setState(
                                        //                   () {
                                        //                 checkbox1 =
                                        //                     value ?? false;
                                        //                 if (checkbox1) {
                                        //                   // If checkbox1 is selected, disable the other checkboxes
                                        //                   checkbox2 = false;
                                        //                   checkbox3 = false;
                                        //                   // You can add additional logic or actions here
                                        //                   enablePayNowButton();
                                        //                 } else {
                                        //                   disablePayNowButton();
                                        //                 }
                                        //               });
                                        //             },
                                        //           ),
                                        //         ),
                                        //       ],
                                        //     ),
                                        //     SizedBox(
                                        //         width: 10),
                                        //     Column(
                                        //       crossAxisAlignment:
                                        //           CrossAxisAlignment
                                        //               .start,
                                        //       children: [
                                        //         Text(
                                        //           'Trip 1',
                                        //           style:
                                        //               const TextStyle(
                                        //             fontWeight:
                                        //                 FontWeight.bold,
                                        //             fontSize:
                                        //                 16,
                                        //           ),
                                        //         ),
                                        //         SizedBox(
                                        //           height: 3,
                                        //         ),
                                        //         Text(
                                        //           "Booking ID Xxxxxx",
                                        //           style: TextStyle(
                                        //               fontFamily:
                                        //                   "SFProText",
                                        //               fontSize:
                                        //                   14),
                                        //         ),
                                        //       ],
                                        //     ),
                                        //     SizedBox(
                                        //       width: 100,
                                        //     ),
                                        //     Row(
                                        //       children: [
                                        //         buildVendorContainer(
                                        //           1,
                                        //           "Vendor 1",
                                        //           "Xxxxx SAR",
                                        //         ),
                                        //         buildVendorContainer1(
                                        //           2,
                                        //           "Vendor 1",
                                        //           "Xxxxx SAR",
                                        //         ),
                                        //         buildVendorContainer2(
                                        //           3,
                                        //           "Vendor 1",
                                        //           "Xxxxx SAR",
                                        //         ),
                                        //       ],
                                        //     ),
                                        //     SizedBox(
                                        //       width: 20,
                                        //     ),
                                        //     Row(
                                        //       children: [
                                        //         IconButton(
                                        //           padding:
                                        //               EdgeInsets
                                        //                   .zero,
                                        //           constraints:
                                        //               BoxConstraints(),
                                        //           onPressed:
                                        //               null,
                                        //           icon:
                                        //               Icon(
                                        //             Icons
                                        //                 .edit_document,
                                        //             color: Color.fromRGBO(
                                        //                 74,
                                        //                 60,
                                        //                 81,
                                        //                 1),
                                        //           ),
                                        //         ),
                                        //         IconButton(
                                        //           padding:
                                        //               EdgeInsets
                                        //                   .zero,
                                        //           onPressed:
                                        //               null,
                                        //           icon: Icon(
                                        //               Icons
                                        //                   .delete),
                                        //         ),
                                        //       ],
                                        //     ),
                                        //     SizedBox(
                                        //       width: 20,
                                        //     ),
                                        //     SizedBox(
                                        //       width: 130,
                                        //       height: 40,
                                        //       child:
                                        //           ElevatedButton(
                                        //         onPressed:
                                        //             isButtonEnabled
                                        //                 ? () {
                                        //                     showDialog(
                                        //                       barrierDismissible: false,
                                        //                       context: context,
                                        //                       builder: (context) {
                                        //                         return BookingDialog();
                                        //                       },
                                        //                     );
                                        //                     print('Elevated Button Pressed!');
                                        //                   }
                                        //                 : null,
                                        //         style: ElevatedButton
                                        //             .styleFrom(
                                        //           primary: isButtonEnabled
                                        //               ? Color.fromRGBO(
                                        //                   98,
                                        //                   105,
                                        //                   254,
                                        //                   1)
                                        //               : Colors
                                        //                   .grey,
                                        //           side:
                                        //               BorderSide(
                                        //             color: isButtonEnabled
                                        //                 ? Color.fromRGBO(
                                        //                     98,
                                        //                     105,
                                        //                     254,
                                        //                     1)
                                        //                 : Colors.grey,
                                        //           ),
                                        //         ),
                                        //         child: Text(
                                        //           'Pay Now',
                                        //           style:
                                        //               TextStyle(
                                        //             color: Colors
                                        //                 .white,
                                        //             fontSize:
                                        //                 16,
                                        //             fontFamily:
                                        //                 "Helvetica",
                                        //           ),
                                        //         ),
                                        //       ),
                                        //     ),
                                        //   ],
                                        // ),
                                        Row(
                                          children: [
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
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Trip 1',
                                                      style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 16,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 3,
                                                    ),
                                                    Text(
                                                      "Booking ID Xxxxxx",
                                                      style: TextStyle(
                                                          fontFamily:
                                                              "SFProText",
                                                          fontSize: 14),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                CustomRadio(
                                                    onChanged: (val) {
                                                      // setState(
                                                      //     () {
                                                      //   if (selectedRadioValue ==
                                                      //       val) {
                                                      //     // Disable button
                                                      //   } else {
                                                      //     selectedRadioValue =
                                                      //         val as int?;
                                                      //     isButtonEnabled1 =
                                                      //         true; // Enable button
                                                      //   }
                                                      // });
                                                      setState(() {
                                                        selectedRadioValue =
                                                            null; // Unselect if already selected
                                                        isButtonEnabled = true;
                                                      });
                                                    },
                                                    groupValue:
                                                        selectedRadioValue,
                                                    value: 1,
                                                    colors: Color.fromRGBO(
                                                        200, 251, 253, 1),
                                                    text1: 'vendor1',
                                                    textcolor1: Colors.black54,
                                                    text2: "Xxxxx SAR",
                                                    textcolor2: Colors.black38),
                                                CustomRadio(
                                                    onChanged: (val) {
                                                      setState(() {
                                                        selectedRadioValue =
                                                            null; // Unselect if already selected
                                                        isButtonEnabled = true;
                                                      });
                                                    },
                                                    groupValue:
                                                        selectedRadioValue,
                                                    value: 2,
                                                    colors: Color.fromRGBO(
                                                        224, 253, 200, 1),
                                                    text1: 'vendor1',
                                                    textcolor1: Colors.black54,
                                                    text2: "Xxxxx SAR",
                                                    textcolor2: Colors.black38),
                                                CustomRadio(
                                                    onChanged: (val) {
                                                      setState(() {
                                                        selectedRadioValue =
                                                            null; // Unselect if already selected
                                                        isButtonEnabled = true;
                                                      });
                                                    },
                                                    groupValue:
                                                        selectedRadioValue,
                                                    value: 3,
                                                    colors: Color.fromRGBO(
                                                        245, 253, 200, 1),
                                                    text1: 'vendor3',
                                                    textcolor1: Colors.black54,
                                                    text2: "Xxxxx SAR",
                                                    textcolor2: Colors.black38),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                IconButton(
                                                  padding: EdgeInsets.zero,
                                                  constraints: BoxConstraints(),
                                                  onPressed: null,
                                                  icon: Icon(
                                                    Icons.edit_document,
                                                    color: Color.fromRGBO(
                                                        74, 60, 81, 1),
                                                  ),
                                                ),
                                                IconButton(
                                                  padding: EdgeInsets.zero,
                                                  onPressed: null,
                                                  icon: Icon(Icons.delete),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              width: 130,
                                              height: 40,
                                              child: ElevatedButton(
                                                onPressed: isButtonEnabled
                                                    ? () {
                                                        showDialog(
                                                          barrierDismissible:
                                                              false,
                                                          context: context,
                                                          builder: (context) {
                                                            return BookingDialog();
                                                          },
                                                        );
                                                        print(
                                                            'Elevated Button Pressed!');
                                                      }
                                                    : null,
                                                style: ElevatedButton.styleFrom(
                                                  primary: isButtonEnabled
                                                      ? Color.fromRGBO(
                                                          98, 105, 254, 1)
                                                      : Colors.grey,
                                                  side: BorderSide(
                                                    color: isButtonEnabled
                                                        ? Color.fromRGBO(
                                                            98, 105, 254, 1)
                                                        : Colors.grey,
                                                  ),
                                                ),
                                                child: Text(
                                                  'Pay Now',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                    fontFamily: "Helvetica",
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        SizedBox(
                                          width: 1184,
                                          child: Divider(
                                            color: Color.fromRGBO(
                                                206, 203, 203, 1),
                                          ),
                                        ),
                                        // Row(
                                        //   children: [
                                        //     SizedBox(
                                        //       width: 5,
                                        //     ),
                                        //     Column(
                                        //       children: [
                                        //         Checkbox(
                                        //             value:
                                        //                 checkbox2,
                                        //             onChanged:
                                        //                 (bool?
                                        //                     value) {
                                        //               setState(
                                        //                   () {
                                        //                 checkbox2 =
                                        //                     value ?? false;
                                        //                 if (checkbox2) {
                                        //                   // If checkbox1 is selected, disable the other checkboxes
                                        //                   checkbox1 = false;
                                        //                   checkbox3 = false;
                                        //                   // You can add additional logic or actions here
                                        //                 }
                                        //               });
                                        //             }),
                                        //       ],
                                        //     ),
                                        //     SizedBox(
                                        //         width: 10),
                                        //     Column(
                                        //       crossAxisAlignment:
                                        //           CrossAxisAlignment
                                        //               .start,
                                        //       children: [
                                        //         Text(
                                        //           'Equipment Hire',
                                        //           style:
                                        //               const TextStyle(
                                        //             fontWeight:
                                        //                 FontWeight.bold,
                                        //             fontSize:
                                        //                 16,
                                        //           ),
                                        //         ),
                                        //         SizedBox(
                                        //           height: 3,
                                        //         ),
                                        //         Text(
                                        //           "Booking ID Xxxxxx",
                                        //           style: TextStyle(
                                        //               fontFamily:
                                        //                   "SFProText",
                                        //               fontSize:
                                        //                   14),
                                        //         )
                                        //       ],
                                        //     ),
                                        //     SizedBox(
                                        //       width: 100,
                                        //     ),
                                        //     Row(
                                        //       children: [
                                        //         buildVendorContainer(
                                        //           1,
                                        //           "Vendor 1",
                                        //           "Xxxxx SAR",
                                        //         ),
                                        //         buildVendorContainer1(
                                        //           2,
                                        //           "Vendor 1",
                                        //           "Xxxxx SAR",
                                        //         ),
                                        //         buildVendorContainer2(
                                        //           3,
                                        //           "Vendor 1",
                                        //           "Xxxxx SAR",
                                        //         ),
                                        //       ],
                                        //     ),
                                        //     SizedBox(
                                        //       width: 20,
                                        //     ),
                                        //     Row(
                                        //       children: [
                                        //         IconButton(
                                        //           padding:
                                        //               EdgeInsets
                                        //                   .zero,
                                        //           constraints:
                                        //               BoxConstraints(),
                                        //           onPressed:
                                        //               null,
                                        //           icon:
                                        //               Icon(
                                        //             Icons
                                        //                 .edit_document,
                                        //             color: Color.fromRGBO(
                                        //                 74,
                                        //                 60,
                                        //                 81,
                                        //                 1),
                                        //           ),
                                        //         ),
                                        //         IconButton(
                                        //           padding:
                                        //               EdgeInsets
                                        //                   .zero,
                                        //           onPressed:
                                        //               null,
                                        //           icon: Icon(
                                        //               Icons
                                        //                   .delete),
                                        //         ),
                                        //       ],
                                        //     ),
                                        //     SizedBox(
                                        //       width: 20,
                                        //     ),
                                        //     SizedBox(
                                        //       width: 130,
                                        //       height: 40,
                                        //       child:
                                        //           ElevatedButton(
                                        //         onPressed:
                                        //             isButtonEnabled1
                                        //                 ? () {
                                        //                     // Handle button press only if any radio button is selected
                                        //                     print('Elevated Button Pressed!');
                                        //                   }
                                        //                 : null,
                                        //         style: ElevatedButton
                                        //             .styleFrom(
                                        //           primary: isButtonEnabled1
                                        //               ? Color.fromRGBO(
                                        //                   98,
                                        //                   105,
                                        //                   254,
                                        //                   1)
                                        //               : Colors
                                        //                   .grey,
                                        //           side:
                                        //               BorderSide(
                                        //             color: isButtonEnabled1
                                        //                 ? Color.fromRGBO(
                                        //                     98,
                                        //                     105,
                                        //                     254,
                                        //                     1)
                                        //                 : Colors.grey,
                                        //           ),
                                        //         ),
                                        //         child: Text(
                                        //           'Pay Now',
                                        //           style:
                                        //               TextStyle(
                                        //             color: Colors
                                        //                 .white,
                                        //             fontSize:
                                        //                 16,
                                        //             fontFamily:
                                        //                 "Helvetica",
                                        //           ),
                                        //         ),
                                        //       ),
                                        //     ),
                                        //   ],
                                        // ),
                                        Row(
                                          children: [
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
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Trip 1',
                                                      style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 16,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 3,
                                                    ),
                                                    Text(
                                                      "Booking ID Xxxxxx",
                                                      style: TextStyle(
                                                          fontFamily:
                                                              "SFProText",
                                                          fontSize: 14),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                CustomRadio(
                                                    onChanged: (val) {
                                                      setState(() {
                                                        selectedRadioValue1 =
                                                            null; // Unselect if already selected
                                                        isButtonEnabled1 = true;
                                                      });
                                                    },
                                                    groupValue:
                                                        selectedRadioValue1,
                                                    value: 1,
                                                    colors: Color.fromRGBO(
                                                        200, 251, 253, 1),
                                                    text1: 'vendor1',
                                                    textcolor1: Colors.black54,
                                                    text2: "Xxxxx SAR",
                                                    textcolor2: Colors.black38),
                                                CustomRadio(
                                                    onChanged: (val) {
                                                      setState(() {
                                                        selectedRadioValue1 =
                                                            null; // Unselect if already selected
                                                        isButtonEnabled1 = true;
                                                      });
                                                    },
                                                    groupValue:
                                                        selectedRadioValue1,
                                                    value: 2,
                                                    colors: Color.fromRGBO(
                                                        224, 253, 200, 1),
                                                    text1: 'vendor1',
                                                    textcolor1: Colors.black54,
                                                    text2: "Xxxxx SAR",
                                                    textcolor2: Colors.black38),
                                                CustomRadio(
                                                    onChanged: (val) {
                                                      setState(() {
                                                        selectedRadioValue1 =
                                                            null; // Unselect if already selected
                                                        isButtonEnabled1 = true;
                                                      });
                                                    },
                                                    groupValue:
                                                        selectedRadioValue1,
                                                    value: 3,
                                                    colors: Color.fromRGBO(
                                                        245, 253, 200, 1),
                                                    text1: 'vendor3',
                                                    textcolor1: Colors.black54,
                                                    text2: "Xxxxx SAR",
                                                    textcolor2: Colors.black38),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                IconButton(
                                                  padding: EdgeInsets.zero,
                                                  constraints: BoxConstraints(),
                                                  onPressed: null,
                                                  icon: Icon(
                                                    Icons.edit_document,
                                                    color: Color.fromRGBO(
                                                        74, 60, 81, 1),
                                                  ),
                                                ),
                                                IconButton(
                                                  padding: EdgeInsets.zero,
                                                  onPressed: null,
                                                  icon: Icon(Icons.delete),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              width: 130,
                                              height: 40,
                                              child: ElevatedButton(
                                                onPressed: isButtonEnabled1
                                                    ? () {
                                                        showDialog(
                                                          barrierDismissible:
                                                              false,
                                                          context: context,
                                                          builder: (context) {
                                                            return BookingDialog();
                                                          },
                                                        );
                                                        print(
                                                            'Elevated Button Pressed!');
                                                      }
                                                    : null,
                                                style: ElevatedButton.styleFrom(
                                                  primary: isButtonEnabled1
                                                      ? Color.fromRGBO(
                                                          98, 105, 254, 1)
                                                      : Colors.grey,
                                                  side: BorderSide(
                                                    color: isButtonEnabled
                                                        ? Color.fromRGBO(
                                                            98, 105, 254, 1)
                                                        : Colors.grey,
                                                  ),
                                                ),
                                                child: Text(
                                                  'Pay Now',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                    fontFamily: "Helvetica",
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        SizedBox(
                                          width: 1184,
                                          child: Divider(
                                            color: Color.fromRGBO(
                                                206, 203, 203, 1),
                                          ),
                                        ),
                                        Row(
                                          children: [
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
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Trip 1',
                                                      style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 16,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 3,
                                                    ),
                                                    Text(
                                                      "Booking ID Xxxxxx",
                                                      style: TextStyle(
                                                          fontFamily:
                                                              "SFProText",
                                                          fontSize: 14),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                CustomRadio(
                                                    onChanged: (val) {
                                                      setState(() {
                                                        selectedRadioValue2 =
                                                            null; // Unselect if already selected
                                                        isButtonEnabled2 = true;
                                                      });
                                                    },
                                                    groupValue:
                                                        selectedRadioValue2,
                                                    value: 1,
                                                    colors: Color.fromRGBO(
                                                        200, 251, 253, 1),
                                                    text1: 'vendor1',
                                                    textcolor1: Colors.black54,
                                                    text2: "Xxxxx SAR",
                                                    textcolor2: Colors.black38),
                                                CustomRadio(
                                                    onChanged: (val) {
                                                      setState(() {
                                                        selectedRadioValue2 =
                                                            null; // Unselect if already selected
                                                        isButtonEnabled2 = true;
                                                      });
                                                    },
                                                    groupValue:
                                                        selectedRadioValue2,
                                                    value: 2,
                                                    colors: Color.fromRGBO(
                                                        224, 253, 200, 1),
                                                    text1: 'vendor1',
                                                    textcolor1: Colors.black54,
                                                    text2: "Xxxxx SAR",
                                                    textcolor2: Colors.black38),
                                                CustomRadio(
                                                    onChanged: (val) {
                                                      setState(() {
                                                        selectedRadioValue2 =
                                                            null; // Unselect if already selected
                                                        isButtonEnabled2 = true;
                                                      });
                                                    },
                                                    groupValue:
                                                        selectedRadioValue2,
                                                    value: 3,
                                                    colors: Color.fromRGBO(
                                                        245, 253, 200, 1),
                                                    text1: 'vendor3',
                                                    textcolor1: Colors.black54,
                                                    text2: "Xxxxx SAR",
                                                    textcolor2: Colors.black38),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                IconButton(
                                                  padding: EdgeInsets.zero,
                                                  constraints: BoxConstraints(),
                                                  onPressed: null,
                                                  icon: Icon(
                                                    Icons.edit_document,
                                                    color: Color.fromRGBO(
                                                        74, 60, 81, 1),
                                                  ),
                                                ),
                                                IconButton(
                                                  padding: EdgeInsets.zero,
                                                  onPressed: null,
                                                  icon: Icon(Icons.delete),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              width: 130,
                                              height: 40,
                                              child: ElevatedButton(
                                                onPressed: isButtonEnabled2
                                                    ? () {
                                                        showDialog(
                                                          barrierDismissible:
                                                              false,
                                                          context: context,
                                                          builder: (context) {
                                                            return BookingDialog();
                                                          },
                                                        );
                                                        print(
                                                            'Elevated Button Pressed!');
                                                      }
                                                    : null,
                                                style: ElevatedButton.styleFrom(
                                                  primary: isButtonEnabled2
                                                      ? Color.fromRGBO(
                                                          98, 105, 254, 1)
                                                      : Colors.grey,
                                                  side: BorderSide(
                                                    color: isButtonEnabled2
                                                        ? Color.fromRGBO(
                                                            98, 105, 254, 1)
                                                        : Colors.grey,
                                                  ),
                                                ),
                                                child: Text(
                                                  'Pay Now',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                    fontFamily: "Helvetica",
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ]),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 200,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Container(
                            height: 10, // Adjust the height as needed
                            width:
                                1200, // Set the desired length of the scroll bar
                            color: Colors
                                .grey, // Background color of the scrollable area
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                    width: 150,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle button press
                        print('Elevated Button Pressed!');
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(98, 105, 254, 1),
                        side: BorderSide(
                          color: Color.fromRGBO(98, 105, 254, 1),
                        ),
                      ),
                      child: Text(
                        'Confirm Booking',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13.4,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        }
      });
    });
  }
}
