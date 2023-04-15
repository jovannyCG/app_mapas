import 'package:app_mapas/blocs/blocs.dart';
import 'package:app_mapas/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class SearchDestinationDelegate extends SearchDelegate<SearchResult> {
  SearchDestinationDelegate() : super(searchFieldLabel: 'Search...');
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          final result = SearchResult(cancel: true);
          close(context, result);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {

    final searchBloc = BlocProvider.of<SearchBloc>(context);
    final proximity = BlocProvider.of<LocationBloc>(context).state.lasKnowLocation;

searchBloc.getPlacesByQuery(proximity!, query);
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        final places = state.places;
        final  place = places[0];
        return ListView(
          children: [
             ListTile(
            title: Text( place.text),
            subtitle: Text( place.placeName),
            leading: const Icon(Icons.place_outlined, color: Colors.black,),
            onTap: (){final result = SearchResult(
              cancel: false, 
              manual: false,
              position: LatLng(place.center[1], place.center[0]),
              name: place.text,
              
              );
            close(context, result);}
          )
          ],
        );
       /* return ListView.separated(
          itemBuilder: ( context,  i){
            final  titlePlace = places[i];
            ListTile(
            title: Text( titlePlace.text),
            subtitle: Text( titlePlace.placeName),
            leading: const Icon(Icons.place_outlined, color: Colors.black,),
            onTap: (){final result = SearchResult(cancel: false, manual: false);
            close(context, result);}
          );
          }, 
          itemCount: places.length, 
          separatorBuilder: ( context, i ) => const Divider()

        );*/
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: const Icon(
            Icons.location_on_outlined,
            color: Colors.black,
          ),
          title: const Text(
            'Colocar la ubicación manualmente',
            style: TextStyle(color: Colors.black),
          ),
          onTap: () {
            final result = SearchResult(cancel: false, manual: true);
            close(context, result);
          },
        )
      ],
    );
  }
}
