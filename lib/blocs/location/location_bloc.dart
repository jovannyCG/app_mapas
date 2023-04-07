import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  LocationBloc() : super(const LocationState()) {
    on<LocationEvent>((event, emit) {
    });
  }

  Future getCurrentPosition()async{
final position =await Geolocator.getCurrentPosition();
print(position);
  }

  Future startFollowingUser()async{
    Geolocator.getPositionStream().listen((event) {  
      final position = event;
      print(position);});
   
}
}