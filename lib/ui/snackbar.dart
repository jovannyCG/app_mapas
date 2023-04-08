import 'package:flutter/material.dart';

class SnackBarMap extends SnackBar{
   SnackBarMap({Key? key, 
   required String message, 
   Duration duration = const Duration(seconds: 2),
   String label= 'OK',
   VoidCallback? pressed,
   }):super(
    key: key,
    content: Text(message),
    duration: duration,
    action: SnackBarAction(
      label: label, 
      onPressed: (){
        if(pressed!=null){
          pressed();
        }
      },
      )
  );

}