import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

class CadastrarClinica extends StatefulWidget {
  @override
  _CadastrarClinica createState() => _CadastrarClinica();
}

class _CadastrarClinica extends State<CadastrarClinica> {
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
                      "Cadastrar clínica",
                      style: GoogleFonts.oswald(fontSize: 30),
                    )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Form(
                      key: formGlobalKey,
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                                labelText: "🝥 Nome Fictício :",
                                labelStyle: TextStyle(color: Colors.black)),
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            decoration: InputDecoration(
                                labelText: "📑 CNPJ :",
                                labelStyle: TextStyle(color: Colors.black)),
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            decoration: InputDecoration(
                                labelText: "📞 Telefone :",
                                labelStyle: TextStyle(color: Colors.black)),
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                                labelText: "🌝 CEP :",
                                labelStyle: TextStyle(color: Colors.black)),
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            decoration: InputDecoration(
                                labelText: "🗾 Estado :",
                                labelStyle: TextStyle(color: Colors.black)),
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            decoration: InputDecoration(
                                labelText: "🗾 Cidade :",
                                labelStyle: TextStyle(color: Colors.black)),
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            decoration: InputDecoration(
                                labelText: "🗾 Bairro :",
                                labelStyle: TextStyle(color: Colors.black)),
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            decoration: InputDecoration(
                                labelText: "🗾 Rua :",
                                labelStyle: TextStyle(color: Colors.black)),
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            decoration: InputDecoration(
                                labelText: "🗾 N° :",
                                labelStyle: TextStyle(color: Colors.black)),
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  )
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
