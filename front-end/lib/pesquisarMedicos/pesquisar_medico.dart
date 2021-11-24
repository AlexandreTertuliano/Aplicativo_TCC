import 'package:MedAgenda/agenda_paciente/marcar_page.dart';
import 'package:MedAgenda/classes/doutor_class.dart';
import 'package:MedAgenda/menuPaciente/menu_page_paciente.dart';
import 'package:MedAgenda/services/medicos/services_medico.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:core';

class PagePesquisarMedico extends StatefulWidget {
  String email, senha;
  int idPaciente;

  PagePesquisarMedico(this.idPaciente, this.email, this.senha);
  @override
  _PagePesquisarMedicoState createState() => _PagePesquisarMedicoState();
}

class _PagePesquisarMedicoState extends State<PagePesquisarMedico> {
  // ignore: deprecated_member_use
  List<Doutor> medico = List<Doutor>();
  // ignore: deprecated_member_use
  List<Doutor> _medicoDisplay = List<Doutor>();

  bool loading;
  int _page = 0;
  var rating = 3.0;

  @override
  void initState() {
    super.initState();
    loading = true;
    _getmedico();
  }

  Future<void> _getmedico() async {
    await ServicesMedico.getMedico().then((list) {
      setState(() {
        medico = list;
        _medicoDisplay = medico;
        loading = false;
      });
    });
  }

  Future<void> _refreshPosts(BuildContext context) async {
    return ServicesMedico.getMedico().then((list) {
      setState(() {
        medico = list;
        _medicoDisplay = medico;
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
                if (_medicoDisplay.length > 0) {
                  return index == 0 ? _searchBar() : _listItem(index - 1);
                } else {
                  return Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Center(child: CircularProgressIndicator()),
                  );
                }
              },
              itemCount: _medicoDisplay.length + 1,
            ),
          )),
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.lightBlue[300],
        backgroundColor: Colors.white,
        items: <Widget>[
          Icon(
            Icons.keyboard_return,
            size: 30,
            color: Colors.white,
          ),
          Icon(Icons.home, size: 30, color: Colors.white),
        ],
        onTap: (index) {
          setState(() {
            _page = index;
            if (index == 0) {
              Navigator.pop(context);
            } else if (index == 1) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          MenuPagePaciente(widget.email, widget.senha)));
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
          hintText: "Pesquisar por especialidade da medico 🔍",
          hintStyle: TextStyle(color: Colors.white),
        ),
        onChanged: (text) {
          text = text.toLowerCase();
          setState(() {
            _medicoDisplay = medico.where((medico) {
              var medicoCliNom = medico.medico.especializacao1Medico;
              return medicoCliNom.contains(text);
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
            caption: 'Info',
            color: Colors.white,
            icon: Icons.info,
            onTap: () {
              print("1");
            }),
      ],
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MarcarHorarioPage(
                      widget.idPaciente,
                      _medicoDisplay[index].medico.id,
                      widget.email,
                      widget.senha)));
        },
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
                    "👨‍⚕️ Médico (a): " +
                                _medicoDisplay[index].medico.nameMedico !=
                            null
                        ? "👨‍⚕️ Médico (a): " +
                            _medicoDisplay[index].medico.nameMedico
                        : 'default value',
                    style: GoogleFonts.didactGothic(
                      fontSize: 20.0,
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
                  _medicoDisplay[index].medico.especializacao1Medico != null
                      ? _medicoDisplay[index].medico.especializacao1Medico
                      : 'default value',
                  style: GoogleFonts.didactGothic(
                    fontSize: 17.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    decorationColor: Colors.white,
                    decorationStyle: TextDecorationStyle.solid,
                    letterSpacing: -1.0,
                    wordSpacing: 5.0,
                  ),
                ),
                new Text(
                  "📞 Telefone: " +
                              _medicoDisplay[index].medico.telefoneMedico !=
                          null
                      ? "📞 Telefone: " +
                          _medicoDisplay[index].medico.telefoneMedico
                      : 'default value',
                  style: GoogleFonts.didactGothic(
                    fontSize: 17.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    decorationColor: Colors.white,
                    decorationStyle: TextDecorationStyle.solid,
                    letterSpacing: -1.0,
                    wordSpacing: 5.0,
                  ),
                ),
                new Text(
                  "💵 Valor da consulta: R\$  " +
                              _medicoDisplay[index]
                                  .medico
                                  .valorConsulta
                                  .toString() !=
                          null
                      ? "💵 Valor da consulta: R\$" +
                          _medicoDisplay[index].medico.valorConsulta.toString()
                      : 'default value',
                  style: GoogleFonts.didactGothic(
                    fontSize: 17.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    decorationColor: Colors.white,
                    decorationStyle: TextDecorationStyle.solid,
                    letterSpacing: -1.0,
                    wordSpacing: 5.0,
                  ),
                ),
                Row(children: [
                  Text(
                    "📊 Avaliação: ",
                    style: GoogleFonts.didactGothic(
                      fontSize: 20.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      decorationColor: Colors.white,
                      decorationStyle: TextDecorationStyle.solid,
                      letterSpacing: -1.0,
                      wordSpacing: 5.0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RatingBar.builder(
                      initialRating: _medicoDisplay[index].avaliacao.toDouble(),
                      itemCount: 5,
                      itemSize: 30,
                      // ignore: missing_return
                      itemBuilder: (context, index) {
                        switch (index) {
                          case 0:
                            return Icon(
                              Icons.sentiment_very_dissatisfied,
                              color: Colors.red,
                            );
                          case 1:
                            return Icon(
                              Icons.sentiment_dissatisfied,
                              color: Colors.redAccent,
                            );
                          case 2:
                            return Icon(
                              Icons.sentiment_neutral,
                              color: Colors.amber,
                            );
                          case 3:
                            return Icon(
                              Icons.sentiment_satisfied,
                              color: Colors.lightGreen,
                            );
                          case 4:
                            return Icon(
                              Icons.sentiment_very_satisfied,
                              color: Colors.green,
                            );
                        }
                      },

                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                  ),
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
