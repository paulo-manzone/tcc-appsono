import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sensors/sensors.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Calibrar extends StatefulWidget {
  Calibrar({Key key}) : super(key: key);

  _CalibrarState createState() => _CalibrarState();
}

class _CalibrarState extends State<Calibrar> {

  //Salva um valor na SharedPreferences -> calibracao
  Future<void> _savePref(calibracao) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('calibracao', calibracao);
  }

  //Dar um tempo e volta na tela anterior
  esperaresair() async {
    await new Future.delayed(const Duration(seconds: 1));
    Navigator.pop(context);
  }

  double x=0, y=0, padraox=0, padraoy=0;
  bool mexeu = false, padrao = true;
  double calibra = 0.00; //Calibracao iniciando com 0 (sensibilidade maxima, vai retornar sempre 1 no 'mexeu')
  int position=0;
  List<String> sono = new List();
  List<double> listacalibracao = new List();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
          sono.add('Calibrando, Por favor deixa o celular em uma superficie plana, sem vibrações e não movimente-o');
          listacalibracao.add(0.0);
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

            if(x<padraox-calibra || x>padraox+calibra || y<padraoy-calibra || y>padraoy+calibra){
              mexeu = true;
            }
          });

          Timer timer = Timer.periodic(Duration(seconds: 5), (timer) {
            padrao = true;
            listacalibracao.add(calibra); // Adiciona a calibracao atual na lista
            if(mexeu){
              sono.add('1');
              calibra+=0.01; // Calibrando para deixar menos sensivel
            }else {
              sono.add('0');
            }
            mexeu = false;

            //Verificando critério para parar
            if(sono.length>10){
              //Caso ele possua uma sequencia de 5 zeros, é considerado calibrado
              if(sono[sono.length-1] == "0" && sono[sono.length-2] == "0" && sono[sono.length-3] == "0" && sono[sono.length-4] == "0" && sono[sono.length-5] == "0"){
                //Salvar nos shared prefs, e sair da tela de calibracao
                _savePref(calibra+0.01);
                sono.add("Calibrado! C = ");
                listacalibracao.add(calibra+0.01);
                esperaresair();
                timer.cancel();
              }
            }
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
                        child: Text(sono[position] + '=>' + listacalibracao[position].toString())
                      );
                    },
                    itemCount: sono.length,
              )
          )
      );
  }
}