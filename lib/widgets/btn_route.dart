import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/blocs.dart';

class BtnShowRoute extends StatelessWidget {
  const BtnShowRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mapBloc = BlocProvider.of<MapBloc>(context);
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: CircleAvatar(
        backgroundColor: Colors.white,
        maxRadius: 25,
        child: IconButton(
            onPressed: () {
              mapBloc.add(OnToggleUserRoute());
            },
            icon: const Icon(
              Icons.more_horiz_rounded,
              color: Colors.black,
            )),
      ),
    );
  }
}
