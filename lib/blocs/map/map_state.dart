part of 'map_bloc.dart';

class MapState extends Equatable {
  final bool isMapInitialized;
  final bool isfollowingUser;
  const MapState({this.isMapInitialized = false, this.isfollowingUser = true});

  MapState copyWith({
    bool? isMapInitialized,
    bool? isfollowingUser,
  }) =>
      MapState(
          isMapInitialized: isMapInitialized ?? this.isMapInitialized,
          isfollowingUser: isfollowingUser ?? this.isfollowingUser,);
  @override
  List<Object> get props => [isMapInitialized, isfollowingUser];
}


