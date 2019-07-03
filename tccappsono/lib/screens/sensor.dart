import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sensors/sensors.dart';

class Sensor extends StatefulWidget {
  Sensor({Key key}) : super(key: key);

  _SensorState createState() => _SensorState();
}

class _SensorState extends State<Sensor> {



  double x=0, y=0, padraox=0, padraoy=0;
  bool mexeu = false, padrao = true;
  int position=0;
  List sono = new List();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
          accelerometerEvents.listen((AccelerometerEvent event) {
            this.setState((){
                x = event.x;
                y = event.y;
                if(padrao){
                  padraox = x;
                  padraoy = y;
                  padrao = false;
                }
                
            });

            if(x<padraox-0.07 || x>padraox+0.07 || y<padraoy-0.07 || y>padraoy+0.07){
              mexeu = true;
            }
          });

          Timer.periodic(Duration(seconds: 1), (timer) {
            padrao = true;
            if(mexeu){
              sono.add('1');
            }else {
              sono.add('0');
            }
            mexeu = false;
          });

      },
      child: Container(
          child: /*Column(
            children: <Widget>[
              Text(x.toStringAsFixed(3) + y.toStringAsFixed(3)),
              Text('Padrao: x=' + padraox.toStringAsFixed(3) +' y='+ padraoy.toStringAsFixed(3)),
              ], */
              ListView.builder(
                    itemBuilder: (context, position) {
                      return Card(
                        child: Text(sono[position]),
                      );
                    },
                    itemCount: sono.length,
              )
          )
      );
  }
}