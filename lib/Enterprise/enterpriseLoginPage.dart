import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Enterprise/enterpriseCreateAccount.dart';
import 'package:flutter_application_1/Enterprise/enterpriseHomePage.dart';
import 'package:flutter_application_1/Widgets/customButton.dart';
import 'package:flutter_application_1/SuperUser/createAccount.dart';
import 'package:flutter_application_1/SuperUser/homepage.dart';
import 'package:sizer/sizer.dart';

import '../../main.dart';

// ignore: must_be_immutable
class enterpriseLoginPage extends StatefulWidget {
  const enterpriseLoginPage();
  @override
  _enterpriseLoginPageState createState() => _enterpriseLoginPageState();
}

class ScaleSize {
  static double textScaleFactor(BuildContext context,
      {double maxTextScaleFactor = 2}) {
    final width = MediaQuery.of(context).size.width;
    double val = (width / 1400) * maxTextScaleFactor;
    return max(1, min(val, maxTextScaleFactor));
  }
}

class _enterpriseLoginPageState extends State<enterpriseLoginPage> {
  bool isVerified = false;
  TextEditingController otpController = TextEditingController();

  TextEditingController contactNumberController = TextEditingController();
  void _showOtpVerificationDialog() {
    print("track4");

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(
              child: Text(
            "Verify Account",
            textScaleFactor: ScaleSize.textScaleFactor(context),
            style: TextStyle(
                fontFamily: 'Colfax',
                fontSize: 15,
                color: Colors.black,
                fontWeight: FontWeight.bold),
          )),
          content: Container(
            height: 150, // Set the desired height
            width: 1000, // Set the desired width
            child: Column(
              children: [
                Text(
                  "Enter Mobile NO",
                  textScaleFactor: ScaleSize.textScaleFactor(context),
                  style: TextStyle(
                    fontFamily: 'Colfax',
                    fontSize: 10,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 30,
                      width: 200,
                      child: TextField(
                        controller: contactNumberController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        _startPhoneAuth(contactNumberController.text);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(60, 55, 148, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: Text(
                        "Get OTP",
                        style: TextStyle(
                          fontFamily: 'Colfax',
                          fontSize: 10,
                          color: Colors.white,
                        ),
                        textScaleFactor: ScaleSize.textScaleFactor(context),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Didn't receive an email? ",
                  style: TextStyle(
                    fontFamily: 'Colfax',
                    fontSize: 7,
                    color: Colors.black,
                  ),
                  textScaleFactor: ScaleSize.textScaleFactor(context),
                ),
                InkWell(
                  onTap: () {
                    // Implement the logic to resend the OTP
                    // For now, let's close the dialog
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Resend.",
                    style: TextStyle(
                        fontFamily: 'Colfax',
                        fontSize: 7,
                        color: Color.fromRGBO(60, 55, 148, 1),
                        fontWeight: FontWeight.bold),
                    textScaleFactor: ScaleSize.textScaleFactor(context),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  void showErrorDialog(String errorMessage) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Error"),
        content: Text(errorMessage),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("OK"),
          ),
        ],
      ),
    );
  }

  Future<void> _startPhoneAuth(String phoneNumber) async {
    print("track3");

    FirebaseAuth _auth = FirebaseAuth.instance;

    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: "+91${contactNumberController.text}",
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _auth.signInWithCredential(credential).then((value) {
            Navigator.pop(context);
            setState(() {
              isVerified = true;
            });
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          // Handle the verification failure
          print('Phone authentication failed: $e');
          showErrorDialog(
              "Invalid phone number format. Please enter a valid 10-digit phone number.");
        },
        codeSent: (String verificationId, [int? forceResendingToken]) {
          // Store the verification ID for later use (e.g., resend OTP)
          String storedVerificationId = verificationId;

          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => AlertDialog(
              title: Text("Enter OTP"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: otpController,
                  ),
                ],
              ),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    FirebaseAuth auth = FirebaseAuth.instance;
                    String smsCode = otpController.text;
                    PhoneAuthCredential _credential =
                        PhoneAuthProvider.credential(
                      verificationId: storedVerificationId,
                      smsCode: smsCode,
                    );

                    auth.signInWithCredential(_credential).then((result) {
                      // Check if the verification is successful
                      if (result.user != null) {
                        print("otp verified successfully");
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => enterpriseMyHomePage(),
                          ),
                        );
                        setState(() {
                          isVerified = true;
                        });
                      } else {
                        showErrorDialog(
                            "Invalid verification code. Please enter the correct code.");
                      }
                    }).catchError((e) {
                      print("Error signing in with credential: $e");
                    });
                  },
                  child: Text("Done"),
                ),
              ],
            ),
          );
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          // Handle code auto retrieval timeout (optional)
        },
      );
    } catch (e) {
      print('Error during phone authentication: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return LayoutBuilder(
          builder: (BuildContext ctx, BoxConstraints constraints) {
        if (constraints.maxWidth >= 1180) {
          return Dialog(
            child: Container(
              height: 750,
              width: 1100,
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 550,
                        height: 750,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 128, 123, 229),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(31),
                            bottomLeft: Radius.circular(31),
                          ),
                        ),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Image.asset(
                            'loginlogo.png',
                            width: 500,
                            height: 500,
                          ),
                        ),
                      ),
                      Container(
                        width: 550,
                        height: 750,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(31),
                            bottomRight: Radius.circular(31),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 20.0,
                            right: 20,
                            top: 20,
                            bottom: 80,
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 100,
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                    fontFamily: 'Colfax',
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textScaleFactor:
                                      ScaleSize.textScaleFactor(context),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 40.0,
                                  right: 40,
                                  top: 80,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Email ID',
                                      style: TextStyle(
                                        fontFamily: 'Colfax',
                                        fontSize: 8,
                                      ),
                                      textScaleFactor:
                                          ScaleSize.textScaleFactor(context),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    TextField(
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.all(5.0),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5)),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      'Password',
                                      style: TextStyle(
                                        fontFamily: 'Colfax',
                                        fontSize: 8,
                                      ),
                                      textScaleFactor:
                                          ScaleSize.textScaleFactor(context),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    TextField(
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.all(5.0),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5)),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 40.0,
                                  right: 40,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      height: 43,
                                      width: 140,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          showDialog(
                                            context: context,
                                            builder: (context) {
                                              return enterpriseMyHomePage();
                                            },
                                          );
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              Color.fromRGBO(128, 123, 229, 1),
                                          side: BorderSide(
                                            color: Color.fromRGBO(
                                                128, 123, 229, 1),
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                        ),
                                        child: Text(
                                          'Login',
                                          style: TextStyle(
                                            fontFamily: 'Colfax',
                                            fontSize: 8,
                                            color: Colors.white,
                                          ),
                                          textScaleFactor:
                                              ScaleSize.textScaleFactor(
                                                  context),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      child: Text(
                                        'Forgot Password?',
                                        style: TextStyle(
                                          fontFamily: 'Colfax',
                                          fontSize: 8,
                                          color: Color.fromARGB(
                                              255, 128, 123, 229),
                                        ),
                                        textScaleFactor:
                                            ScaleSize.textScaleFactor(context),
                                      ),
                                      onTap: () {},
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 13,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 40.0,
                                  right: 40,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Don't have an account?",
                                      style: TextStyle(
                                        fontFamily: 'Colfax',
                                        fontSize: 8,
                                        color: Colors.black,
                                      ),
                                      textScaleFactor:
                                          ScaleSize.textScaleFactor(context),
                                    ),
                                    InkWell(
                                      child: Text(
                                        'Create One!',
                                        style: TextStyle(
                                          fontFamily: 'Colfax',
                                          fontSize: 8,
                                          color: Color.fromARGB(
                                              255, 128, 123, 229),
                                        ),
                                        textScaleFactor:
                                            ScaleSize.textScaleFactor(context),
                                      ),
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return enterpriseCreateAccount();
                                          },
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 40.0,
                                  right: 40,
                                ),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: InkWell(
                                    child: Text(
                                      'Use without Log in',
                                      style: TextStyle(
                                        fontFamily: 'Colfax',
                                        fontSize: 8,
                                        color:
                                            Color.fromARGB(255, 128, 123, 229),
                                      ),
                                      textScaleFactor:
                                          ScaleSize.textScaleFactor(context),
                                    ),
                                    onTap: () async {
                                      _showOtpVerificationDialog();
                                      if (isVerified) {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                enterpriseMyHomePage(),
                                          ),
                                        );
                                      }
                                    },
                                  ),
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
          );
        } else {
          return Dialog(
            child: Container(
              height: 600,
              width: 295,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 295,
                    height: 600,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 5.0,
                        right: 5,
                        top: 3,
                        bottom: 20,
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: SizedBox(
                              height: 130,
                              width: 130,
                              child: Image.asset(
                                'Naqli-final-logo.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: 30.0,
                              right: 20,
                              top: 40,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Email ID',
                                  style: TextStyle(
                                    fontFamily: 'Colfax',
                                    fontSize: 15,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                TextField(
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(4.0),
                                    border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8)),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  'Password',
                                  style: TextStyle(
                                    fontFamily: 'Colfax',
                                    fontSize: 15,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                TextField(
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(4.0),
                                    border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: 30.0,
                              right: 20,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 40,
                                  width: 230,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return enterpriseMyHomePage();
                                        },
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          Color.fromRGBO(128, 123, 229, 1),
                                      side: BorderSide(
                                        color: Color.fromRGBO(128, 123, 229, 1),
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(7),
                                      ),
                                    ),
                                    child: Text(
                                      'Login',
                                      style: TextStyle(
                                        fontFamily: 'Colfax',
                                        fontSize: 15,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 17),
                                InkWell(
                                  child: Text(
                                    'Forgot Password?',
                                    style: TextStyle(
                                      fontFamily: 'Colfax',
                                      fontSize: 12,
                                      color: Color.fromARGB(255, 128, 123, 229),
                                    ),
                                  ),
                                  onTap: () {},
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: 30.0,
                              right: 20,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Don't have an account?",
                                  style: TextStyle(
                                    fontFamily: 'Colfax',
                                    fontSize: 12,
                                    color: Colors.black,
                                  ),
                                ),
                                InkWell(
                                  child: Text(
                                    'Create One!',
                                    style: TextStyle(
                                      fontFamily: 'Colfax',
                                      fontSize: 12,
                                      color: Color.fromARGB(255, 128, 123, 229),
                                    ),
                                  ),
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return enterpriseCreateAccount();
                                      },
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: 30.0,
                              right: 20,
                            ),
                            child: Align(
                              alignment: Alignment.center,
                              child: InkWell(
                                child: Text(
                                  'Use without Log in',
                                  style: TextStyle(
                                    fontFamily: 'Colfax',
                                    fontSize: 12,
                                    color: Color.fromARGB(255, 128, 123, 229),
                                  ),
                                ),
                                onTap: () async {
                                  _showOtpVerificationDialog();
                                  if (isVerified) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            enterpriseMyHomePage(),
                                      ),
                                    );
                                  }
                                },
                              ),
                            ),
                          ),
                        ],
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
