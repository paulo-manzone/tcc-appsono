import 'package:flutter/material.dart';
import 'screens/principal.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App-sono',
      home: Principal(),
    );
  }
}