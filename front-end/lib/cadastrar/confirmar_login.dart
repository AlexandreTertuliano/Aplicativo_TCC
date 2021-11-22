import 'dart:convert';

import 'package:MedAgenda/main.dart';
import 'package:http/http.dart' as http;
import 'package:MedAgenda/cadastrar/register_medico.dart';
import 'package:MedAgenda/cadastrar/register_paciente.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ConfirmarLoginPage extends StatefulWidget {
  String validar;
  @override
  _ConfirmarLoginPageState createState() => _ConfirmarLoginPageState();
}

class _ConfirmarLoginPageState extends State<ConfirmarLoginPage> {
  TextEditingController _controllerNome = TextEditingController();
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerCodigo = TextEditingController();
  final formKey = new GlobalKey<FormState>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  bool _validate = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          height: MediaQuery.of(context).size.height - 50,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    "Valide seu Login",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Confirme seu login, e tenha acesso ao MarqueMed ",
                    style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                  ),
                  Image.asset(
                    "assets/validar.png",
                  ),
                ],
              ),
              Form(
                key: formKey,
                autovalidate: _validate,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: _controllerNome,
                      decoration: new InputDecoration(hintText: 'Nome'),
                      validator: _validarNome,
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _controllerEmail,
                      decoration: new InputDecoration(hintText: 'Email'),
                      validator: _validarEmail,
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _controllerCodigo,
                      decoration: new InputDecoration(
                          hintText: 'Código de confirmação'),
                      validator: _validarCodigo,
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 3, left: 3),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border(
                      bottom: BorderSide(color: Colors.black),
                      top: BorderSide(color: Colors.black),
                      left: BorderSide(color: Colors.black),
                      right: BorderSide(color: Colors.black),
                    )),
                child: MaterialButton(
                  minWidth: double.infinity,
                  height: 60,
                  onPressed: _submit,
                  color: Colors.lightBlue,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Text(
                    "Validar",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 3, left: 3),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border(
                      bottom: BorderSide(color: Colors.black),
                      top: BorderSide(color: Colors.black),
                      left: BorderSide(color: Colors.black),
                      right: BorderSide(color: Colors.black),
                    )),
                child: MaterialButton(
                  minWidth: double.infinity,
                  height: 60,
                  color: Colors.lightBlue,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  onPressed: () {},
                  child: Text(
                    "Reenviar Código de confirmação",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _validarNome(String value) {
    String patttern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Informe o nome";
    } else if (!regExp.hasMatch(value)) {
      return "O nome deve conter caracteres de a-z ou A-Z";
    }
    return null;
  }

  String _validarEmail(String value) {
    /*String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';*/
    //RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "Informe o Email";
    } else if (value.length < 10) {
      return "Email inválido";
    } else {
      return null;
    }
  }

  String _validarCodigo(String value) {
    if (value.length == 0) {
      return "Informe o código";
    } else if (value.length < 4) {
      return "O código deve conter 4 dígitos";
    }
    return null;
  }

  _submit() async {
    final form = formKey.currentState;

    if (formKey.currentState.validate()) {
      // Sem erros na validação
      form.save();

      await getLoginPaciente(_controllerCodigo.text, _controllerEmail.text);
      if (widget.validar == "true") {
        showDialog<void>(
          context: context,
          barrierDismissible: false, // user must tap button!
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Conta validada com sucesso ✔'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: const <Widget>[
                    Text('Faça seu login no MarqueMed.'),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('Fazer login'),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyApp()));
                  },
                ),
              ],
            );
          },
        );
      } else {
        showDialog<void>(
          context: context,
          barrierDismissible: false, // user must tap button!
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Erro ao validar login ❌'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: const <Widget>[
                    Text('Verifique os dados e tente novamente.'),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('Voltar'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            );
          },
        );
      }
    } else {
      // erro de validação
      setState(() {
        _validate = true;
      });
    }
  }

  // ignore: missing_return
  Future<bool> getLoginPaciente(String codigo, String email) async {
    final response = await http.get(Uri.parse(
        "https://api-marquemed.herokuapp.com/codigo?codigo=$codigo&email=$email"));
    var json = jsonDecode(response.body);
    setState(() {
      widget.validar = json.toString();
    });

    print(json);
  }
}
