part of 'location_bloc.dart';

class LocationState extends Equatable {
  final bool followingUser;
  final LatLng? lasKnowLocation;
  final List<LatLng> myLocationHistory;

  const LocationState(
      {this.lasKnowLocation, this.followingUser = false, myLocationHistory})
      : myLocationHistory = myLocationHistory ?? const [];

  LocationState copyWith({
    final bool? followingUser,
    final LatLng? lasKnowLocation,
    final List<LatLng>? myLocationHistory,
  }) =>
      LocationState(
          followingUser: followingUser ?? this.followingUser,
          lasKnowLocation: lasKnowLocation ?? this.lasKnowLocation,
          myLocationHistory: myLocationHistory ?? this.myLocationHistory);

  @override
  List<Object?> get props =>
      [followingUser, lasKnowLocation, myLocationHistory];
}
