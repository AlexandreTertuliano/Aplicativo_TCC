import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DadosPessoais extends StatefulWidget {
  DadosPessoais({Key key}) : super(key: key);

  @override
  _DadosPessoaisState createState() => _DadosPessoaisState();
}

class _DadosPessoaisState extends State<DadosPessoais> {
  // ignore: non_constant_identifier_names
  String _value_Nome;
  // ignore: non_constant_identifier_names
  String _value_Cpf;
  // ignore: non_constant_identifier_names
  String _value_Data_Aniversario;
  // ignore: non_constant_identifier_names
  String _value_Telefone;
  // ignore: non_constant_identifier_names
  String _value_Cidade;
  // ignore: non_constant_identifier_names
  String _value_Tipo_Sangue;
  // ignore: non_constant_identifier_names
  String _value_Genero;
  // ignore: non_constant_identifier_names
  String _value_Doador;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meus Dados'),
        backgroundColor: Colors.cyan,
      ),
      backgroundColor: Colors.white,
      body: Container(
          padding: EdgeInsets.only(
            top: 5,
            left: 10,
            right: 10,
          ),
          child: ListView(
              padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
              children: <Widget>[
                Text("informações Pessoais ",
                    style: TextStyle(
                        fontSize: ScreenUtil.getInstance().setSp(30),
                        fontFamily: "Poppins-Bold",
                        letterSpacing: .6)),
                SizedBox(
                  height: ScreenUtil.getInstance().setHeight(30),
                ),
                Text("Nome : ",
                    style: TextStyle(
                        fontFamily: "Poppins-Medium",
                        fontSize: ScreenUtil.getInstance().setSp(26))),
                TextField(
                  decoration: InputDecoration(
                      hintText: "Nome Completo",
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0)),
                      onChanged: (String value) {
                    setState(() {
                      _value_Nome = value;
                    });
                  },
                ),
                SizedBox(
                  height: ScreenUtil.getInstance().setHeight(20),
                ),
                Text("Cpf ",
                    style: TextStyle(
                        fontFamily: "Poppins-Medium",
                        fontSize: ScreenUtil.getInstance().setSp(26))),
                TextField(
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp('[1-9]')),
                  ],
                  decoration: InputDecoration(
                      hintText:
                          "Suas informações estão em um banco de Dados seguro.",
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0)),
                      onChanged: (String value) {
                    setState(() {
                      _value_Cpf = value;
                    });
                  }
                ),
                SizedBox(
                  height: ScreenUtil.getInstance().setHeight(20),
                ),
                Text("Data de Nascimento ",
                    style: TextStyle(
                        fontFamily: "Poppins-Medium",
                        fontSize: ScreenUtil.getInstance().setSp(26))),
                TextField(
                  decoration: InputDecoration(
                      hintText: "??/??/????",
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0)),
                       onChanged: (String value) {
                    setState(() {
                      _value_Data_Aniversario = value;
                    });
                  }
                ),
                SizedBox(
                  height: ScreenUtil.getInstance().setHeight(20),
                ),
                Text("Telefone ",
                    style: TextStyle(
                        fontFamily: "Poppins-Medium",
                        fontSize: ScreenUtil.getInstance().setSp(26))),
                TextField(
                  decoration: InputDecoration(
                      hintText: "Ex : (35)9 1234-5678",
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0)),
                       onChanged: (String value) {
                    setState(() {
                      _value_Telefone = value;
                    });
                  }
                ),
                SizedBox(
                  height: ScreenUtil.getInstance().setHeight(20),
                ),
                Text("Cidade ",
                    style: TextStyle(
                        fontFamily: "Poppins-Medium",
                        fontSize: ScreenUtil.getInstance().setSp(26))),
                TextField(
                  decoration: InputDecoration(
                      hintText: "Ex : Pouso Alegre",
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0)),
                       onChanged: (String value) {
                    setState(() {
                      _value_Cidade = value;
                    });
                  }
                ),
                SizedBox(
                  height: ScreenUtil.getInstance().setHeight(40),
                ),
                Text("Ficha Tecnica ",
                    style: TextStyle(
                        fontSize: ScreenUtil.getInstance().setSp(30),
                        fontFamily: "Poppins-Bold",
                        letterSpacing: .6)),
                SizedBox(
                  height: ScreenUtil.getInstance().setHeight(40),
                ),
                Text("Tipo Sanguineo ",
                    style: TextStyle(
                        fontFamily: "Poppins-Medium",
                        fontSize: ScreenUtil.getInstance().setSp(26))),
                DropdownButton<String>(
                  items: [
                    DropdownMenuItem<String>(
                      child: Text('Sangue A+'),
                      value: 'A+',
                    ),
                    DropdownMenuItem<String>(
                      child: Text('Sangue A-'),
                      value: 'A-',
                    ),
                    DropdownMenuItem<String>(
                      child: Text('Sangue B+'),
                      value: 'B+',
                    ),
                     DropdownMenuItem<String>(
                      child: Text('Sangue B-'),
                      value: 'B-',
                    ),
                     DropdownMenuItem<String>(
                      child: Text('Sangue AB+'),
                      value: 'AB+',
                    ),
                     DropdownMenuItem<String>(
                      child: Text('Sangue AB-'),
                      value: 'AB-',
                    ),  
                     DropdownMenuItem<String>(
                      child: Text('Sangue O+'),
                      value: 'O+',
                    ),
                     DropdownMenuItem<String>(
                      child: Text('Sangue O-'),
                      value: 'O-',
                    ),
                  ],
                  onChanged: (String value) {
                    setState(() {
                      _value_Tipo_Sangue = value;
                    });
                  },
                  hint: Text('Selecione'),
                  value: _value_Tipo_Sangue,
                ),
                SizedBox(
                  height: ScreenUtil.getInstance().setHeight(20),
                ),
                Text("Genero ",
                    style: TextStyle(
                        fontFamily: "Poppins-Medium",
                        fontSize: ScreenUtil.getInstance().setSp(26))),
                DropdownButton<String>(
                  items: [
                    DropdownMenuItem<String>(
                      child: Text('Masculino'),
                      value: 'Masculino',
                    ),
                    DropdownMenuItem<String>(
                      child: Text('Feminino'),
                      value: 'Feminino',
                    ),
                    DropdownMenuItem<String>(
                      child: Text('Não identificar'),
                      value: 'Outros',
                    ),
                  ],
                  onChanged: (String value) {
                    setState(() {
                      _value_Genero = value;
                    });
                  },
                  hint: Text('Selecione'),
                  value: _value_Genero,
                ),
                SizedBox(
                  height: ScreenUtil.getInstance().setHeight(40),
                ),
                Text("Doador de Órgãos  ",
                    style: TextStyle(
                        fontFamily: "Poppins-Medium",
                        fontSize: ScreenUtil.getInstance().setSp(26))),
                DropdownButton<String>(
                  items: [
                    DropdownMenuItem<String>(
                      child: Text('Sim'),
                      value: 'S',
                    ),
                    DropdownMenuItem<String>(
                      child: Text('Não'),
                      value: 'N',
                    )
                  ],
                  onChanged: (String value) {
                    setState(() {
                      _value_Doador = value;
                    });
                  },
                  hint: Text('Selecione'),
                  value: _value_Doador,
                ),
                SizedBox(
                  height: ScreenUtil.getInstance().setHeight(80),
                ),
                Container(
                  height: 60,
                  alignment: Alignment.centerLeft,
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
                 child: SizedBox.expand(
                     // ignore: deprecated_member_use
                     child: FlatButton(
                    child: Text(
                      "Salvar",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    onPressed: () {
                      print(_value_Nome);
                      print(_value_Cpf);
                      print(_value_Data_Aniversario);
                      print(_value_Telefone);
                      print(_value_Cidade);
                      print(_value_Tipo_Sangue);
                      print(_value_Genero);
                      print(_value_Doador);
                    },
                  ),
                 ),
                ),
                SizedBox(
                  height: ScreenUtil.getInstance().setHeight(80),
                ),
              ])),
    );
  }
}
