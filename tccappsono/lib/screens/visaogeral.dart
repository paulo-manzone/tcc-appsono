import 'package:flutter/material.dart';

class VisaoGeral extends StatefulWidget {
  VisaoGeral({Key key}) : super(key: key);

  _VisaoGeralState createState() => _VisaoGeralState();
}

class _VisaoGeralState extends State<VisaoGeral> {
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
                            Text('Qualidade Geral:', style: TextStyle(fontSize: 25, color: Colors.white)),
                            SizedBox(width: 20),
                            Text('Bom', style: TextStyle(fontSize: 20, color: Colors.white)),
                            SizedBox(width: 15),
                            Container(height: 30, width: 30, child: Icon(Icons.info, color: Colors.white)),
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
                            Text('Qualidade Geral:', style: TextStyle(fontSize: 25, color: Colors.white)),
                            SizedBox(width: 20),
                            Text('Bom', style: TextStyle(fontSize: 20, color: Colors.white)),
                            SizedBox(width: 15),
                            Container(height: 30, width: 30, child: Icon(Icons.info, color: Colors.white)),
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