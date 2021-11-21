import 'package:MedAgenda/TelaCovid/cases_page.dart';
import 'package:flutter/material.dart';

import 'info_page.dart';

class CovidMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          fontFamily: 'FiraSans', scaffoldBackgroundColor: Color(0xFFF4F4F4)),
      home: MyStatefulWidget(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[CovidCases(), InfoPage()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: new IconButton(
          icon: new Image.asset('assets/corona.png'),
          onPressed: () {},
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Se proteja, vacine-se 💉',
                style: TextStyle(
                    color: Colors.lightBlue,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold)),
            Text('Covid-19 Brasil',
                style: TextStyle(
                    color: Color(0xFFFF0231),
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold))
          ],
        ),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text(
                'Home',
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
          BottomNavigationBarItem(
              icon: Icon(Icons.info_outline),
              title: Text(
                'Info',
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.lightBlue,
        onTap: _onItemTapped,
      ),
    );
  }
}
