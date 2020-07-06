import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'model/receita.dart';

class CadNovaReceita extends StatefulWidget {
  @override
  _CadNovaReceitaState createState() => _CadNovaReceitaState();
}

class _CadNovaReceitaState extends State<CadNovaReceita> {

  //controles para os campos de texto
  TextEditingController txtNome = TextEditingController();
  TextEditingController txtDescricao = TextEditingController();
  TextEditingController txtCodreceita = TextEditingController();
  //instância do Firebase
  var db = Firestore.instance;

  //retornar dados do documento a partir do idDocument
  void getDocumento(String idDocumento) async {
    //Recuperar o documento no Firestore
    DocumentSnapshot doc =
        await db.collection("receita").document(idDocumento).get();

    setState(() {
      txtNome.text = doc.data["nome"];
      txtDescricao.text = doc.data["descricao"];
      txtCodreceita.text = doc.data["codreceita"];
    });
  }



  @override
  Widget build(BuildContext context) {
 
 //
    // RECUPERAR o ID do Documento
    //
    final String idDocumento = ModalRoute.of(context).settings.arguments;

    if (idDocumento != null) {
      if (txtNome.text == "" && txtDescricao.text == "" && txtCodreceita.text == "") {
        getDocumento(idDocumento);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastrar nova Receita"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Container(
        padding: EdgeInsets.all(50),
        child: Column(
          children: [
            //CAMPO NOME
            TextField(
              controller: txtNome,
              style:
                  TextStyle(color: Colors.brown, fontWeight: FontWeight.w300),
              decoration: InputDecoration(
                labelText: "Nome",
              ),
            ),
            SizedBox(
              height: 20,
            ),

            //CAMPO DESCRICAO
            TextField(
              controller: txtDescricao,
              style:
                  TextStyle(color: Colors.brown, fontWeight: FontWeight.w300),
              decoration: InputDecoration(
                labelText: "Descrição",
              ),
            ),
            SizedBox(
              height: 30,
            ),

                        //CAMPO CODRECEITA
            TextField(
              controller: txtDescricao,
              style:
                  TextStyle(color: Colors.brown, fontWeight: FontWeight.w300),
              decoration: InputDecoration(
                labelText: "Código da Receita",
              ),
            ),
            SizedBox(
              height: 30,
            ),

            //BOTÕES
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 150,
                  child: RaisedButton(
                    color: Colors.green,
                    child: Text("salvar",
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                    onPressed: () {
                      //
                      // Inserir ou Atualizar
                      //
                      if (idDocumento == null) {
                        inserir(context, 
                          Receita(idDocumento, txtNome.text,txtDescricao.text, txtCodreceita.text ));
                      } else {
                        atualizar(context,
                            Receita(idDocumento, txtNome.text,txtDescricao.text,txtCodreceita.text));
                      }
                    },
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                SizedBox(
                  width: 150,
                  child: RaisedButton(
                    color: Colors.green,
                    child: Text("cancelar",
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );


  }

    //
  // ATUALIZAR
  //
  void atualizar(BuildContext context, Receita receita) async{
    await db.collection("receita").document(receita.id)
      .updateData(
        {
          "nome": receita.nome,
          "descricao": receita.descricao
        }
      );
    Navigator.pop(context);
  }

  //
  // INSERIR
  //
  void inserir(BuildContext context, Receita receita) async{
    await db.collection("receita")
      .add(
        {
          "nome": receita.nome,
          "descricao": receita.descricao,
        }
      );
    Navigator.pop(context);
  } 
}