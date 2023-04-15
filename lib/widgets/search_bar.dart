import 'package:animate_do/animate_do.dart';
import 'package:app_mapas/blocs/blocs.dart';
import 'package:app_mapas/models/models.dart';
import 'package:app_mapas/search/search_delegate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        return state.displayManualMarker
            ? const SizedBox()
            : FadeInDown(
                duration: const Duration(milliseconds: 300),
                child: const _SearchBarBody());
      },
    );
  }
}

class _SearchBarBody extends StatelessWidget {
  void onSearchResults(BuildContext context, SearchResult result) async {
    final searchBloc = BlocProvider.of<SearchBloc>(context);
    final mapBloc = BlocProvider.of<MapBloc>(context);
    final locationBloc = BlocProvider.of<LocationBloc>(context).state.lasKnowLocation;
    if (result.manual) {
      searchBloc.add(OnActivateManualMarkerEvent());
      return;
    }
    if (result.position != null) {
      final destination = await searchBloc.getCoorsStartToEnd(locationBloc!, result.position!);
      await mapBloc.drawRoutePolyline(destination);
    }
  }

  const _SearchBarBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 3),
        margin: const EdgeInsets.only(top: 10),
        width: double.infinity,
        child: GestureDetector(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(100),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 5,
                    offset: Offset(0, 5),
                  )
                ]),
            child: const Text(
              'donde quiress ir?',
              style: TextStyle(color: Colors.black87),
            ),
          ),
          onTap: () async {
            final result = await showSearch(
                context: context, delegate: SearchDestinationDelegate());
            if (result == null) return;
            onSearchResults(context, result);
          },
        ),
      ),
    );
  }
}
