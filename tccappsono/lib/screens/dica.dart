import 'package:flutter/material.dart';
import 'package:tccappsono/services/http.dart';

class Dica extends StatefulWidget {
  Dica({Key key}) : super(key: key);

  _DicaState createState() => _DicaState();
}

class _DicaState extends State<Dica> {

  String dica = "Carregando...";

  _DicaState() {
    getMessage().then((val) => setState(() {
      this.dica = val;
    })).catchError((err) => 
      this.dica = "ServerDown"
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar( title: Text('Dica')),
      body: Container (
        margin: EdgeInsets.all(20),
        child: Card(
          elevation: 2,
          color: Colors.grey[100],
          child: Container(
            padding: EdgeInsets.all(15),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Text(this.dica, style: TextStyle(fontSize: 20)),
          ),
        ),
      )
    );
  }
}
