import 'package:MedAgenda/Clinicas/cadastrar_clinica.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

class PageClinica extends StatefulWidget {
  @override
  _PageClinica createState() => _PageClinica();
}

class _PageClinica extends State<PageClinica> {
  int _page = 0;
  final formGlobalKey = GlobalKey<FormState>();

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
        body: SingleChildScrollView(
          child: Column(children: [
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
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Center(
                        child: Text(
                      "Clínicas cadastradas :",
                      style: GoogleFonts.oswald(fontSize: 30),
                    )),
                  ),
                  
                ],
              ),
            ]),
          ]),
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
            Icon(Icons.add_location_alt, size: 30, color: Colors.white),
          ],
          onTap: (index) {
            setState(() {
              _page = index;
              if (index == 0) {
                Navigator.pop(context);
              } else if (index == 1) {
                Navigator.push(
          context, MaterialPageRoute(builder: (context) => CadastrarClinica()));
              }
            });
          },
        ),
      ),
    );
  }
}
