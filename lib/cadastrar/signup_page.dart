import 'package:MedAgenda/cadastrar/register_medico.dart';
import 'package:MedAgenda/cadastrar/register_paciente.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  int type;
  SignupPage(this.type);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController _controllerNome = TextEditingController();
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerSenha = TextEditingController();
  TextEditingController _controllerRepetirSenha = TextEditingController();
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
                    "Dados de acesso",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Crie sua conta, simples e gratuito ",
                    style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                  ),
                  Image.asset(
                    "assets/login.png",
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
                      controller: _controllerSenha,
                      decoration: new InputDecoration(hintText: 'Senha'),
                      validator: _validarSenha,
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _controllerRepetirSenha,
                      decoration:
                          new InputDecoration(hintText: 'Repetir Senha'),
                      validator: _validarRepetirSenha,
                    ),
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
                    "Próximo",
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
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "Informe o Email";
    } else if (!regExp.hasMatch(value)) {
      return "Email inválido";
    } else {
      return null;
    }
  }

  String _validarSenha(String value) {
    if (value.length == 0) {
      return "Informe a senha";
    } else if (value.length < 6) {
      return "A senha deve ter 6 dígitos";
    }
    return null;
  }

  String _validarRepetirSenha(String value) {
    if (value.length == 0) {
      return "Informe a senha novamente";
    } else if (value.length < 6) {
      return "A senha deve ser igual a anterior";
    }
    return null;
  }

  void _submit() {
    final form = formKey.currentState;

    if (formKey.currentState.validate()) {
      // Sem erros na validação
      form.save();

      if (widget.type == 1) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => RegisterMedicoPage()));
      } else {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => RegisterPacientePage()));
      }
    } else {
      // erro de validação
      setState(() {
        _validate = true;
      });
    }
  }
}
