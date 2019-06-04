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
      body: Text('visão geral')
    );
  }
}