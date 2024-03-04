import 'package:flutter/material.dart';

class Sample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Drawer Example',
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
  String _currentContent = 'Home Page Content';

  void _handleItem1Tap() {
    setState(() {
      _currentContent = 'Item 1 Content';
    });
    Navigator.pop(context);
  }

  void _handleItem2Tap() {
    setState(() {
      _currentContent = 'Item 2 Content';
    });
    Navigator.pop(context);
  }

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
              onTap: _handleItem1Tap,
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: _handleItem2Tap,
            ),
          ],
        ),
      ),
      body: Center(
        child: Text(_currentContent),
      ),
    );
  }
}
