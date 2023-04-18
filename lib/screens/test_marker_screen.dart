import 'package:flutter/material.dart';

import '../markers/end_marker.dart';
import '../markers/start_marker.dart';




class MarkerTest extends StatelessWidget {
  const MarkerTest({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 350,
          height: 150,
          color: Colors.amber,
          child: CustomPaint(
            painter: EndMarkerPainter(destination: 'Upiiz', kms: 5),
          ),
        )
     ),
   );
  }
}