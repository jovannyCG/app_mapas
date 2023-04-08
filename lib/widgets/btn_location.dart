import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/blocs.dart';
import '../ui/ui.dart';

class BtnCurrentLocation extends StatelessWidget {
  const BtnCurrentLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final locationBloc = BlocProvider.of<LocationBloc>(context);
    final mapBloc = BlocProvider.of<MapBloc>(context);
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: CircleAvatar(
        backgroundColor: Colors.white,
        maxRadius: 25,
        child: IconButton(
            onPressed: () {
              final userLocation = locationBloc.state.lasKnowLocation;

              if (userLocation == null) {
                final snack = SnackBarMap(
                  message: 'la ubicación no esta disponible',
                );
                ScaffoldMessenger.of(context).showSnackBar(snack);
                return;
              }
              mapBloc.movCamera(userLocation);
            },
            icon: const Icon(
              Icons.my_location_outlined,
              color: Colors.black,
            )),
      ),
    );
  }
}
