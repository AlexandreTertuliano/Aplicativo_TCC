import 'dart:convert';

import 'package:MedAgenda/classes/medico_class.dart';
import 'package:MedAgenda/main.dart';
import 'package:MedAgenda/services/crm/class_crm.dart' as FCrm;
import 'package:MedAgenda/services/crm/crm_services.dart';
import 'package:cupertino_date_textbox/cupertino_date_textbox.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:http/http.dart' as http;
import 'package:search_cep/search_cep.dart';

class RegisterMedicoPage extends StatefulWidget {
  Medico medico;
  final String email, senha;
  RegisterMedicoPage({
    this.email,
    this.senha,
  });

  @override
  _RegisterMedicoPageState createState() => _RegisterMedicoPageState();
}

class _RegisterMedicoPageState extends State<RegisterMedicoPage> {
  final viaCepSearchCep = ViaCepSearchCep();
  TextEditingController _controllerNomeCompleto = TextEditingController();
  TextEditingController _controllerCpf = TextEditingController();
  TextEditingController _controllerIdade = TextEditingController();
  TextEditingController _controllerSexo = TextEditingController();
  TextEditingController _controllerCRM = TextEditingController();
  TextEditingController _controllerEsp1 = TextEditingController();
  TextEditingController _controllerEsp2 = TextEditingController();
  TextEditingController _controllerEsp3 = TextEditingController();
  TextEditingController _controllerAnoFormacao = TextEditingController();
  TextEditingController _controllerCidadeFormacao = TextEditingController();
  TextEditingController _controllerFaculdade = TextEditingController();
  TextEditingController _controllerCEP = TextEditingController();
  TextEditingController _controllerEstado = TextEditingController();
  TextEditingController _controllerCidade = TextEditingController();
  TextEditingController _controllerBairro = TextEditingController();
  TextEditingController _controllerRua = TextEditingController();
  TextEditingController _controllerNumero = TextEditingController();
  TextEditingController _controllerTelefone = TextEditingController();
  TextEditingController _controllerValorConsulta = TextEditingController();
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
                            controller: _controllerCRM,
                            decoration: new InputDecoration(hintText: 'CRM'),
                            validator: _validarCRM,
                          ),
                          const SizedBox(height: 10),
                          IconButton(
                            icon: const Icon(Icons.search),
                            color: Colors.black,
                            onPressed: () async {
                              await pegaCrm(_controllerCRM.text);
                            },
                          ),
                          const SizedBox(height: 10),
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
                            controller: _controllerTelefone,
                            decoration:
                                new InputDecoration(hintText: 'Telefone'),
                            validator: _validar,
                          ),
                          const SizedBox(height: 10),
                          Image.asset(
                            "assets/medicalForm.png",
                          ),
                          TextFormField(
                            controller: _controllerValorConsulta,
                            decoration: new InputDecoration(
                                hintText: 'Valor da consulta'),
                            validator: _validar,
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: _controllerEsp1,
                            decoration: new InputDecoration(
                                hintText: 'Especialidade 1'),
                            validator: _validar,
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: _controllerEsp2,
                            decoration: new InputDecoration(
                                hintText: 'Especialidade 2'),
                            validator: _validar,
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: _controllerEsp3,
                            decoration: new InputDecoration(
                                hintText: 'Especialidade 3'),
                            validator: _validar,
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: _controllerAnoFormacao,
                            decoration: new InputDecoration(
                                hintText: 'Ano de Formação'),
                            validator: _validar,
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: _controllerCidadeFormacao,
                            decoration: new InputDecoration(
                                hintText: 'Cidade de Formação'),
                            validator: _validar,
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: _controllerFaculdade,
                            decoration: new InputDecoration(
                                hintText: 'Faculdade de formação'),
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
                          IconButton(
                            icon: const Icon(Icons.search),
                            color: Colors.black,
                            onPressed: () async {
                              final infoCepJSON = await viaCepSearchCep
                                  .searchInfoByCep(cep: _controllerCEP.text);
                              print(infoCepJSON.fold(
                                  (_) => null, (data) => data));
                              setState(() {
                                _controllerBairro.text = infoCepJSON.fold(
                                    (_) => null, (data) => data.bairro);
                                _controllerRua.text = infoCepJSON.fold(
                                    (_) => null, (data) => data.logradouro);
                                _controllerCidade.text = infoCepJSON.fold(
                                    (_) => null, (data) => data.localidade);
                                _controllerEstado.text = infoCepJSON.fold(
                                    (_) => null, (data) => data.uf);
                              });
                            },
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
    } else if (value.length < 8 || value.length > 8) {
      return "O CEP deve ter 8 dígitos";
    }
    return null;
  }

  void onBirthdayChange(DateTime birthday) {
    setState(() {
      _selectedDateTime = birthday;
    });
  }

  Future<void> _submit() async {
    final form = formKey.currentState;

    if (formKey.currentState.validate()) {
      // Sem erros na validação
      form.save();
      await saveInfoMedico();
    } else {
      // erro de validação
      setState(() {
        _validate = true;
      });
    }
  }

  Future<void> saveInfoMedico() async {
    Medico medico = Medico(
        nameMedico: _controllerNomeCompleto.text,
        cpfMedico: _controllerCpf.text,
        //dnMedico: _selectedDateTime,
        telefoneMedico: _controllerTelefone.text,
        cepMedico: _controllerCEP.text,
        cidadeMedico: _controllerCidade.text,
        bairroMedico: _controllerBairro.text,
        ruaMedico: _controllerRua.text,
        numeroMedico: _controllerNumero.text,
        idadeMedico: _controllerIdade.text,
        especializacao1Medico: _controllerEsp1.text,
        especializacao2Medico: _controllerEsp2.text,
        especializacao3Medico: _controllerEsp3.text,
        generoMedico: _controllerSexo.text,
        emailMedico: widget.email,
        anoFormacaoMedico: _controllerAnoFormacao.text,
        cidadeFormacaoMedico: _controllerCidadeFormacao.text,
        universidadeFormacaoMedico: _controllerFaculdade.text,
        crmMedico: _controllerCRM.text,
        valorConsulta: double.parse(_controllerValorConsulta.text),
        senhaMedico: widget.senha);
    if (widget.medico == null) {
      createMedico(medico).then((isSuccess) async {
        if (isSuccess) {
          await _showMyDialog();

          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: const Text('Médico adicionado com sucesso !')));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: const Text('Erro ao adicionar médico !')));
        }
      });
    } else {
      return ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: const Text('Erro no Médico !')));
    }
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Conta criada com sucesso!'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Bem vindo Drº ao MarqueMed!'),
                Text(
                    'Enviamos um email a você com o código de validação de conta!'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Inicio'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyApp(),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }

  static Future<bool> createMedico(Medico data) async {
    final response = await http.post(
      Uri.parse("https://api-marquemed.herokuapp.com/medico"),
      headers: {"content-type": "application/json"},
      body: postToJson(data),
    );
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> pegaCrm(String crm) async {
    final jsonCrm = await CrmServices.getCrm(crm);

    if (jsonCrm.item.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: const Text('Falha ao localizar CRM !')));
    } else {
      setState(() {
        _controllerNomeCompleto.text = jsonCrm.item[0].nome;
        _controllerEsp1.text = jsonCrm.item[0].profissao;
        _controllerEsp2.text = jsonCrm.item[0].profissao;
        _controllerEsp3.text = jsonCrm.item[0].profissao;
      });
    }
  }
}
