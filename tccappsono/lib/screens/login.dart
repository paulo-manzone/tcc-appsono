import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import '../services/authentication.dart';
import 'package:tccappsono/screens/telaprincipal.dart';

class LoginPage extends StatefulWidget {
  final Widget child;

  LoginPage({Key key, this.child}) : super(key: key);

  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    final emailController = TextEditingController();
    final senhaController = TextEditingController();
    emailController.text = "@test.com";

    return Scaffold(
      appBar: AppBar(title: Text('Login'), automaticallyImplyLeading: false, centerTitle: true),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
          child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(100, 0, 100, 5),
                    child: Image.asset('assets/icone.png'),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                    child: Text('AppSono', style: TextStyle(color:Color.fromRGBO(22, 343, 231, 1))),
                  ),
                  TextFormField(
                    controller: emailController,
                    validator: (value) {
                      if (value.isEmpty) return 'Insira o e-mail!';
                    },
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.account_circle),
                      hintText: 'Digite seu e-mail',
                      labelText: 'e-mail',
                    ),
                  ),
                  TextFormField( 
                    controller: senhaController,
                    validator: (value) {
                      if (value.isEmpty) return 'Insira a senha!';
                    },
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.lock),
                      hintText: 'Digite sua senha',
                      labelText: 'senha',
                    ),
                    obscureText: true,
                  ),
                  Container(
                      padding: EdgeInsets.only(top: 20.0),
                      child: RaisedButton(
                        child: const Text('Entrar',
                            style: TextStyle(color: Colors.white)),
                        color: Colors.blue[800],
                        onPressed: () {
                          login(emailController.text, senhaController.text, context);
                        }
                      )
                  ),
                  
                ],
              )),
        ),
      ),
    );
  }
}

void login(String e, String s, context) async{
  try{
    Auth _auth = Auth();
    _auth.logar(e, s);
    if(_auth.getUser() != null){
      Navigator.pushReplacementNamed(context,'/principal');
      //Navigator.push(context, MaterialPageRoute(builder: (context) => TelaPrincipal()));
    }
  }catch(e){
    
  }
}