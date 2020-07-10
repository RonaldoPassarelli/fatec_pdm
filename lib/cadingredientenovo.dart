import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farofa/model/ingrediente.dart';
import 'package:flutter/material.dart';

class CadNovoIngrediente extends StatefulWidget {
  @override
  _CadNovoIngredienteState createState() => _CadNovoIngredienteState();
}

class _CadNovoIngredienteState extends State<CadNovoIngrediente> {

  //controles para os campos de texto
  TextEditingController txtCodigo = TextEditingController();
  TextEditingController txtDescricao = TextEditingController();
  TextEditingController txtUnidade = TextEditingController();
  TextEditingController txtValor = TextEditingController();
  //instância do Firebase
  var db = Firestore.instance;

  //retornar dados do documento a partir do idDocument
  void getDocumento(String idDocumento) async {
    //Recuperar o documento no Firestore
    DocumentSnapshot doc =
        await db.collection("ingrediente").document(idDocumento).get();

    setState(() {
      txtCodigo.text = doc.data["codigo"];
      txtDescricao.text = doc.data["descricao"];
      txtUnidade.text = doc.data["unidade"];
      txtValor.text = doc.data["valor"];
    });
  }

@override
  Widget build(BuildContext context) {
 
 //
    // RECUPERAR o ID do Documento
    //
    final String idDocumento = ModalRoute.of(context).settings.arguments;

    if (idDocumento != null) {
      if (txtCodigo.text == "" && txtDescricao.text == "" && txtUnidade.text == "") {
        getDocumento(idDocumento);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastrar novo Ingrediente"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Container(
        padding: EdgeInsets.all(50),
        child: Column(
          children: [
            //CAMPO NOME
            TextField(
              controller: txtCodigo,
              style:
                  TextStyle(color: Colors.green, fontWeight: FontWeight.w300),
              decoration: InputDecoration(
                labelText: "Código",
              ),
            ),
            SizedBox(
              height: 20,
            ),

            //CAMPO DESCRICAO
            TextField(
              controller: txtDescricao,
              style:
                  TextStyle(color: Colors.green, fontWeight: FontWeight.w300),
              decoration: InputDecoration(
                labelText: "Descrição",
              ),
            ),
            SizedBox(
              height: 30,
            ),

                        //CAMPO UNIDADE
            TextField(
              controller: txtUnidade,
              style:
                  TextStyle(color: Colors.brown, fontWeight: FontWeight.w300),
              decoration: InputDecoration(
                labelText: "Unidade de Medida",
              ),
            ),
            SizedBox(
              height: 30,
            ),


             TextField(
              controller: txtValor,
              style:
                  TextStyle(color: Colors.brown, fontWeight: FontWeight.w300),
              decoration: InputDecoration(
                labelText: "Valor da Unidade",
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
                          Ingrediente(idDocumento, txtCodigo.text ,txtDescricao.text, txtUnidade.text, txtValor.text ));
                      } else {
                        atualizar(context,
                          Ingrediente(idDocumento, txtCodigo.text,txtDescricao.text, txtUnidade.text, txtValor.text ));
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
  void atualizar(BuildContext context, Ingrediente ingrediente) async{
    await db.collection("ingrediente").document(ingrediente.id)
      .updateData(
        {
          "codigo": ingrediente.codigo,
          "descricao": ingrediente.descricao,
          "unidade": ingrediente.unidade,
          "valor": ingrediente.valor,

        }
      );
    Navigator.pop(context);
  }

  //
  // INSERIR
  //
  void inserir(BuildContext context, Ingrediente ingrediente) async{
    await db.collection("ingrediente")
      .add(
        {
          "codigo": ingrediente.codigo,
          "descricao": ingrediente.descricao,
          "unidade": ingrediente.unidade,
          "valor": ingrediente.valor,
        }
      );
    Navigator.pop(context);
  } 
}


  