import 'dart:io';
import 'package:MedAgenda/Clinicas/cadastrar_clinica.dart';
import 'package:MedAgenda/Clinicas/page_clinica.dart';
import 'package:MedAgenda/formularios_cadastro/add_meus_dados_medicos.dart';
import 'package:MedAgenda/tela_agendamento/add_horarios.dart';
import 'package:MedAgenda/tela_agendamento/page_agenda.dart';
import 'package:flutter/material.dart';

import 'home_icon_buttoms.dart';

class MenuPageMedico extends StatelessWidget {
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
                        'Olá Dr.(a) ******** ',
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
                                    image: 'assets/hospital.png',
                                    text: 'Meu perfil',
                                    color: Color(0xFF008000),
                                  ),
                                  onTap: () {
                                    Navigator.push(
          context, MaterialPageRoute(builder: (context) => DadosMedico()));
                                  },
                                ),
                                GestureDetector(
                                  child: CatigoryW(
                                    image: 'assets/agenda.png',
                                    text: 'Minha Agenda',
                                    color: Color(0xFFFFFF00),
                                  ),
                                  onTap: () {
                                    Navigator.push(
          context, MaterialPageRoute(builder: (context) => PageAgenda()));
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
                                    image: 'assets/carteira.png',
                                    text: 'Carteira',
                                    color: Color(0xFFFD47DF),
                                  ),
                                  onTap: () {
                                  },
                                ),
                                GestureDetector(
                                    child: CatigoryW(
                                      image: 'assets/clinica.png',
                                      text: 'Clínicas',
                                      color: Color(0xFF1E90FF),
                                    ),
                                    onTap: () {
                                      Navigator.push(
          context, MaterialPageRoute(builder: (context) => PageClinica()));
                                    })
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
                                    image: 'assets/configuracoes.png',
                                    text: 'Configurações',
                                    color: Color(0xFFD2691E),
                                  ),
                                  onTap: () {},
                                ),
                                GestureDetector(
                                  child: CatigoryW(
                                    image: 'assets/exit.png',
                                    text: 'Sair',
                                    color: Color(0xFF008080),
                                  ),
                                  onTap: () => exit(0),
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
