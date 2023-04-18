

import 'package:flutter/material.dart';

class StarTMarkerPainter extends CustomPainter {
  final int minutes;
  final String destination;

  StarTMarkerPainter({required this.minutes, required this.destination});
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
        style: const TextStyle(
          color: Colors.white,
          fontSize: 30,
          fontWeight: FontWeight.w400,
        ),
        text: '$minutes');
    final minutesPaiter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
    )..layout(minWidth: 70, maxWidth: 70);
    minutesPaiter.paint(canvas, const Offset(40, 35));

    const minutesText = TextSpan(
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w300,
        ),
        text: 'Minutos');
    final minutesTextPaiter = TextPainter(
      text: minutesText,
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
    )..layout(minWidth: 70, maxWidth: 70);
    minutesTextPaiter.paint(canvas, const Offset(40, 68));
    //const tempdestination = 'Mi casa';

    final locationText = TextSpan(
        style: const TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.w400,
        ),
        text: destination);
    final loactionPaiter = TextPainter(
      maxLines: 2,
      ellipsis: '...',
      text: locationText,
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.left,
    )..layout(minWidth: size.width - 135, maxWidth: size.width - 135);
    double offsetY = (destination.length > 20) ? 35 : 48;

    loactionPaiter.paint(canvas, Offset(120, offsetY));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(covariant CustomPainter oldDelegate) => false;
}
