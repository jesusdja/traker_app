import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:traker_app/config/traker_texts.dart';

Future<bool?> alertFinish(BuildContext context) async{
  //Size size = MediaQuery.of(context).size;
  bool res = await showDialog(
      context: context,
      builder: ( context ) {
        return AlertDialog(
          title: const Text(''),
          content: const Text(''),
          actions: <Widget>[
            CupertinoButton(
              child: Text(TrakerText().yes,),
              onPressed: ()  {
                Navigator.of(context).pop(true);
              },
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.02,),
            CupertinoButton(
              child: Text(TrakerText().no,),
              onPressed: ()  {
                Navigator.of(context).pop(false);
              },
            ),
          ],
        );
      }
  );
  return res;
}