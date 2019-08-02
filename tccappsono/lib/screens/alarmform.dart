import 'package:flutter/material.dart';
import 'package:tccappsono/services/database.dart';
import 'package:tccappsono/services/authentication.dart';

class AlarmeForm extends StatefulWidget {
  AlarmeForm({Key key}) : super(key: key);

  _AlarmeFormState createState() => _AlarmeFormState();
}

class _AlarmeFormState extends State<AlarmeForm> {

  final horaController = TextEditingController();
  final intervaloController = TextEditingController();
  final minutoController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(title: Text('Editar Alarme')),
      body: Container(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox( height: 20),
              TextFormField(
                controller: horaController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                      icon: const Icon(Icons.watch),
                      hintText: 'digite a hora',
                      labelText: 'Hora:',
                    )
              ),
              TextFormField(
                controller: minutoController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                      icon: const Icon(Icons.timer),
                      hintText: 'digite os minutos',
                      labelText: 'Minuto:',
                    )
              ),/*
              TextFormField(
                controller: intervaloController,
                decoration: const InputDecoration(
                      icon: const Icon(Icons.av_timer),
                      hintText: 'digite o intervalo',
                      labelText: 'Intervalo:',
                    )
              ),*/
              SizedBox(height: 100),
              Container(
                width: 150,
                height: 150,
                child: FloatingActionButton.extended(
                  shape: CircleBorder(),
                  backgroundColor: Colors.green[300],
                  foregroundColor: Colors.white,
                  label: Text('Agendar'),
                  icon: Icon(Icons.access_alarm),
                  onPressed: (){
                    //Guardar horário do alarme
                    DataBase db = new DataBase();
                    Auth auth = new Auth();
                    
                    db.gravarAlarme(horaController.text, minutoController.text, auth.getUser().email);
                    Navigator.pop(context);
                  },
                ),
              )
            ],
          ),

        ),
      ),
    );
  }
}