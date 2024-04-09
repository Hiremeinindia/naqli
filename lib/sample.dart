import 'package:flutter/material.dart';
import 'package:flutter_application_1/Widgets/formText.dart';

class Sample extends StatefulWidget {
  const Sample({Key? key}) : super(key: key);

  @override
  State<Sample> createState() => _SampleState();
}

class _SampleState extends State<Sample> {
  @override
  void initState() {
    super.initState();
    _buttonKey = GlobalKey();
    _buttonKey1 = GlobalKey();
    _buttonKey2 = GlobalKey();
  }

  double screenHeight = 0;
  double screenWidth = 0;
  double bottom = 0;
  bool expand = false;
  GlobalKey? _buttonKey1;
  GlobalKey? _buttonKey2;
  GlobalKey? _buttonKey;
  String selectedTypeName1 = 'Select Type';
  String selectedTypeName2 = 'Select Type';
  String selectedTypeName3 =
      'Select Type'; // Define separate variables for each container

  Color blue = const Color(0xff8cccff);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade200,
      body: Column(
        children: [
          Column(
            children: [
              CustomContainer1(
                unitNames: [
                  {'image': 'Group2181.png', 'name': 'Dump truck'},
                  {'image': 'Group2270.png', 'name': 'Forklift'},
                  {'image': 'Group2271.png', 'name': 'Scissorlift'},
                ],
                buttonText: 'Excavator',
                selectedTypeName: selectedTypeName1,
                buttonKey: _buttonKey!,
              ),
              SizedBox(height: 5),
              CustomContainer1(
                unitNames: [
                  {'image': 'Group1660.png', 'name': 'Compactors'},
                ],
                buttonText: 'Bulldozer',
                selectedTypeName: selectedTypeName2,
                buttonKey: _buttonKey1!,
              ),
              SizedBox(height: 5),
              CustomContainer1(
                unitNames: [
                  {'image': 'Group2181.png', 'name': 'Dump truck'},
                  {'image': 'Group2052.png', 'name': 'Bulldozers'},
                  {'image': 'Group2270.png', 'name': 'Forklift'},
                  {'image': 'Group2271.png', 'name': 'Scissorlift'},
                  {'image': 'Group2052.png', 'name': 'Bulldozers'},
                  {'image': 'Group2148.png', 'name': 'Graders'},
                  {'image': 'Group2181.png', 'name': 'Dump truck'},
                  {'image': 'Group2270.png', 'name': 'Forklift'},
                ],
                buttonText: 'Graders',
                selectedTypeName: selectedTypeName3,
                buttonKey: _buttonKey2!,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomContainer1 extends StatefulWidget {
  final String? buttonText;
  final void Function()? onPressed;
  final GlobalKey? buttonKey;
  final List<Map<String, String>> unitNames;
  String? selectedTypeName;

  CustomContainer1({
    Key? key,
    this.buttonText,
    this.selectedTypeName,
    this.onPressed,
    required this.unitNames,
    this.buttonKey,
  }) : super(key: key);

  @override
  _CustomContainer1State createState() => _CustomContainer1State();
}

class _CustomContainer1State extends State<CustomContainer1> {
  late OverlayEntry _overlayEntry;
  bool _overlayVisible = false;
  bool expand = false;

  @override
  void initState() {
    super.initState();
  }

  OverlayEntry _createOverlayEntry(GlobalKey key, String selectedTypeName) {
    RenderBox? renderBox = key.currentContext?.findRenderObject() as RenderBox?;
    final position = renderBox!.localToGlobal(Offset.zero);
    return OverlayEntry(
      builder: (context) => Positioned(
        right: position.dx - 350,
        top: position.dy + renderBox.size.height,
        child: Material(
          elevation: 2,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 0.4,
              color: Color.fromRGBO(112, 112, 112, 1).withOpacity(0.2),
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Container(
            height: 400,
            width: 500,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                width: 0.4,
                color: Color.fromRGBO(112, 112, 112, 1).withOpacity(0.2),
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: ListView.builder(
              itemCount: widget.unitNames.length,
              itemBuilder: (context, index) {
                String image = widget.unitNames[index]['image']!;
                String name = widget.unitNames[index]['name']!;
                return ListTile(
                  onTap: () {
                    setState(() {
                      widget.selectedTypeName = name;
                      expand = false;
                    });
                    _hideOverlay();
                  },
                  leading: Image.asset(
                    image,
                    width: 60,
                    height: 60,
                  ),
                  title: Text(name),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  void _showOverlay(GlobalKey key, String selectedTypeName) {
    _overlayEntry = _createOverlayEntry(key, selectedTypeName);
    Overlay.of(context)!.insert(_overlayEntry);
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
    return Container(
      width: 500,
      child: Column(
        children: [
          Container(
            height: 50,
            width: 500,
            decoration: BoxDecoration(
              border: Border.all(color: Color.fromRGBO(183, 183, 183, 1)),
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
              color: Colors.white,
            ),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'delivery-truck.png',
                  width: 50,
                  height: 50,
                ),
                Text(widget.buttonText!, style: AvailableText.helvetica17black),
                SizedBox(
                  height: double.infinity,
                  child: VerticalDivider(),
                ),
                Text(
                  widget.selectedTypeName ?? '',
                  style: AvailableText.helvetica,
                ),
                IconButton(
                  key: widget.buttonKey,
                  icon: Icon(
                    Icons.arrow_drop_down,
                    size: 25,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    if (!_overlayVisible) {
                      _showOverlay(
                          widget.buttonKey!, widget.selectedTypeName ?? '');
                    } else {
                      _hideOverlay();
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
