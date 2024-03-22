import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/Users/Enterprise/dashboard_page.dart';
import 'package:flutter_application_1/Users/SingleUser/dashboard_page.dart';
import 'package:flutter_application_1/Users/SuperUser/dashboard_page.dart';
import 'package:flutter_application_1/Widgets/customTextField.dart';

import 'package:flutter_application_1/loginPage.dart';
import 'package:sizer/sizer.dart';

import 'Widgets/formText.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount();

  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final _formKey = GlobalKey<FormState>();

  List<String> cities = ['City 1', 'City 2', 'City 3', 'City 4'];
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String? selectedCity;
  String? selectedType;
  String? selectedOption;
  bool isVerified = false;
  String firstName = '';
  String lastName = '';
  String phoneNumber = '';
  String enterpriseSelect = 'User';
  final ScrollController _Scroll1 = ScrollController();
  final ScrollController _Scroll2 = ScrollController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController legalNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController contactNumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController govtIdController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController alternateNumberController = TextEditingController();
  TextEditingController address2Controller = TextEditingController();
  TextEditingController idNumberController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController companyidNumberController = TextEditingController();
  TextEditingController accounttypeController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    try {
      DocumentSnapshot userDoc =
          await _firestore.collection('users').doc('user_id').get();

      setState(() {
        firstName = userDoc['firstName'];
        lastName = userDoc['lastName'];
        phoneNumber = userDoc['phoneNumber'];
      });
    } catch (e) {
      print('Error fetching user data: $e');
    }
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

  Future<void> _saveUserDataToFirestore() async {
    print("track2");
    try {
      CollectionReference usersCollection = _firestore.collection('users');

      await usersCollection.add({
        'firstName': firstNameController.text,
        'lastName': lastNameController.text,
        'email': emailController.text,
        'password': passwordController.text,
        'phoneNumber': contactNumberController.text,
        'address': addressController.text,
        'city': selectedCity,
        'govtId': selectedOption,
        'confirmPassword': confirmPasswordController.text,
        'alternateNumber': alternateNumberController.text,
        'address2': address2Controller.text,
        'accountType': selectedType,
        'idNumber': idNumberController.text,
      });

      print('User data saved to Firestore successfully!');
    } catch (e) {
      print('Error saving user data to Firestore: $e');
    }
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
        },
        codeSent: (String verificationId, [int? forceResendingToken]) {
          // Store the verification ID for later use (e.g., resend OTP)
          String storedVerificationId = verificationId;

          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => AlertDialog(
              title: Column(
                children: [
                  Text("Verify"),
                  Text("Your code was sent to your mobile no")
                ],
              ),
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
                        print("OTP verified successfully");
                        // Fetch user details from Firebase
                        User? user = FirebaseAuth.instance.currentUser;
                        String? phoneNumber = user?.phoneNumber;

                        // Check if any document exists in 'users' collection
                        FirebaseFirestore.instance
                            .collection('users')
                            .get()
                            .then((QuerySnapshot querySnapshot) {
                          if (querySnapshot.docs.isNotEmpty) {
                            // At least one document exists, you can fetch and display data here
                            // For simplicity, let's assume you want to display the first document's data
                            QueryDocumentSnapshot firstDocument =
                                querySnapshot.docs.first;
                            Map<String, dynamic> userData = firstDocument.data()
                                as Map<String, dynamic>; // Explicit cast

                            // Check if 'firstName' field exists in the document
                            if (userData.containsKey('firstName')) {
                              String? firstName = userData['firstName'];
                              // Display user details in a dialog box
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text("User Details"),
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Name: $firstName"),
                                        Text("Phone Number: $phoneNumber"),
                                      ],
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("Close"),
                                      ),
                                    ],
                                  );
                                },
                              );
                            } else {
                              print(
                                  'No firstName field found in Firestore document.');
                            }
                          } else {
                            // No documents found in 'users' collection
                            print('No user data found in Firestore.');
                          }
                        }).catchError((e) {
                          print("Error fetching user data: $e");
                        });

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

  void _showOtpVerificationDialog() {
    print("track4");

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Verification"),
          content: Column(
            children: [
              Text("Enter OTP"),
              TextField(
                controller: otpController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'OTP',
                ),
              ),
            ],
          ),
          actions: [
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Text("Cancel"),
            ),
            InkWell(
              onTap: () async {
                // Validate OTP and proceed if valid
                String enteredOtp = otpController.text;
                if (enteredOtp.isNotEmpty) {
                  // You can add OTP validation logic here
                  // If the OTP is valid, you can perform further actions
                  // For now, let's just close the dialog
                  Navigator.of(context).pop();
                } else {
                  // Handle case where OTP is empty
                }
              },
              child: Text("Verify"),
            ),
          ],
        );
      },
    );
  }

  bool isValidName(String name) {
    final RegExp nameRegExp = RegExp(r"^[A-Za-z']+([- ][A-Za-z']+)*$");
    return nameRegExp.hasMatch(name);
  }

  bool isValidEmail(String email) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  String? nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return '*Required';
    } else if (!isValidName(value)) {
      return 'Invalid format';
    }
    return null;
  }

  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return '*Required';
    } else if (!isValidEmail(value)) {
      return 'Invalid email format';
    }
    return null;
  }

  String? validatePassword(String? value) {
    RegExp regex =
        RegExp(r'^(?=.?[A-Z])(?=.?[a-z])(?=.?[0-9])(?=.?[!@#\$&*~]).{8,}$');
    if (value!.isEmpty) {
      return 'Please enter password';
    } else {
      if (!regex.hasMatch(value)) {
        return 'Enter valid password';
      } else {
        return null;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return LayoutBuilder(
          builder: (BuildContext ctx, BoxConstraints constraints) {
        if (constraints.maxWidth >= 1180) {
          return Padding(
            padding: EdgeInsets.only(
              left: 18.w,
              right: 18.w,
              top: 8.h,
              bottom: 8.h,
            ),
            child: Scrollbar(
              controller: _Scroll1,
              thumbVisibility: true,
              child: SingleChildScrollView(
                controller: _Scroll1,
                scrollDirection: Axis.vertical,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(31))),
                  child: Container(
                    padding: EdgeInsets.only(
                        left: 5.w, right: 5.w, top: 50, bottom: 45),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(31)),
                    height: 770,
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(child: SizedBox()),
                              Text(
                                'Create your account',
                                style: LoginpageText.helvetica20bold,
                              ),
                              Expanded(child: SizedBox()),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: ImageIcon(
                                  AssetImage('cancel.png'),
                                  color: Color.fromRGBO(112, 112, 112, 1),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Column(
                                children: [
                                  Text('First Name ',
                                      style: HomepageText.helvetica16black),
                                  SizedBox(
                                    height: 40,
                                  ),
                                  Text('Email Address',
                                      style: HomepageText.helvetica16black),
                                ],
                              ),
                              SizedBox(
                                width: 42,
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                            child: CustomTextfield(
                                          validator: nameValidator,
                                          controller: firstNameController,
                                          text: 'First Name',
                                        )),
                                        SizedBox(width: 25),
                                        Expanded(
                                            child: CustomTextfield(
                                          validator: nameValidator,
                                          controller: lastNameController,
                                          text: 'Last Name',
                                        )),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    CustomTextfield(
                                      controller: emailController,
                                      validator: emailValidator,
                                      text: 'Email address',
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Password',
                                      style: HomepageText.helvetica16black),
                                  SizedBox(
                                    height: 40,
                                  ),
                                  Text('Contact Number',
                                      style: HomepageText.helvetica16black),
                                  SizedBox(
                                    height: 40,
                                  ),
                                  Text('Address 1',
                                      style: HomepageText.helvetica16black),
                                  SizedBox(
                                    height: 40,
                                  ),
                                  Text('City',
                                      style: HomepageText.helvetica16black),
                                  SizedBox(
                                    height: 40,
                                  ),
                                  Text(
                                      enterpriseSelect == 'Enterprise'
                                          ? 'Company ID No'
                                          : 'Govt ID',
                                      style: HomepageText.helvetica16black),
                                ],
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomTextfield(
                                      controller: passwordController,
                                      validator: validatePassword,
                                      text: 'Password',
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    CustomTextfield(
                                      controller: contactNumberController,
                                      validator: (value) {
                                        if (value!.length != 10)
                                          return 'Mobile Number must be of 10 digit';
                                        else
                                          return null;
                                      },
                                      text: 'Phone Number',
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    CustomTextfield(
                                      controller: addressController,
                                      validator: nameValidator,
                                      text: 'Address',
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    SizedBox(
                                      height: 45,
                                      child: DropdownButtonFormField(
                                        isExpanded: true,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.all(5.0),
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5)),
                                          ),
                                        ),
                                        value: selectedCity,
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            selectedCity = newValue;
                                          });
                                        },
                                        items: cities
                                            .map<DropdownMenuItem<String>>(
                                                (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value,
                                                style: TextStyle(fontSize: 16)),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    enterpriseSelect == 'Enterprise'
                                        ? CustomTextfield(
                                            validator: nameValidator,
                                            controller:
                                                companyidNumberController,
                                            text: 'Id number',
                                          )
                                        : SizedBox(
                                            height: 45,
                                            child:
                                                DropdownButtonFormField<String>(
                                              isExpanded: true,
                                              value: selectedOption,
                                              decoration: InputDecoration(
                                                contentPadding:
                                                    EdgeInsets.all(5.0),
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(5)),
                                                ),
                                              ),
                                              onChanged: (String? newValue) {
                                                setState(() {
                                                  selectedOption = newValue;
                                                });
                                              },
                                              items: [
                                                DropdownMenuItem<String>(
                                                  value: 'National ID',
                                                  child: Text('National ID',
                                                      style: TextStyle(
                                                          fontSize: 16)),
                                                ),
                                                DropdownMenuItem<String>(
                                                  value: 'Iqama No.',
                                                  child: Text('Iqama No.',
                                                      style: TextStyle(
                                                          fontSize: 16)),
                                                ),
                                                DropdownMenuItem<String>(
                                                  value:
                                                      'Visit Visa / Border No',
                                                  child: Text(
                                                      'Visit Visa / Border No',
                                                      style: TextStyle(
                                                          fontSize: 16)),
                                                ),
                                              ],
                                            ),
                                          ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Confirm Password',
                                      style: HomepageText.helvetica16black),
                                  SizedBox(
                                    height: 40,
                                  ),
                                  Text('Alternate Number',
                                      style: HomepageText.helvetica16black),
                                  SizedBox(
                                    height: 40,
                                  ),
                                  Text('Address 2',
                                      style: HomepageText.helvetica16black),
                                  SizedBox(
                                    height: 40,
                                  ),
                                  Text('Account Type',
                                      style: HomepageText.helvetica16black),
                                  SizedBox(
                                    height: 40,
                                  ),
                                  Text(
                                      enterpriseSelect == 'Enterprise'
                                          ? 'Legal Name'
                                          : 'ID Number',
                                      style: HomepageText.helvetica16black),
                                ],
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomTextfield(
                                      controller: confirmPasswordController,
                                      validator: validatePassword,
                                      text: 'Confirm Password',
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    CustomTextfield(
                                      validator: (value) {
                                        if (value!.length != 10)
                                          return 'Mobile Number must be of 10 digit';
                                        else
                                          return null;
                                      },
                                      controller: alternateNumberController,
                                      text: 'Phone Number',
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    CustomTextfield(
                                      validator: nameValidator,
                                      controller: address2Controller,
                                      text: 'Address',
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    DropdownButtonHideUnderline(
                                      child: DropdownButton2<String>(
                                        value: selectedType,
                                        items: <String>[
                                          'User',
                                          'Super User',
                                          'Enterprise',
                                        ].map<DropdownMenuItem<String>>(
                                            (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value,
                                                style: HomepageText
                                                    .helvetica16black),
                                          );
                                        }).toList(),
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            selectedType = newValue;
                                            enterpriseSelect = selectedType!;
                                          });
                                        },
                                        buttonStyleData: ButtonStyleData(
                                          height: 45,
                                          width: 15.w,
                                          padding: EdgeInsets.only(
                                              left: 9, right: 9),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Color.fromRGBO(
                                                    112, 112, 112, 1)),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5)),
                                            color: Colors.white,
                                          ),
                                        ),
                                        iconStyleData: const IconStyleData(
                                          icon: Icon(
                                            Icons.arrow_drop_down_sharp,
                                          ),
                                          iconSize: 25,
                                          iconEnabledColor: Colors.black,
                                          iconDisabledColor: null,
                                        ),
                                        dropdownStyleData: DropdownStyleData(
                                          elevation: 0,
                                          maxHeight: 200,
                                          padding: EdgeInsets.all(3),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Color.fromRGBO(
                                                    112, 112, 112, 1)),
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(0),
                                              topRight: Radius.circular(0),
                                              bottomLeft: Radius.circular(5),
                                              bottomRight: Radius.circular(5),
                                            ),
                                            color: Colors.white,
                                          ),
                                          scrollPadding: EdgeInsets.all(5),
                                          scrollbarTheme: ScrollbarThemeData(
                                            thickness: MaterialStateProperty
                                                .all<double>(6),
                                            thumbVisibility:
                                                MaterialStateProperty.all<bool>(
                                                    true),
                                          ),
                                        ),
                                        menuItemStyleData: MenuItemStyleData(
                                          height: 30,
                                          padding: EdgeInsets.only(
                                              left: 9, right: 9),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    enterpriseSelect == 'Enterprise'
                                        ? CustomTextfield(
                                            validator: nameValidator,
                                            controller: legalNameController,
                                            text: 'Leagl name',
                                          )
                                        : CustomTextfield(
                                            validator: (value) {
                                              if (value!.length != 10)
                                                return 'Mobile Number must be of 10 digit';
                                              else
                                                return null;
                                            },
                                            controller: idNumberController,
                                            text: 'ID Number',
                                          ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 45,
                                child: ElevatedButton(
                                  onPressed: () async {
                                    if (_formKey.currentState!.validate()) {
                                      print("track1");
                                      await _startPhoneAuth(
                                          contactNumberController.text);
                                      // _showOtpVerificationDialog();
                                      // Save user data and start phone authentication
                                      await _saveUserDataToFirestore();
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Color.fromARGB(255, 128, 123, 229),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                  child: Text(
                                    'Create Account',
                                    style: TextStyle(
                                      fontFamily: 'Colfax',
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              SizedBox(
                                height: 45,
                                child: ElevatedButton(
                                  onPressed: () async {
                                    if (_formKey.currentState!.validate()) {
                                      print("track1");
                                      await _startPhoneAuth(
                                          contactNumberController.text);
                                      // _showOtpVerificationDialog();
                                      // Save user data and start phone authentication
                                      await _saveUserDataToFirestore();
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    fixedSize:
                                        const Size.fromWidth(double.infinity),
                                    backgroundColor:
                                        Color.fromARGB(112, 112, 112, 1),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          5), // Adjust border radius as needed
                                    ),
                                  ),
                                  child: Text(
                                    'Cancel',
                                    style: TextStyle(
                                      fontFamily: 'Colfax',
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Already have an account? ',
                                  style: HomepageText.helvetica16black),
                              InkWell(
                                onTap: () {
                                  if (selectedType == 'User') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            SingleUserDashboardPage(),
                                      ),
                                    );
                                  } else if (selectedType == 'Super User') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            SuperUserDashboardPage(),
                                      ),
                                    );
                                  } else if (selectedType == 'Enterprise') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            EnterDashboardPage(),
                                      ),
                                    );
                                  }
                                },
                                child: Text(
                                  'Sign In',
                                  style: TextStyle(
                                    color: Color.fromRGBO(128, 123, 229, 1),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Divider(
                            color: const Color.fromRGBO(112, 112, 112, 1),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('By Clicking Sign up, you agree to the ',
                                  style: HomepageText.helvetica16black),
                              Text(
                                'Terms & Privacy policy.',
                                style: TextStyle(
                                  color: Color.fromRGBO(128, 123, 229, 1),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        } else {
          return Dialog(
              child: SingleChildScrollView(
                  child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(31),
                  bottomLeft: Radius.circular(31),
                  topRight: Radius.circular(31),
                  bottomRight: Radius.circular(31),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                    left: 2.5.h, right: 2.5.h, top: 3.w, bottom: 3.w),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Text(
                          'Create your account',
                          style: TextStyle(
                            fontFamily: 'ColfaxBold',
                            fontSize: 15,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                              width: 150,
                              child: Text('First Name ',
                                  style: HomepageText.helvetica16black)),
                          SizedBox(width: 5),
                          Expanded(
                            child: SizedBox(
                              height: 40,
                              child: TextFormField(
                                controller: firstNameController,
                                validator: nameValidator,
                                decoration: InputDecoration(
                                  hintStyle: TextStyle(fontSize: 15),
                                  hintText: 'First Name',
                                  contentPadding: EdgeInsets.all(2.0),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(2.0)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          SizedBox(
                              width: 150,
                              child: Text('Last Name',
                                  style: HomepageText.helvetica16black)),
                          SizedBox(width: 5),
                          Expanded(
                            child: SizedBox(
                              height: 40,
                              child: TextFormField(
                                controller: lastNameController,
                                validator: nameValidator,
                                decoration: InputDecoration(
                                  hintStyle: TextStyle(fontSize: 15),
                                  hintText: 'Last Name',
                                  contentPadding: EdgeInsets.all(1.0),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(2.0)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          SizedBox(
                              width: 150,
                              child: Text('Email Address',
                                  style: HomepageText.helvetica16black)),
                          SizedBox(width: 5),
                          Expanded(
                            child: SizedBox(
                              height: 40,
                              child: TextFormField(
                                controller: emailController,
                                validator: emailValidator,
                                decoration: InputDecoration(
                                  hintStyle: TextStyle(fontSize: 15),
                                  hintText: 'Email address',
                                  contentPadding: EdgeInsets.all(2.0),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(2)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          SizedBox(
                              width: 150,
                              child: Text('Password',
                                  style: HomepageText.helvetica16black)),
                          SizedBox(width: 5),
                          Expanded(
                            child: SizedBox(
                              height: 40,
                              child: TextFormField(
                                controller: emailController,
                                validator: emailValidator,
                                decoration: InputDecoration(
                                  hintStyle: TextStyle(fontSize: 15),
                                  hintText: 'Password',
                                  contentPadding: EdgeInsets.all(2.0),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(2)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          SizedBox(
                              width: 150,
                              child: Text('Confirm Password',
                                  style: HomepageText.helvetica16black)),
                          SizedBox(width: 5),
                          Expanded(
                            child: SizedBox(
                              height: 40,
                              child: TextFormField(
                                controller: emailController,
                                validator: emailValidator,
                                decoration: InputDecoration(
                                  hintStyle: TextStyle(fontSize: 15),
                                  hintText: 'Password',
                                  contentPadding: EdgeInsets.all(2.0),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(2)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          SizedBox(
                              width: 150,
                              child: Text('Contact Number',
                                  style: HomepageText.helvetica16black)),
                          SizedBox(width: 5),
                          Expanded(
                            child: SizedBox(
                              height: 40,
                              child: TextFormField(
                                controller: contactNumberController,
                                validator: (value) {
                                  if (value!.length != 10)
                                    return 'Mobile Number must be of 10 digit';
                                  else
                                    return null;
                                },
                                decoration: InputDecoration(
                                  hintStyle: TextStyle(fontSize: 15),
                                  hintText: 'Phone Number',
                                  contentPadding: EdgeInsets.all(5.0),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          SizedBox(
                              width: 150,
                              child: Text('Alternate Number',
                                  style: HomepageText.helvetica16black)),
                          SizedBox(width: 5),
                          Expanded(
                            child: SizedBox(
                              height: 40,
                              child: TextFormField(
                                validator: (value) {
                                  if (value!.length != 10)
                                    return 'Mobile Number must be of 10 digit';
                                  else
                                    return null;
                                },
                                controller: alternateNumberController,
                                decoration: InputDecoration(
                                  hintStyle: TextStyle(fontSize: 15),
                                  hintText: 'Phone Number',
                                  contentPadding: EdgeInsets.all(5.0),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          SizedBox(
                              width: 150,
                              child: Text('Address 1',
                                  style: HomepageText.helvetica16black)),
                          SizedBox(width: 5),
                          Expanded(
                            child: SizedBox(
                              height: 40,
                              child: TextFormField(
                                controller: addressController,
                                validator: nameValidator,
                                decoration: InputDecoration(
                                  hintStyle: TextStyle(fontSize: 15),
                                  hintText: 'Address',
                                  contentPadding: EdgeInsets.all(5.0),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          SizedBox(
                              width: 150,
                              child: Text('Address 2',
                                  style: HomepageText.helvetica16black)),
                          SizedBox(width: 5),
                          Expanded(
                            child: SizedBox(
                              height: 40,
                              child: TextFormField(
                                controller: addressController,
                                validator: nameValidator,
                                decoration: InputDecoration(
                                  hintStyle: TextStyle(fontSize: 15),
                                  hintText: 'Address',
                                  contentPadding: EdgeInsets.all(5.0),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          SizedBox(
                              width: 150,
                              child: Text('Çity',
                                  style: HomepageText.helvetica16black)),
                          SizedBox(width: 5),
                          Expanded(
                            child: SizedBox(
                              height: 40,
                              child: DropdownButtonFormField(
                                isExpanded: true,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(5.0),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                  ),
                                ),
                                value: selectedCity,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedCity = newValue;
                                  });
                                },
                                items: cities.map<DropdownMenuItem<String>>(
                                    (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value,
                                        style: TextStyle(fontSize: 14)),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          SizedBox(
                              width: 150,
                              child: Text('Account Type',
                                  style: HomepageText.helvetica16black)),
                          SizedBox(width: 5),
                          Expanded(
                            child: SizedBox(
                              height: 40,
                              child: DropdownButtonFormField(
                                isExpanded: true,
                                value: selectedType,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(5.0),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                  ),
                                ),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedType = newValue;
                                  });
                                },
                                items: [
                                  DropdownMenuItem<String>(
                                    value: 'Individual',
                                    child: Text('Individual',
                                        style: TextStyle(fontSize: 14)),
                                  ),
                                  DropdownMenuItem<String>(
                                    value: 'Company',
                                    child: Text('Company',
                                        style: TextStyle(fontSize: 14)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          SizedBox(
                              width: 150,
                              child: Text('Govt ID',
                                  style: HomepageText.helvetica16black)),
                          SizedBox(width: 5),
                          Expanded(
                            child: SizedBox(
                              height: 40,
                              child: DropdownButtonFormField(
                                isExpanded: true,
                                value: selectedOption,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(5.0),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                  ),
                                ),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedOption = newValue;
                                  });
                                },
                                items: [
                                  DropdownMenuItem<String>(
                                    value: 'National ID',
                                    child: Text(
                                      'National ID',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  ),
                                  DropdownMenuItem<String>(
                                    value: 'Iqama No.',
                                    child: Text(
                                      'Iqama No.',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  ),
                                  DropdownMenuItem<String>(
                                    value: 'Visit Visa / Border No',
                                    child: Text(
                                      'Visit Visa / Border No',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          SizedBox(
                              width: 150,
                              child: Text('ID Number',
                                  style: HomepageText.helvetica16black)),
                          SizedBox(width: 5),
                          Expanded(
                            child: SizedBox(
                              height: 40,
                              child: TextFormField(
                                controller: addressController,
                                validator: nameValidator,
                                decoration: InputDecoration(
                                  hintStyle: TextStyle(fontSize: 13),
                                  hintText: 'ID Number',
                                  contentPadding: EdgeInsets.all(5.0),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 40,
                            child: ElevatedButton(
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  print("track1");
                                  await _startPhoneAuth(
                                      contactNumberController.text);
                                  // _showOtpVerificationDialog();
                                  // Save user data and start phone authentication
                                  await _saveUserDataToFirestore();
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                fixedSize:
                                    const Size.fromWidth(double.infinity),
                                backgroundColor:
                                    Color.fromARGB(255, 128, 123, 229),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      5), // Adjust border radius as needed
                                ),
                              ),
                              child: Text(
                                'Create Account',
                                style: TextStyle(
                                  fontFamily: 'Colfax',
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 7),
                          SizedBox(
                            height: 40,
                            child: ElevatedButton(
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  print("track1");
                                  await _startPhoneAuth(
                                      contactNumberController.text);
                                  // _showOtpVerificationDialog();
                                  // Save user data and start phone authentication
                                  await _saveUserDataToFirestore();
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                fixedSize:
                                    const Size.fromWidth(double.infinity),
                                backgroundColor:
                                    Color.fromARGB(112, 112, 112, 1),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      5), // Adjust border radius as needed
                                ),
                              ),
                              child: Text(
                                'Cancel',
                                style: TextStyle(
                                  fontFamily: 'Colfax',
                                  fontSize: 10,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Already have an account? ',
                              style: HomepageText.helvetica16black),
                          InkWell(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return LoginPage();
                                },
                              );
                            },
                            child: Text('Sign In',
                                style: LoginpageText.purplehelvetica),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )));
        }
      });
    });
  }
}
