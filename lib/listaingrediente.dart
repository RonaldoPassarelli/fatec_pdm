import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'model/ingrediente.dart';
import 'package:flutter/material.dart';

class ListaIngrediente extends StatefulWidget {
  @override
  _ListaIngredienteState createState() => _ListaIngredienteState();
}

class _ListaIngredienteState extends State<ListaIngrediente> {
  //Conexão Fluter+Firebase
  final db = Firestore.instance;
  final String colecao = "ingrediente";

  //Lista dinâmica para manipulação dos dados
  List<Ingrediente> lista = List();

  //Stream para "ouvir" o Firebase
  StreamSubscription<QuerySnapshot> listen;

  @override
  void initState() {
    super.initState();

    //cancelar o listen, caso a coleção esteja vazia.
    listen?.cancel();

    //retornar dados da coleção e inserir na lista dinâmica
    listen = db.collection(colecao).snapshots().listen((res) {
      setState(() {
        lista = res.documents
            .map((doc) => Ingrediente.fromMap(doc.data, doc.documentID))
            .toList();
      });
    });
  }

  @override
  void dispose() {
    listen?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //final Mensagem msg2 = ModalRoute.of(context).settings.arguments;
    //codigo = msg2.mensagem;
    return Scaffold(
      appBar: AppBar(
          title: Text("Ingredientes cadastrados"),
          centerTitle: true,
          backgroundColor: Colors.green,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.backspace),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ]),
      body: StreamBuilder<QuerySnapshot>(

          //fonte de dados
          stream: db.collection(colecao).snapshots(),
          //exibição dos dados
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return Center(child: CircularProgressIndicator());
              default:
                List<DocumentSnapshot> docs = snapshot.data.documents;
                return ListView.builder(
                    itemCount: docs.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          "Cod: " +
                              lista[index].codigo +
                              " - Desc: " +
                              lista[index].descricao,
                          style: TextStyle(fontSize: 20),
                        ),
                        subtitle: Container(
                            child: Text(
                                "Unid. Medida: " +
                                    lista[index].unidade +
                                    "  Valor: R\$ " +
                                    lista[index].valor,
                                style: TextStyle(fontSize: 16))),
                        trailing: IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              // db.collection(colecao).document(lista[index].id).delete();
                            }),
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            "/tela11",
                          );
                        },
                      );
                    });
            }
          }),
      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.white,
        backgroundColor: Colors.green,
        elevation: 0,
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, "/tela11", arguments: null);
        },
      ),
      backgroundColor: Colors.white,
    );
  }
}
