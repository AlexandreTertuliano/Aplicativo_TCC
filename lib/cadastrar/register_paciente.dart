import 'package:cupertino_date_textbox/cupertino_date_textbox.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RegisterPacientePage extends StatefulWidget {
  @override
  _RegisterPacientePageState createState() => _RegisterPacientePageState();
}

class _RegisterPacientePageState extends State<RegisterPacientePage> {
  TextEditingController _controllerNomeCompleto = TextEditingController();
  TextEditingController _controllerCpf = TextEditingController();
  TextEditingController _controllerAltura = TextEditingController();
  TextEditingController _controllerIdade = TextEditingController();
  TextEditingController _controllerSexo = TextEditingController();
  TextEditingController _controllerSangue = TextEditingController();
  TextEditingController _controllerProfissao = TextEditingController();
  TextEditingController _controllerPeso = TextEditingController();
  TextEditingController _controllerCEP = TextEditingController();
  TextEditingController _controllerEstado = TextEditingController();
  TextEditingController _controllerCidade = TextEditingController();
  TextEditingController _controllerBairro = TextEditingController();
  TextEditingController _controllerRua = TextEditingController();
  TextEditingController _controllerNumero = TextEditingController();
  final formKey = new GlobalKey<FormState>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  bool _validate = false;
  DateTime _selectedDateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final String formattedDate = DateFormat.yMd().format(_selectedDateTime);
    final selectedText = Text('You selected: $formattedDate');

    return Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
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
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            "Dados Pessoais",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Crie sua conta, simples, gratuito e com segurança! ",
                            style: TextStyle(
                                fontSize: 15, color: Colors.grey[700]),
                          )
                        ],
                      ),
                    ),
                    Form(
                      key: formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: _controllerNomeCompleto,
                            decoration: new InputDecoration(hintText: 'Nome'),
                            validator: _validar,
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: _controllerCpf,
                            decoration: new InputDecoration(hintText: 'CPF'),
                            validator: _validarCPF,
                          ),
                          const SizedBox(height: 10),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Data de nascimento",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black87),
                            ),
                          ),
                          CupertinoDateTextBox(
                              initialValue: _selectedDateTime,
                              onDateChange: onBirthdayChange,
                              hintText:
                                  DateFormat.yMd().format(_selectedDateTime)),
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: _controllerIdade,
                            decoration: new InputDecoration(hintText: 'Idade'),
                            validator: _validar,
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: _controllerSexo,
                            decoration: new InputDecoration(hintText: 'Sexo'),
                            validator: _validar,
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: _controllerAltura,
                            decoration: new InputDecoration(hintText: 'CRM'),
                            validator: _validar,
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: _controllerPeso,
                            decoration: new InputDecoration(
                                hintText: 'Especialidade 1'),
                            validator: _validar,
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: _controllerSangue,
                            decoration: new InputDecoration(
                                hintText: 'Especialidade 2'),
                            validator: _validar,
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: _controllerProfissao,
                            decoration: new InputDecoration(
                                hintText: 'Especialidade 3'),
                            validator: _validar,
                          ),
                          const SizedBox(height: 10),
                          Image.asset(
                            "assets/form.png",
                          ),
                          TextFormField(
                            controller: _controllerCEP,
                            decoration: new InputDecoration(hintText: 'CEP'),
                            validator: _validarCEP,
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: _controllerEstado,
                            decoration: new InputDecoration(hintText: 'Estado'),
                            validator: _validar,
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: _controllerCidade,
                            decoration: new InputDecoration(hintText: 'Cidade'),
                            validator: _validar,
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: _controllerBairro,
                            decoration: new InputDecoration(hintText: 'Bairro'),
                            validator: _validar,
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: _controllerRua,
                            decoration: new InputDecoration(hintText: 'Rua'),
                            validator: _validar,
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: _controllerNumero,
                            decoration: new InputDecoration(hintText: 'N°'),
                            validator: _validar,
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: MaterialButton(
              minWidth: double.infinity,
              height: 60,
              onPressed: _submit,
              color: Colors.lightBlue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              child: Text(
                "Salvar",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }

  String _validar(String value) {
    if (value.length == 0) {
      return "Preencha o campo";
    }
    return null;
  }

  String _validarCPF(String value) {
    if (value.length == 0) {
      return "Informe o CPF";
    } else if (value.length < 11) {
      return "O CPF deve ter 11 dígitos";
    }
    return null;
  }

  String _validarCRM(String value) {
    if (value.length == 0) {
      return "Informe o CRM";
    } else if (value.length < 5) {
      return "O CRM deve ter 5 dígitos";
    }
    return null;
  }

  String _validarCEP(String value) {
    if (value.length == 0) {
      return "Informe o CEP";
    } else if (value.length < 9) {
      return "O CEP deve ter 9 dígitos";
    }
    return null;
  }

  void onBirthdayChange(DateTime birthday) {
    setState(() {
      _selectedDateTime = birthday;
    });
  }

  void _submit() {
    final form = formKey.currentState;

    if (formKey.currentState.validate()) {
      // Sem erros na validação
      form.save();
    } else {
      // erro de validação
      setState(() {
        _validate = true;
      });
    }
  }
}
