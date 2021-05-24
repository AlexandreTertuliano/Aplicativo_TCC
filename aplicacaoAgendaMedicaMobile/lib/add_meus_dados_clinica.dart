import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DadosClinica extends StatefulWidget {
  DadosClinica({Key key}) : super(key: key);

  @override
  _DadosClinicaState createState() => _DadosClinicaState();
}

class _DadosClinicaState extends State<DadosClinica> {
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
                Text("Informações Empresa : ",
                    style: TextStyle(
                        fontSize: ScreenUtil.getInstance().setSp(30),
                        fontFamily: "Poppins-Bold",
                        letterSpacing: .6)),
                SizedBox(
                  height: ScreenUtil.getInstance().setHeight(30),
                ),
                Text("Razão Social : ",
                    style: TextStyle(
                        fontFamily: "Poppins-Medium",
                        fontSize: ScreenUtil.getInstance().setSp(26))),
                TextField(
                  decoration: InputDecoration(
                      hintText: "razão social",
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
                Text("Nome Fantasia : ",
                    style: TextStyle(
                        fontFamily: "Poppins-Medium",
                        fontSize: ScreenUtil.getInstance().setSp(26))),
                TextField(
                  decoration: InputDecoration(
                      hintText: "nome fantasia",
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
                Text("CNPJ ",
                    style: TextStyle(
                        fontFamily: "Poppins-Medium",
                        fontSize: ScreenUtil.getInstance().setSp(26))),
                TextField(
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp('[1-9]')),
                  ],
                  decoration: InputDecoration(
                      hintText: "cnpj",
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
                Text("Endereço : ",
                    style: TextStyle(
                        fontSize: ScreenUtil.getInstance().setSp(30),
                        fontFamily: "Poppins-Bold",
                        letterSpacing: .6)),
                SizedBox(
                  height: ScreenUtil.getInstance().setHeight(30),
                ),
                Text("Rua ",
                    style: TextStyle(
                        fontFamily: "Poppins-Medium",
                        fontSize: ScreenUtil.getInstance().setSp(26))),
                TextField(
                  decoration: InputDecoration(
                      hintText: "Ex : av. vicente",
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
                Text("Numero",
                    style: TextStyle(
                        fontFamily: "Poppins-Medium",
                        fontSize: ScreenUtil.getInstance().setSp(26))),
                TextField(
                  decoration: InputDecoration(
                      hintText: "Ex : 123",
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
                Text("Complemento",
                    style: TextStyle(
                        fontFamily: "Poppins-Medium",
                        fontSize: ScreenUtil.getInstance().setSp(26))),
                TextField(
                  decoration: InputDecoration(
                      hintText: "Ex : em frente a praça",
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
