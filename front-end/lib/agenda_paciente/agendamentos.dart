import 'package:MedAgenda/classes/agenda_paciente_class.dart';
import 'package:MedAgenda/classes/feedback_class.dart' as fFeedback;
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:http/http.dart' as http;
import 'package:quick_feedback/quick_feedback.dart';

class AgendamentosPaciente extends StatefulWidget {
  fFeedback.FeedbackClass feedback;
  int idPaciente;

  AgendamentosPaciente(this.idPaciente);
  @override
  _AgendamentosPacienteState createState() => _AgendamentosPacienteState();
}

class _AgendamentosPacienteState extends State<AgendamentosPaciente> {
  // ignore: deprecated_member_use
  List<AgendaPaciente> agendaPaciente = List<AgendaPaciente>();
  // ignore: deprecated_member_use
  List<AgendaPaciente> _agendaPacienteDisplay = List<AgendaPaciente>();

  bool loading;
  int _page = 0;

  @override
  void initState() {
    super.initState();
    loading = true;
    _getAgendaClinica(widget.idPaciente);
  }

  Future<void> _getAgendaClinica(int id) async {
    listaAgendaPaciente(id).then((list) {
      setState(() {
        agendaPaciente = list;
        _agendaPacienteDisplay = agendaPaciente;
        loading = false;
      });
    });
  }

  Future<void> _refreshPosts(BuildContext context) async {
    return listaAgendaPaciente(widget.idPaciente).then((list) {
      setState(() {
        agendaPaciente = list;
        _agendaPacienteDisplay = agendaPaciente;
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
          "Minhas Consultas",
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
              if (_agendaPacienteDisplay.length > 0) {
                return index == 0 ? _searchBar() : _listItem(index - 1);
              } else {
                return Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Center(child: CircularProgressIndicator()),
                );
              }
            },
            itemCount: _agendaPacienteDisplay.length + 1,
          ),
        ),
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
        ],
        onTap: (index) {
          setState(() {
            _page = index;
            if (index == 0) {
              Navigator.pop(context);
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
          hintText: "Pesquisar por nome do médico 🔍",
          hintStyle: TextStyle(color: Colors.white),
        ),
        onChanged: (text) {
          text = text.toLowerCase();
          setState(() {
            _agendaPacienteDisplay = agendaPaciente.where((agendaPaciente) {
              var agendaPacienteCliNom = agendaPaciente.medico.toLowerCase();
              return agendaPacienteCliNom.contains(text);
            }).toList();
          });
        },
      ),
    );
  }

  _listItem(index) {
    return GestureDetector(
      onTap: () {
        if (_agendaPacienteDisplay[index].status == "Confirmado") {
          showDialog(
            context: context,
            builder: (context) {
              return QuickFeedback(
                title: 'Avalie o Médico (a)',
                showTextBox: true,
                textBoxHint: 'Deixe seu comentário',
                submitText: 'ENVIAR',
                onSubmitCallback: (feedback) async {
                  Navigator.of(context).pop();
                  await dadosFeedback(
                      feedback['rating'],
                      _agendaPacienteDisplay[index].medico,
                      feedback['feedback']);
                },
                askLaterText: 'Responder depois',
                onAskLaterCallback: () {
                  print('Do something on ask later click');
                },
              );
            },
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: const Text('Envio de Feedback indisponível')));
        }
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
                  "📅 Horário : " + _agendaPacienteDisplay[index].dataHora,
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
                "🏥 Clínica: " + _agendaPacienteDisplay[index].clinica,
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
                  "👨‍⚕️ Médico : " + _agendaPacienteDisplay[index].medico,
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
                "📍 Status : " + _agendaPacienteDisplay[index].status,
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

  static Future<List<AgendaPaciente>> listaAgendaPaciente(int id) async {
    final response = await http.get(
        Uri.parse("http://api-marquemed.herokuapp.com/paciente/agenda/$id"));
    if (response.statusCode == 200) {
      return postFromJson(response.body);
    } else {
      return null;
    }
  }

  static Future<bool> enviarFeedback(fFeedback.FeedbackClass data) async {
    final response = await http.post(
      Uri.parse("https://api-marquemed.herokuapp.com/feedback"),
      headers: {"content-type": "application/json"},
      body: fFeedback.postToJson(data),
    );
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> dadosFeedback(
      int avaliacao, String nomeMedico, String feedbackText) async {
    String dataAjustada = DateTime.now().toString().substring(0, 10) +
        "T" +
        DateTime.now().toString().substring(11, 23);
    if (feedbackText == "") {
      feedbackText = "Sem comentario";
    }
    fFeedback.FeedbackClass feedback = fFeedback.FeedbackClass(
        avaliacaoFeedback: avaliacao,
        nameMedico: nomeMedico,
        pacienteId: fFeedback.Paciente(id: widget.idPaciente),
        dateFeedback: dataAjustada,
        feedbackPaciente: feedbackText);
    print(feedbackText);

    if (widget.feedback == null) {
      enviarFeedback(feedback).then((isSuccess) async {
        if (isSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: const Text('Feedback enviado com sucesso !')));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: const Text('Erro ao enviar feedback !')));
        }
      });
    } else {
      return ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: const Text('Erro no feedback !')));
    }
  }
}
