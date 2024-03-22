import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/Controllers/allUsersFormController.dart';
import 'package:flutter_application_1/Users/Enterprise/dashboard_page.dart';
import 'package:flutter_application_1/DialogBox/SingleTimeUser/mblNoDialog.dart';
import 'package:flutter_application_1/DialogBox/SingleTimeUser/optDialog.dart';
import 'package:flutter_application_1/Users/SingleUser/dashboard_page.dart';
import 'package:flutter_application_1/Users/SuperUser/dashboard_page.dart';
import 'package:flutter_application_1/Widgets/customTextField.dart';
import 'package:flutter_application_1/Widgets/formText.dart';

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
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final ScrollController _Scroll1 = ScrollController();
  final ScrollController _Scroll2 = ScrollController();
  AllUsersFormController controller = AllUsersFormController();
  TextEditingController otpController = TextEditingController();
  @override
  void initState() {
    super.initState();
    // fetchUserData();
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
        'firstName': controller.firstName.text,
        'lastName': controller.lastName.text,
        'legalName': controller.legalName.text,
        'email': controller.email.text,
        'password': controller.password.text,
        'contactNumber': controller.contactNumber.text,
        'address': controller.address.text,
        'govtId': controller.govtId.text,
        'confirmPassword': controller.confirmPassword.text,
        'alternateNumber': controller.alternateNumber.text,
        'address2': controller.address2.text,
        'idNumber': controller.idNumber.text,
        'city': controller.city.text,
        'companyidNumber': controller.companyidNumber.text,
        'accounttype': controller.accounttype.text,
      });

      print('User data saved to Firestore successfully!');
    } catch (e) {
      print('Error saving user data to Firestore: $e');
    }
  }

  Future<void> _showDialog() async {
    print("track3");
    Padding(
      padding: EdgeInsets.fromLTRB(15.w, 6.h, 15.w, 6.h),
      child: Dialog(
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
                  controller: controller.contactNumber,
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
                  onPressed: () async {
                    await _startPhoneAuth(controller.contactNumber.text);
                    showDialog(
                      barrierColor: Colors.transparent,
                      context: context,
                      builder: (context) {
                        return OTPDialog();
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
              Text("Don't have an account?", style: TabelText.helvetica),
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
                child:
                    Text('Create One!', style: FormTextStyle.purplehelvetica),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _startPhoneAuth(String phoneNumber) async {
    FirebaseAuth _auth = FirebaseAuth.instance;

    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: "+91${controller.contactNumber.text}",
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
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          // Handle code auto retrieval timeout (optional)
        },
      );
    } catch (e) {
      print('Error during phone authentication: $e');
    }
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
                                          // validator: nameValidator,
                                          controller: controller.firstName,
                                          text: 'First Name',
                                        )),
                                        SizedBox(width: 25),
                                        Expanded(
                                            child: CustomTextfield(
                                          // validator: nameValidator,
                                          controller: controller.lastName,
                                          text: 'Last Name',
                                        )),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    CustomTextfield(
                                      controller: controller.email,
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
                                      controller: controller.password,
                                      // validator: validatePassword,
                                      text: 'Password',
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    CustomTextfield(
                                      controller: controller.contactNumber,
                                      // validator: (value) {
                                      //   if (value!.length != 10)
                                      //     return 'Mobile Number must be of 10 digit';
                                      //   else
                                      //     return null;
                                      // },
                                      text: 'Phone Number',
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    CustomTextfield(
                                      controller: controller.address,
                                      // validator: nameValidator,
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
                                            // validator: nameValidator,
                                            controller:
                                                controller.companyidNumber,
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
                                      controller: controller.confirmPassword,
                                      // validator: validatePassword,
                                      text: 'Confirm Password',
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    CustomTextfield(
                                      // validator: (value) {
                                      //   if (value!.length != 10)
                                      //     return 'Mobile Number must be of 10 digit';
                                      //   else
                                      //     return null;
                                      // },
                                      controller: controller.alternateNumber,
                                      text: 'Phone Number',
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    CustomTextfield(
                                      // validator: nameValidator,
                                      controller: controller.address2,
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
                                            // validator: nameValidator,
                                            controller: controller.legalName,
                                            text: 'Leagl name',
                                          )
                                        : CustomTextfield(
                                            // validator: (value) {
                                            //   if (value!.length != 10)
                                            //     return 'Mobile Number must be of 10 digit';
                                            //   else
                                            //     return null;
                                            // },
                                            controller: controller.idNumber,
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
                                      showDialog(
                                        barrierColor:
                                            Colors.grey.withOpacity(0.5),
                                        context: context,
                                        builder: (context) {
                                          return MblNoDialog();
                                        },
                                      );

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
                                          controller.contactNumber.text);
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
                                onTap: () async {
                                  showDialog(
                                    barrierColor: Colors.grey.withOpacity(0.5),
                                    context: context,
                                    builder: (context) {
                                      return MblNoDialog();
                                    },
                                  );
                                  try {
                                    UserCredential userCredential = await _auth
                                        .createUserWithEmailAndPassword(
                                      email: controller.email.text,
                                      password: controller.password.text,
                                    );
                                    // User creation successful
                                    print(
                                        "User created: ${userCredential.user!.email}");
                                    await _createAccount(
                                        userCredential.user!.uid,
                                        selectedType.toString());
                                    print('value passed$selectedType');

                                    // Navigate to different pages based on selectedType
                                    if (selectedType == 'Enterprise') {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                EnterDashboardPage()),
                                      );
                                    } else if (selectedType == 'Super User') {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SuperUserDashboardPage()),
                                      );
                                    } else if (selectedType == 'User') {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SingleUserDashboardPage()),
                                      );
                                    } else {
                                      // Handle invalid selectedType
                                      print(
                                          'Invalid selected type: $selectedType');
                                    }
                                  } catch (e) {
                                    print("Error creating user: $e");
                                  }
                                  // Call _register function when onTap is triggered
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
          return Padding(
              padding: EdgeInsets.only(
                left: 18.w,
                right: 18.w,
                top: 8.h,
                bottom: 8.h,
              ),
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
                    child: SingleChildScrollView(
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
                            height: 30,
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
                                  child: CustomTextfield(
                                // validator: nameValidator,
                                controller: controller.firstName,
                                text: 'First Name',
                              )),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                  width: 150,
                                  child: Text('Last Name',
                                      style: HomepageText.helvetica16black)),
                              SizedBox(width: 5),
                              Expanded(
                                  child: CustomTextfield(
                                // validator: nameValidator,
                                controller: controller.lastName,
                                text: 'Last Name',
                              )),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                  width: 150,
                                  child: Text('Email Address',
                                      style: HomepageText.helvetica16black)),
                              SizedBox(width: 5),
                              Expanded(
                                child: CustomTextfield(
                                  controller: controller.email,
                                  validator: emailValidator,
                                  text: 'Email address',
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                  width: 150,
                                  child: Text('Password',
                                      style: HomepageText.helvetica16black)),
                              SizedBox(width: 5),
                              Expanded(
                                child: CustomTextfield(
                                  controller: controller.password,
                                  validator: validatePassword,
                                  text: 'Password',
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                  width: 150,
                                  child: Text('Confirm Password',
                                      style: HomepageText.helvetica16black)),
                              SizedBox(width: 5),
                              Expanded(
                                child: CustomTextfield(
                                  controller: controller.confirmPassword,
                                  validator: validatePassword,
                                  text: 'Confirm Password',
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                  width: 150,
                                  child: Text('Contact Number',
                                      style: HomepageText.helvetica16black)),
                              SizedBox(width: 5),
                              Expanded(
                                child: CustomTextfield(
                                  // validator: (value) {
                                  //   if (value!.length != 10)
                                  //     return 'Mobile Number must be of 10 digit';
                                  //   else
                                  //     return null;
                                  // },
                                  controller: controller.contactNumber,
                                  text: 'Phone Number',
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                  width: 150,
                                  child: Text('Alternate Number',
                                      style: HomepageText.helvetica16black)),
                              SizedBox(width: 5),
                              Expanded(
                                child: CustomTextfield(
                                  // validator: (value) {
                                  //   if (value!.length != 10)
                                  //     return 'Mobile Number must be of 10 digit';
                                  //   else
                                  //     return null;
                                  // },
                                  controller: controller.alternateNumber,
                                  text: 'Phone Number',
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                  width: 150,
                                  child: Text('Address 1',
                                      style: HomepageText.helvetica16black)),
                              SizedBox(width: 5),
                              Expanded(
                                child: CustomTextfield(
                                  // validator: nameValidator,
                                  controller: controller.address,
                                  text: 'Address',
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                  width: 150,
                                  child: Text('Address 2',
                                      style: HomepageText.helvetica16black)),
                              SizedBox(width: 5),
                              Expanded(
                                child: CustomTextfield(
                                  // validator: nameValidator,
                                  controller: controller.address2,
                                  text: 'Address',
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                  width: 150,
                                  child: Text('Çity',
                                      style: HomepageText.helvetica16black)),
                              SizedBox(width: 5),
                              Expanded(
                                child: SizedBox(
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
                                    items: cities.map<DropdownMenuItem<String>>(
                                        (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value,
                                            style: TextStyle(fontSize: 16)),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                  width: 150,
                                  child: Text('Account Type',
                                      style: HomepageText.helvetica16black)),
                              SizedBox(width: 5),
                              Expanded(
                                child: DropdownButtonHideUnderline(
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
                                            style:
                                                HomepageText.helvetica16black),
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
                                      padding:
                                          EdgeInsets.only(left: 9, right: 9),
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
                                        thickness:
                                            MaterialStateProperty.all<double>(
                                                6),
                                        thumbVisibility:
                                            MaterialStateProperty.all<bool>(
                                                true),
                                      ),
                                    ),
                                    menuItemStyleData: MenuItemStyleData(
                                      height: 30,
                                      padding:
                                          EdgeInsets.only(left: 9, right: 9),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 150,
                                child: Text(
                                    enterpriseSelect == 'Enterprise'
                                        ? 'Company ID No'
                                        : 'Govt ID',
                                    style: HomepageText.helvetica16black),
                              ),
                              SizedBox(width: 5),
                              Expanded(
                                child: enterpriseSelect == 'Enterprise'
                                    ? CustomTextfield(
                                        // validator: nameValidator,
                                        controller: controller.companyidNumber,
                                        text: 'Id number',
                                      )
                                    : SizedBox(
                                        height: 45,
                                        child: DropdownButtonFormField<String>(
                                          isExpanded: true,
                                          value: selectedOption,
                                          decoration: InputDecoration(
                                            contentPadding: EdgeInsets.all(5.0),
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
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
                                                  style:
                                                      TextStyle(fontSize: 16)),
                                            ),
                                            DropdownMenuItem<String>(
                                              value: 'Iqama No.',
                                              child: Text('Iqama No.',
                                                  style:
                                                      TextStyle(fontSize: 16)),
                                            ),
                                            DropdownMenuItem<String>(
                                              value: 'Visit Visa / Border No',
                                              child: Text(
                                                  'Visit Visa / Border No',
                                                  style:
                                                      TextStyle(fontSize: 16)),
                                            ),
                                          ],
                                        ),
                                      ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 150,
                                child: Text(
                                    enterpriseSelect == 'Enterprise'
                                        ? 'Legal Name'
                                        : 'ID Number',
                                    style: HomepageText.helvetica16black),
                              ),
                              SizedBox(width: 5),
                              Expanded(
                                child: enterpriseSelect == 'Enterprise'
                                    ? CustomTextfield(
                                        // validator: nameValidator,
                                        controller: controller.legalName,
                                        text: 'Leagl name',
                                      )
                                    : CustomTextfield(
                                        // validator: (value) {
                                        //   if (value!.length != 10)
                                        //     return 'Mobile Number must be of 10 digit';
                                        //   else
                                        //     return null;
                                        // },
                                        controller: controller.idNumber,
                                        text: 'ID Number',
                                      ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 30,
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
                                          controller.contactNumber.text);
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
                                          controller.contactNumber.text);
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
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Already have an account? ',
                                  style: HomepageText.helvetica16black),
                              InkWell(
                                onTap: () async {
                                  try {
                                    UserCredential userCredential = await _auth
                                        .createUserWithEmailAndPassword(
                                      email: controller.email.text,
                                      password: controller.password.text,
                                    );
                                    // User creation successful
                                    print(
                                        "User created: ${userCredential.user!.email}");
                                    await _createAccount(
                                        userCredential.user!.uid,
                                        selectedType.toString());
                                    print('value passed$selectedType');

                                    // Navigate to different pages based on selectedType
                                    if (selectedType == 'Enterprise') {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                EnterDashboardPage()),
                                      );
                                    } else if (selectedType == 'Super User') {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SuperUserDashboardPage()),
                                      );
                                    } else if (selectedType == 'User') {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SingleUserDashboardPage()),
                                      );
                                    } else {
                                      // Handle invalid selectedType
                                      print(
                                          'Invalid selected type: $selectedType');
                                    }
                                  } catch (e) {
                                    print("Error creating user: $e");
                                  }
                                  // Call _register function when onTap is triggered
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
                          SizedBox(
                            height: 20,
                          ),
                          Divider(
                            color: const Color.fromRGBO(112, 112, 112, 1),
                          ),
                          SizedBox(
                            height: 20,
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
              ));
        }
      });
    });
  }

  Future<void> _createAccount(String uid, String selectedType) async {
    try {
      String userCollection;
      Map<String, dynamic> userData = {
        'firstName': controller.firstName.text,
        'lastName': controller.lastName.text,
        'email': controller.email.text,
        'password': controller.password.text,
        'contactNumber': controller.contactNumber.text,
        'address': controller.address.text,
        'alternateNumber': controller.alternateNumber.text,
        'address2': controller.address2.text,
        'city': controller.city.text,
        'accounttype': controller.accounttype.text,
      };

      if (selectedType == 'Enterprise') {
        userCollection = 'enterprisedummy';
        userData['legalName'] = controller.legalName.text;
        userData['companyidNumber'] = controller.companyidNumber.text;
      } else if (selectedType == 'User') {
        userCollection = 'userdummy';
        userData['govtId'] = controller.govtId.text;
        userData['idNumber'] = controller.idNumber.text;
      } else if (selectedType == 'Super User') {
        userCollection = 'superuserdummy';
        userData['govtId'] = controller.govtId.text;
        userData['idNumber'] = controller.idNumber.text;
      } else {
        throw Exception('Invalid selected type');
      }

      await FirebaseFirestore.instance
          .collection(userCollection)
          .doc(uid)
          .set(userData);
    } catch (e) {
      print('Error creating account: $e');
    }
  }
}
