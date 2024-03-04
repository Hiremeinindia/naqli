import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

@immutable
class CustomRadio extends StatelessWidget {
  final String? text1;
  final String? text2;

  final Color? colors;
  final Color? textcolor1;
  final Color? textcolor2;
  int? value;
  int? groupValue;
  void Function(int?)? onChanged;
  CustomRadio({
    super.key,
    this.text1,
    this.text2,
    this.value,
    this.groupValue,
    this.onChanged,
    this.textcolor1,
    this.textcolor2,
    this.colors,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      decoration: BoxDecoration(
          color: colors,
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(color: Colors.grey)),
      child: Padding(
        padding: EdgeInsets.fromLTRB(0.1.w, 1.h, 1.w, 1.h),
        child: Center(
          child: Row(
            children: [
              Radio<int?>(
                value: value,
                groupValue: groupValue,
                onChanged: onChanged,
                activeColor: Color.fromRGBO(98, 105, 254, 1),
              ),
              Text(text1!,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'SFProText',
                    fontSize: 9,
                    color: Colors.black54,
                  )),
              SizedBox(
                width: 10,
              ),
              Text(
                text2!,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'SFProText',
                  fontSize: 8,
                  color: Color.fromRGBO(143, 142, 151, 1),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
