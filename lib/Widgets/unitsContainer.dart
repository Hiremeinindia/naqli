// ignore_for_file: must_be_immutable

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/Widgets/formText.dart';
import 'package:sizer/sizer.dart';

@immutable
final class UnitsContainer extends StatelessWidget {
  final String? text;
  String? value;
  List<String>? items;
  void Function(String?)? onChanged;

  UnitsContainer({
    super.key,
    this.text,
    this.value,
    this.items,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: DropdownButtonHideUnderline(
            child: DropdownButton2<String>(
              value: value, // Use value from the list
              items: items!.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'delivery-truck.png',
                        width: 50,
                        height: 50,
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      SizedBox(
                          width: 6.w,
                          child: Text(text!,
                              style: AvailableText.helvetica17black)),
                      SizedBox(width: 2.w),
                      SizedBox(
                          height: double.infinity, child: VerticalDivider()),
                      SizedBox(width: 2.w),
                      Text(value, style: AvailableText.helvetica),
                    ],
                  ),
                );
              }).toList(),
              onChanged: onChanged,
              buttonStyleData: ButtonStyleData(
                height: 50,
                padding: EdgeInsets.only(left: 9, right: 9),
                decoration: BoxDecoration(
                  border: Border.all(color: Color.fromRGBO(183, 183, 183, 1)),
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                  color: Colors.white,
                ),
              ),
              iconStyleData: const IconStyleData(
                icon: Icon(
                  Icons.arrow_drop_down_sharp,
                ),
                iconSize: 25,
                iconEnabledColor: Colors.black,
                iconDisabledColor: null,
              ),
              dropdownStyleData: DropdownStyleData(
                elevation: 0,
                maxHeight: 200,
                padding: EdgeInsets.all(3),
                decoration: BoxDecoration(
                  border: Border.all(color: Color.fromRGBO(112, 112, 112, 1)),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(0),
                    topRight: Radius.circular(0),
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5),
                  ),
                  color: Colors.white,
                ),
                scrollPadding: EdgeInsets.all(5),
                scrollbarTheme: ScrollbarThemeData(
                  thickness: MaterialStateProperty.all<double>(6),
                  thumbVisibility: MaterialStateProperty.all<bool>(true),
                ),
              ),
              menuItemStyleData: MenuItemStyleData(
                height: 30,
                padding: EdgeInsets.only(left: 9, right: 9),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
