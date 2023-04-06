
import 'package:app_mapas/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/gps/blocs.dart';




class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<GpsBloc, GpsState>(
        builder: (context, state) {
          return state.isAllGranted
          ? const MapsScreen()
          : const GpsAccessScreen();
        },
      )
   );
  }
}