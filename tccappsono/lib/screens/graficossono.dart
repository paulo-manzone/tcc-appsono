import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:tccappsono/services/authentication.dart';
import 'package:tccappsono/services/database.dart';


class GraficosSono extends StatefulWidget {
  GraficosSono({Key key}) : super(key: key);

  _GraficosSonoState createState() => _GraficosSonoState();
}

class _GraficosSonoState extends State<GraficosSono> {

  List<charts.Series<Sono, int>> _seriesData;
  var dadosSono = [
      new Sono(0,0)
    ];

  _generateData() async{
    DataBase db = new DataBase();
    Auth au = new Auth();
    List a = await db.getGr(au.getUser().email);
    int l;
    var datasonox = <Sono>[];
    for (int i = 0; i < a.length; i++){
       l = int.parse(a[i]);
       datasonox.add(new Sono(i, l));
     }
     return datasonox;
  }

  _GraficosSonoState(){
    _seriesData = new List<charts.Series<Sono, int>>();
    _seriesData.add(
              charts.Series(
                colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xff990099)),
                id: 'Sono',
                data: dadosSono,
                domainFn: (Sono sono, _) => sono.x,
                measureFn: (Sono sono, _) => sono.y,
              ),
    );
    _generateData().then((a){
      setState(() {
        dadosSono = a;
        _seriesData = new List<charts.Series<Sono, int>>();
        _seriesData.add(
              charts.Series(
                colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xff990099)),
                id: 'Sono',
                data: dadosSono,
                domainFn: (Sono sono, _) => sono.x,
                measureFn: (Sono sono, _) => sono.y,
              ),
        );
      });
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('Seu Sono'), centerTitle: true),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(10, 50, 10, 20),
            height: MediaQuery.of(context).size.height*0.5,
            child: charts.LineChart(
              _seriesData,
              animate: true,
              animationDuration: Duration(milliseconds: 500),
              
              )
 
          ),
          Text('Dados da sua última noite de sono'),
          Container(
            child: Text('Perceba como sua agitação varia durante a noite, tendo picos de forma cíclica. ' + 
            'Acordar em um momento de sono mais leve (com maior agitação) pode melhorar a sua disposição'),
            padding: EdgeInsets.fromLTRB(50, 50, 50, 20),
          )
          
          
        ],
        
      )
    );
  }
}

//Classe de entrada do sono
class Sono {
  final int x;
  final int y;
  Sono(this.x, this.y);
}