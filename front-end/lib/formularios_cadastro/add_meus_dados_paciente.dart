import 'package:MedAgenda/services/login/services_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DadosPessoais extends StatefulWidget {
  String email, senha;
  DadosPessoais(this.email, this.senha);

  @override
  _DadosPessoaisState createState() => _DadosPessoaisState();
}

class _DadosPessoaisState extends State<DadosPessoais> {
  String _value_Nome;

  String _value_Cpf;

  String _value_Data_Aniversario;

  String _value_Telefone;

  String _value_Cidade;

  String _value_Tipo_Sangue;

  String _value_Genero;

  String _value_Doador;

  String _value_Idade;

  String _value_peso;

  String _value_altura;

  String _value_estado;

  String _value_bairro;

  String _value_rua;

  String _value_numero;

  /*--------------------------------------------------------------------------------------------------*/

  String nome;

  String cpf;

  String data_Aniversario;

  String telefone;

  String cidade;

  String tipo_Sangue;

  String genero;

  String doador;

  String idade;

  String peso;

  String altura;

  String estado;

  String bairro;

  String rua;

  String numero;

  @override
  void initState() {
    super.initState();
    pegaNomeMedico();
  }

  Future<void> pegaNomeMedico() async {
    final jsonPaciente =
        await ServicesLogin.getLoginPaciente(widget.email, widget.senha);

    setState(() {
      return {
        nome = jsonPaciente.paciente.namePaciente,
        cpf = jsonPaciente.paciente.namePaciente,
        data_Aniversario = jsonPaciente.paciente.dnPaciente,
        telefone = jsonPaciente.paciente.telefonePaciente,
        cidade = jsonPaciente.paciente.cidadePaciente,
        tipo_Sangue = jsonPaciente.paciente.tipoSanguePaciente,
        genero = jsonPaciente.paciente.generoPaciente,
        doador = jsonPaciente.paciente.doadorPaciente,
        peso = jsonPaciente.paciente.pesoPaciente,
        altura = jsonPaciente.paciente.alturaPaciente,
        bairro = jsonPaciente.paciente.bairroPaciente,
        rua = jsonPaciente.paciente.ruaPaciente,
      };
    });
  }

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
                      Text("Nome : ",
                          style: TextStyle(
                              fontFamily: "Poppins-Medium",
                              fontSize: ScreenUtil.getInstance().setSp(26))),
                      TextField(
                        decoration: InputDecoration(
                            hintText: nome,
                            hintStyle: TextStyle(
                                color: Colors.orange[700], fontSize: 15.0)),
                        onChanged: (String value) {
                          setState(() {
                            _value_Nome = value;
                          });
                        },
                      ),
                      SizedBox(
                        height: ScreenUtil.getInstance().setHeight(20),
                      ),
                      Text("CPF ",
                          style: TextStyle(
                              fontFamily: "Poppins-Medium",
                              fontSize: ScreenUtil.getInstance().setSp(26))),
                      TextField(
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp('[1-9]')),
                          ],
                          decoration: InputDecoration(
                              hintText: cpf,
                              hintStyle: TextStyle(
                                  color: Colors.orange[700], fontSize: 15.0)),
                          onChanged: (String value) {
                            setState(() {
                              _value_Cpf = value;
                            });
                          }),
                      SizedBox(
                        height: ScreenUtil.getInstance().setHeight(20),
                      ),
                      Text("Data de Nascimento ",
                          style: TextStyle(
                              fontFamily: "Poppins-Medium",
                              fontSize: ScreenUtil.getInstance().setSp(26))),
                      TextField(
                          decoration: InputDecoration(
                              hintText: data_Aniversario,
                              hintStyle: TextStyle(
                                  color: Colors.orange[700], fontSize: 15.0)),
                          onChanged: (String value) {
                            setState(() {
                              _value_Data_Aniversario = value;
                            });
                          }),
                      SizedBox(
                        height: ScreenUtil.getInstance().setHeight(20),
                      ),
                      Text("Idade ",
                          style: TextStyle(
                              fontFamily: "Poppins-Medium",
                              fontSize: ScreenUtil.getInstance().setSp(26))),
                      TextField(
                          decoration: InputDecoration(
                              hintText: "Ex :  00",
                              hintStyle: TextStyle(
                                  color: Colors.orange[700], fontSize: 15.0)),
                          onChanged: (String value) {
                            setState(() {
                              _value_Idade = value;
                            });
                          }),
                      Text("Telefone ",
                          style: TextStyle(
                              fontFamily: "Poppins-Medium",
                              fontSize: ScreenUtil.getInstance().setSp(26))),
                      TextField(
                          decoration: InputDecoration(
                              hintText: telefone,
                              hintStyle: TextStyle(
                                  color: Colors.orange[700], fontSize: 15.0)),
                          onChanged: (String value) {
                            setState(() {
                              _value_Telefone = value;
                            });
                          }),
                      Text("Genero ",
                          style: TextStyle(
                              fontFamily: "Poppins-Medium",
                              fontSize: ScreenUtil.getInstance().setSp(26))),
                      TextField(
                          decoration: InputDecoration(
                              hintText: genero,
                              hintStyle: TextStyle(
                                  color: Colors.orange[700], fontSize: 15.0)),
                          onChanged: (String value) {
                            setState(() {
                              _value_Tipo_Sangue = value;
                            });
                          }),
                      Text("Peso ",
                          style: TextStyle(
                              fontFamily: "Poppins-Medium",
                              fontSize: ScreenUtil.getInstance().setSp(26))),
                      TextField(
                          decoration: InputDecoration(
                              hintText: peso,
                              hintStyle: TextStyle(
                                  color: Colors.orange[700], fontSize: 15.0)),
                          onChanged: (String value) {
                            setState(() {
                              _value_peso = value;
                            });
                          }),
                      Text("Altura ",
                          style: TextStyle(
                              fontFamily: "Poppins-Medium",
                              fontSize: ScreenUtil.getInstance().setSp(26))),
                      TextField(
                          decoration: InputDecoration(
                              hintText: altura,
                              hintStyle: TextStyle(
                                  color: Colors.orange[700], fontSize: 15.0)),
                          onChanged: (String value) {
                            setState(() {
                              _value_altura = value;
                            });
                          }),
                      Text("Tipo Sanguineo ",
                          style: TextStyle(
                              fontFamily: "Poppins-Medium",
                              fontSize: ScreenUtil.getInstance().setSp(26))),
                      TextField(
                          decoration: InputDecoration(
                              hintText: tipo_Sangue,
                              hintStyle: TextStyle(
                                  color: Colors.orange[700], fontSize: 15.0)),
                          onChanged: (String value) {
                            setState(() {
                              _value_Tipo_Sangue = value;
                            });
                          }),
                      Image.asset(
                        "assets/terms.png",
                      ),
                      Text("Endereço ",
                          style: TextStyle(
                              fontSize: ScreenUtil.getInstance().setSp(40),
                              fontFamily: "Poppins-Bold",
                              letterSpacing: .6)),
                      SizedBox(
                        height: ScreenUtil.getInstance().setHeight(40),
                      ),
                      Text("CEP ",
                          style: TextStyle(
                              fontFamily: "Poppins-Medium",
                              fontSize: ScreenUtil.getInstance().setSp(26))),
                      TextField(
                          decoration: InputDecoration(
                              hintText: "Ex : 00000-000",
                              hintStyle: TextStyle(
                                  color: Colors.orange[700], fontSize: 15.0)),
                          onChanged: (String value) {
                            setState(() {
                              _value_Cidade = value;
                            });
                          }),
                      Text("Cidade ",
                          style: TextStyle(
                              fontFamily: "Poppins-Medium",
                              fontSize: ScreenUtil.getInstance().setSp(26))),
                      TextField(
                          decoration: InputDecoration(
                              hintText: cidade,
                              hintStyle: TextStyle(
                                  color: Colors.orange[700], fontSize: 15.0)),
                          onChanged: (String value) {
                            setState(() {
                              _value_Cidade = value;
                            });
                          }),
                      Text("Estado ",
                          style: TextStyle(
                              fontFamily: "Poppins-Medium",
                              fontSize: ScreenUtil.getInstance().setSp(26))),
                      TextField(
                          decoration: InputDecoration(
                              hintText: estado,
                              hintStyle: TextStyle(
                                  color: Colors.orange[700], fontSize: 15.0)),
                          onChanged: (String value) {
                            setState(() {
                              _value_estado = value;
                            });
                          }),
                      Text("Bairro ",
                          style: TextStyle(
                              fontFamily: "Poppins-Medium",
                              fontSize: ScreenUtil.getInstance().setSp(26))),
                      TextField(
                          decoration: InputDecoration(
                              hintText: bairro,
                              hintStyle: TextStyle(
                                  color: Colors.orange[700], fontSize: 15.0)),
                          onChanged: (String value) {
                            setState(() {
                              _value_bairro = value;
                            });
                          }),
                      Text("Rua ",
                          style: TextStyle(
                              fontFamily: "Poppins-Medium",
                              fontSize: ScreenUtil.getInstance().setSp(26))),
                      TextField(
                          decoration: InputDecoration(
                              hintText: rua,
                              hintStyle: TextStyle(
                                  color: Colors.orange[700], fontSize: 15.0)),
                          onChanged: (String value) {
                            setState(() {
                              _value_rua = value;
                            });
                          }),
                      Text("N° ",
                          style: TextStyle(
                              fontFamily: "Poppins-Medium",
                              fontSize: ScreenUtil.getInstance().setSp(26))),
                      TextField(
                          decoration: InputDecoration(
                              hintText: numero,
                              hintStyle: TextStyle(
                                  color: Colors.orange[700], fontSize: 15.0)),
                          onChanged: (String value) {
                            setState(() {
                              _value_numero = value;
                            });
                          }),
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
                              onPressed: () {},
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
