import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/blocs.dart';
import 'package:flutter/material.dart';

class MapsScreen extends StatefulWidget {
  const MapsScreen({super.key});

  @override
  State<MapsScreen> createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> {
  late LocationBloc locationBloc;
  @override
  void initState() {
    final locationBloc = BlocProvider.of<LocationBloc>(context);
    locationBloc.startFollowingUser();
    //locationBloc.getCurrentPosition();
    super.initState();
  }

  @override
  void dispose() {
    locationBloc.stopFollowingUser();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<LocationBloc, LocationState>(
      builder: (context, state) {
        if(state.lasKnowLocation == null) return const Center(child: Text('Espere porfavor...'),);
        return Center(child: Text('${state.lasKnowLocation!.latitude},${state.lasKnowLocation!.longitude}'),);
      },
    ));
  }
}
