import 'package:MedAgenda/TelaCovid/covid_main.dart';
import 'package:MedAgenda/agenda_paciente/agendamentos.dart';
import 'package:MedAgenda/cadastro_pessoal/add_meus_dados_paciente.dart';
import 'package:MedAgenda/pesquisarMedicos/pesquisar_medico.dart';
import 'package:MedAgenda/services/login/services_login.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import 'home_icon_buttoms.dart';

class MenuPagePaciente extends StatefulWidget {
  String email;
  String senha;
  MenuPagePaciente(this.email, this.senha);

  @override
  State<MenuPagePaciente> createState() => _MenuPagePacienteState();
}

class _MenuPagePacienteState extends State<MenuPagePaciente> {
  String nomePaciente;
  int idPaciente;
  @override
  void initState() {
    super.initState();
    pegaNomeMedico();
  }

  Future<void> pegaNomeMedico() async {
    final jsonMedico =
        await ServicesLogin.getLoginPaciente(widget.email, widget.senha);
    nomePaciente = jsonMedico.paciente.namePaciente;
    idPaciente = jsonMedico.paciente.id;
    setState(() {
      return nomePaciente;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
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
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 70),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'MarqueMed',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Olá ' + nomePaciente.toString() + ', seja bem vindo!',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 50),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                GestureDetector(
                                  child: CatigoryW(
                                    image: 'assets/perfil.png',
                                    text: 'Meu perfil',
                                    color: Color(0xFF008000),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => DadosPessoais(
                                                widget.email, widget.senha)));
                                  },
                                ),
                                GestureDetector(
                                  child: CatigoryW(
                                    image: 'assets/agenda.png',
                                    text: 'Agenda',
                                    color: Color(0xFFFFFF00),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                AgendamentosPaciente(
                                                  idPaciente,
                                                )));
                                  },
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                GestureDetector(
                                  child: CatigoryW(
                                    image: 'assets/doutor.png',
                                    text: 'Pesquisar\n Médicos',
                                    color: Color(0xFFFD47DF),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                PagePesquisarMedico(
                                                  idPaciente,
                                                  widget.email,
                                                  widget.senha,
                                                )));
                                  },
                                ),
                                GestureDetector(
                                    child: CatigoryW(
                                      image: 'assets/carteira.png',
                                      text: 'Carteira',
                                      color: Color(0xFF1E90FF),
                                    ),
                                    onTap: () {})
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                GestureDetector(
                                  child: CatigoryW(
                                    image: 'assets/covid.png',
                                    text: 'Covid19',
                                    color: Color(0xFFD2691E),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => CovidMain()));
                                  },
                                ),
                                GestureDetector(
                                  child: CatigoryW(
                                    image: 'assets/exit.png',
                                    text: 'Sair',
                                    color: Color(0xFF008080),
                                  ),
                                  //onTap: () => exit(0),
                                  onTap: () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => MyApp()));
                                  },
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
