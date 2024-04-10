// ignore_for_file: must_be_immutable

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/Widgets/formText.dart';
import 'package:sizer/sizer.dart';

@immutable
class UnitsContainer extends StatefulWidget {
  final String? buttonText;
  final void Function()? onPressed;
  final GlobalKey<CustomContainerState>? buttonKey;
  final List<Map<String, String>> unitNames;
  String? selectedTypeName;
  final ValueChanged<String>? onSelectionChanged;

  UnitsContainer({
    Key? key,
    this.buttonText,
    this.selectedTypeName,
    this.onPressed,
    required this.unitNames,
    this.buttonKey,
    this.onSelectionChanged,
  }) : super(key: key);

  @override
  CustomContainerState createState() => CustomContainerState();
}

class CustomContainerState extends State<UnitsContainer> {
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
        right: position.dx + 7.w,
        top: position.dy + 50,
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
      GlobalKey<CustomContainerState> key, String selectedTypeName) {
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
