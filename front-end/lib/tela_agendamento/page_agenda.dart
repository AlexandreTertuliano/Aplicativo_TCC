import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'add_horarios.dart';

class PageAgenda extends StatefulWidget {
  @override
  _PageAgenda createState() => _PageAgenda();
}

class _PageAgenda extends State<PageAgenda> {
  int _page = 0;
  @override
  void initState() {
    super.initState();
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
              children: [],
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
            Icon(Icons.event, size: 30, color: Colors.white),
          ],
          onTap: (index) {
            setState(() {
              _page = index;
              if (index == 0) {
                Navigator.pop(context);
              } else if (index == 1) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddHorario()));
              }
            });
          },
        ),
      ),
    );
  }
}
