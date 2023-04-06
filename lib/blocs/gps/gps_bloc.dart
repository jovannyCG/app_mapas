import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';

part 'gps_event.dart';
part 'gps_state.dart';

class GpsBloc extends Bloc<GpsEvent, GpsState> {

  StreamSubscription? gpsServiceSubscription;
  GpsBloc()
      : super(
            const GpsState(isGpsEnable: false, isGpsPermissionGranted: false)) {
    // on<GpsEvent>((event, emit) {});
    on<GpsAndPermissionEvent>((event, emit) => emit(state.copyWith(
        isGpsEnable: event.isGpsEnable,
        isGpsPermissionGranted: event.isGpsPermissionGranted)));
        _init();
  }

Future<void> _init()async {
final isEnable = await _checkGpsStatus();

add(GpsAndPermissionEvent(
  isGpsEnable: isEnable, 
isGpsPermissionGranted: state.isGpsPermissionGranted));

}
Future<bool> _checkGpsStatus()async{

final isEnable = await Geolocator.isLocationServiceEnabled();
gpsServiceSubscription = Geolocator.getServiceStatusStream().listen((event) { 
Geolocator.getServiceStatusStream().listen((event) { 
final isEnable =(event.index == 1) ? true: false;
add(GpsAndPermissionEvent(
  isGpsEnable: isEnable, 
isGpsPermissionGranted: state.isGpsPermissionGranted));
});
});
  return isEnable;
}
@override
  Future<void> close() {
   gpsServiceSubscription?.cancel();
    return super.close();
  }
}
