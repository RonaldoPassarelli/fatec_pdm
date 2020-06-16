import 'package:flutter/material.dart';

class Detalhareceita extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Detalhamento de Receita"),
            centerTitle: true,
            backgroundColor: Colors.green,
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.book),
                onPressed: () {},
              )
            ]),
        body: ListView(
          padding: const EdgeInsets.all(40),
          children: <Widget>[
            Container(padding: EdgeInsets.symmetric(horizontal: 80 ),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
                child: Text(
                  "VOLTAR PARA RECEITAS",
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
                },
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
                height: 30,
                child: Text('Ingrediente 1;Solido ;300;gramas',
                    style: TextStyle(fontSize: 18))),
            Container(
                height: 30,
                child: Text('Ingrediente 2;Solido ;250;gramas',
                    style: TextStyle(fontSize: 18))),
            Container(
                height: 30,
                child: Text('Ingrediente 3;Líquido ;250;ml',
                    style: TextStyle(fontSize: 18))),
            Container(
                height: 30,
                child: Text('Ingrediente 4;Sólido ;100;gramas',
                    style: TextStyle(fontSize: 18))),
            Container(
                height: 30,
                child:
                    Text('Fogo;Alto ;40; min', style: TextStyle(fontSize: 18))),
          ],
        ));
  }
}
