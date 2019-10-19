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
  _generateData(){
    var datasono = [
      new Sono(0,1),
      new Sono(1,1),
      new Sono(2,0),
      new Sono(3,1),
      new Sono(4,0),
      new Sono(5,0),
      new Sono(6,0),
      new Sono(7,1),
      new Sono(8,0),
      new Sono(9,0),
      new Sono(10,1)
    ];

    DataBase db = new DataBase();
    Auth au = new Auth();
    if(db.getGraficos(au.getUser()) != null)
     datasono = db.getGraficos(au.getUser()); 
    
    _seriesData.add(
      charts.Series(
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xff990099)),
        id: 'Sono',
        data: datasono,
        domainFn: (Sono sono, _) => sono.x,
        measureFn: (Sono sono, _) => sono.y,
      ),
    );
    int i = 0;
  }

  @override
  void initState() { 
    super.initState();
    _seriesData = List<charts.Series<Sono, int>>();
    _generateData();
    
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('Seu Sono'), centerTitle: true),
      body: Container(
        padding: EdgeInsets.fromLTRB(10, 50, 10, 20),
        height: MediaQuery.of(context).size.height*0.5,
        child: charts.LineChart(
          _seriesData,
          animate: true,
          animationDuration: Duration(seconds: 1),
          )
 
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