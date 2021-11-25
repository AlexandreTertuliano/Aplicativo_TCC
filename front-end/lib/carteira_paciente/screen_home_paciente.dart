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

  Future<void> _refreshPosts(BuildContext context) async {
    return listaCarteiraPaciente(widget.idPaciente).then((list) {
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
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xff00BFFF), Color(0xFFFFFAFA)],
          ),
        ),
        child: RefreshIndicator(
          onRefresh: () => _refreshPosts(context),
          child: ListView.builder(
            itemBuilder: (context, index) {
              if (_pacienteCarteiraDisplay.length > 0) {
                return index == 0 ? _searchBar() : _listItem(index - 1);
              } else {
                return Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Center(child: CircularProgressIndicator()),
                );
              }
            },
            itemCount: _pacienteCarteiraDisplay.length + 1,
          ),
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
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CardScreen(widget.idPaciente)));
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
        Uri.parse("http://api-marquemed.herokuapp.com/carteira/paciente/$id"));
    if (response.statusCode == 200) {
      return postFromJson(response.body);
    } else {
      return null;
    }
  }
}
