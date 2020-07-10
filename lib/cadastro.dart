import 'package:flutter/material.dart';
import 'alerta.dart';

class Cadastro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Gestão - Farofa artesanal"),
          centerTitle: true,
          backgroundColor: Colors.green,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.backspace),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/tela1',
                );
              },
            )
          ]),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: 316,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(vertical: 15.0),
                  width: 250,
                  height: 110,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.green, width: 1),
                      borderRadius: BorderRadius.circular(18),
                      color: const Color(0xff7c94b6)),
                  child: Column(children: <Widget>[
                    Center(
                        child: Text("<< Tela de Cadastros >>",
                            style:
                                TextStyle(color: Colors.white, fontSize: 18))),
                    Center(child: Text("")),
                    Text(""),
                    Center(
                        child: Text("Por favor escolha a opção desejada.",
                            style:
                                TextStyle(color: Colors.white, fontSize: 18)))
                  ]),
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
                        "RECEITA",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      color: Colors.green,
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          '/tela4',
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
                        "INGREDIENTE",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      color: Colors.green,
                      onPressed: () {
                        Navigator.pushNamed(context, '/tela8');
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
                        "CLIENTES",
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
                        "VENDEDOR",
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
