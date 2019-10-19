import 'package:flutter/material.dart';
//import 'screens/principal.dart';
import 'package:flutter/services.dart';
import 'package:tccappsono/screens/telaprincipal.dart';
//import 'screens/telaprincipal.dart';
import 'screens/login.dart';

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
      //home: LoginPage(),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/principal': (context) => TelaPrincipal(),
      },
      theme: ThemeData(
        primaryColor: Color.fromRGBO(0, 0, 0, 1)
      ),
    );
  }
}