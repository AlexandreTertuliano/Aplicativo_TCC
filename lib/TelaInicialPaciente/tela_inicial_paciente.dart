import 'package:MedAgenda/main__drawer_clinica.dart';
import 'package:MedAgenda/main_drawer_paciente.dart';
import 'package:flutter/material.dart';

class TelaInicialPaciente extends StatefulWidget {
  @override
  _TelaInicialPaciente createState() => _TelaInicialPaciente();
}

class _TelaInicialPaciente extends State<TelaInicialPaciente> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("Bem Vindo(a)"),
        backgroundColor: Colors.cyan,
      ),
      drawer: MainDrawerPaciente(),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.6, 1],
            colors: [
              Color(0xFF53b7d2),
              Color(0xFF17ead9),
            ],
          ),
        ),
        padding: EdgeInsets.all(10.0),
        child: GridView.count(
          crossAxisCount: 2,
          children: <Widget>[
            Card(
              margin: EdgeInsets.all(8.0),
              child: InkWell(
                  onTap: () {},
                  splashColor: Colors.cyan,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Image.network(
                            "https://s3-us-west-2.amazonaws.com/userdata123/www/htmlblocks-images/1591/1591803/1591803_3559161_5b2ce2977ce44.png",
                            height: 100,
                            width: 100),
                        Text(
                          "Meu Perfil",
                          style: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 20,
                              fontFamily: "Poppins-Medium"),
                        )
                      ],
                    ),
                  )),
            ),
            Card(
              margin: EdgeInsets.all(8.0),
              child: InkWell(
                  onTap: () {},
                  splashColor: Colors.cyan,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Image.network(
                            "https://image.flaticon.com/icons/png/512/284/284301.png",
                            height: 100,
                            width: 100),
                        Text(
                          "Minha Agenda",
                          style: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 20,
                              fontFamily: "Poppins-Medium"),
                        )
                      ],
                    ),
                  )),
            ),
            Card(
              margin: EdgeInsets.all(8.0),
              child: InkWell(
                  onTap: () {},
                  splashColor: Colors.cyan,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Image.network(
                            "https://www.endocrino.org.br/static/images/buscamedico.c0ef0097a775.png",
                            height: 100,
                            width: 100),
                        Text(
                          "Pesquisar \n Médicos",
                          style: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 20,
                              fontFamily: "Poppins-Medium"),
                        ),
                      ],
                    ),
                  )),
            ),
            Card(
              margin: EdgeInsets.all(8.0),
              child: InkWell(
                  onTap: () {},
                  splashColor: Colors.cyan,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Image.network(
                            "https://i.pinimg.com/originals/33/69/7f/33697f6bc37bacb5c924d3f73af0ab0f.png",
                            height: 100,
                            width: 100),
                        Text(
                          "Configurações",
                          style: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 20,
                              fontFamily: "Poppins-Medium"),
                        )
                      ],
                    ),
                  )),
            ),
            Card(
              margin: EdgeInsets.all(8.0),
              child: InkWell(
                  onTap: () {},
                  splashColor: Colors.cyan,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Image.network(
                            "https://img.icons8.com/plasticine/2x/exit.png",
                            height: 100,
                            width: 100),
                        Text(
                          "Sair",
                          style: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 20,
                              fontFamily: "Poppins-Medium"),
                        )
                      ],
                    ),
                  )),
            ),
            Card(
              margin: EdgeInsets.all(8.0),
              child: InkWell(
                  onTap: () {},
                  splashColor: Colors.cyan,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          "",
                          style: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 20,
                              fontFamily: "Poppins-Medium"),
                        )
                      ],
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
