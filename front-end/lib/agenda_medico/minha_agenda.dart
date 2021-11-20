import 'package:MedAgenda/agenda_paciente/add_horarios.dart';
import 'package:MedAgenda/classes/pega_agenda_class.dart';
import 'package:MedAgenda/menuPaciente/menu_page_paciente.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:core';

class MinhaAgenda extends StatefulWidget {
  int idMedico;
  MinhaAgenda(this.idMedico);

  @override
  _MinhaAgendaState createState() => _MinhaAgendaState();
}

class _MinhaAgendaState extends State<MinhaAgenda> {
<<<<<<< HEAD
  // ignore: deprecated_member_use
  List<PegaAgenda> pegaAgenda = List<PegaAgenda>();
  // ignore: deprecated_member_use
  List<PegaAgenda> _pegaAgenda = List<PegaAgenda>();

  bool loading;
  int _page = 0;
  var rating = 3.0;

  @override
  void initState() {
    super.initState();
    loading = true;
    _getAgenda(widget.idMedico);
  }

  Future<void> _getAgenda(int id) async {
    PegaAgendaEspecifica(id).then((list) {
      setState(() {
        pegaAgenda = list;
        _pegaAgenda = pegaAgenda;
        loading = false;
      });
    });
  }

  Future<void> _refreshPosts(BuildContext context, int id) async {
    PegaAgendaEspecifica(id).then((list) {
      setState(() {
        pegaAgenda = list;
        _pegaAgenda = pegaAgenda;
        loading = false;
      });
    });
  }
=======

   List data;
>>>>>>> 0faf0b21bf6392db8fad2d437d453e1ef04551ff

  @override
  Widget build(BuildContext context) {
    return Scaffold(
<<<<<<< HEAD
      body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xff00BFFF), Color(0xFFFFFAFA)],
            ),
          ),
          child: RefreshIndicator(
            onRefresh: () => _refreshPosts(context, widget.idMedico),
            child: ListView.builder(
              itemBuilder: (context, index) {
                if (_pegaAgenda.length > 0) {
                  return index == 0 ? _searchBar() : _listItem(index - 1);
                } else {
                  return Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Center(child: CircularProgressIndicator()),
                  );
                }
              },
              itemCount: _pegaAgenda.length + 1,
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
                          MenuPagePaciente("email", "senha")));
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
            _pegaAgenda = pegaAgenda.where((medico) {
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
            caption: 'Excluir',
            color: Colors.red,
            icon: Icons.delete,
            onTap: () {
              print("1");
            }),
        IconSlideAction(
            caption: 'Editar',
            color: Colors.blue,
            icon: Icons.edit,
            onTap: () {
              print("2");
            }),
      ],
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddHorario()));
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
                    _pegaAgenda[index].medico.nameMedico != null
                        ? _pegaAgenda[index].medico.nameMedico
                        : 'default value',
                    style: GoogleFonts.didactGothic(
                      fontSize: 20.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      decorationColor: Colors.white,
                      decorationStyle: TextDecorationStyle.solid,
                      letterSpacing: -1.0,
                      wordSpacing: 5.0,
=======
        body: FutureBuilder(
      future: pegaAgendaEspecifica(widget.idMedico),
      builder: (context, data) {
        if (data.hasError) {
          return Center(child: Text("${data.error}"));
        } else if (data.hasData) {
          var items = data.data.agenda as List<Agenda>;
          return ListView.builder(
              itemCount: items == null ? 0 : items.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  child: Container(
                    padding: EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          child: Text(
                            items[index].dadosAgenda,
                          ),
                        ),
                        Expanded(
                            child: Container(
                          padding: EdgeInsets.only(bottom: 8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 8, right: 8),
                                child: Text(
                                  items[index].ocupadoAgenda,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 8, right: 8),
                                child: Text(
                                    items[index].id.toString()),
                              )
                            ],
                          ),
                        ))
                      ],
>>>>>>> 0faf0b21bf6392db8fad2d437d453e1ef04551ff
                    ),
                  ),
                ),
                new Text(
                  _pegaAgenda[index].medico.especializacao1Medico != null
                      ? _pegaAgenda[index].medico.especializacao1Medico
                      : 'default value',
                  style: GoogleFonts.didactGothic(
                    fontSize: 15.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    decorationColor: Colors.white,
                    decorationStyle: TextDecorationStyle.solid,
                    letterSpacing: -1.0,
                    wordSpacing: 5.0,
                  ),
                ),
                new Text(
                  "📞  " + _pegaAgenda[index].medico.telefoneMedico != null
                      ? "📞 " + _pegaAgenda[index].medico.telefoneMedico
                      : 'default value',
                  style: GoogleFonts.didactGothic(
                    fontSize: 15.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    decorationColor: Colors.white,
                    decorationStyle: TextDecorationStyle.solid,
                    letterSpacing: -1.0,
                    wordSpacing: 5.0,
                  ),
                ),
                Center(
                  child: RatingBar.builder(
                    initialRating: _pegaAgenda[index].avaliacao.toDouble(),
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
              ],
            ),
          ),
        ),
      ),
    );
  }

<<<<<<< HEAD
  static Future<List<PegaAgenda>> PegaAgendaEspecifica(int id) async {
    final response =
        await http.get(Uri.parse("https://senai.cck.com.br/medico/$id"));
    if (response.statusCode == 200) {
      return postFromJsonPegaAgenda(response.body);
    } else {
      return null;
    }
=======
  Future<PegaAgenda> pegaAgendaEspecifica(int id) async {
    final response =
        await http.get(Uri.parse("https://senai.cck.com.br/medico/$id"));
    var data = json.decode(response.body);
    return PegaAgenda.fromJson(data);
>>>>>>> 0faf0b21bf6392db8fad2d437d453e1ef04551ff
  }

 
}
