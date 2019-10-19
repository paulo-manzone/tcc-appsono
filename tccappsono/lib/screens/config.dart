import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tccappsono/screens/calibrar.dart';
import 'package:tccappsono/screens/sensor.dart';

class Config extends StatefulWidget {
  Config({Key key}) : super(key: key);

  _ConfigState createState() => _ConfigState();
}

class _ConfigState extends State<Config> {

  _deleteCal() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
       child:  Scaffold(
        appBar: AppBar(title: Row(
          children: <Widget>[
            Container(height: 30, width: 30, child: Icon(Icons.settings, color: Colors.white)),
            SizedBox(width: MediaQuery.of(context).size.width*0.03),
            Text('Configurações')
          ],
        ), centerTitle: true),
        body: Container(
          child: ListView(
            children: <Widget>[
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Calibrar()));
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
                        Text('Calibrar', style: TextStyle(fontSize: 25, color: Colors.white)),
                        SizedBox(width: 5),
                        Container(height: 30, width: 30, child: Icon(Icons.settings_overscan, color: Colors.white)),
                      ],
                    ),
                  )
                ),
              ),

              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Sensor()));
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
                        Text('Saidas do sensor', style: TextStyle(fontSize: 25, color: Colors.white)),
                        SizedBox(width: 5),
                        Container(height: 30, width: 30, child: Icon(Icons.remove_red_eye, color: Colors.white)),
                      ],
                    ),
                  )
                ),
              ),
              GestureDetector(
                onTap: (){
                  _deleteCal();
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
                        Text('Deletar Calibracao', style: TextStyle(fontSize: 25, color: Colors.white)),
                        SizedBox(width: 5),
                        Container(height: 30, width: 30, child: Icon(Icons.delete, color: Colors.white)),
                      ],
                    ),
                  )
                ),
              ),
            ]
          )
        ),
      )
    );
  }
}