import 'package:flutter/material.dart';

class Dica extends StatefulWidget {
  Dica({Key key}) : super(key: key);

  _DicaState createState() => _DicaState();
}

class _DicaState extends State<Dica> {
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
            child: Text('Texto Texto Texto Texto Texto Texto Texto Texto Texto ', style: TextStyle(fontSize: 20)),
          ),
        ),
      )
    );
  }
}
