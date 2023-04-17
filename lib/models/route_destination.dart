import 'package:app_mapas/models/models.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class RouteDestination {
  final List<LatLng> points;
  final double duration;
  final double distance;
  final Feature endPlace;

  RouteDestination(
      {required this.endPlace, required this.points, required this.duration, required this.distance});
}
