import 'package:flutter/material.dart';
import 'alerta.dart';

class Listarec extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(padding: EdgeInsets.symmetric(horizontal: 80, vertical: 20 ),
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),

                      child: Text(
                        "VOLTAR PARA CADASTROS",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      color: Colors.green,

                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/tela3',
                  );
                },
        ),
      ),
            /*
            FlatButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/tela3',
                  );
                },
                child: Icon(Icons.home)
                ),
            title: Text(
              "<== VOLTAR PARA CADASTROS",
              style: TextStyle(
                color: Colors.green,
                fontSize: 16, 
              ),
            )),*/
        ListTile(
            leading: FlatButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/tela6',
                  );
                },
                child: Icon(Icons.edit)),
            //Icon(Icons.edit),
            title: Text("Farofa Original"),
            subtitle: Text("Farofa de Proteína de Soja Simples")),
        ListTile(
            leading: FlatButton(
                onPressed: () {showAlertDialog1(context);},
                child: Icon(Icons.edit)),
            title: Text("Farofa com Pimenta"),
            subtitle: Text("Farofa com 50 gramas de Pimenta Calabresa")),
        ListTile(
            leading: FlatButton(
                onPressed: () {showAlertDialog1(context);},
                child: Icon(Icons.edit)),
            title: Text("Farofa com + Pimenta"),
            subtitle: Text("Farofa com 100 gramas de Pimenta Calabresa")),
        ListTile(
            leading: FlatButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/tela10',
                  );
                },
                child: Icon(Icons.edit)),
            title: Text("Farofa Especial Cebola"),
            subtitle: Text("Farofa de Proteína de Soja acebolado")),
        ListTile(
            leading: FlatButton(
                onPressed: () {showAlertDialog1(context);},
                child: Icon(Icons.edit)),
            title: Text("Farofa Especial de Alho"),
            subtitle: Text("Farofa de Proteína de Soja com Alho Frito")),
        ListTile(
            leading: FlatButton(
                onPressed: () {showAlertDialog1(context);},
                child: Icon(Icons.edit)),
            title: Text("Farofa Especial Bacon"),
            subtitle: Text("Farofa de Proteína de Soja Com Bacon")),
        ListTile(
            leading: FlatButton(
                onPressed: () {showAlertDialog1(context);},
                child: Icon(Icons.edit)),
            title: Text("Farofa Doce"),
            subtitle:
                Text("Farofa de Proteína de Soja com frutas Cristalizadas")),
      ],
    );
  }
}
