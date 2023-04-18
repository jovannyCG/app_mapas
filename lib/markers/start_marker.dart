import 'package:flutter/material.dart';

class StarTMarkerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final blackpaint = Paint()..color = Colors.black;
    final whitepaint = Paint()..color = Colors.white;
    const double circleBlackRadius = 20;
    const double circleWhiteRadius = 7;
    canvas.drawCircle(
        Offset(circleBlackRadius, size.height - circleBlackRadius),
        circleBlackRadius,
        blackpaint);
    canvas.drawCircle(
        Offset(circleBlackRadius, size.height - circleBlackRadius),
        circleWhiteRadius,
        whitepaint);

    final path = Path();
    path.moveTo(40, 20);
    path.lineTo(size.width - 10, 20);
    path.lineTo(size.width - 10, 100);
    path.lineTo(40, 100);
    canvas.drawShadow(path, Colors.black, 10, false);
    canvas.drawPath(path, whitepaint);

    const blacBox = Rect.fromLTWH(40, 20, 70, 80);
    canvas.drawRect(blacBox, blackpaint);

    final textSpan = TextSpan(
      style: TextStyle(
        color: Colors.white, fontSize: 30, fontWeight: FontWeight.w400,
      ),
      text: '55'
    );
    final minutesPaiter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
    )..layout(
      minWidth: 70,
      maxWidth: 70
    );
    minutesPaiter.paint(canvas, const Offset(40,35));


    final minutesText = TextSpan(
      style: TextStyle(
        color: Colors.white, fontSize: 18, fontWeight: FontWeight.w300,
      ),
      text: 'Minutos'
    );
    final minutesTextPaiter = TextPainter(
      text: minutesText,
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
    )..layout(
      minWidth: 70,
      maxWidth: 70
    );
   minutesTextPaiter.paint(canvas, const Offset(40,68));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(covariant CustomPainter oldDelegate) => false;
}
