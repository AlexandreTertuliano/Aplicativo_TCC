import 'dart:convert';

import 'package:MedAgenda/classes/pega_agenda_class.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class MinhaAgenda extends StatefulWidget {
  int idMedico;

  MinhaAgenda(this.idMedico);
  @override
  _MinhaAgendaState createState() => _MinhaAgendaState();
}

class _MinhaAgendaState extends State<MinhaAgenda> {

   List data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    ));
  }

  Future<PegaAgenda> pegaAgendaEspecifica(int id) async {
    final response =
        await http.get(Uri.parse("https://senai.cck.com.br/medico/$id"));
    var data = json.decode(response.body);
    return PegaAgenda.fromJson(data);
  }

 
}
