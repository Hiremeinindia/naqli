import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import 'allUsers.dart';

class AllUsersFormController {
  AllUsersFormController();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final legalName = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final contactNumber = TextEditingController();
  final address = TextEditingController();
  final govtId = TextEditingController();
  final confirmPassword = TextEditingController();
  final alternateNumber = TextEditingController();
  final address2 = TextEditingController();
  final idNumber = TextEditingController();
  final city = TextEditingController();
  final companyidNumber = TextEditingController();
  final accounttype = TextEditingController();
  final otp = TextEditingController();

  // String get newDocId => FirebaseFirestore.instance.collection('AllUserss').doc().id;

  DocumentReference? _reference;

  DocumentReference get reference {
    _reference ??=
        FirebaseFirestore.instance.collection('enterprisedummy').doc();
    return _reference!;
  }

  AllUsers get allUsers => AllUsers(
        reference: reference,
        firstName: firstName.text,
        lastName: lastName.text,
        legalName: legalName.text,
        email: email.text,
        password: password.text,
        contactNumber: contactNumber.text,
        address: address.text,
        govtId: govtId.text,
        confirmPassword: confirmPassword.text,
        alternateNumber: alternateNumber.text,
        address2: address2.text,
        idNumber: idNumber.text,
        city: city.text,
        companyidNumber: companyidNumber.text,
        accounttype: accounttype.text,
      );
}
