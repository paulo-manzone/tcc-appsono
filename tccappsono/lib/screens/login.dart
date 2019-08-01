import 'package:flutter/material.dart';
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
    emailController.text = "loc@test.com";

    return Scaffold(
      appBar: AppBar(title: Text('Login'), leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: (){},)),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(top: 40.0, left: 20.0, right: 20.0),
          child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
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
                        color: Colors.blue,
                        onPressed: () {
                          login(emailController.text, senhaController.text, context);
                        }
                      ))
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
      Navigator.push(context, MaterialPageRoute(builder: (context) => TelaPrincipal()));
    }
  }catch(e){
    
  }
}