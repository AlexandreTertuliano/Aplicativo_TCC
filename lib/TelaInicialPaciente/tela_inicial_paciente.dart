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
        title: Text("Bem Vindo"),
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
                        Icon(
                          Icons.person_pin,
                          color: Colors.blueGrey,
                          size: 90.0,
                        ),
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
                        Icon(
                          Icons.calendar_today,
                          color: Colors.blueGrey,
                          size: 90.0,
                        ),
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
                        Icon(
                          Icons.person_search,
                          color: Colors.blueGrey,
                          size: 90.0,
                        ),
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
                        Icon(
                          Icons.settings_applications,
                          color: Colors.blueGrey,
                          size: 90.0,
                        ),
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
                        Icon(
                          Icons.exit_to_app,
                          color: Colors.blueGrey,
                          size: 90.0,
                        ),
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
