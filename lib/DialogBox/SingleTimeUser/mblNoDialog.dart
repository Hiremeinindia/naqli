import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/Controllers/allUsersFormController.dart';
import 'package:flutter_application_1/DialogBox/SingleTimeUser/optDialog.dart';
import 'package:flutter_application_1/DialogBox/SingleTimeUser/verfiedDialog.dart';
import 'package:flutter_application_1/Users/SingleTimeUser/availableUnits.dart';
import 'package:flutter_application_1/Widgets/customButton.dart';
import 'package:flutter_application_1/Widgets/formText.dart';
import 'package:flutter_application_1/DialogBox/bookingSuccessful.dart';
import 'package:sizer/sizer.dart';

import '../../createAccount.dart';
import '../../homePage.dart';

class MblNoDialog extends StatefulWidget {
  const MblNoDialog();

  @override
  _MblNoDialogState createState() => _MblNoDialogState();
}

class _MblNoDialogState extends State<MblNoDialog> {
  bool isVerified = false;
  TextEditingController otp1 = TextEditingController();
  TextEditingController otp2 = TextEditingController();
  TextEditingController otp3 = TextEditingController();
  TextEditingController otp4 = TextEditingController();
  TextEditingController otp5 = TextEditingController();
  TextEditingController otp6 = TextEditingController();
  AllUsersFormController controller = AllUsersFormController();
  TextEditingController otpController = TextEditingController();
  TextEditingController contactNumberController = TextEditingController();
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

  bool isValidPhoneNumber(String phoneNumber) {
    // Regular expression pattern to match a 10-digit phone number
    RegExp regex = RegExp(r'^[0-9]{10}$');

    // Check if the phone number matches the pattern
    if (regex.hasMatch(phoneNumber)) {
      // Phone number format is valid
      return true;
    } else {
      // Phone number format is invalid
      return false;
    }
  }

  String?
      storedVerificationId; // Declare a variable to store the verification ID

