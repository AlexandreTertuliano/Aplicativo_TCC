import 'dart:convert';

import 'package:MedAgenda/classes/pega_agenda_class.dart';
import 'package:MedAgenda/menuMedico/menu_page_medico.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MinhaAgenda extends StatefulWidget {
  int idMedico;
  String email, senha;

  MinhaAgenda(this.idMedico, this.email, this.senha);
  @override
  _MinhaAgendaState createState() => _MinhaAgendaState();
}

class _MinhaAgendaState extends State<MinhaAgenda> {
  List data;
  int _page = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[300],
        title: Text(
          "Minha agenda:",
          style: GoogleFonts.lato(
            textStyle: Theme.of(context).textTheme.headline4,
            fontSize: 30,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
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
                  return Slidable(
                    actionPane: SlidableDrawerActionPane(),
                    actionExtentRatio: 0.25,
                    secondaryActions: [
                      IconSlideAction(
                          caption: 'Excluir',
                          color: Colors.red,
                          icon: Icons.delete,
                          onTap: () {}),
                      IconSlideAction(
                          caption: 'Editar',
                          color: Colors.blue,
                          icon: Icons.edit,
                          onTap: () {}),
                    ],
                    child: Card(
                      color: (items[index].ocupadoAgenda == "Sim" ||
                              items[index].ocupadoAgenda == "sim"
                          ? Colors.red[200]
                          : Colors.green[200]),
                      elevation: 5,
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                      child: Container(
                        padding: EdgeInsets.all(8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
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
                                      "📅 Horário: " +
                                          DateFormat('yyyy-MM-dd – kk:mm')
                                              .format(DateTime.parse(
                                                  items[index].dadosAgenda)),
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 8, right: 8),
                                    child: Text(
                                      "📍 Agenda Ocupada: " +
                                          items[index].ocupadoAgenda,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 8, right: 8),
                                    child: Text(
                                      "🏥 Clínica: " +
                                          items[index].clinica.nameClinica,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ))
                          ],
                        ),
                      ),
                    ),
                  );
                });
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
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
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          MenuPageMedico(widget.email, widget.senha)));
            }
          });
        },
      ),
    );
  }

  Future<PegaAgenda> pegaAgendaEspecifica(int id) async {
    final response =
        await http.get(Uri.parse("https://senai.cck.com.br/medico/$id"));
    var data = json.decode(response.body);
    return PegaAgenda.fromJson(data);
  }
}
