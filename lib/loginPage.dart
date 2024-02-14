import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Widgets/customButton.dart';
import 'package:flutter_application_1/createAccount.dart';
import 'package:flutter_application_1/homepage.dart';

import '../main.dart';

// ignore: must_be_immutable
class LoginPage extends StatefulWidget {
  const LoginPage();
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isVerified = false;
  TextEditingController otpController = TextEditingController();

  TextEditingController contactNumberController = TextEditingController();
  void _showOtpVerificationDialog() {
    print("track4");

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(child: Text("Verify Account")),
          content: Container(
            height: 200, // Set the desired height
            width: 300, // Set the desired width
            child: Column(
              children: [
                Text("Enter Mobile Number"),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
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
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        _startPhoneAuth(contactNumberController.text);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(60, 55, 148, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: Text(
                        "Get OTP",
                        style: TextStyle(
                          fontFamily: 'Colfax',
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Row(
                children: [
                  Text(
                    "Didn't receive an email?",
                    style: TextStyle(
                      fontFamily: 'Colfax',
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      // Implement the logic to resend the OTP
                      // For now, let's close the dialog
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Resend",
                      style: TextStyle(
                        fontFamily: 'Colfax',
                        fontSize: 14,
                        color: Color.fromRGBO(60, 55, 148, 1),
                      ),
                    ),
                  ),
                ],
              ),
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
                            builder: (context) => MyHomePage(),
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
                        Align(
                          alignment: Alignment.topRight,
                          child: IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: Icon(Icons.cancel),
                          ),
                        ),
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
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              TextField(
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(5.0),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
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
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              TextField(
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(5.0),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                height: 43,
                                width: 140,
                                child: ElevatedButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return MyHomePage();
                                      },
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: Color.fromRGBO(112, 112, 112, 1),
                                    side: BorderSide(
                                      color: Color.fromRGBO(112, 112, 112, 1),
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  child: Text(
                                    'Login',
                                    style: TextStyle(
                                      fontFamily: 'Colfax',
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                child: Text(
                                  'Forgot Password?',
                                  style: TextStyle(
                                    fontFamily: 'Colfax',
                                    fontSize: 16,
                                    color: Color.fromARGB(255, 128, 123, 229),
                                  ),
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
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                              InkWell(
                                child: Text(
                                  'Create One!',
                                  style: TextStyle(
                                    fontFamily: 'Colfax',
                                    fontSize: 16,
                                    color: Color.fromARGB(255, 128, 123, 229),
                                  ),
                                ),
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return CreateAccount();
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
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 128, 123, 229),
                                ),
                              ),
                              onTap: () async {
                                _showOtpVerificationDialog();
                                if (isVerified) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MyHomePage(),
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
          ],
        ),
      ),
    );
  }
}
