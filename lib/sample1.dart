import 'package:flutter/material.dart';
import 'package:flutter_application_1/sample.dart';

class Sample1 extends StatefulWidget {
  @override
  _Sample1State createState() => _Sample1State();
}

class _Sample1State extends State<Sample1> {
  late OverlayEntry _overlayEntry;
  bool _overlayVisible = false;

  @override
  void initState() {
    super.initState();
  }

  OverlayEntry _createOverlayEntry() {
    return OverlayEntry(
      builder: (context) => Center(
        child: Container(
          width: 200,
          height: 200,
          color: Colors.blue.withOpacity(0.8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Overlay Content',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _hideOverlay();
                },
                child: Text('Close Overlay'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showOverlay() {
    _overlayEntry = _createOverlayEntry();
    Overlay.of(context).insert(_overlayEntry);
    setState(() {
      _overlayVisible = true;
    });
  }

  void _hideOverlay() {
    _overlayEntry.remove();
    setState(() {
      _overlayVisible = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Overlay Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                if (!_overlayVisible) {
                  _showOverlay();
                }
              },
              child: Text('Show Overlay'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    if (_overlayVisible) {
      _overlayEntry.remove();
    }
    super.dispose();
  }
}
