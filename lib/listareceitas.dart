import 'package:flutter/material.dart';
import 'lista1.dart';

class Lista extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Lista de Receitas"),
            centerTitle: true,
            backgroundColor: Colors.green,
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.book),
                onPressed: () {},
              )
            ]),
        body: Listarec());
  }
}
