import 'package:flutter/material.dart';
import 'screens/principal.dart';
import 'package:flutter/services.dart';
import 'screens/telaprincipal.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //Travar orientação do aplicativo 
    SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'App-sono',
      home: TelaPrincipal(),
    );
  }
}