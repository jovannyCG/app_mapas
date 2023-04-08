import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../themes/themes.dart';
import '../blocs.dart';
part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  final LocationBloc locationBloc;

  GoogleMapController? _mapController;

  MapBloc({
    required this.locationBloc
  }) : super(const MapState()) {
    on<OnMapInitializedEvent>(_oninitMap);
    locationBloc.stream.listen((locationState) {
      if(!state.followUser)return;
      if(locationState.lasKnowLocation==null)return;
      movCamera(locationState.lasKnowLocation!);

     });
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
