import 'package:flutter/material.dart';
import 'package:sensors/sensors.dart';

class Dormir extends StatelessWidget {
  const Dormir({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double x;
    double y;
    double z;
    return Container(
      child: GestureDetector(
         onTap: (){
          accelerometerEvents.listen((AccelerometerEvent event) {
            x = event.x;
            y = event.y;
            z = event.z;
          });
           Navigator.pop(context);
         },
         child: Text('Acelerometer:'+ x.toString() + y.toString() + z.toString()),
       )
    );
  }
}