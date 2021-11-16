import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DadosMedicos extends StatefulWidget {
  DadosMedicos({Key key}) : super(key: key);

  @override
  _DadosMedicosState createState() => _DadosMedicosState();
}

class _DadosMedicosState extends State<DadosMedicos> {
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

  String _value_idade;

  String _value_crm;
  // ignore: non_constant_identifier_names
  String _value_sexo;

  // ignore: non_constant_identifier_names
  String _value_cep;
  // ignore: non_constant_identifier_names
  String _value_estado;

  // ignore: non_constant_identifier_names
  String _value_rua;
  // ignore: non_constant_identifier_names
  String _value_bairro;

  // ignore: non_constant_identifier_names
  String _value_numero;
  // ignore: non_constant_identifier_names
  String _value_esp1;

  // ignore: non_constant_identifier_names
  String _value_esp2;
  // ignore: non_constant_identifier_names
  String _value_esp3;

  // ignore: non_constant_identifier_names
  String _value_universidade;
  // ignore: non_constant_identifier_names
  String _value_anograduacao;

  // ignore: non_constant_identifier_names
  String _value_cidadegraduacao;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          padding: EdgeInsets.only(
            top: 5,
            left: 10,
            right: 10,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
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
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Informações Pessoais ",
                          style: TextStyle(
                              fontSize: ScreenUtil.getInstance().setSp(40),
                              fontFamily: "Poppins-Bold",
                              letterSpacing: .6)),
                      SizedBox(
                        height: ScreenUtil.getInstance().setHeight(30),
                      ),
                      Text("Nome Completo : ",
                          style: TextStyle(
                              fontFamily: "Poppins-Medium",
                              fontSize: ScreenUtil.getInstance().setSp(26))),
                      TextField(
                        decoration: InputDecoration(
                            hintText: "Ex : Nome Completo",
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 12.0)),
                        onChanged: (String value) {
                          setState(() {
                            _value_Nome = value;
                          });
                        },
                      ),
                      Text("CPF : ",
                          style: TextStyle(
                              fontFamily: "Poppins-Medium",
                              fontSize: ScreenUtil.getInstance().setSp(26))),
                      TextField(
                        decoration: InputDecoration(
                            hintText: "Ex : CPF",
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 12.0)),
                        onChanged: (String value) {
                          setState(() {
                            _value_Cpf = value;
                          });
                        },
                      ),
                      Text("Data de nascimento",
                          style: TextStyle(
                              fontFamily: "Poppins-Medium",
                              fontSize: ScreenUtil.getInstance().setSp(26))),
                      TextField(
                        decoration: InputDecoration(
                            hintText: "Ex : 01/01/2021",
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 12.0)),
                        onChanged: (String value) {
                          setState(() {
                            _value_Data_Aniversario = value;
                          });
                        },
                      ),
                      Text("Sexo",
                          style: TextStyle(
                              fontFamily: "Poppins-Medium",
                              fontSize: ScreenUtil.getInstance().setSp(26))),
                      TextField(
                        decoration: InputDecoration(
                            hintText: "Ex : Masculino",
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 12.0)),
                        onChanged: (String value) {
                          setState(() {
                            _value_sexo = value;
                          });
                        },
                      ),
                      Text("Telefone",
                          style: TextStyle(
                              fontFamily: "Poppins-Medium",
                              fontSize: ScreenUtil.getInstance().setSp(26))),
                      TextField(
                        decoration: InputDecoration(
                            hintText: "Ex : 00 01234-5678",
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 12.0)),
                        onChanged: (String value) {
                          setState(() {
                            _value_Telefone = value;
                          });
                        },
                      ),
                      Text("Idade",
                          style: TextStyle(
                              fontFamily: "Poppins-Medium",
                              fontSize: ScreenUtil.getInstance().setSp(26))),
                      TextField(
                        decoration: InputDecoration(
                            hintText: "Ex : 00",
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 12.0)),
                        onChanged: (String value) {
                          setState(() {
                            _value_idade = value;
                          });
                        },
                      ),
                      SizedBox(
                        height: ScreenUtil.getInstance().setHeight(30),
                      ),
                      Text("Endereço ",
                          style: TextStyle(
                              fontSize: ScreenUtil.getInstance().setSp(40),
                              fontFamily: "Poppins-Bold",
                              letterSpacing: .6)),
                      SizedBox(
                        height: ScreenUtil.getInstance().setHeight(30),
                      ),
                      Text("CEP",
                          style: TextStyle(
                              fontFamily: "Poppins-Medium",
                              fontSize: ScreenUtil.getInstance().setSp(26))),
                      TextField(
                        decoration: InputDecoration(
                            hintText: "Ex : 11111-000",
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 12.0)),
                        onChanged: (String value) {
                          setState(() {
                            _value_cep = value;
                          });
                        },
                      ),
                      Text("Cidade",
                          style: TextStyle(
                              fontFamily: "Poppins-Medium",
                              fontSize: ScreenUtil.getInstance().setSp(26))),
                      TextField(
                        decoration: InputDecoration(
                            hintText: "Ex : Pouso Alegre",
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 12.0)),
                        onChanged: (String value) {
                          setState(() {
                            _value_Cidade = value;
                          });
                        },
                      ),
                      Text("Estado",
                          style: TextStyle(
                              fontFamily: "Poppins-Medium",
                              fontSize: ScreenUtil.getInstance().setSp(26))),
                      TextField(
                        decoration: InputDecoration(
                            hintText: "Ex : Minas Gerais",
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 12.0)),
                        onChanged: (String value) {
                          setState(() {
                            _value_estado = value;
                          });
                        },
                      ),
                      Text("Rua",
                          style: TextStyle(
                              fontFamily: "Poppins-Medium",
                              fontSize: ScreenUtil.getInstance().setSp(26))),
                      TextField(
                        decoration: InputDecoration(
                            hintText: "Ex : xxxxxxxxxxxxx",
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 12.0)),
                        onChanged: (String value) {
                          setState(() {
                            _value_rua = value;
                          });
                        },
                      ),
                      Text("Bairro",
                          style: TextStyle(
                              fontFamily: "Poppins-Medium",
                              fontSize: ScreenUtil.getInstance().setSp(26))),
                      TextField(
                        decoration: InputDecoration(
                            hintText: "Ex : xxxxxxxxxx",
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 12.0)),
                        onChanged: (String value) {
                          setState(() {
                            _value_bairro = value;
                          });
                        },
                      ),
                      Text("N°",
                          style: TextStyle(
                              fontFamily: "Poppins-Medium",
                              fontSize: ScreenUtil.getInstance().setSp(26))),
                      TextField(
                        decoration: InputDecoration(
                            hintText: "Ex : 111",
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 12.0)),
                        onChanged: (String value) {
                          setState(() {
                            _value_numero = value;
                          });
                        },
                      ),
                      Image.asset(
                        "assets/medicalForm.png",
                      ),
                      SizedBox(
                        height: ScreenUtil.getInstance().setHeight(30),
                      ),
                      Text("Dados Profissionais ",
                          style: TextStyle(
                              fontSize: ScreenUtil.getInstance().setSp(40),
                              fontFamily: "Poppins-Bold",
                              letterSpacing: .6)),
                      SizedBox(
                        height: ScreenUtil.getInstance().setHeight(30),
                      ),
                      Text("CRM : ",
                          style: TextStyle(
                              fontFamily: "Poppins-Medium",
                              fontSize: ScreenUtil.getInstance().setSp(26))),
                      TextField(
                        decoration: InputDecoration(
                            hintText: "Ex : CRM",
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 12.0)),
                        onChanged: (String value) {
                          setState(() {
                            _value_crm = value;
                          });
                        },
                      ),
                      Text("Especialidade ",
                          style: TextStyle(
                              fontFamily: "Poppins-Medium",
                              fontSize: ScreenUtil.getInstance().setSp(26))),
                      TextField(
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp('[1-9]')),
                        ],
                        decoration: InputDecoration(
                            hintText: "Ex : Cardiologia",
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 12.0)),
                        onChanged: (String value) {
                          setState(() {
                            _value_esp1 = value;
                          });
                        },
                      ),
                      Text("Especialidade 1 ",
                          style: TextStyle(
                              fontFamily: "Poppins-Medium",
                              fontSize: ScreenUtil.getInstance().setSp(26))),
                      TextField(
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp('[1-9]')),
                        ],
                        decoration: InputDecoration(
                            hintText: "Ex : Oftalmologista ",
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 12.0)),
                        onChanged: (String value) {
                          setState(() {
                            _value_esp2 = value;
                          });
                        },
                      ),
                      Text("Especialidade 3",
                          style: TextStyle(
                              fontFamily: "Poppins-Medium",
                              fontSize: ScreenUtil.getInstance().setSp(26))),
                      TextField(
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp('[1-9]')),
                        ],
                        decoration: InputDecoration(
                            hintText: "Ex : Geriatra",
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 12.0)),
                        onChanged: (String value) {
                          setState(() {
                            _value_esp3 = value;
                          });
                        },
                      ),
                      SizedBox(
                        height: ScreenUtil.getInstance().setHeight(20),
                      ),
                      Text("Universidade de Graduação",
                          style: TextStyle(
                              fontFamily: "Poppins-Medium",
                              fontSize: ScreenUtil.getInstance().setSp(26))),
                      TextField(
                        decoration: InputDecoration(
                            hintText: "Ex : UNIVAS",
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 12.0)),
                        onChanged: (String value) {
                          setState(() {
                            _value_universidade = value;
                          });
                        },
                      ),
                      Text("Ano de graduação",
                          style: TextStyle(
                              fontFamily: "Poppins-Medium",
                              fontSize: ScreenUtil.getInstance().setSp(26))),
                      TextField(
                        decoration: InputDecoration(
                            hintText: "Ex : 2021",
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 12.0)),
                        onChanged: (String value) {
                          setState(() {
                            _value_anograduacao = value;
                          });
                        },
                      ),
                      Text("Cidade de Graduação",
                          style: TextStyle(
                              fontFamily: "Poppins-Medium",
                              fontSize: ScreenUtil.getInstance().setSp(26))),
                      TextField(
                        decoration: InputDecoration(
                            hintText: "Ex : Pouso Alegre",
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 12.0)),
                        onChanged: (String value) {
                          setState(() {
                            _value_cidadegraduacao = value;
                          });
                        },
                      ),
                      SizedBox(
                        height: ScreenUtil.getInstance().setHeight(30),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
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
                              Radius.circular(50),
                            ),
                          ),
                          child: SizedBox.expand(
                            // ignore: deprecated_member_use
                            child: FlatButton(
                              child: Text(
                                "Salvar Alteração",
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
                      ),
                      SizedBox(
                        height: ScreenUtil.getInstance().setHeight(80),
                      ),
                    ],
                  ),
                )
              ])
            ],
          )),
    );
  }
}
