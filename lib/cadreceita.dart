import 'package:flutter/material.dart';

class CadReceita extends StatelessWidget {
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
            //padding: const EdgeInsets.all(80.0),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(vertical: 15.0),
                  width: 250,
                  height: 100,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.green, width: 1),
                      borderRadius: BorderRadius.circular(18),
                      color: const Color(0xff7c94b6)),
                  child: Column(children: <Widget>[
                    Center(
                        child: Text("<< Controle de Receitas >>",
                            style:
                                TextStyle(color: Colors.white, fontSize: 18))),
                    Center(
                        child: Text("",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold))),
                    Center(
                        child: Text("Por favor clique na opção desejada.",
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
                        "LISTAR",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      color: Colors.green,
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          '/tela6',
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
                        "NOVA",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      color: Colors.green,
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          '/tela5',
                        );
                      }),
                ),
                SizedBox(
                  height: 40,
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
