import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'mensagem.dart';
import 'model/ingredientes.dart';
import 'package:flutter/material.dart';

class ListaIngredientes extends StatefulWidget {
  @override
  _ListaIngredientesState createState() => _ListaIngredientesState();
}

class _ListaIngredientesState extends State<ListaIngredientes> {
  //Conexão Fluter+Firebase
  final db = Firestore.instance;
  final String colecao = "ingredientes";
  String codigo = "";
  //Lista dinâmica para manipulação dos dados
  List<Ingredientes> lista = List();

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
            .map((doc) => Ingredientes.fromMap(doc.data, doc.documentID))
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
    final Mensagem msg2 = ModalRoute.of(context).settings.arguments;
    codigo = msg2.mensagem;
    return Scaffold(
      appBar: AppBar(
          title: Text("Ingredientes desta Receita"),
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
      body: StreamBuilder<QuerySnapshot>(

          //fonte de dados
          stream: db
              .collection(colecao)
              .where("codrec", isEqualTo: msg2.mensagem)
              .snapshots(),
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
                          lista[index].ingrediente,
                          style: TextStyle(fontSize: 20),
                        ),
                        subtitle: Container(
                            child: Text(
                                lista[index].unidade +
                                    "  qtde  " +
                                    lista[index].valor.toString(),
                                style: TextStyle(fontSize: 16))),
                        trailing: IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              // db.collection(colecao).document(lista[index].id).delete();
                            }),
                        onTap: () {
                          Navigator.pushNamed(context, "/tela5",
                              arguments: lista[index].codrec);
                        },
                      );
                    });
            }
          }),
    );
  }
}
