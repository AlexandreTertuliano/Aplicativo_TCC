import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DadosMedico extends StatefulWidget {
  DadosMedico({Key key}) : super(key: key);

  @override
  _DadosMedicoState createState() => _DadosMedicoState();
}

class _DadosMedicoState extends State<DadosMedico> {
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
                Text("Dados Pessoais : ",
                    style: TextStyle(
                        fontSize: ScreenUtil.getInstance().setSp(30),
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
                      hintText: "Nome Completo",
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0)),
                  onChanged: (String value) {
                    setState(() {
                      //_value_Nome = value;
                    });
                  },
                ),
                SizedBox(
                  height: ScreenUtil.getInstance().setHeight(20),
                ),
                Text("CRM : ",
                    style: TextStyle(
                        fontFamily: "Poppins-Medium",
                        fontSize: ScreenUtil.getInstance().setSp(26))),
                TextField(
                  decoration: InputDecoration(
                      hintText: "CRM",
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0)),
                  onChanged: (String value) {
                    setState(() {
                      //_value_Nome = value;
                    });
                  },
                ),
                SizedBox(
                  height: ScreenUtil.getInstance().setHeight(20),
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
                      hintText: "Especialidade",
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0)),
                  onChanged: (String value) {
                    setState(() {
                      //_value_Nome = value;
                    });
                  },
                ),
                SizedBox(
                  height: ScreenUtil.getInstance().setHeight(20),
                ),
                Text("Telefone",
                    style: TextStyle(
                        fontFamily: "Poppins-Medium",
                        fontSize: ScreenUtil.getInstance().setSp(26))),
                TextField(
                  decoration: InputDecoration(
                      hintText: "Ex : 00 1234-5678",
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0)),
                  onChanged: (String value) {
                    setState(() {
                      //_value_Nome = value;
                    });
                  },
                ),
                SizedBox(
                  height: ScreenUtil.getInstance().setHeight(30),
                ),
                Text("Dados bancários : ",
                    style: TextStyle(
                        fontSize: ScreenUtil.getInstance().setSp(30),
                        fontFamily: "Poppins-Bold",
                        letterSpacing: .6)),
                SizedBox(
                  height: ScreenUtil.getInstance().setHeight(30),
                ),
                Text("Banco ",
                    style: TextStyle(
                        fontFamily: "Poppins-Medium",
                        fontSize: ScreenUtil.getInstance().setSp(26))),
                TextField(
                  decoration: InputDecoration(
                      hintText: "Banco",
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0)),
                  onChanged: (String value) {
                    setState(() {
                      //_value_Nome = value;
                    });
                  },
                ),
                SizedBox(
                  height: ScreenUtil.getInstance().setHeight(20),
                ),
                Text("Numero da Conta ",
                    style: TextStyle(
                        fontFamily: "Poppins-Medium",
                        fontSize: ScreenUtil.getInstance().setSp(26))),
                TextField(
                  decoration: InputDecoration(
                      hintText: "Numero da Conta",
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0)),
                  onChanged: (String value) {
                    setState(() {
                      //_value_Nome = value;
                    });
                  },
                ),
                SizedBox(
                  height: ScreenUtil.getInstance().setHeight(20),
                ),
                Text("Tipo de conta",
                    style: TextStyle(
                        fontFamily: "Poppins-Medium",
                        fontSize: ScreenUtil.getInstance().setSp(26))),
                TextField(
                  decoration: InputDecoration(
                      hintText: "Tipo de conta",
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0)),
                  onChanged: (String value) {
                    setState(() {
                      //_value_Nome = value;
                    });
                  },
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
                      onPressed: () {},
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
