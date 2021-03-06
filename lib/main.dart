import 'package:flutter/cupertino.dart';
import 'cadIngrediente.dart';
import 'cadingredientenovo.dart';
import 'listaingrediente.dart';
import 'listaingredientes.dart';
import 'mensagem.dart';
import 'cadreceitanova.dart';
import 'listareceita.dart';
import 'sobre.dart';
import 'package:flutter/material.dart';
import 'menuprincipal.dart';
import 'cadreceita.dart';
import 'cadastro.dart';

void main() async => runApp(MaterialApp(
        
        debugShowCheckedModeBanner: false,
        
        initialRoute: "/tela1",
        routes: {
          "/tela1": (context) => Telalogin(),
          "/tela2": (context) => MenuPrincipal(),
          "/tela3": (context) => Cadastro(),
          "/tela4": (context) => CadReceita(),
          "/tela5": (context) => CadNovaReceita(),
          "/tela6": (context) => ListaReceita(),
          "/tela7": (context) => ListaIngredientes(),
          "/tela8": (context) => CadIngrediente(),
          "/tela9": (context) => ListaIngrediente(),
          "/tela10": (context) => Sobremim(),
          "/tela11": (context) => CadNovoIngrediente(),

        }));

class ListaIngredientenew {}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, title: "AppFarofa", home: Telalogin()

        );
  }
}

class Telalogin extends StatefulWidget {
  @override
  _TelaloginState createState() => _TelaloginState();
}

class _TelaloginState extends State<Telalogin> {
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController txtUser = TextEditingController();
  TextEditingController txtPaswd = TextEditingController();

  String mensagem = '';
  String passwd = '';
  int testlogin = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Gestão - Farofa artesanal"),
          centerTitle: true,
          backgroundColor: Colors.green,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.book),
              onPressed: () {},
            )
          ]),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(30.0),
        child: Form(
          key: _formkey,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset("assets/imagens/ceminha.png", scale: 1),
                campoTexto("Login", txtUser),
                campoTextopsw("Senha", txtPaswd),
                SizedBox(
                  height: 30,
                ),
                botaoAcessar(context),
              ]),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }

  campoTexto(rotulo, controle) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        keyboardType: TextInputType.number,
        style: TextStyle(color: Colors.green[900], fontSize: 20),
        decoration: InputDecoration(
          labelText: rotulo,
          labelStyle: TextStyle(
            color: Colors.green[500],
            fontSize: 12,
          ),
        ),
        controller: controle,
        validator: (value) {
          return (value.isEmpty) ? "Forneça seu nome de usuário" : null;
        },
      ),
    );
  }

  campoTextopsw(rotulo, controle) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        keyboardType: TextInputType.number,
        obscureText: true,
        style: TextStyle(color: Colors.green[900], fontSize: 20),
        decoration: InputDecoration(
          labelText: rotulo,
          labelStyle: TextStyle(
            color: Colors.green[500],
            fontSize: 12,
          ),
        ),
        controller: controle,
        validator: (value) {
          return (value.isEmpty) ? "Informe sua senha" : null;
        },
      ),
    );
  }

  botaoAcessar(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.only(top: 20),
      child: SizedBox(
        width: 250,
        height: 50,
        child: RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
            child: Text(
              "Acessar",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            color: Colors.green,
            onPressed: () {
              if (_formkey.currentState.validate()) {
                mensagem = txtUser.text;
                passwd = txtPaswd.text;
                //testlogin = autenticar(mensagem, passwd);
                //if(testlogin == 1){
                  Navigator.pushNamed(context, "/tela2", arguments: Mensagem(mensagem));
                 // }
                //  showAlertDialog1(context);
              }
            }),
      ),
    );
  }
  autenticar(String nome, String senha){
  }
}
