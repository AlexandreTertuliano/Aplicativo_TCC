import 'package:MedAgenda/main__drawer_clinica.dart';
import 'package:MedAgenda/main_drawer_paciente.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class AddHorario extends StatefulWidget {
  @override
  _AddHorario createState() => _AddHorario();
}

class _AddHorario extends State<AddHorario> {
  CalendarController _controller;
  bool _isSelected = false;

  void _radio() {
    setState(() {
      _isSelected = !_isSelected;
    });
  }

  Widget radioButton(bool isSelected) => Container(
        width: 16.0,
        height: 16.0,
        padding: EdgeInsets.all(2.0),
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            border: Border.all(width: 2.0, color: Colors.black)),
        child: isSelected
            ? Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle, color: Colors.black),
              )
            : Container(),
      );

  @override
  void initState() {
    super.initState();
    _controller = CalendarController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar horários'),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TableCalendar(
              initialCalendarFormat: CalendarFormat.week,
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
            Container(
              child: Column(
                children: [
                  new Text(
                    'Marque os horários disponiveis:',
                    style: new TextStyle(
                        fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  new Padding(
                    padding: new EdgeInsets.all(8.0),
                  ),
                  new Divider(height: 5.0, color: Colors.black),
                  new Padding(
                    padding: new EdgeInsets.all(8.0),
                  ),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Padding(
                        padding: new EdgeInsets.all(10.0),
                      ),
                      GestureDetector(
                        onTap: _radio,
                        child: radioButton(_isSelected),
                      ),
                      new Text(
                        '07:00',
                        style: new TextStyle(fontSize: 20.0),
                      ),
                      new Padding(
                        padding: new EdgeInsets.all(10.0),
                      ),
                      GestureDetector(
                        onTap: _radio,
                        child: radioButton(_isSelected),
                      ),
                      new Text(
                        '07:30',
                        style: new TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                      new Padding(
                        padding: new EdgeInsets.all(10.0),
                      ),
                      GestureDetector(
                        onTap: _radio,
                        child: radioButton(_isSelected),
                      ),
                      new Text(
                        '08:00',
                        style: new TextStyle(fontSize: 20.0),
                      ),
                      new Padding(
                        padding: new EdgeInsets.all(10.0),
                      ),
                      GestureDetector(
                        onTap: _radio,
                        child: radioButton(_isSelected),
                      ),
                      new Text(
                        '08:30',
                        style: new TextStyle(fontSize: 20.0),
                      ),
                    ],
                  ),
                  new Divider(height: 25.0, color: Colors.black),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Padding(
                        padding: new EdgeInsets.all(10.0),
                      ),
                      GestureDetector(
                        onTap: _radio,
                        child: radioButton(_isSelected),
                      ),
                      new Text(
                        '09:00',
                        style: new TextStyle(fontSize: 20.0),
                      ),
                      new Padding(
                        padding: new EdgeInsets.all(10.0),
                      ),
                      GestureDetector(
                        onTap: _radio,
                        child: radioButton(_isSelected),
                      ),
                      new Text(
                        '09:30',
                        style: new TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                      new Padding(
                        padding: new EdgeInsets.all(10.0),
                      ),
                      GestureDetector(
                        onTap: _radio,
                        child: radioButton(_isSelected),
                      ),
                      new Text(
                        '10:00',
                        style: new TextStyle(fontSize: 20.0),
                      ),
                      new Padding(
                        padding: new EdgeInsets.all(10.0),
                      ),
                      GestureDetector(
                        onTap: _radio,
                        child: radioButton(_isSelected),
                      ),
                      new Text(
                        '10:30',
                        style: new TextStyle(fontSize: 20.0),
                      ),
                    ],
                  ),
                  new Divider(height: 25.0, color: Colors.black),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Padding(
                        padding: new EdgeInsets.all(10.0),
                      ),
                      GestureDetector(
                        onTap: _radio,
                        child: radioButton(_isSelected),
                      ),
                      new Text(
                        '11:00',
                        style: new TextStyle(fontSize: 20.0),
                      ),
                      new Padding(
                        padding: new EdgeInsets.all(10.0),
                      ),
                      GestureDetector(
                        onTap: _radio,
                        child: radioButton(_isSelected),
                      ),
                      new Text(
                        '11:30',
                        style: new TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                      new Padding(
                        padding: new EdgeInsets.all(10.0),
                      ),
                      GestureDetector(
                        onTap: _radio,
                        child: radioButton(_isSelected),
                      ),
                      new Text(
                        '12:00',
                        style: new TextStyle(fontSize: 20.0),
                      ),
                      new Padding(
                        padding: new EdgeInsets.all(10.0),
                      ),
                      GestureDetector(
                        onTap: _radio,
                        child: radioButton(_isSelected),
                      ),
                      new Text(
                        '12:30',
                        style: new TextStyle(fontSize: 20.0),
                      ),
                    ],
                  ),
                  new Divider(height: 25.0, color: Colors.black),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Padding(
                        padding: new EdgeInsets.all(10.0),
                      ),
                      GestureDetector(
                        onTap: _radio,
                        child: radioButton(_isSelected),
                      ),
                      new Text(
                        '13:00',
                        style: new TextStyle(fontSize: 20.0),
                      ),
                      new Padding(
                        padding: new EdgeInsets.all(10.0),
                      ),
                      GestureDetector(
                        onTap: _radio,
                        child: radioButton(_isSelected),
                      ),
                      new Text(
                        '13:30',
                        style: new TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                      new Padding(
                        padding: new EdgeInsets.all(10.0),
                      ),
                      GestureDetector(
                        onTap: _radio,
                        child: radioButton(_isSelected),
                      ),
                      new Text(
                        '14:00',
                        style: new TextStyle(fontSize: 20.0),
                      ),
                      new Padding(
                        padding: new EdgeInsets.all(10.0),
                      ),
                      GestureDetector(
                        onTap: _radio,
                        child: radioButton(_isSelected),
                      ),
                      new Text(
                        '14:30',
                        style: new TextStyle(fontSize: 20.0),
                      ),
                    ],
                  ),
                  new Divider(height: 25.0, color: Colors.black),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Padding(
                        padding: new EdgeInsets.all(10.0),
                      ),
                      GestureDetector(
                        onTap: _radio,
                        child: radioButton(_isSelected),
                      ),
                      new Text(
                        '15:00',
                        style: new TextStyle(fontSize: 20.0),
                      ),
                      new Padding(
                        padding: new EdgeInsets.all(10.0),
                      ),
                      GestureDetector(
                        onTap: _radio,
                        child: radioButton(_isSelected),
                      ),
                      new Text(
                        '15:30',
                        style: new TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                      new Padding(
                        padding: new EdgeInsets.all(10.0),
                      ),
                      GestureDetector(
                        onTap: _radio,
                        child: radioButton(_isSelected),
                      ),
                      new Text(
                        '16:00',
                        style: new TextStyle(fontSize: 20.0),
                      ),
                      new Padding(
                        padding: new EdgeInsets.all(10.0),
                      ),
                      GestureDetector(
                        onTap: _radio,
                        child: radioButton(_isSelected),
                      ),
                      new Text(
                        '16:30',
                        style: new TextStyle(fontSize: 20.0),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0.3, 1],
                    colors: [
                      Color(0xFF17ead9),
                      Color(0xFF6078ea),
                    ],
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                margin: EdgeInsets.all(25),
                child: Center(
                  child: Text("SALVAR",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Poppins-Bold",
                          fontSize: 25,
                          letterSpacing: 1.0)),
                ))
          ],
        ),
      ),
    );
  }
}
