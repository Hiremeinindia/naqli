import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/Widgets/customButton.dart';
import 'package:flutter_application_1/Widgets/formText.dart';
import 'package:flutter_application_1/homePage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sizer/sizer.dart';

class Bookings extends StatefulWidget {
  Bookings();
  @override
  State<Bookings> createState() => _BookingsState();
}

class _BookingsState extends State<Bookings> {
  GoogleMapController? mapController;
  List<Marker> _markers = [];
  bool showmaps = true;

  final LatLng _center = const LatLng(45.521563, -122.677433);
  final ScrollController _book1Scroll = ScrollController();
  final ScrollController _book2Scroll = ScrollController();
  final ScrollController _book3Scroll = ScrollController();
  final ScrollController _scrollController = ScrollController();
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  void initState() {
    super.initState();

    if (_markers.isNotEmpty) {
      _markers.add(const Marker(
        markerId: MarkerId("Mylocation"),
        position: LatLng(59.948680, 11.010630),
      ));
      setState(() {
        showmaps = true;
      });
    }
  }

  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return LayoutBuilder(
          builder: (BuildContext ctx, BoxConstraints constraints) {
        if (constraints.maxWidth >= 950) {
          return SingleChildScrollView(
            child: Container(
              height: 100.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Color.fromRGBO(255, 255, 255, 0.925),
              ),
              padding: EdgeInsets.fromLTRB(3.w, 3.h, 3.w, 3.h),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'Group1787.png',
                            width: 140,
                            height: 140,
                          ),
                          Text(
                            "Booking Id #1345789345",
                            style: TextStyle(
                                fontFamily: "Helvetica",
                                fontSize: 21,
                                color: Color.fromRGBO(16, 3, 3, 1)),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          showmaps
                              ? Padding(
                                  padding: const EdgeInsets.only(left: 25),
                                  child: Container(
                                    height: 400,
                                    width: 400,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: GoogleMap(
                                        onMapCreated: (controller) {
                                          setState(() {
                                            mapController = controller;
                                          });
                                        },
                                        markers: Set<Marker>.of(_markers),
                                        mapType: MapType.normal,
                                        initialCameraPosition: CameraPosition(
                                            target:
                                                LatLng(24.755562, 46.589584),
                                            zoom: 13)),
                                  ),
                                )
                              : CircularProgressIndicator(
                                  color: Colors.amber,
                                )
                        ],
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [],
                  ),
                ],
              ),
            ),
          );
        } else {
          return Expanded(
            child: Container(
              color: Color.fromRGBO(255, 255, 255, 200),
              padding: EdgeInsets.fromLTRB(3.w, 1.5.h, 3.w, 1.5.h),
            ),
          );
        }
      });
    });
  }
}
