import 'package:MedAgenda/agenda_medico/minha_agenda.dart';
import 'package:MedAgenda/classes/agenda_class.dart';
import 'package:MedAgenda/menuMedico/menu_page_medico.dart';
import 'package:MedAgenda/services/agenda/services_agenda.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';
import 'dart:ui';
import 'dart:convert';
import 'package:http/http.dart' as http;

class PageAgendaMedico extends StatefulWidget {
  Agenda agenda;
  String email, senha;
  int idMedico;

  PageAgendaMedico(this.email, this.senha, this.idMedico);
  @override
  _PageAgendaMedicoState createState() => _PageAgendaMedicoState();
}

class _PageAgendaMedicoState extends State<PageAgendaMedico> {
  CalendarController _controller;
  String _date = "Não informado";
  String _time = "Não informado";
  String nomeClinica;
  String _mySelection;
  DateTime dataCompleta;

  int _page = 0;

  @override
  void initState() {
    super.initState();
    _controller = CalendarController();
    pegaNomeClinica();
  }

  List data = List(); //edited line

  Future<String> pegaNomeClinica() async {
    var res = await http.get(Uri.parse("http://senai.cck.com.br/clinica"));
    var resBody = json.decode(res.body);

    setState(() {
      data = resBody;
    });

    return "Sucess";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[300],
        title: Text(
          "Minha Agenda",
          style: GoogleFonts.lato(
            textStyle: Theme.of(context).textTheme.headline4,
            fontSize: 30,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                    elevation: 4.0,
                    onPressed: () {
                      DatePicker.showDatePicker(context,
                          theme: DatePickerTheme(
                            containerHeight: 210.0,
                          ),
                          showTitleActions: true,
                          minTime: DateTime(2000, 1, 1),
                          maxTime: DateTime(2022, 12, 31), onConfirm: (date) {
                        print('$date');
                        _date = '${date.year} - ${date.month} - ${date.day}';
                        setState(() {});
                      }, currentTime: DateTime.now(), locale: LocaleType.en);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 50.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.date_range,
                                      size: 18.0,
                                      color: Colors.teal,
                                    ),
                                    Text(
                                      " $_date",
                                      style: TextStyle(
                                          color: Colors.teal,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18.0),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          Text(
                            "  Selecionar",
                            style: TextStyle(
                                color: Colors.teal,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0),
                          ),
                        ],
                      ),
                    ),
                    color: Colors.white,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                    elevation: 4.0,
                    onPressed: () {
                      DatePicker.showTimePicker(context,
                          theme: DatePickerTheme(
                            containerHeight: 210.0,
                          ),
                          showTitleActions: true, onConfirm: (time) {
                        print('$time');
                        dataCompleta = time;
                        _time =
                            '${time.hour} : ${time.minute} : ${time.second}';
                        setState(() {});
                      }, currentTime: DateTime.now(), locale: LocaleType.en);
                      setState(() {});
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 50.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.access_time,
                                      size: 18.0,
                                      color: Colors.teal,
                                    ),
                                    Text(
                                      " $_time",
                                      style: TextStyle(
                                          color: Colors.teal,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18.0),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          Text(
                            "  Selecionar",
                            style: TextStyle(
                                color: Colors.teal,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0),
                          ),
                        ],
                      ),
                    ),
                    color: Colors.white,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Card(
              elevation: 1,
              margin: EdgeInsets.only(bottom: 3),
              child: ListTile(
                title: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Selecione a clínica:",
                    style: TextStyle(
                        color: Colors.teal,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0),
                  ),
                ),
                contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                trailing: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    items: data.map((item) {
                      return new DropdownMenuItem(
                        child: new Text(item['nameClinica']),
                        value: item['id'].toString(),
                      );
                    }).toList(),
                    onChanged: (newVal) {
                      setState(() {
                        _mySelection = newVal;
                        print(_mySelection);
                      });
                    },
                    value: _mySelection,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: RaisedButton(
                color: Colors.lightBlue[200],
                disabledColor: Colors.green,
                disabledTextColor: Colors.blue,
                onPressed: () async {
                  await addHorarioAgenda();
                },
                child: Text('ADICIONAR HORÁRIO'),
              ),
            ),
          ],
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
          Icon(Icons.import_contacts, size: 30, color: Colors.white),
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
                      builder: (context) => MinhaAgenda(widget.idMedico)));
            }
          });
        },
      ),
    );
  }

  Future<void> addHorarioAgenda() async {
    String dataAjustada = dataCompleta.toString().substring(0, 10) +
        "T" +
        dataCompleta.toString().substring(11, 23);
    print(dataAjustada);
    print(widget.idMedico);
    print(_mySelection);
    Agenda agenda = Agenda(
        dadosAgenda: dataAjustada,
        medico: Medico(id: widget.idMedico),
        clinica: Clinica(id: int.parse(_mySelection)),
        ocupadoAgenda: "Não");

    if (widget.agenda == null) {
      ServicesAgenda.createAgenda(agenda).then((isSuccess) async {
        if (isSuccess) {
          await _showMyDialog();
        } else {
          print("Deu erro");
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: const Text('Erro ao adicionar horário !')));
        }
      });
    } else {
      return ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: const Text('Erro na agenda !')));
    }
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Horário adicionado com sucesso!'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text("Deseja adicionar outro horário ?"),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                'Sim',
                style: TextStyle(color: Colors.green),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: const Text('Não', style: TextStyle(color: Colors.red)),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MinhaAgenda(widget.idMedico)));
              },
            ),
          ],
        );
      },
    );
  }
}
