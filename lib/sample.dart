import 'package:flutter/material.dart';

class Dashboard1 extends StatefulWidget {
  const Dashboard1({Key? key}) : super(key: key);

  @override
  State<Dashboard1> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Dashboard1> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Your App'),
      ),
      drawer: buildSideMenu(),
      body: Center(
        child: Text('Main Content'),
      ),
    );
  }

  Widget buildSideMenu() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Side Menu Header'),
          ),
          ListTile(
            title: Text('Dashboard'),
            onTap: () {
              // Handle dashboard item tap
              _scaffoldKey.currentState!.openEndDrawer();
              // Navigate or perform actions related to 'Dashboard'
            },
          ),
          ListTile(
            title: Text('Trigger Booking'),
            onTap: () {
              // Handle Trigger Booking item tap
              _scaffoldKey.currentState!.openEndDrawer();
              // Navigate or perform actions related to 'Trigger Booking'
            },
          ),
          // Add more list tiles for other menu items
        ],
      ),
    );
  }
}
