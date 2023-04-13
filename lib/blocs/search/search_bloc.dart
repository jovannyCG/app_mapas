import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:app_mapas/services/services.dart';
part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {

TrafficService trafficService;

  SearchBloc({
    required this.trafficService
  }) : super(const SearchState()) {
    on<OnActivateManualMarkerEvent>((event, emit) => emit(state.copyWhith(displayManualMarker: true)));
  on<OnDesActivateManualMarkerEvent>((event, emit) => emit(state.copyWhith(displayManualMarker: false)));
  }
}
