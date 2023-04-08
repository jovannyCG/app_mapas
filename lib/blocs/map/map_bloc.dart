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

  MapBloc({required this.locationBloc}) : super(const MapState()) {
    on<OnMapInitializedEvent>(_oninitMap);
    on<OnStartFollowingUserEventMap>(_onStartFollowingUser);
    on<OnStopFollowingUserEventMap>((event, emit)=>emit(state.copyWith(isfollowingUser: false)));
    locationBloc.stream.listen((locationState) {
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

  void movCamera(LatLng newlocation) {
    final cameraUpdate = CameraUpdate.newLatLng(newlocation);
    _mapController?.animateCamera(cameraUpdate);
  }

  void _onStartFollowingUser( OnStartFollowingUserEventMap event, Emitter<MapState> emit) {
    emit(state.copyWith(isfollowingUser: true));
      if (locationBloc.state.lasKnowLocation == null) return;
    movCamera(locationBloc.state.lasKnowLocation!);
    
  }
}
