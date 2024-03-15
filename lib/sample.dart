import 'package:flutter/material.dart';

class Sample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dropdown in IconButton Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dropdown in IconButton Example'),
        actions: <Widget>[
          PopupMenuButton<String>(
            icon: Icon(Icons.more_vert),
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              PopupMenuItem<String>(
                value: 'option1',
                child: Text('Option 1'),
              ),
              PopupMenuItem<String>(
                value: 'option2',
                child: Text('Option 2'),
              ),
              // Add more PopupMenuItems as needed
            ],
            onSelected: (String value) {
              // Handle the selection of the dropdown menu item
              if (value == 'option1') {
                // Perform action for option 1
              } else if (value == 'option2') {
                // Perform action for option 2
              }
              // Add more conditions as needed
            },
          ),
        ],
      ),
    );
  }
}
