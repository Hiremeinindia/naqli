import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Dashboard/dashboard.dart';
import 'package:flutter_application_1/Partner/homepage.dart';
import 'package:flutter_application_1/advancepayment.dart';
import 'package:flutter_application_1/homepage.dart';
import 'package:flutter_application_1/sample.dart';

import 'Dashboard/dashboard_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  print("Initializing Firebase...");
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyAw2q-XYb_1TlynK7PuCHRcPZXsfWd3J_s",
          authDomain: "naqli-5825c.firebaseapp.com",
          databaseURL:
              "https://naqli-5825c-default-rtdb.europe-west1.firebasedatabase.app",
          projectId: "naqli-5825c",
          storageBucket: "naqli-5825c.appspot.com",
          messagingSenderId: "736301032077",
          appId: "1:736301032077:web:bd7a20a1eb8447a54ef8c4",
          measurementId: "G-PV5TPJPRMX"));
  print("Firebase initialized successfully!");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePagePartner(),
    );
  }
}
