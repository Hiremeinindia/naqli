import 'package:flutter/material.dart';
import 'package:flutter_application_1/Widgets/customButton.dart';
import 'package:flutter_application_1/Widgets/formText.dart';

import '../main.dart';

// ignore: must_be_immutable
class CreateAccount extends StatefulWidget {
  const CreateAccount();
  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      // The Dialog widget provides a full-page overlay
      child: Container(
        width: 1100,
        height: 750,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(31),
                bottomLeft: Radius.circular(31),
                topRight: Radius.circular(31),
                bottomRight: Radius.circular(31))),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 100, right: 100, top: 50, bottom: 50),
          child: Column(children: [
            Text(
              'Create your account',
              style: TextStyle(
                fontFamily: 'ColfaxBold',
                fontSize: 25,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('First Name ', style: FormTextStyle.text),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: SizedBox(
                    height: 45,
                    child: TextField(
                      decoration: InputDecoration(
                        hintStyle: FormTextStyle.textfieldtext,
                        hintText: 'First Name',
                        contentPadding: EdgeInsets.all(5.0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 25,
                ),
                Expanded(
                  child: SizedBox(
                    height: 45,
                    child: TextField(
                      decoration: InputDecoration(
                        hintStyle: FormTextStyle.textfieldtext,
                        hintText: 'Last Name',
                        contentPadding: EdgeInsets.all(5.0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5))),
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
                Text(
                  'Email Address',
                  style: TextStyle(
                    fontFamily: 'Colfax',
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: SizedBox(
                    height: 45,
                    child: TextField(
                      decoration: InputDecoration(
                        hintStyle: FormTextStyle.textfieldtext,
                        hintText: 'Email address',
                        contentPadding: EdgeInsets.all(5.0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5))),
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Password', style: FormTextStyle.text),
                    SizedBox(
                      height: 30,
                    ),
                    Text('Contact Number', style: FormTextStyle.text),
                    SizedBox(
                      height: 30,
                    ),
                    Text('Address 1', style: FormTextStyle.text),
                    SizedBox(
                      height: 30,
                    ),
                    Text('City', style: FormTextStyle.text),
                    SizedBox(
                      height: 30,
                    ),
                    Text('Govt ID', style: FormTextStyle.text),
                  ],
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 45,
                        child: TextField(
                          decoration: InputDecoration(
                            hintStyle: FormTextStyle.textfieldtext,
                            hintText: 'Password',
                            contentPadding: EdgeInsets.all(5.0),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 45,
                        child: TextField(
                          decoration: InputDecoration(
                            hintStyle: FormTextStyle.textfieldtext,
                            hintText: 'Phone Number',
                            contentPadding: EdgeInsets.all(5.0),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 45,
                        child: TextField(
                          decoration: InputDecoration(
                            hintStyle: FormTextStyle.textfieldtext,
                            hintText: 'Address',
                            contentPadding: EdgeInsets.all(5.0),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 45,
                        child: TextField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(5.0),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 45,
                        child: TextField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(5.0),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Confirm Password', style: FormTextStyle.text),
                    SizedBox(
                      height: 30,
                    ),
                    Text('Alternate Number', style: FormTextStyle.text),
                    SizedBox(
                      height: 30,
                    ),
                    Text('Address 2', style: FormTextStyle.text),
                    SizedBox(
                      height: 30,
                    ),
                    Text('Account Type', style: FormTextStyle.text),
                    SizedBox(
                      height: 30,
                    ),
                    Text('ID Number', style: FormTextStyle.text),
                  ],
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 45,
                        child: TextField(
                          decoration: InputDecoration(
                            hintStyle: FormTextStyle.textfieldtext,
                            hintText: 'Password',
                            contentPadding: EdgeInsets.all(5.0),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 45,
                        child: TextField(
                          decoration: InputDecoration(
                            hintStyle: FormTextStyle.textfieldtext,
                            hintText: 'Phone Number',
                            contentPadding: EdgeInsets.all(5.0),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 45,
                        child: TextField(
                          decoration: InputDecoration(
                            hintStyle: FormTextStyle.textfieldtext,
                            hintText: 'Address',
                            contentPadding: EdgeInsets.all(5.0),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 45,
                        child: TextField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(5.0),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 45,
                        child: TextField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(5.0),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 45,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CreateAccount()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size.fromWidth(double.infinity),
                      backgroundColor: Color.fromARGB(255, 128, 123, 229),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            5), // Adjust border radius as needed
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 80.0, right: 80),
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
                ),
                SizedBox(
                  width: 20,
                ),
                SizedBox(
                  height: 45,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CreateAccount()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size.fromWidth(double.infinity),
                      backgroundColor: Color.fromARGB(255, 128, 123, 229),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            5), // Adjust border radius as needed
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 90.0, right: 90),
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
                ),
              ],
            ),
            SizedBox(
              height: 13,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
                  style: TextStyle(
                      fontFamily: 'Colfax', fontSize: 16, color: Colors.black),
                ),
                TextButton(
                  child: Text(
                    'Sign in',
                    style: TextStyle(
                        fontFamily: 'Colfax',
                        fontSize: 16,
                        color: Color.fromARGB(255, 128, 123, 229)),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Divider(
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "By Clicking Sign up, you agree to the ",
                  style: TextStyle(
                      fontFamily: 'Colfax', fontSize: 16, color: Colors.black),
                ),
                TextButton(
                  child: Text(
                    'Terms & Privacy policy.',
                    style: TextStyle(
                        fontFamily: 'Colfax',
                        fontSize: 16,
                        color: Color.fromARGB(255, 128, 123, 229)),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
