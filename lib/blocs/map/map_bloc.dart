import 'dart:convert';
import 'dart:async';
import 'package:app_mapas/models/models.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';

import '../../themes/themes.dart';
import '../blocs.dart';
part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  final LocationBloc locationBloc;
  GoogleMapController? _mapController;
  LatLng? mapCenter; 
  StreamSubscription<LocationState>? locationStateSubscription;

  MapBloc({required this.locationBloc}) : super(const MapState()) {

    on<OnMapInitializedEvent>(_oninitMap);

    on<OnStartFollowingUserEventMap>(_onStartFollowingUser);

    on<OnStopFollowingUserEventMap>(
        (event, emit) => emit(state.copyWith(isfollowingUser: false)));

    on<UpdateUserPolyLinesEvent>(_updateUserPolyLines);

    on<OnToggleUserRoute>(
        (event, emit) => emit(state.copyWith(showMyRoute: !state.showMyRoute)));
        on<DisplayPolyLinesEvent>((event, emit) => emit(state.copyWith(polylines: event.polylines, markers: event.markers)));

    locationStateSubscription =locationBloc.stream.listen((locationState) {
      if (locationState.lasKnowLocation != null) {
        add(UpdateUserPolyLinesEvent(locationState.myLocationHistory));
      }
      if (!state.isfollowingUser) return;
      if (locationState.lasKnowLocation == null) return;
      movCamera(locationState.lasKnowLocation!);
    });
  }
  void _oninitMap(OnMapInitializedEvent event, Emitter<MapState> emit) {
    _mapController = event.controller;
    _mapController!.setMapStyle(jsonEncode(darkMaptheme));
    //_mapController!.setMapStyle(jsonEncode(uberMapTheme));
    emit(state.copyWith(isMapInitialized: true));
  }

  Future drawRoutePolyline(RouteDestination destination) async {
    final myRoute = Polyline(
      width: 5,
      polylineId: const PolylineId('route'),
      color: Colors.black,
      points: destination.points,
      startCap: Cap.roundCap,
      endCap: Cap.roundCap
      );
      final startMarker = Marker(
        markerId: const MarkerId('start'),
        position: destination.points.first,
        infoWindow: const InfoWindow(
          title: 'inicio',
          snippet: 'punto inicial de la ruta'
        )
        );
        final endMarker = Marker(
        markerId: const MarkerId('end'),
        position: destination.points.last,
        infoWindow: const InfoWindow(
          title: 'fin',
          snippet: 'punto final de la ruta'
        )
        );

      final currentPolylines = Map<String, Polyline>.from(state.polylines);
      currentPolylines['route'] = myRoute;

      final currentMarkers = Map<String, Marker>.from(state.markers);
      currentMarkers['start'] = startMarker;
      currentMarkers['end'] = endMarker;
      add(DisplayPolyLinesEvent(currentPolylines, currentMarkers));

      await Future.delayed(const Duration(milliseconds: 300));
      _mapController?.showMarkerInfoWindow(const MarkerId('start'),);
  }

  void movCamera(LatLng newlocation) {
    final cameraUpdate = CameraUpdate.newLatLng(newlocation);
    _mapController?.animateCamera(cameraUpdate);
  }

  void _onStartFollowingUser(
      OnStartFollowingUserEventMap event, Emitter<MapState> emit) {
    emit(state.copyWith(isfollowingUser: true));
    if (locationBloc.state.lasKnowLocation == null) return;
    movCamera(locationBloc.state.lasKnowLocation!);
  }

  void _updateUserPolyLines(
      UpdateUserPolyLinesEvent event, Emitter<MapState> emit) {
    final myRoute = Polyline(
        polylineId: const PolylineId('myRoute'),
        color: Colors.black,
        width: 5,
        startCap: Cap.roundCap,
        endCap: Cap.roundCap,
        points: event.userLocation);
    final currentPolylines = Map<String, Polyline>.from(state.polylines);
    currentPolylines['myRoute'] = myRoute;
    emit(state.copyWith(polylines: currentPolylines));
  }
  @override
  Future<void> close() {
    locationStateSubscription?.cancel();
    return super.close();
  }
}
