import 'package:flutter/material.dart';

class Sample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Icon Button Dropdown',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> dropdowns = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Icon Button Dropdown'),
      ),
      body: Center(
        child: Column(
          children: [
            ...dropdowns,
            IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                setState(() {
                  dropdowns.add(_buildDropdown()); // Add a new dropdown
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdown() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: PopupMenuButton(
        itemBuilder: (BuildContext context) => [
          PopupMenuItem(
            child: Text('Option 1'),
            value: 'Option 1',
          ),
          PopupMenuItem(
            child: Text('Option 2'),
            value: 'Option 2',
          ),
          PopupMenuItem(
            child: Text('Option 3'),
            value: 'Option 3',
          ),
        ],
      ),
    );
  }
}
