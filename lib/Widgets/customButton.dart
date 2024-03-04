import 'package:flutter/material.dart';

@immutable
final class CustomButton extends StatelessWidget {
  final String? text;
  Widget? child;
  final Function()? onPressed;

  final List<Color>? colors;
  final double? dynamicHeight;
  CustomButton({
    super.key,
    this.text,
    this.onPressed,
    this.colors,
    this.dynamicHeight,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 2,
          backgroundColor: Color.fromRGBO(98, 106, 254, 1),
          shape: RoundedRectangleBorder(
            side: BorderSide(color: const Color.fromRGBO(112, 112, 112, 1)),
            borderRadius:
                BorderRadius.circular(20), // Adjust border radius as needed
          ),
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 4, 0, 4),
          child: Text(
            text!,
            style: TextStyle(
              fontFamily: 'Helvetica',
              color: Colors.white,
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }
}