  Future<void> _startPhoneAuth(String phoneNumber) async {
    print("mobtrack3");

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
          storedVerificationId = verificationId;

          // Show the dialog to enter OTP
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return Padding(
                padding: EdgeInsets.fromLTRB(4.w, 10.h, 4.w, 10.h),
                child: Container(
                  height: 360,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(31),
                    ),
                  ),
                  padding: EdgeInsets.fromLTRB(4.w, 4.h, 4.w, 4.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Center(
                              child: Text('Verify',
                                  style: TabelText.helveticablack19),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: ImageIcon(
                              AssetImage('cancel.png'),
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20), // Adjust spacing as needed
                      Text(
                        'Your code was sent to your mobile no',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Helvetica',
                          fontSize: 22,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Your OTP input fields
                        ],
                      ),
                      SizedBox(height: 20), // Adjust spacing as needed
                      SizedBox(
                        height: 40,
                        child: ElevatedButton(
                          onPressed: () async {
                            String smsCode = otp1.text +
                                otp2.text +
                                otp3.text +
                                otp4.text +
                                otp5.text +
                                otp6.text; // Concatenate all OTP fields
                            PhoneAuthCredential _credential =
                                PhoneAuthProvider.credential(
                              verificationId: storedVerificationId!,
                              smsCode: smsCode,
                            );

                            FirebaseAuth.instance
                                .signInWithCredential(_credential)
                                .then((result) {
                              if (result.user != null) {
                                print("OTP verified successfully");
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MyHomePage(),
                                  ),
                                );
                              } else {
                                showErrorDialog(
                                    "Invalid verification code. Please enter the correct code.");
                              }
                            }).catchError((e) {
                              print("Error signing in with credential: $e");
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromRGBO(60, 55, 148, 1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text("Verify", style: TabelText.dialogtext1),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 2.w, right: 2.w),
                        child: Divider(),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Didn't receive OTP ?",
                              style: TabelText.helvetica),
                          InkWell(
                            child: Text('Resend',
                                style: FormTextStyle.purplehelvetica),
                            onTap: () {
                              showDialog(
                                barrierColor: Colors.grey.withOpacity(0.5),
                                context: context,
                                builder: (context) {
                                  return CreateAccount();
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          // Handle code auto retrieval timeout if needed
        },
        timeout: Duration(seconds: 45),
      );
    } catch (e) {
      print('Error during phone authentication: $e');
      showErrorDialog(
          "Error during phone number verification. Please try again.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return LayoutBuilder(
          builder: (BuildContext ctx, BoxConstraints constraints) {
        if (constraints.maxWidth >= 1180) {
          return Padding(
            padding: EdgeInsets.fromLTRB(16.w, 6.h, 16.w, 6.h),
            child: Dialog(
              child: SingleChildScrollView(
                child: Expanded(
                  child: Container(
                    height: 280,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(31),
                      ),
                    ),
                    padding: EdgeInsets.fromLTRB(4.w, 2.h, 1.w, 4.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Enter Mobile NO',
                                style: TabelText.helveticablack19),
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: ImageIcon(
                                AssetImage('cancel.png'),
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
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
                                  hintText: '99999 99999',
                                  contentPadding: EdgeInsets.only(
                                    left: 1.w,
                                  ),
                                  hintStyle: TextStyle(
                                      color: Color.fromRGBO(238, 225, 225, 1)),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(0)),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                              child: ElevatedButton(
                                onPressed: () async {
                                  await _startPhoneAuth(
                                      contactNumberController.text);
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Color.fromRGBO(60, 55, 148, 1),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(0),
                                    )),
                                child: Text("Get OTP",
                                    style: TabelText.dialogtext1),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 40),
                        Padding(
                          padding: EdgeInsets.only(left: 2.w, right: 5.w),
                          child: Divider(),
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Don't have an account?",
                                style: TabelText.helvetica),
                            InkWell(
                              child: Text('Create One!',
                                  style: FormTextStyle.purplehelvetica),
                              onTap: () {
                                showDialog(
                                  barrierColor: Colors.grey.withOpacity(0.5),
                                  context: context,
                                  builder: (context) {
                                    return CreateAccount();
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        } else {
          return Padding(
            padding: EdgeInsets.fromLTRB(2.w, 6.h, 2.w, 6.h),
            child: Dialog(
              child: SingleChildScrollView(
                child: Expanded(
                  child: Container(
                    width: 350,
                    height: 350,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(31),
                      ),
                    ),
                    padding: EdgeInsets.fromLTRB(1.5.w, 4.h, 1.5.w, 4.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Enter Mobile NO',
                          style: TextStyle(
                            fontFamily: 'Colfax',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 20),
                        SizedBox(
                          height: 30,
                          width: 200,
                          child: TextField(
                            controller: contactNumberController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(0)),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        SizedBox(
                          height: 30,
                          child: ElevatedButton(
                            onPressed: () {
                              showDialog(
                                barrierColor: Colors.transparent,
                                context: context,
                                builder: (context) {
                                  return OTPDialog(
                                      verificationId: storedVerificationId);
                                },
                              );
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Color.fromRGBO(60, 55, 148, 1),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0),
                                )),
                            child: Text(
                              "Get OTP",
                              style: TextStyle(
                                fontFamily: 'Colfax',
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 40),
                        Padding(
                          padding: EdgeInsets.only(left: 2.w, right: 2.w),
                          child: Divider(),
                        ),
                        SizedBox(height: 10),
                        Text("Don't have an account?",
                            style: TabelText.helvetica),
                        SizedBox(height: 10),
                        InkWell(
                          onTap: () {
                            showDialog(
                              barrierColor: Colors.grey.withOpacity(0.5),
                              context: context,
                              builder: (context) {
                                return CreateAccount();
                              },
                            );
                          },
                          child: Text('Create One!',
                              style: FormTextStyle.purplehelvetica),
                        ),
                      ],
                    ),
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
