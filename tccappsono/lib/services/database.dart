import 'package:cloud_firestore/cloud_firestore.dart';

class DataBase {

  gravarSono(var horac, horaf, var dados, var usuario){
    Firestore.instance.collection('Registros').document().setData({ 'HorarioInicial': horac, 'HorarioFinal': horaf, 'Dados': dados, 'Usuario': usuario });
  }

  gravarAlarme(var h, var m, var usuario){
    Firestore.instance.collection('Alarmes').document(usuario).setData({ 'hora': h, 'minuto': m, 'Usuario': usuario });
  }

  getHoraAlarme(var usuario){
    return Firestore.instance.collection('Alarmes').document(usuario).get().then((a) => a['hora']);
  }

  getMinutoAlarme(var usuario) async{
    return Firestore.instance.collection('Alarmes').document(usuario).get().then((a) => a['minuto']);
  }

  getH(u) async {
    return await getHoraAlarme(u);
  }

  getM(u) async {
    return await getMinutoAlarme(u);
  }

  getGr(var usuario){
    return Firestore.instance.collection('Registros').where('Usuario', isEqualTo: usuario).getDocuments()
    .then((a){
      return a.documents.elementAt(a.documents.length-1)['Dados'];
    });
  }

  getGraficos(var usuario){
    return Firestore.instance.collection('Registros').document('-LrSxSFGPssUF6sA0st6').get().then((a)=> a['Dados']);
  }


}