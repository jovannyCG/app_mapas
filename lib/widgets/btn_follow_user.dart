import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/blocs.dart';

class BtnFollowUser extends StatelessWidget {
  const BtnFollowUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mapBloc = BlocProvider.of<MapBloc>(context);
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: CircleAvatar(
        backgroundColor: Colors.white,
        maxRadius: 25,
        child: BlocBuilder<MapBloc, MapState>(
          builder: (context, state) {
            return IconButton(
              onPressed: () {
                mapBloc.add(OnStartFollowingUserEventMap());
              },
              icon:  Icon(
                state.isfollowingUser 
              ?Icons.directions_run_rounded
              :Icons.hail_rounded,
                color: Colors.black,
              ));
          },
        
        ),
      ),
    );
  }
}
