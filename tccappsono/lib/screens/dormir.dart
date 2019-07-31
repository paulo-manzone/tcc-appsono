import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sensors/sensors.dart';
import 'package:tccappsono/services/database.dart';

class Dormir extends StatefulWidget {
  Dormir({Key key}) : super(key: key);

  _DormirState createState() => _DormirState();
}

class _DormirState extends State<Dormir> {


  esperaresair() async {
    await new Future.delayed(const Duration(seconds: 1));
    Navigator.pop(context);
  }


  var texto = "Aperte para começar", horac, horaf;
  double x=0, y=0, padraox=0, padraoy=0;
  bool mexeu = false, padrao = true, comecou= false;
  int position=0;
  List sono = new List();
  Timer timer;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        //Se ja startou, o proximo tap é para parar e gravar no banco
          if(comecou){
            texto = "Gravado!";
            timer.cancel();
            horaf = DateTime.now();
            DataBase db = new DataBase();
            db.gravarSono(horac, horaf, sono);
            esperaresair();
          } else {
            texto = "Gravando! Pressione novamente para finalizar";
            horac = DateTime.now();
            comecou = true;
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

            timer = Timer.periodic(Duration(seconds: 1), (timer) {
              padrao = true;
              if(mexeu){
                sono.add('1');
              }else {
                sono.add('0');
              }
              mexeu = false;
            });
          }

          

      },
      child: Center(
        child: Row(
          children: <Widget>[
            SizedBox(width: 10),
            Text(this.texto, style: TextStyle(fontSize: 20, color: Colors.white, )),
            Container(height: 30, width: 30, child: Icon(Icons.access_time, color: Colors.white)),
          ],
        ),
      )
      );
  }
}