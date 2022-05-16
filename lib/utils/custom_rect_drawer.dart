import 'package:flutter/cupertino.dart';

class CustomRectDrawer extends CustomPainter {
  double customSize;
  int customColor;

  CustomRectDrawer(this.customSize, this.customColor);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRect(
      //const Rect.fromLTRB(0.0, 0.0, 50.0, 50.0),
      Rect.fromLTRB(0.0, 0.0, customSize, customSize),
      //Paint()..color = const Color(0xFF0099FF),
      Paint()..color = Color(customColor),
    );
  }

  @override
  bool shouldRepaint(CustomRectDrawer oldDelegate) {
    return false;
  }
}