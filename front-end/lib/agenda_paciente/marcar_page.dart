import 'dart:convert';
import 'package:MedAgenda/classes/finaliza_agenda_class.dart' as fAgenda;
import 'package:MedAgenda/classes/pega_agenda_class.dart';
import 'package:MedAgenda/menuPaciente/menu_page_paciente.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MarcarHorarioPage extends StatefulWidget {
  Agenda agenda;
  int idMedico, idPaciente;
  String email, senha;

  MarcarHorarioPage(this.idPaciente, this.idMedico, this.email, this.senha);
  @override
  _MarcarHorarioPageState createState() => _MarcarHorarioPageState();
}

class _MarcarHorarioPageState extends State<MarcarHorarioPage> {
  List data;
  int _page = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[300],
        title: Text(
          "Marcar consulta:",
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
                          caption: 'Info',
                          color: Colors.red,
                          icon: Icons.info,
                          onTap: () {}),
                    ],
                    child: GestureDetector(
                      onTap: () async {
                        await finalizarMarcacao(
                            items[index].id, widget.idPaciente);
                      },
                      child: Visibility(
                        visible: items[index].ocupadoAgenda == "Nao" ||
                            items[index].ocupadoAgenda == "Não" ||
                            items[index].ocupadoAgenda == "nao" ||
                            items[index].ocupadoAgenda == "",
                        child: Card(
                          color: (items[index].ocupadoAgenda == "Sim" ||
                                  items[index].ocupadoAgenda == "sim"
                              ? Colors.red[200]
                              : Colors.green[200]),
                          elevation: 5,
                          margin:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 6),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          "📅 Horário: " +
                                              DateFormat('yyyy-MM-dd – kk:mm')
                                                  .format(DateTime.parse(
                                                      items[index]
                                                          .dadosAgenda)),
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          "🏥 Local de atendimento: " +
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
                          MenuPagePaciente(widget.email, widget.senha)));
            }
          });
        },
      ),
    );
  }

  Future<PegaAgenda> pegaAgendaEspecifica(int id) async {
    final response = await http
        .get(Uri.parse("https://api-marquemed.herokuapp.com/medico/$id"));
    var data = json.decode(response.body);
    return PegaAgenda.fromJson(data);
  }

  Future<void> finalizarMarcacao(int idAgenda, int idPaciente) async {
    fAgenda.FinalizaAgendaClass finalizaAgenda = fAgenda.FinalizaAgendaClass(
      agenda: fAgenda.Agenda(id: idAgenda),
      paciente: fAgenda.Paciente(id: idPaciente),
      status: "",
    );
    if (widget.agenda == null) {
      FinalizaConsulta(finalizaAgenda).then((isSuccess) async {
        if (isSuccess) {
          await _showMyDialog();

          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: const Text('Consulta agendada com sucesso !')));
        } else {
          print("Deu erro");
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: const Text('Erro ao agendar a consulta !')));
        }
      });
    } else {
      return ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: const Text('Erro no agendamento !')));
    }
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Sua consulta foi marcada com sucesso !'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text(
                    'Em até 3 horas, o médico selecionado irá confirmar sua consulta !'),
                Text(
                    'Enviamos um comprovante a você com o status da sua solicitação !'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Inicio'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  static Future<bool> FinalizaConsulta(fAgenda.FinalizaAgendaClass data) async {
    print(data.toJson());
    final response = await http.post(
      Uri.parse("https://api-marquemed.herokuapp.com/finalizar/analise"),
      headers: {"content-type": "application/json"},
      body: fAgenda.postToJson(data),
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
