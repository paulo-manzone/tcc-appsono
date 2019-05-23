import 'package:flutter/material.dart';

class Dormir extends StatelessWidget {
  const Dormir({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
         onTap: (){
           Navigator.pop(context);
         },
         child: Text('Dormindo'),
       )
    );
  }
}