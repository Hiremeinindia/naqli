import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/Controllers/allUsersFormController.dart';
import 'package:flutter_application_1/DialogBox/SingleTimeUser/optDialog.dart';
import 'package:flutter_application_1/Widgets/formText.dart';
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
  AllUsersFormController controller = AllUsersFormController();
  TextEditingController otpController = TextEditingController();
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
          String storedVerificationId = verificationId;
          ElevatedButton(
            onPressed: () {
              FirebaseAuth auth = FirebaseAuth.instance;
              String smsCode = otpController.text;
              PhoneAuthCredential _credential = PhoneAuthProvider.credential(
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

  TextEditingController contactNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return LayoutBuilder(
          builder: (BuildContext ctx, BoxConstraints constraints) {
        if (constraints.maxWidth >= 1180) {
          return Padding(
            padding: EdgeInsets.fromLTRB(18.w, 33.h, 18.w, 33.h),
            child: SingleChildScrollView(
              child: Expanded(
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(31))),
                  child: Container(
                    height: 280,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(31),
                      ),
                    ),
                    padding: EdgeInsets.fromLTRB(4.w, 4.h, 2.w, 4.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Center(
                                child: Text('Enter Mobile No',
                                    style: LoginpageText.helvetica30bold),
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
                                  hintStyle: DialogText.helvetica16sandal,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(0)),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                              child: ElevatedButton(
                                onPressed: () async {
                                  if (isValidPhoneNumber(
                                      contactNumberController.text)) {
                                    await _startPhoneAuth(
                                        contactNumberController.text);
                                  } else {
                                    showErrorDialog(
                                        "Invalid phone number format. Please enter a valid 10-digit phone number.");
                                  }
                                  await _startPhoneAuth(
                                      contactNumberController.text);
                                  showDialog(
                                    barrierColor: Colors.transparent,
                                    context: context,
                                    builder: (context) {
                                      return OTPDialog();
                                    },
                                  );
                                  // _startPhoneAuth(contactNumberController.text);
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Color.fromRGBO(60, 55, 148, 1),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(0),
                                    )),
                                child: Text("Get OTP",
                                    style: LoginpageText.helvetica16white),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 40),
                        Padding(
                          padding: EdgeInsets.only(left: 2.w, right: 5.w),
                          child: Divider(
                            color: Color.fromRGBO(112, 112, 112, 1),
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Don't have an account?",
                                style: HomepageText.helvetica16black),
                            InkWell(
                              child: Text('Create One!',
                                  style: LoginpageText.purplehelvetica),
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
            child: SingleChildScrollView(
              child: Expanded(
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(31))),
                  child: Container(
                    width: 400,
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Center(
                                child: Text('Enter Mobile No',
                                    style: LoginpageText.helvetica30bold),
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
                        SizedBox(height: 20),
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
                              hintStyle: DialogText.helvetica16sandal,
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
                                  return OTPDialog();
                                },
                              );
                              // _startPhoneAuth(contactNumberController.text);
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Color.fromRGBO(60, 55, 148, 1),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0),
                                )),
                            child: Text("Get OTP",
                                style: LoginpageText.helvetica16white),
                          ),
                        ),
                        SizedBox(height: 40),
                        Padding(
                          padding: EdgeInsets.only(left: 2.w, right: 2.w),
                          child: Divider(),
                        ),
                        SizedBox(height: 10),
                        Text("Don't have an account?",
                            style: HomepageText.helvetica16black),
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
                              style: LoginpageText.purplehelvetica),
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
