import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/blocs.dart';

class GpsAccessScreen extends StatelessWidget {
  const GpsAccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: BlocBuilder<GpsBloc, GpsState>(
        builder: (context, state) {
          return !state.isGpsEnable
              ? const _EnableGpsMessage()
              : const _AccessBotton();
        },
      )
          //

          ),
    );
  }
}

class _AccessBotton extends StatelessWidget {
  const _AccessBotton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    
    final gpsBloc = BlocProvider.of<GpsBloc>(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Es necesario acceder al gps'),
        MaterialButton(
            splashColor: Colors.transparent,
            elevation: 0,
            shape: const StadiumBorder(),
            color: Colors.black,
            child: const Text(
              'solicitar Acceso',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              gpsBloc.askGpsAccess();
            })
      ],
    );
  }
}

class _EnableGpsMessage extends StatelessWidget {
  const _EnableGpsMessage();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Es necesario activar el GPS',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
      ),
    );
  }
}
