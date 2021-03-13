import 'package:MedAgenda/add_horarios.dart';
import 'package:MedAgenda/main.dart';
import 'package:MedAgenda/main__drawer_clinica.dart';
import 'package:MedAgenda/main_drawer_paciente.dart';
import 'package:flutter/material.dart';

class TelaInicialClinica extends StatefulWidget {
  @override
  _TelaInicialClinica createState() => _TelaInicialClinica();
}

class _TelaInicialClinica extends State<TelaInicialClinica> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("Bem Vindo(a)"),
        backgroundColor: Colors.cyan,
      ),
      drawer: MainDrawerClinica(),
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
        padding: EdgeInsets.all(8.0),
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
                            "https://www2.unifap.br/drh/files/2010/04/formulário1.png",
                            height: 100,
                            width: 100),
                        Text(
                          "Meus Dados",
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
                            "https://image.freepik.com/vetores-gratis/ilustracao-de-calendario-icone_53876-5588.jpg",
                            height: 100,
                            width: 100),
                        Text(
                          "Ver agendas",
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
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddHorario(),
                      ),
                    );
                  },
                  splashColor: Colors.cyan,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Image.network(
                            "https://idigestivo.com.br/wp-content/uploads/2016/03/icone-medico.png",
                            height: 100,
                            width: 100),
                        Text(
                          "Adicionar \n Médicos",
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
                            "https://static.vecteezy.com/ti/vetor-gratis/p1/1880046-staff-medical-using-face-mask-isolated-icon-grátis-vetor.jpg",
                            height: 100,
                            width: 100),
                        Text(
                          " Ver Médicos\n Cadastrados",
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
            )
          ],
        ),
      ),
    );
  }
}
