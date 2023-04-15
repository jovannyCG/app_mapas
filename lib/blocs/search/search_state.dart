part of 'search_bloc.dart';

class SearchState extends Equatable {
  final bool displayManualMarker;
  final List<Feature> places;
  final List<Feature> history;

  const SearchState({ 
    this.places = const [], 
    this.displayManualMarker= false,
    this.history = const [],
    });



  SearchState copyWhith({
    final bool? displayManualMarker,
    final List<Feature>? places,
    final List<Feature>? history
    }
    )=>SearchState(
      displayManualMarker: displayManualMarker ?? this.displayManualMarker,
      places: places ?? this.places,
      history: history ?? this.history
      );
    
  
  
  @override
  List<Object> get props => [displayManualMarker, places, history];
}


