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
      height: 40,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(206, 205, 205, 1),
              offset: Offset(0, 1),
              spreadRadius: 1,
              blurRadius: 5, // changes position of shadow
            ),
          ],
          color: colors,
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(color: Color.fromRGBO(216, 216, 216, 1))),
      child: Padding(
        padding: EdgeInsets.fromLTRB(0.1.w, 1.h, 1.w, 1.h),
        child: Center(
          child: Row(
            children: [
              Transform.scale(
                scale: 0.7,
                child: Radio<int?>(
                  splashRadius: 5,
                  fillColor: MaterialStateProperty.all(
                      Color.fromRGBO(208, 205, 205, 1)),
                  hoverColor: Color.fromRGBO(98, 105, 254, 1).withOpacity(.8),
                  value: value,
                  groupValue: groupValue,
                  onChanged: onChanged,
                  activeColor: Color.fromRGBO(98, 105, 254, 1),
                ),
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
