import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Widgets/customButton.dart';
import 'package:flutter_application_1/Widgets/formText.dart';

class Sample extends StatefulWidget {
  const Sample({Key? key}) : super(key: key);

  @override
  State<Sample> createState() => _SampleState();
}

class _SampleState extends State<Sample> {
  late GlobalKey<_CustomContainer1State> _buttonKey1;
  late GlobalKey<_CustomContainer1State> _buttonKey2;
  late GlobalKey<_CustomContainer1State> _buttonKey3;
  String selectedTypeName1 = 'Select Type';
  String selectedTypeName2 = 'Select Type';
  String selectedTypeName3 = 'Select Type';
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();

  @override
  void initState() {
    super.initState();
    _buttonKey1 = GlobalKey<_CustomContainer1State>();
    _buttonKey2 = GlobalKey<_CustomContainer1State>();
    _buttonKey3 = GlobalKey<_CustomContainer1State>();
  }

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
                buttonKey: _buttonKey1,
                onSelectionChanged: (value) {
                  setState(() {
                    selectedTypeName1 = value;
                  });
                },
              ),
              SizedBox(height: 5),
              CustomContainer1(
                unitNames: [
                  {'image': 'Group1660.png', 'name': 'Compactors'},
                ],
                buttonText: 'Bulldozer',
                selectedTypeName: selectedTypeName2,
                buttonKey: _buttonKey2,
                onSelectionChanged: (value) {
                  setState(() {
                    selectedTypeName2 = value;
                  });
                },
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
                buttonKey: _buttonKey3,
                onSelectionChanged: (value) {
                  setState(() {
                    selectedTypeName3 = value;
                  });
                },
              ),
              CustomButton(
                onPressed: () async {
                  try {
                    print('$selectedTypeName1');
                    print('$selectedTypeName2');
                    print('$selectedTypeName3');
                    // Call functions to create documents in collection and subcollection
                    // await createNewBooking(
                    //     truck,
                    //     size,
                    //     load,
                    //     widget.user!);
                  } catch (e) {
                    print("Error creating user: $e");
                  }
                },
                text: 'Create Booking',
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
  final GlobalKey<_CustomContainer1State>? buttonKey;
  final List<Map<String, String>> unitNames;
  final String? selectedTypeName;
  final ValueChanged<String>? onSelectionChanged;

  CustomContainer1({
    Key? key,
    this.buttonText,
    this.selectedTypeName,
    this.onPressed,
    required this.unitNames,
    this.buttonKey,
    this.onSelectionChanged,
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

  OverlayEntry _createOverlayEntry(
      GlobalKey<_CustomContainer1State> key, String selectedTypeName) {
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
                      widget.onSelectionChanged!(name);
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

  void _showOverlay(
      GlobalKey<_CustomContainer1State> key, String selectedTypeName) {
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
