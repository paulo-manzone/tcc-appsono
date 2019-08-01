import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  static FirebaseUser _user;

/*
  Future<FirebaseUser> signInWithEmailAndPassword(String email, String senha) async {
     _user = await _auth.signInWithEmailAndPassword(
      email: email,
      password: senha,
     ).then(( user) => user).catchError((e) => print(e));
     return _user;
  }
*/

    Future<FirebaseUser> logar(String email, String senha) async {
    final FirebaseUser user = (await _auth.signInWithEmailAndPassword(
      email: email,
      password: senha,
    )).user;
    _user = user;
    return user;
  }

  FirebaseUser getUser(){
    return _user;
  }




}