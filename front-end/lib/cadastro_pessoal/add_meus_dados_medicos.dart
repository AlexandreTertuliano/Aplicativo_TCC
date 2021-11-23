import 'package:MedAgenda/services/login/services_login.dart';
import 'package:MedAgenda/widgets/button_animation_medico.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DadosMedicos extends StatefulWidget {
  String email, senha;
  DadosMedicos(this.email, this.senha);

  @override
  _DadosMedicosState createState() => _DadosMedicosState();
}

class _DadosMedicosState extends State<DadosMedicos> {
  String _value_Nome;

  String _value_Cpf;

  String _value_Data_Aniversario;

  String _value_Telefone;

  String _value_Cidade;

  String _value_Tipo_Sangue;

  String _value_Genero;

  String _value_Doador;

  String _value_idade;

  String _value_crm;

  String _value_sexo;

  String _value_cep;

  String _value_estado;

  String _value_rua;

  String _value_bairro;

  String _value_numero;

  String _value_esp1;

  String _value_esp2;

  String _value_esp3;

  String _value_universidade;

  String _value_anograduacao;

  String _value_cidadegraduacao;

  /*---------------------------------------------------------------------------------------------------*/

  String nomeMedico;

  String cpf;

  String data_Aniversario;

  String telefone;

  String cidade;

  String tipo_Sangue;

  String genero;

  String doador;

  String idade;

  String crm;

  String sexo;

  String cep;

  String estado;

  String rua;

  String bairro;

  String numero;

  String esp1;

  String esp2;

  String esp3;

  String universidade;

  String anograduacao;

  String cidadegraduacao;
  @override
  void initState() {
    super.initState();
    pegaNomeMedico();
  }

  Future<void> pegaNomeMedico() async {
    final jsonMedico =
        await ServicesLogin.getLoginMedico(widget.email, widget.senha);

    setState(() {
      return {
        nomeMedico = jsonMedico.medico.nameMedico,
        cpf = jsonMedico.medico.cpfMedico,
        data_Aniversario = jsonMedico.medico.cpfMedico,
        telefone = jsonMedico.medico.telefoneMedico,
        cidade = jsonMedico.medico.cidadeMedico,
        genero = jsonMedico.medico.generoMedico,
        idade = jsonMedico.medico.idadeMedico,
        crm = jsonMedico.medico.crmMedico,
        cep = jsonMedico.medico.cepMedico,
        rua = jsonMedico.medico.ruaMedico,
        bairro = jsonMedico.medico.bairroMedico,
        numero = jsonMedico.medico.numeroMedico,
        esp1 = jsonMedico.medico.especializacao1Medico,
        esp2 = jsonMedico.medico.especializacao2Medico,
        esp3 = jsonMedico.medico.especializacao3Medico,
        universidade = jsonMedico.medico.universidadeFormacaoMedico,
        anograduacao = jsonMedico.medico.anoFormacaoMedico,
        cidadegraduacao = jsonMedico.medico.cidadeFormacaoMedico,
        estado = jsonMedico.medico.estadoMedico
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Informações Pessoais"),
        automaticallyImplyLeading: true,
        backgroundColor: Colors.lightBlue,
      ),
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
                      Text("Nome Completo : ",
                          style: TextStyle(
                              fontFamily: "Poppins-Medium",
                              fontSize: ScreenUtil.getInstance().setSp(26))),
                      TextField(
                        decoration: InputDecoration(
                            hintText: nomeMedico,
                            hintStyle: TextStyle(
                                color: Colors.orange[700], fontSize: 15.0)),
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
                            hintText: cpf,
                            hintStyle: TextStyle(
                                color: Colors.orange[700], fontSize: 15)),
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
                            hintText: data_Aniversario,
                            hintStyle: TextStyle(
                                color: Colors.orange[700], fontSize: 15)),
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
                            hintText: genero,
                            hintStyle: TextStyle(
                                color: Colors.orange[700], fontSize: 15)),
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
                            hintText: telefone,
                            hintStyle: TextStyle(
                                color: Colors.orange[700], fontSize: 15)),
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
                            hintText: idade,
                            hintStyle: TextStyle(
                                color: Colors.orange[700], fontSize: 15)),
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
                            hintText: cep,
                            hintStyle: TextStyle(
                                color: Colors.orange[700], fontSize: 15)),
                        onChanged: (String value) {
                          setState(() {
                            _value_cep = value;
                          });
                        },
                      ),
                      IconButton(
            icon: const Icon(Icons.search),
            color: Colors.white,
            onPressed: () {},
          ),
                      Text("Cidade",
                          style: TextStyle(
                              fontFamily: "Poppins-Medium",
                              fontSize: ScreenUtil.getInstance().setSp(26))),
                      TextField(
                        decoration: InputDecoration(
                            hintText: cidade,
                            hintStyle: TextStyle(
                                color: Colors.orange[700], fontSize: 15)),
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
                            hintText: estado,
                            hintStyle: TextStyle(
                                color: Colors.orange[700], fontSize: 15)),
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
                            hintText: rua,
                            hintStyle: TextStyle(
                                color: Colors.orange[700], fontSize: 15)),
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
                            hintText: bairro,
                            hintStyle: TextStyle(
                                color: Colors.orange[700], fontSize: 15)),
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
                            hintText: numero,
                            hintStyle: TextStyle(
                                color: Colors.orange[700], fontSize: 15)),
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
                            hintText: crm,
                            hintStyle: TextStyle(
                                color: Colors.orange[700], fontSize: 15)),
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
                            hintText: esp1,
                            hintStyle: TextStyle(
                                color: Colors.orange[700], fontSize: 15)),
                        onChanged: (String value) {
                          setState(() {
                            _value_esp1 = value;
                          });
                        },
                      ),
                      Text("Especialidade  ",
                          style: TextStyle(
                              fontFamily: "Poppins-Medium",
                              fontSize: ScreenUtil.getInstance().setSp(26))),
                      TextField(
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp('[1-9]')),
                        ],
                        decoration: InputDecoration(
                            hintText: esp2,
                            hintStyle: TextStyle(
                                color: Colors.orange[700], fontSize: 15)),
                        onChanged: (String value) {
                          setState(() {
                            _value_esp2 = value;
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
                            hintText: esp3,
                            hintStyle: TextStyle(
                                color: Colors.orange[700], fontSize: 15)),
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
                            hintText: universidade,
                            hintStyle: TextStyle(
                                color: Colors.orange[700], fontSize: 15)),
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
                            hintText: anograduacao,
                            hintStyle: TextStyle(
                                color: Colors.orange[700], fontSize: 15)),
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
                            hintText: cidadegraduacao,
                            hintStyle: TextStyle(
                                color: Colors.orange[700], fontSize: 15)),
                        onChanged: (String value) {
                          setState(() {
                            _value_cidadegraduacao = value;
                          });
                        },
                      ),
                      SizedBox(
                        height: ScreenUtil.getInstance().setHeight(30),
                      ),
                      Center(
                        child: ButtonAnimation(Color.fromRGBO(0, 191, 255, 1),
                            Color.fromRGBO(0, 191, 255, 1)),
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
