import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sensors/sensors.dart';
//import 'package:tccappsono/services/alarm.dart';
import 'package:tccappsono/services/authentication.dart';
import 'package:tccappsono/services/database.dart';
import 'package:screen/screen.dart';

class Dormir extends StatefulWidget {
  Dormir({Key key}) : super(key: key);

  _DormirState createState() => _DormirState();
}

class _DormirState extends State<Dormir> {

  var horaalarme='50';
  var minutoalarme='50';

  _DormirState() {
    Screen.keepOn(true);
    ler();
  }

  /*dispose(){
    this.dispose();
  }*/

  ler()async{
    DataBase db1 = new DataBase();
    Auth au = new Auth();

     horaalarme =  await db1.getH(au.getUser().email);
     minutoalarme =  await db1.getM(au.getUser().email);
     print(horaalarme);
     print(minutoalarme);
  }

  esperaresair() async {
    await new Future.delayed(const Duration(seconds: 1));
    Navigator.pop(context);
  }

  //static Alarme alarme = new Alarme();
  var texto = "Aperte para começar", horac, horaf, usuario;
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
            //_DormirState.alarme.stop();
            horaf = DateTime.now();
            DataBase db = new DataBase();
            Auth a = new Auth();
            usuario = a.getUser().email;
            db.gravarSono(horac, horaf, sono, usuario);
            esperaresair();
          } else {
            texto = "Gravando! Aperte para finalizar";
            //if(int.parse(horaalarme)!=50)
              //alarme.setAlarm(int.parse(horaalarme),int.parse(minutoalarme));
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

            timer = Timer.periodic(Duration(seconds: 5), (timer) {
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
            child: Text(this.texto, style: TextStyle(fontSize: 10, color: Colors.white))
          )
      );
  }
}