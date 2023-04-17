part of 'map_bloc.dart';

abstract class MapEvent extends Equatable {
  const MapEvent();

  @override
  List<Object> get props => [];
}
class OnMapInitializedEvent extends MapEvent{
  final GoogleMapController controller;

  const OnMapInitializedEvent(this.controller);
}

class OnStopFollowingUserEventMap extends MapEvent{

}
class OnStartFollowingUserEventMap extends MapEvent{
  
}

class UpdateUserPolyLinesEvent extends MapEvent{
final List<LatLng> userLocation;

  const UpdateUserPolyLinesEvent(this.userLocation);
}

class OnToggleUserRoute extends MapEvent{

}

class DisplayPolyLinesEvent extends MapEvent{
final Map<String, Polyline> polylines;
final Map<String, Marker> markers;
  const DisplayPolyLinesEvent(this.polylines, this.markers);
}

