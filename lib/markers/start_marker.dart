import 'package:flutter/material.dart';

class StarTMarkerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final blackpaint = Paint()..color =Colors.black;

    const double circleBlackRadius=20;
    canvas.drawCircle(
     Offset(circleBlackRadius, size.height-circleBlackRadius), 
      circleBlackRadius, 
      blackpaint);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) =>true;
    

  @override
  bool shouldRebuildSemantics(covariant CustomPainter oldDelegate) =>false;
  

}