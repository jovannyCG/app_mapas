import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showloadingMessage(BuildContext context) {
  if (Platform.isAndroid) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) =>  AlertDialog(
              title: const Text('espere por favor'),
              content: Container(
                width: 100,
                height: 100,
                margin: const EdgeInsets.only(top: 10),
                child: Column(
                  children: const [
                    Text('calculando ruta'),
                    SizedBox(height: 5,),
                    CircularProgressIndicator(strokeWidth: 2, color: Colors.black)
              
                  ],
                ),
              )
            ));
    return;
  }
  showCupertinoDialog(
      context: context,
      builder: (context) => const CupertinoAlertDialog(
            title: Text('espere por favor'),
            content: CupertinoActivityIndicator()
          ));
}
