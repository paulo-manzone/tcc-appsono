import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sensors/sensors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Sensor extends StatefulWidget {
  Sensor({Key key}) : super(key: key);

  _SensorState createState() => _SensorState();
}

class _SensorState extends State<Sensor> {

  @override
  void dispose(){
    processo.cancel();
  }
  
  Timer processo;
  double x=0, y=0, padraox=0, padraoy=0;
  bool mexeu = false, padrao = true;
  double cal=0.0; // Calibração
  int position=0;
  List sono = new List();

  //Inicializando a calibração
  _getCal() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    cal= (prefs.getDouble('calibracao') ?? 0);
  }
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        _getCal();
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

            if(x<padraox-cal || x>padraox+cal || y<padraoy-cal || y>padraoy+cal){
              mexeu = true;
            }
          });

          processo = Timer.periodic(Duration(seconds: 1), (timer) {
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
                        child: Text(sono[position] + "=>Cal = " + cal.toString()),
                      );
                    },
                    itemCount: sono.length,
              )
          )
      );
  }
}