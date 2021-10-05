import 'package:MedAgenda/agenda_paciente/add_horarios.dart';
import 'package:MedAgenda/classes/medico_class.dart';
import 'package:MedAgenda/menuPaciente/menu_page_paciente.dart';
import 'package:MedAgenda/services/medicos/services_medico.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class PagePesquisarMedico extends StatefulWidget {
  @override
  _PagePesquisarMedicoState createState() => _PagePesquisarMedicoState();
}

class _PagePesquisarMedicoState extends State<PagePesquisarMedico> {
  // ignore: deprecated_member_use
  List<Medico> medico = List<Medico>();
  // ignore: deprecated_member_use
  List<Medico> _medicoDisplay = List<Medico>();

  bool loading;
  int _page = 0;
  var rating = 3.0;

  @override
  void initState() {
    super.initState();
    loading = true;
    _getmedico();
  }

  Future<void> _getmedico() async {
    ServicesMedico.getMedico().then((list) {
      setState(() {
        medico = list;
        _medicoDisplay = medico;
        loading = false;
      });
    });
  }

  Future<void> _refreshPosts(BuildContext context) async {
    return ServicesMedico.getMedico().then((list) {
      setState(() {
        medico = list;
        _medicoDisplay = medico;
        loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              if (_medicoDisplay.length > 0) {
                return index == 0 ? _searchBar() : _listItem(index - 1);
              } else {
                return Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Center(child: CircularProgressIndicator()),
                );
              }
            },
            itemCount: _medicoDisplay.length + 1,
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
          Icon(Icons.home, size: 30, color: Colors.white),
        ],
        onTap: (index) {
          setState(() {
            _page = index;
            if (index == 0) {
              Navigator.pop(context);
            } else if (index == 1) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MenuPagePaciente()));
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
          hintText: "Pesquisar por especialidade da medico 🔍",
          hintStyle: TextStyle(color: Colors.white),
        ),
        onChanged: (text) {
          text = text.toLowerCase();
          setState(() {
            _medicoDisplay = medico.where((medico) {
              var medicoCliNom = medico.especializacao1Medico.toLowerCase();
              return medicoCliNom.contains(text);
            }).toList();
          });
        },
      ),
    );
  }

  _listItem(index) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      secondaryActions: [
        IconSlideAction(
            caption: 'Excluir',
            color: Colors.red,
            icon: Icons.delete,
            onTap: () {
              print("1");
            }),
        IconSlideAction(
            caption: 'Editar',
            color: Colors.blue,
            icon: Icons.edit,
            onTap: () {
              print("2");
            }),
      ],
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddHorario()));
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
                SmoothStarRating(
                  rating: rating,
                  isReadOnly: false,
                  size: 40,
                  filledIconData: Icons.star,
                  halfFilledIconData: Icons.star_half,
                  defaultIconData: Icons.star_border,
                  starCount: 5,
                  allowHalfRating: true,
                  spacing: 2.0,
                  onRated: (value) {
                    print("rating value -> $value");
                    // print("rating value dd -> ${value.truncate()}");
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: new Text(
                    "🏨 Médico : " + _medicoDisplay[index].nameMedico,
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
                  "📋 Especialidade : " +
                      _medicoDisplay[index].especializacao1Medico,
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
                new Text(
                  "📞 Telefone : " + _medicoDisplay[index].telefoneMedico,
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
      ),
    );
  }
}
