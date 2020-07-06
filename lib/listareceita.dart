import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farofa/mensagem.dart';
import 'model/receita.dart';
import 'package:flutter/material.dart';

class ListaReceita extends StatefulWidget {
  @override
  _ListaReceitaState createState() => _ListaReceitaState();
}

class _ListaReceitaState extends State<ListaReceita> {
  //Conexão Fluter+Firebase
  final db = Firestore.instance;
  final String colecao = "receita";
  var mensagem2 = "";

  //Lista dinâmica para manipulação dos dados
  List<Receita> lista = List();

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
            .map((doc) => Receita.fromMap(doc.data, doc.documentID))
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
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Receitas"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
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
                        leading: FlatButton(
                            onPressed: () {
                              mensagem2 = lista[index].codreceita;
                              Navigator.pushNamed(context, "/tela7",
                                  arguments: Mensagem(mensagem2));
                            },
                            child: Icon(Icons
                                .content_paste)), //Text(lista[index].codreceita),
                        title: Text(
                          lista[index].nome,
                          style: TextStyle(fontSize: 20),
                        ),
                        subtitle: Text(lista[index].descricao,
                            style: TextStyle(fontSize: 16)),
                        trailing: IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              // db.collection(colecao).document(lista[index].id).delete();
                            }),

                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            "/tela5",
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
          Navigator.pushNamed(context, "/tela5", arguments: null);
        },
      ),
      backgroundColor: Colors.brown[50],
    );
  }
}
