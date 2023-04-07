import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../blocs/blocs.dart';

class MapView extends StatelessWidget {
  final LatLng initialLocation;
  const MapView({Key? key, required this.initialLocation}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final mapBloc = BlocProvider.of<MapBloc>(context);
    final size = MediaQuery.of(context).size;
     final CameraPosition initialCameraPosition = CameraPosition(
      target: initialLocation,
      zoom: 15);

    return SizedBox(
      width: size.width,
      height: size.height,
      child: GoogleMap(
        myLocationButtonEnabled: false,
        zoomControlsEnabled: false,
        trafficEnabled: true,
        compassEnabled: true,
        myLocationEnabled: true,
          mapType: MapType.hybrid,
          initialCameraPosition: initialCameraPosition,
          onMapCreated: ( controller) => mapBloc.add(OnMapInitializedEvent(controller)),
           
        ),
    );
  }
}