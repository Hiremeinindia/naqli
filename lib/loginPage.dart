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
  @override
  Widget build(BuildContext context) {
    return Dialog(
      // The Dialog widget provides a full-page overlay
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
                          bottomLeft: Radius.circular(31))),
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
                          bottomRight: Radius.circular(31))),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, right: 20, top: 20, bottom: 80),
                    child: Column(children: [
                      Align(
                          alignment: Alignment.topRight,
                          child: IconButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              icon: Icon(Icons.cancel))),
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
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 40.0, right: 40, top: 80),
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
                                        BorderRadius.all(Radius.circular(5))),
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
                                        BorderRadius.all(Radius.circular(5))),
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
                                      return CreateAccount();
                                    },
                                  );
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
                                  'Login',
                                  style: TextStyle(
                                    fontFamily: 'Colfax',
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            TextButton(
                              child: Text(
                                'Forgot Password?',
                                style: TextStyle(
                                    fontFamily: 'Colfax',
                                    fontSize: 16,
                                    color: Color.fromARGB(255, 128, 123, 229)),
                              ),
                              onPressed: () {},
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
                              "Dont't have an account?",
                              style: TextStyle(
                                  fontFamily: 'Colfax',
                                  fontSize: 16,
                                  color: Colors.black),
                            ),
                            TextButton(
                              child: Text(
                                'Create One!',
                                style: TextStyle(
                                    fontFamily: 'Colfax',
                                    fontSize: 16,
                                    color: Color.fromARGB(255, 128, 123, 229)),
                              ),
                              onPressed: () {
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
                          child: TextButton(
                            child: Text(
                              'Use without Log in',
                              style: TextStyle(
                                  fontFamily: 'Colfax',
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 128, 123, 229)),
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ),
                    ]),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
