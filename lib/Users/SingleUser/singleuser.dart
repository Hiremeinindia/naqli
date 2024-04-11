import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

enum SingleUserStatus { verified, notVerified }

enum ActiveStatus { selected, curated, rejected }

class SingleUserBooking {
  final String? truck;
  final String? load;
  final String? size;
  final String? date;
  final String? bookingid;
  String? get docId => reference!.id;

  final DocumentReference? reference;
  ActiveStatus activeStatus;

  SingleUserBooking({
    this.truck,
    this.load,
    this.size,
    this.date,
    this.bookingid,
    this.reference,
    this.activeStatus = ActiveStatus.curated,
  });

  toJson() => {
        "truck": truck,
        "reference": reference,
        "load": load,
        "size": size,
        "date": date,
        "bookingid": bookingid,
        "docId": docId,
      };

  factory SingleUserBooking.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    var data = snapshot.data() as Map<String, dynamic>;
    return SingleUserBooking(
      truck: data["truck"],
      load: data["load"],
      size: data["size"],
      date: data["date"],
      bookingid: data["bookingid"],
      reference: snapshot.reference,
    );
  }

  factory SingleUserBooking.fromJson(json, DocumentReference reference) {
    return SingleUserBooking(
      truck: json["truck"],
      load: json["load"],
      size: json["size"],
      date: json["date"],
      bookingid: json["bookingid"],
      // reference: json["reference"],
      reference: reference,
    );
  }

  static Future<List<SingleUserBooking>> getSingleUsers(
      {SingleUserBooking? selectedSkills,
      SingleUserBooking? selectedQualification}) {
    return FirebaseFirestore.instance.collection('users').get().then((value) =>
        value.docs.map((e) => SingleUserBooking.fromSnapshot(e)).toList());
  }

  static Stream<List<SingleUserBooking>> getFilteredList({
    SingleUserBooking? selectedQualification,
    SingleUserBooking? selectedSkills,
  }) {
    // You can keep this method for additional filters if needed
    // Make sure not to apply the skills filter here since it's done in the query

    return FirebaseFirestore.instance
        .collection("users")
        .snapshots()
        .map((snapshot) {
      return snapshot.docs
          .map((doc) => SingleUserBooking.fromSnapshot(doc))
          .toList();
    });
  }

  Future<void> curated() {
    return FirebaseFirestore.instance
        .collection('greycollaruser')
        .doc(docId)
        .update({
      "labelText": 'Curated',
    });
  }

  Future<void> selected() {
    return FirebaseFirestore.instance
        .collection('greycollaruser')
        .doc(docId)
        .update({
      "labelText": 'Selected',
    });
  }

  Future<void> rejected() {
    return FirebaseFirestore.instance
        .collection('greycollaruser')
        .doc(docId)
        .update({
      "labelText": 'Rejected',
    });
  }

  Future<void> updateLabel(String labelText, Color labelColor) {
    return FirebaseFirestore.instance
        .collection('greycollaruser')
        .doc(docId)
        .update({
      'labelText': labelText,
      'labelColor': labelColor.value.toString(),
    });
  }
}
