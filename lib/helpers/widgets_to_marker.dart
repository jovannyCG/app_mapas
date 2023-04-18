import 'dart:ui' as ui;
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../markers/markers.dart';



Future<BitmapDescriptor>getStartMarker(int duration, String destination)async{
final recorder =ui.PictureRecorder();
final canvas = ui.Canvas(recorder);
const size = ui.Size(350, 150);
final startMarker = StarTMarkerPainter(destination: destination, minutes: duration);
startMarker.paint(canvas, size);
final picture = recorder.endRecording();
final image = await picture.toImage(size.width.toInt(), size.height.toInt());
final byteData = await image.toByteData(format: ui.ImageByteFormat.png);

return BitmapDescriptor.fromBytes(byteData!.buffer.asUint8List());
}


Future<BitmapDescriptor>getEndMarker(int kms, String destination)async{
final recorder =ui.PictureRecorder();
final canvas = ui.Canvas(recorder);
const size = ui.Size(350, 150);
final startMarker = EndMarkerPainter(destination: destination, kms: kms,);
startMarker.paint(canvas, size);
final picture = recorder.endRecording();
final image = await picture.toImage(size.width.toInt(), size.height.toInt());
final byteData = await image.toByteData(format: ui.ImageByteFormat.png);

return BitmapDescriptor.fromBytes(byteData!.buffer.asUint8List());
}