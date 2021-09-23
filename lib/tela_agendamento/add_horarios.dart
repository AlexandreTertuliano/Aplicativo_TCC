import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

class AddHorario extends StatefulWidget {
  @override
  _AddHorario createState() => _AddHorario();
}

class _AddHorario extends State<AddHorario> {
  CalendarController _controller;
  final format = DateFormat("HH:mm");

  String name_clinicas;
  String _fromDate = "";
  int _page = 0;

  @override
  void initState() {
    super.initState();
    _controller = CalendarController();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        body: Column(children: [
          Stack(children: [
            Transform.rotate(
              origin: Offset(30, -30),
              angle: 2.4,
              child: Container(
                margin: EdgeInsets.only(
                  left: 75,
                  top: 40,
                ),
                height: 400,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(80),
                  gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    colors: [Color(0xff87CEFA), Color(0xFF00BFFF)],
                  ),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TableCalendar(
                  initialCalendarFormat: CalendarFormat.month,
                  calendarStyle: CalendarStyle(
                      todayColor: Colors.orange,
                      selectedColor: Theme.of(context).primaryColor,
                      todayStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                          color: Colors.white)),
                  headerStyle: HeaderStyle(
                    centerHeaderTitle: true,
                    formatButtonDecoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    formatButtonTextStyle: TextStyle(color: Colors.white),
                    formatButtonShowsNext: false,
                  ),
                  startingDayOfWeek: StartingDayOfWeek.monday,
                  onDaySelected: (day, events, holidays) {},
                  builders: CalendarBuilders(
                    selectedDayBuilder: (context, date, events) => Container(
                        margin: const EdgeInsets.all(4.0),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Text(
                          date.day.toString(),
                          style: TextStyle(color: Colors.white),
                        )),
                    todayDayBuilder: (context, date, events) => Container(
                        margin: const EdgeInsets.all(4.0),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Text(
                          date.day.toString(),
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                  calendarController: _controller,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                      child: Column(children: <Widget>[
                        DropdownButton<String>(
                          isExpanded: true,
                          items: [
                            DropdownMenuItem<String>(
                              child: Text('Hospital Regional'),
                              value: 'C1',
                            ),
                            DropdownMenuItem<String>(
                              child: Text('Renascentista'),
                              value: 'C2',
                            ),
                            DropdownMenuItem<String>(
                              child: Text('Clinica São Bento'),
                              value: 'C3',
                            ),
                            DropdownMenuItem<String>(
                              child: Text('Clínica São José'),
                              value: 'C4',
                            ),
                            DropdownMenuItem<String>(
                              child: Text('Hospitalar'),
                              value: 'C5',
                            ),
                            DropdownMenuItem<String>(
                              child: Text('Santa Paula'),
                              value: 'C6',
                            ),
                          ],
                          onChanged: (String value) {
                            setState(() {
                              name_clinicas = value;
                            });
                          },
                          hint: Text('Selecione a clínica'),
                          value: name_clinicas,
                        ),
                      ])),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                      child: Column(children: <Widget>[
                    DateTimeField(
                      decoration: InputDecoration(
                        labelText: 'Adicionar horário',
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25.0),
                          borderSide: new BorderSide(),
                        ),
                      ),
                      format: format,
                      onShowPicker: (context, currentValue) async {
                        final time = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.fromDateTime(
                              currentValue ?? DateTime.now()),
                        );

                        return DateTimeField.convert(time);
                      },
                      onChanged: (DateTime newValue) {
                        setState(() {
                          _fromDate = (DateFormat('HH:mm').format(newValue));
                        });
                      },
                    ),
                  ])),
                ),
              ],
            ),
          ]),
        ]),
        bottomNavigationBar: CurvedNavigationBar(
          color: Colors.lightBlue[300],
          backgroundColor: Colors.white,
          items: <Widget>[
            Icon(
              Icons.keyboard_return,
              size: 30,
              color: Colors.white,
            ),
            Icon(Icons.add, size: 30, color: Colors.white),
          ],
          onTap: (index) {
            setState(() {
              _page = index;
              if (index == 0) {
                Navigator.pop(context);
              } else if (index == 1) {
                //ADICIONA OS DADOS DO CONTROLLER E ENVIA PARA O SERVIDOR E DEPOIS RETORNA OS DADOS.
              }
            });
          },
        ),
      ),
    );
  }
}
