import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';

class MainDrawerPaciente extends StatelessWidget {
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
                              'https://www.leadsdeconsorcio.com.br/blog/wp-content/uploads/2019/11/04-1.jpg'),
                          fit: BoxFit.fill),
                    ),
                  ),
                  Text(
                    "Alexandre Tertuliano",
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "alexandretertuliano2010@hotmail.com",
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
              Icons.person,
              color: Colors.black,
            ),
            title: Text(
              'Perfil',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.calendar_today, color: Colors.black),
            title: Text(
              'Meus Agendamentos',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.medical_services_sharp, color: Colors.black),
            title: Text(
              'Ver Médicos',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.settings, color: Colors.black),
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
