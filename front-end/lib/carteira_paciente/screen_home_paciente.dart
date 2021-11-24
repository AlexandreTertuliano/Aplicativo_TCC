import 'package:MedAgenda/carteira_paciente/card_paciente.dart';
import 'package:MedAgenda/classes/carteira_paciente_class.dart';
import 'package:clipboard_manager/clipboard_manager.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  int idPaciente;
  HomeScreen(this.idPaciente);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _page = 0;
  double valorTotal = 250.50;
  String chavePix = '13255152640';

  List<PacienteCarteira> pacienteCarteira = List<PacienteCarteira>();
  // ignore: deprecated_member_use
  List<PacienteCarteira> _pacienteCarteiraDisplay = List<PacienteCarteira>();

  bool loading;

  @override
  void initState() {
    super.initState();
    loading = true;
    _getCarteiraPaciente(widget.idPaciente);
  }

  Future<void> _getCarteiraPaciente(int id) async {
    listaCarteiraPaciente(id).then((list) {
      setState(() {
        pacienteCarteira = list;
        _pacienteCarteiraDisplay = pacienteCarteira;
        loading = false;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Stack(
          children: <Widget>[
            //Container for top data
            Container(
              margin: EdgeInsets.symmetric(horizontal: 32, vertical: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        valorTotal.toString(),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 36,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  Text(
                    "Saldo",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: Colors.blue[100]),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Column(
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(243, 245, 248, 1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(18))),
                              child: Icon(
                                Icons.attach_money,
                                color: Colors.blue[900],
                                size: 30,
                              ),
                              padding: EdgeInsets.all(12),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              "PIX",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14,
                                  color: Colors.blue[100]),
                            ),
                          ],
                        ),
                      ),
                      Center(
                        child: Column(
                          children: <Widget>[
                            Text("Chave Pix:" + chavePix,
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20,
                                    color: Colors.black)),
                            RaisedButton(
                              child: Text('Copiar'),
                              onPressed: () {
                                ClipboardManager.copyToClipBoard(chavePix)
                                    .then((result) {
                                  final snackBar = SnackBar(
                                    content: Text('Copied to Clipboard'),
                                    action: SnackBarAction(
                                      label: 'Undo',
                                      onPressed: () {},
                                    ),
                                  );
                                  Scaffold.of(context).showSnackBar(snackBar);
                                });
                              },
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),

            //draggable sheet
            DraggableScrollableSheet(
              builder: (context, scrollController) {
                return Container(
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(243, 245, 248, 1),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40))),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 24,
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "Transações recentes",
                                style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 24,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 32),
                        ),
                        SizedBox(
                          height: 24,
                        ),

                        //Container for buttons
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 32),
                          child: Row(
                            children: <Widget>[
                              Container(
                                child: Text(
                                  "Todas",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14,
                                      color: Colors.grey[900]),
                                ),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey[200],
                                          blurRadius: 10.0,
                                          spreadRadius: 4.5)
                                    ]),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                              ),
                              SizedBox(
                                width: 16,
                              ),
                            ],
                          ),
                        ),

                        SizedBox(
                          height: 16,
                        ),
                        //Container Listview for expenses and incomes
                        Container(
                          child: Text(
                            "TODAY",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: Colors.grey[500]),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 32),
                        ),

                        SizedBox(
                          height: 16,
                        ),

                        ListView.builder(
                          itemBuilder: (context, index) {
                            if (_pacienteCarteiraDisplay.length > 0) {
                              return index == 0
                                  ? _searchBar()
                                  : _listItem(index - 1);
                            } else {
                              return Padding(
                                padding: const EdgeInsets.all(40.0),
                                child:
                                    Center(child: CircularProgressIndicator()),
                              );
                            }
                          },
                          itemCount: _pacienteCarteiraDisplay.length + 1,
                        ),

                        //now expense

                        //now expense
                      ],
                    ),
                    controller: scrollController,
                  ),
                );
              },
              initialChildSize: 0.65,
              minChildSize: 0.65,
              maxChildSize: 1,
            )
          ],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.lightBlue[300],
        backgroundColor: Colors.white,
        items: <Widget>[
          Icon(
            Icons.attach_money,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.credit_card,
            size: 30,
            color: Colors.white,
          ),
        ],
        onTap: (index) {
          setState(() {
            _page = index;
            if (index == 0) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CardScreen(widget.idPaciente)));
            } else if (index == 1) {}
          });
        },
      ),
    );
  }

  _searchBar() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Pesquisar por nome do médico 🔍",
          hintStyle: TextStyle(color: Colors.white),
        ),
        onChanged: (text) {
          text = text.toLowerCase();
          setState(() {
            _pacienteCarteiraDisplay = pacienteCarteira.where((agendaPaciente) {
              var agendaPacienteCliNom = agendaPaciente.medico.toLowerCase();
              return agendaPacienteCliNom.contains(text);
            }).toList();
          });
        },
      ),
    );
  }

  _listItem(index) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      color: Color(0x9FFF0F8FF),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: new Text(
                "👩‍⚕️ Médico : " + _pacienteCarteiraDisplay[index].medico,
                style: GoogleFonts.didactGothic(
                  fontSize: 16.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  decorationColor: Colors.white,
                  decorationStyle: TextDecorationStyle.solid,
                  letterSpacing: -1.0,
                  wordSpacing: 5.0,
                ),
              ),
            ),
            new Text(
              "💲 Valor da consulta: " +
                  _pacienteCarteiraDisplay[index].valorConsulta.toString(),
              style: GoogleFonts.didactGothic(
                fontSize: 16.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                decorationColor: Colors.white,
                decorationStyle: TextDecorationStyle.solid,
                letterSpacing: -1.0,
                wordSpacing: 5.0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Future<List<PacienteCarteira>> listaCarteiraPaciente(int id) async {
    final response = await http.get(
        Uri.parse("http://api-marquemed.herokuapp.com/paciente/agenda/$id"));
    if (response.statusCode == 200) {
      return postFromJson(response.body);
    } else {
      return null;
    }
  }
}
