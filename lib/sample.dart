import 'package:flutter/material.dart';

class Sample extends StatelessWidget {
  // Define functions for handling onTap for each drawer item
  void _handleItem1Tap(BuildContext context) {
    // Replace this with your desired action
    print('Item 1 tapped');
    // Close the drawer
    Navigator.pop(context);
  }

  void _handleItem2Tap(BuildContext context) {
    // Replace this with your desired action
    print('Item 2 tapped');
    // Close the drawer
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Drawer Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(
        onItem1Tap: _handleItem1Tap,
        onItem2Tap: _handleItem2Tap,
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final void Function(BuildContext) onItem1Tap;
  final void Function(BuildContext) onItem2Tap;

  MyHomePage({Key? key, required this.onItem1Tap, required this.onItem2Tap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drawer Example'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                // Call the function passed to handle item 1 tap
                onItem1Tap(context);
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                // Call the function passed to handle item 2 tap
                onItem2Tap(context);
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text('Home Page Content'),
      ),
    );
  }
}
