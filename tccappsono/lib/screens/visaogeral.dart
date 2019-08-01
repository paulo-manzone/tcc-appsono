import 'package:flutter/material.dart';
import 'package:tccappsono/services/http.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:tccappsono/widgets/graph.dart';

class VisaoGeral extends StatefulWidget {
  VisaoGeral({Key key}) : super(key: key);

  _VisaoGeralState createState() => _VisaoGeralState();
}

class LinearSales {
  final int year;
  final int sales;

  LinearSales(this.year, this.sales);
}

class _VisaoGeralState extends State<VisaoGeral> {



//Carregando através de API o valor do status
  String status = "Carregando...";
  String regularidade = "Carregando...";

  _VisaoGeralState() {
    getStatus().then((val) => setState(() {
      this.status = val;
    })).catchError((err) => 
      this.status = "ServerDown"
    );

    getRegularidade().then((val) => setState(() {
      this.regularidade = val;
    })).catchError((err) => 
      this.regularidade = "ServerDown"
    );
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar( title: Text('Visão Geral')),
      body: Container(
        child: Column(
          children: <Widget>[
            Card(
                      elevation: 4,
                      borderOnForeground: true,
                      color: Colors.blue[300],
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: Container(
                        padding: EdgeInsets.only(left: 20),
                        height: MediaQuery.of(context).size.height*0.1,
                        decoration: BoxDecoration(border: Border(right: BorderSide(color: Colors.lime[200], width: 15))),
                        child: Row(
                          children: <Widget>[
                            Text('Estado:', style: TextStyle(fontSize: 25, color: Colors.white)),
                            SizedBox(width: 15),
                            Text(this.status, style: TextStyle(fontSize: 25, color: Colors.white)),
                          ],
                        ),
                      )
                    ),
            Card(
                      elevation: 4,
                      borderOnForeground: true,
                      color: Colors.blue[300],
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: Container(
                        padding: EdgeInsets.only(left: 20),
                        height: MediaQuery.of(context).size.height*0.1,
                        decoration: BoxDecoration(border: Border(right: BorderSide(color: Colors.lime[200], width: 15))),
                        child: Row(
                          children: <Widget>[
                            Text('Regularidade:', style: TextStyle(fontSize: 25, color: Colors.white)),
                            SizedBox(width: 20),
                            Text(this.regularidade , style: TextStyle(fontSize: 20, color: Colors.white)),
                          ],
                        ),
                      )
                    ),
              Card(
                      elevation: 4,
                      borderOnForeground: true,
                      color: Colors.blue[300],
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: Container(
                        padding: EdgeInsets.only(left: 20),
                        height: MediaQuery.of(context).size.height*0.5,
                        decoration: BoxDecoration(border: Border(right: BorderSide(color: Colors.yellow, width: 15), left:BorderSide(color: Colors.green, width: 5))),
                        child: Column(
                          children: <Widget>[
                            Row(children: <Widget>[Text('Lembretes:', style: TextStyle(fontSize: 25, color: Colors.white))],),
                            SizedBox(height: MediaQuery.of(context).size.height*0.05),
                            Text('1: Celular deve estar no silencioso;', style: TextStyle(fontSize: 25, color: Colors.white)),
                            Text('2: Celular deve estar na cama;', style: TextStyle(fontSize: 25, color: Colors.white)),
                            Text('3: Celular deve estar conectado na internet ao finalizar o registro de sono.', style: TextStyle(fontSize: 25, color: Colors.white))

                          ],
                        ),
                      )
                    ),
          ],
        )
      )
    );
  }
}