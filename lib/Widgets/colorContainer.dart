import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

@immutable
final class ColorContainer extends StatelessWidget {
  final String? text1;
  final String? text2;
  Widget? child;

  final Color? colors;
  final double? dynamicHeight;
  ColorContainer({
    super.key,
    this.text1,
    this.text2,
    this.colors,
    this.dynamicHeight,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(216, 216, 216, 1),
              offset: Offset(0, 1),
              blurRadius: 0.1, // changes position of shadow
            ),
          ],
          color: colors,
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(color: Color.fromARGB(246, 245, 242, 242))),
      child: Padding(
        padding: EdgeInsets.fromLTRB(1.w, 0.5.h, 1.w, 0.5.h),
        child: Center(
          child: Row(
            children: [
              Text(text1!,
                  style: const TextStyle(
                      fontFamily: 'SFProText',
                      fontWeight: FontWeight.bold,
                      fontSize: 9,
                      color: Color.fromRGBO(128, 118, 118, 1))),
              SizedBox(
                width: 1.w,
              ),
              Text(
                text2!,
                style: const TextStyle(
                    fontFamily: 'SFProText',
                    fontWeight: FontWeight.bold,
                    fontSize: 9,
                    color: Color.fromRGBO(127, 106, 255, 1)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

@immutable
final class ElevationContainer extends StatelessWidget {
  final String? text1;
  final String? text2;
  Widget? child;
  final double? width;
  final Color? colors;
  final double? height;
  final double? bottomright;
  final double? bottomleft;
  ElevationContainer({
    super.key,
    this.text1,
    this.text2,
    this.colors,
    this.height,
    this.bottomleft,
    this.bottomright,
    this.width,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(112, 112, 112, 1).withOpacity(0.1),
                offset: Offset(0, 0),
                blurRadius: 0.1, // changes position of shadow
              ),
            ],
            color: Colors.white,
            border: Border.all(
                width: 0.4,
                color: Color.fromRGBO(112, 112, 112, 1).withOpacity(0.2)),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: child);
  }
}
