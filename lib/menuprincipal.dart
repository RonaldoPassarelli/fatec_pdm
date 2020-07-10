import 'package:flutter/material.dart';
import 'mensagem.dart';
import 'alerta.dart';

class MenuPrincipal extends StatefulWidget {
  @override
  _MenuPrincipalState createState() => _MenuPrincipalState();
}

class _MenuPrincipalState extends State<MenuPrincipal> {
  @override
  Widget build(BuildContext context) {
    //Declarar o objeto que receberá os dados
    final Mensagem msg = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
          title: Text("Gestão - Farofa artesanal"),
          centerTitle: true,
          backgroundColor: Colors.green,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.help),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/tela10',
                );
              },
            )
          ]),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: 316,
            //padding: const EdgeInsets.all(80.0),
            child: Column(
              // mainAxisSize: MainAxisSize.max ,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,

              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(vertical: 15.0),
                  width: 255,
                  height: 110,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.green, width: 1),
                      borderRadius: BorderRadius.circular(18),
                      color: const Color(0xff7c94b6)),
                  child: Column(
                    children: <Widget>[
                      Text("<< Menu Principal >>",
                          style: TextStyle(color: Colors.white, fontSize: 18)),
                      Text("",
                          style: TextStyle(color: Colors.white, fontSize: 6)),
                      Text("Ola " + msg.mensagem + "!",
                          style: TextStyle(color: Colors.white, fontSize: 18)),
                      Text("",
                          style: TextStyle(color: Colors.white, fontSize: 6)),
                      Center(
                          child: Text("O que você deseja fazer?",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18)))
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 50,
                  width: 250,
                  child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                      child: Text(
                        "CADASTRAR",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      color: Colors.green,
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          '/tela3',
                        );
                      }),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 50,
                  width: 250,
                  child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                      child: Text(
                        "ANOTAR",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      color: Colors.green,
                      onPressed: () {
                        showAlertDialog1(context);
                      }),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 50,
                  width: 250,
                  child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                      child: Text(
                        "CALCULAR",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      color: Colors.green,
                      onPressed: () {
                        showAlertDialog1(context);
                      }),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 50,
                  width: 250,
                  child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                      child: Text(
                        "CONTROLE",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      color: Colors.green,
                      onPressed: () {
                        showAlertDialog1(context);
                      }),
                ),
                SizedBox(
                  height: 20,
                ),
                RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  child: Text('voltar',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      )),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
