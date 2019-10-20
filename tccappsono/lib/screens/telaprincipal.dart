import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tccappsono/screens/calibrar.dart';
import 'package:tccappsono/screens/config.dart';
//import 'package:tccappsono/screens/alarme.dart';
//import 'package:tccappsono/screens/alarmform.dart';
import 'package:tccappsono/screens/dica.dart';
import 'package:tccappsono/screens/dormir.dart';
import 'package:tccappsono/screens/sensor.dart';
import 'package:tccappsono/screens/visaogeral.dart';
import 'package:tccappsono/services/authentication.dart';
import 'package:tccappsono/services/database.dart';
import 'package:tccappsono/services/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TelaPrincipal extends StatefulWidget {
  TelaPrincipal({Key key}) : super(key: key);

  _TelaPrincipalState createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  String qualidade = "...";
  double cal = 0;

  _getCal() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    cal= (prefs.getDouble('calibracao') ?? 0);
  }


  _TelaPrincipalState() {

    getQualidadeGeral().then((val) => setState(() {
      this.qualidade = val;
    })).catchError((err) => 
      this.qualidade = "ServerDown"
    );
  }


  @override
  Widget build(BuildContext context) {
  return Container(
      child: Scaffold(
        appBar: AppBar(title: Row(
          children: <Widget>[
            Container(height: 30, width: 30, child: Icon(Icons.developer_mode, color: Colors.white)),
            SizedBox(width: MediaQuery.of(context).size.width*0.1),
            Text('AppSono - UNESP BAURU')
          ],
        ), centerTitle: true, automaticallyImplyLeading: false),
        
        body: Container(
          child: ListView(
            children: <Widget>[
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => VisaoGeral()));
                },
                child: Card(
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
                        Text('Qualidade Geral:', style: TextStyle(fontSize: 25, color: Colors.white)),
                        SizedBox(width: 5),
                        Text(this.qualidade, style: TextStyle(fontSize: 15, color: Colors.white)),
                        SizedBox(width: 15),
                        Container(height: 30, width: 30, child: Icon(Icons.info, color: Colors.white)),
                      ],
                    ),
                  )
                ),
              ),

              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Config()));
                },
                child: Card(
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
                        Text('Configurações', style: TextStyle(fontSize: 25, color: Colors.white)),
                        SizedBox(width: 5),
                        Container(height: 30, width: 30, child: Icon(Icons.settings, color: Colors.white)),
                      ],
                    ),
                  )
                ),
              ),

              
                            
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Dica()));
                },
                child: Card(
                  elevation: 4,
                  borderOnForeground: true,
                  color: Colors.blue[300],
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Container(
                    padding: EdgeInsets.only(left: 20),
                    height: MediaQuery.of(context).size.height*0.25,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(border: Border(right: BorderSide(color: Colors.orange[200], width: 15))),
                    child: Column(
                      children: <Widget>[
                        SizedBox(height:10),
                        Text('Dica do Dia', style: TextStyle(fontSize: 25, color: Colors.white)),
                        SizedBox(height:30),
                        Text('clique para ler', style: TextStyle(fontSize: 20, color: Colors.white)),
                        SizedBox(height: 10),
                        Container(height: 30, width: 30, child: Icon(Icons.airline_seat_flat, color: Colors.white))
                        
                      ],
                    ),
                  )
                ),
              ),
              SizedBox(height: 5),

              SizedBox(
                width: 200,
                height: MediaQuery.of(context).size.height*0.3,
                child: FloatingActionButton.extended(
                  shape: CircleBorder(),
                  backgroundColor: Colors.orange[300],
                  foregroundColor: Colors.white,
                  label: Text('Dormir'),
                  icon: Icon(Icons.access_alarm),
                  onPressed: (){
                    //Registrar sono -> Abre somente se a calibração tiver sido feita
                    _getCal();
                    if(cal == 0) Navigator.push(context, MaterialPageRoute(builder: (context) => Calibrar()));
                    else Navigator.push(context, MaterialPageRoute(builder: (context) => Dormir()));

                  },
                ),
              )
            ],
          )
        ),
      )
    );
  }
}