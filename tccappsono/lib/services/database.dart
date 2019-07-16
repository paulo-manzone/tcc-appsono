import 'package:cloud_firestore/cloud_firestore.dart';

class DataBase {

  gravarSono(var horac, horaf, var dados){
    Firestore.instance.collection('Registros').document().setData({ 'HorarioInicial': horac, 'HorarioFinal': horaf, 'Dados': dados });
  }


}