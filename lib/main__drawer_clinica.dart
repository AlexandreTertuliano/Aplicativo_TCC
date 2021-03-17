import 'dart:ui';

import 'package:flutter/material.dart';

class MainDrawerClinica extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Colors.cyan,
            child: Center(
              child: Column(
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.only(
                      top: 25,
                      bottom: 10,
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://media-exp1.licdn.com/dms/image/C560BAQGM2GqfunbqYg/company-logo_200_200/0/1519890421416?e=2159024400&v=beta&t=c5m5-B7tl52JMQA551hIqgmm-WBBizSvD3TAHFzGTZ4'),
                          fit: BoxFit.fill),
                    ),
                  ),
                  Text(
                    "Clinica MedCenter",
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "medcenter@gmail.com",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home, color: Colors.black),
            title: Text(
              'Inicio',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(
              Icons.apartment,
              color: Colors.black,
            ),
            title: Text(
              'Meus Dados',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.calendar_today, color: Colors.black),
            title: Text(
              'Ver agendas',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.person_add, color: Colors.black),
            title: Text(
              'Adicionar Médicos',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.local_hospital, color: Colors.black),
            title: Text(
              'Médicos Cadastrados',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.settings_applications, color: Colors.black),
            title: Text(
              'Configurações',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app, color: Colors.black),
            title: Text(
              'Sair',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
