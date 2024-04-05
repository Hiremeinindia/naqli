import 'package:flutter/material.dart';
import 'package:flutter_application_1/Widgets/formText.dart';
import 'package:sizer/sizer.dart';

class FancyFab extends StatefulWidget {
  final Function()? onPressed;
  final String? tooltip;
  final IconData? icon;

  FancyFab({this.onPressed, this.tooltip, this.icon});

  @override
  _FancyFabState createState() => _FancyFabState();
}

class _FancyFabState extends State<FancyFab>
    with SingleTickerProviderStateMixin {
  bool isOpened = false;
  late AnimationController _animationController;
  late Animation<Color?> _buttonColor;
  late Animation<double> _animateIcon;
  late Animation<double> _translateButton;

  @override
  initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500))
          ..addListener(() {
            setState(() {});
          });
    _animateIcon =
        Tween<double>(begin: 0.0, end: 0.0).animate(_animationController);
    _buttonColor = ColorTween(
      begin: Colors.white,
      end: Colors.white,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.00,
        1.00,
        curve: Curves.linear,
      ),
    ));
    _translateButton = Tween<double>(
      begin: 40,
      end: 160.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.0,
        0.75,
        curve: Curves.linear,
      ),
    ));
    super.initState();
  }

  @override
  dispose() {
    _animationController.dispose();
    super.dispose();
  }

  animate() {
    if (!isOpened) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
    isOpened = !isOpened;
  }

  Widget inbox() {
    return Container(
        width: 600,
        height: 100,
        color: Colors.red.shade200,
        child: Padding(
          padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
          child: ListView(
            children: [
              Row(
                children: [
                  Image.asset(
                    'Group2270.png',
                    width: 30,
                    height: 30,
                  ),
                  Text('Referigerator', style: BookingManagerText.sfpro20black)
                ],
              ),
              Row(
                children: [
                  Image.asset(
                    'Group2271.png',
                    width: 30,
                    height: 30,
                  ),
                  Text('Referigerator', style: BookingManagerText.sfpro20black)
                ],
              )
            ],
          ),
        ));
  }

  Widget toggle() {
    return Container(
      width: 600,
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(183, 183, 183, 1)),
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
        color: Colors.white,
      ),
      child: FloatingActionButton(
        elevation: 0,
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        backgroundColor: _buttonColor.value,
        onPressed: animate,
        tooltip: 'Toggle',
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 2, 20, 2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                'delivery-truck.png',
                width: 60,
                height: 60,
              ),
              Text('Excavator', style: AvailableText.helvetica17black),
              SizedBox(height: double.infinity, child: VerticalDivider()),
              Text('Selec type', style: AvailableText.helvetica),
              Icon(
                Icons.arrow_drop_down,
                size: 25,
                color: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        color: Colors.amber,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            isOpened
                ? Transform(
                    transform: Matrix4.translationValues(
                      0.0,
                      _translateButton.value,
                      0.0,
                    ),
                    child: inbox(),
                  )
                : SizedBox(),
            toggle(),
            Text('data')
          ],
        ),
      ),
    );
  }
}
