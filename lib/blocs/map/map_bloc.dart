import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../themes/themes.dart';
part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {

  GoogleMapController? _mapController;

  MapBloc() : super(const MapState()) {
    on<OnMapInitializedEvent>(_oninitMap);
  }
  void _oninitMap(OnMapInitializedEvent event, Emitter<MapState> emit){
    _mapController = event.controller;
    _mapController!.setMapStyle(jsonEncode(uberMapTheme));
    //_mapController!.setMapStyle(jsonEncode(darkMaptheme));
    emit(state.copyWith(isMapInitialized: true));
  }

  void movCamera(LatLng newlocation){
    final cameraUpdate = CameraUpdate.newLatLng(newlocation);
    _mapController?.animateCamera(cameraUpdate);
  }
  
}
