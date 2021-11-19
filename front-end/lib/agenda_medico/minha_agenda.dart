import 'package:MedAgenda/classes/agenda_class.dart';
import 'package:MedAgenda/services/agenda/services_agenda.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';

class MinhaAgenda extends StatefulWidget {
  int idMedico;

  MinhaAgenda(this.idMedico);

  @override
  _MinhaAgendaState createState() => _MinhaAgendaState();
}

class _MinhaAgendaState extends State<MinhaAgenda> {
  List<Agenda> agendas = List<Agenda>();
  // ignore: deprecated_member_use
  List<Agenda> _agendas = List<Agenda>();

  // ignore: deprecated_member_use

  bool loading;

  @override
  void initState() {
    super.initState();
    loading = true;
    _getMinhaAgenda(widget.idMedico);
  }

  Future<void> _getMinhaAgenda(int id) async {
    ServicesAgenda.getPegaAgendaEspecifica(id).then((list) async {
      setState(() {
        agendas = list;
        _agendas = agendas;
        loading = false;
      });
    });
  }

  Future<void> _refreshNfceSaida(BuildContext context, int id) async {
    return ServicesAgenda.getPegaAgendaEspecifica(id).then((list) {
      setState(() {
        agendas = list;
        _agendas = agendas;
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
          "Meus Horários:",
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
            colors: [Color(0xff87CEFA), Color(0xFF00BFFF)],
          ),
        ),
        child: RefreshIndicator(
          onRefresh: () => _refreshNfceSaida(context, widget.idMedico),
          child: ListView.builder(
            itemCount: _agendas == null ? 0 : _agendas.length,
            itemBuilder: (context, index) {
              return Slidable(
                actionPane: SlidableDrawerActionPane(),
                actionExtentRatio: 0.25,
                secondaryActions: [
                  IconSlideAction(
                      caption: 'Excluir \nHorário',
                      color: Colors.red,
                      icon: Icons.delete,
                      onTap: () {}),
                  IconSlideAction(
                      caption: 'Editar \nHorário',
                      color: Colors.blue,
                      icon: Icons.edit,
                      onTap: () {}),
                ],
                child: GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: new Card(
                      color: Color(0x9FFF8F8FF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: new Text(
                                  "📅 " +
                                      "Data e hora: " +
                                      _agendas[index].dadosAgenda,
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
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: new Text(
                                  "📄 " +
                                      "Situação: " +
                                      _agendas[index].ocupadoAgenda,
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
                            ]),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
