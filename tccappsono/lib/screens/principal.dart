import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tccappsono/screens/alarme.dart';
import 'package:tccappsono/screens/dica.dart';
import 'package:tccappsono/screens/dormir.dart';
import 'package:tccappsono/screens/visaogeral.dart';
import 'package:tccappsono/screens/sensor.dart';

class Principal extends StatelessWidget {
  const Principal({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(title: Row(
          children: <Widget>[
            Container(height: 30, width: 30, child: Icon(Icons.developer_mode, color: Colors.white)),
            SizedBox(width: 70),
            Text('BCC UNESP - Bauru')
          ],
        ), centerTitle: true),
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
                        SizedBox(width: 20),
                        Text('Bom', style: TextStyle(fontSize: 20, color: Colors.white)),
                        SizedBox(width: 15),
                        Container(height: 30, width: 30, child: Icon(Icons.info, color: Colors.white)),
                      ],
                    ),
                  )
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Alarme()));
                },
                child: Card(
                  elevation: 4,
                  borderOnForeground: true,
                  color: Colors.blue[300],
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Container(
                    padding: EdgeInsets.only(left: 20),
                    height: MediaQuery.of(context).size.height*0.1,
                    decoration: BoxDecoration(border: Border(right: BorderSide(color: Colors.yellowAccent[100], width: 15))),
                    child: Row(
                      children: <Widget>[
                        Text('Hora do Alarme:', style: TextStyle(fontSize: 25, color: Colors.white)),
                        SizedBox(width: 20),
                        Text('10h20', style: TextStyle(fontSize: 20, color: Colors.white)),
                        SizedBox(width: 15),
                        Container(height: 30, width: 30, child: Icon(Icons.edit, color: Colors.white)),
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
                        Text('Dica do Dia:', style: TextStyle(fontSize: 25, color: Colors.white)),
                        SizedBox(height:10),
                        Text('Higiene do Sono', style: TextStyle(fontSize: 20, color: Colors.white)),
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
                  backgroundColor: Colors.green[300],
                  foregroundColor: Colors.white,
                  label: Text('Dormir'),
                  icon: Icon(Icons.access_alarm),
                  onPressed: (){
                    //Registrar sono
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Dormir()));

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
