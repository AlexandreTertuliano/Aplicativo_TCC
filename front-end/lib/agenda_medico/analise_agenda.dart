import 'dart:convert';

import 'package:MedAgenda/agenda_medico/page_agenda.dart';
import 'package:MedAgenda/classes/finalizar_class.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

import 'minha_agenda.dart';

class AnaliseAgenda extends StatefulWidget {
  int idMedico;
  String email, senha;

  AnaliseAgenda(this.idMedico, this.email, this.senha);

  @override
  _AnaliseAgendaState createState() => _AnaliseAgendaState();
}

class _AnaliseAgendaState extends State<AnaliseAgenda> {
  List<Finalizar> finalizar = List<Finalizar>();
  // ignore: deprecated_member_use
  List<Finalizar> _finalizarDisplay = List<Finalizar>();

  bool loading;
  int _page = 0;

  @override
  void initState() {
    super.initState();
    loading = true;
    _getFinalizar(widget.idMedico);
  }

  Future<void> _getFinalizar(int id) async {
    listaConsulta(id).then((list) {
      setState(() {
        finalizar = list;
        _finalizarDisplay = finalizar;
        loading = false;
      });
    });
  }

  Future<void> _getAceitar(int id) async {
    final response = await http.get(Uri.parse(
        "https://api-marquemed.herokuapp.com/finalizar/confirma/$id"));
    if (response.statusCode == 200) {
      return postFromJson(response.body);
    } else {
      return null;
    }
  }

  Future<void> _getCancelar(int id) async {
    final response = await http.get(
        Uri.parse("https://api-marquemed.herokuapp.com/finalizar/cancela/$id"));
    if (response.statusCode == 200) {
      return postFromJson(response.body);
    } else {
      return null;
    }
  }

  Future<void> _refreshPosts(BuildContext context) async {
    return listaConsulta(widget.idMedico).then((list) {
      setState(() {
        finalizar = list;
        _finalizarDisplay = finalizar;
        loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[300],
        title: Text(
          "Consulta em análise: ",
          style: GoogleFonts.lato(
            textStyle: Theme.of(context).textTheme.headline4,
            fontSize: 30,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
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
              if (_finalizarDisplay.length > 0) {
                return index == 0 ? _searchBar() : _listItem(index - 1);
              } else {
                return Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Center(child: CircularProgressIndicator()),
                );
              }
            },
            itemCount: _finalizarDisplay.length + 1,
          ),
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.lightBlue[300],
        backgroundColor: Colors.white,
        items: <Widget>[
          Icon(
            Icons.add_alarm,
            size: 30,
            color: Colors.white,
          ),
          Icon(Icons.import_contacts, size: 30, color: Colors.white),
          Icon(Icons.fact_check, size: 30, color: Colors.white),
        ],
        onTap: (index) {
          setState(() {
            _page = index;
            if (index == 0) {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PageAgendaMedico(
                          widget.email, widget.senha, widget.idMedico)));
            } else if (index == 1) {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MinhaAgenda(
                          widget.idMedico, widget.email, widget.senha)));
            }
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
          hintText: "Pesquisar por status da consulta 🔍",
          hintStyle: TextStyle(color: Colors.white),
        ),
        onChanged: (text) {
          text = text.toLowerCase();
          setState(() {
            _finalizarDisplay = finalizar.where((finalizar) {
              var finalizarCliNom = finalizar.status.toLowerCase();
              return finalizarCliNom.contains(text);
            }).toList();
          });
        },
      ),
    );
  }

  _listItem(index) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      secondaryActions: [
        IconSlideAction(
            caption: 'Aceitar',
            color: Colors.green,
            icon: Icons.check,
            onTap: () {
              _getAceitar(_finalizarDisplay[index].id);
              _refreshPosts(context);
            }),
        IconSlideAction(
            caption: 'Cancelar',
            color: Colors.red,
            icon: Icons.cancel,
            onTap: () {
              _getCancelar(_finalizarDisplay[index].id);
              _refreshPosts(context);
            }),
      ],
      child: Card(
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
                  "🏨 Clinica : " +
                      _finalizarDisplay[index].agenda.clinica.nameClinica,
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
                "📅 Horário: " +
                    DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.parse(
                        _finalizarDisplay[index].agenda.dadosAgenda)),
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
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: new Text(
                  "👨‍💼 Paciente : " +
                      _finalizarDisplay[index].paciente.namePaciente,
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
                "📍 Status : " + _finalizarDisplay[index].status,
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
      ),
    );
  }

  static Future<List<Finalizar>> listaConsulta(int id) async {
    final response = await http.get(Uri.parse(
        "https://api-marquemed.herokuapp.com/medico/listConsulta/$id"));
    if (response.statusCode == 200) {
      return postFromJson(response.body);
    } else {
      return null;
    }
  }
}
