import 'package:flutter/material.dart';

String meuTexto = '  Este aplicativo tem como objetivo ' +
    'auxiliar o artesão na precificação de '+
    'seus produtos. A ideia original foi '+
    'auxiliar na produção e precificação '+
    'da Farofa de Proteina de soja '+
    'feita pela Dona Iracema, '+
    'A simpática senhora da tela incial. '+
    'Durante o projeto, percebemos o '+
    'Potencial para uso em outras produções '+
    'artesanais. Além disto, a ferramenta se '+
    'Propõe a ajudar na gestão de todo o '+
    'negócio, Cadastro de Clientes, Cadastro '+
    'de vendedores e o que mais se fizer '+
    'necessário, afinal, '+
    'A imaginação é o limite';

class Sobremim extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sobre este App"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Image.asset("assets/imagens/Eu.png", scale: 1.5),
              Text("Tema: Gestão de farofa artesanal"),
              Text("================================"),
              Text(""),
              Center(child: Text(meuTexto, textAlign: TextAlign.justify,)),
              Text(""),
              Text("================================"),
            ],
          ),
        ),
      ),
    );
  }
}
