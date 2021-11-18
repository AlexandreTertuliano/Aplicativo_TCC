import 'package:MedAgenda/ResetPassword/reset_password.dart';
import 'package:MedAgenda/Splash/Splash.dart';
import 'package:MedAgenda/cadastrar/cadastrar_page.dart';
import 'package:MedAgenda/menuMedico/menu_page_medico.dart';
import 'package:MedAgenda/services/login/services_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:ui';
import 'menuPaciente/menu_page_paciente.dart';

void main() => runApp(MaterialApp(
      home: Splash(),
      debugShowCheckedModeBanner: false,
    ));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isSelected = false;

  void _radio() {
    setState(() {
      _isSelected = !_isSelected;
    });
  }

  TextEditingController _controllerSenhaPaciente = TextEditingController();

  TextEditingController _controllerEmailPaciente = TextEditingController();
  TextEditingController _controllerSenhaMedico = TextEditingController();

  TextEditingController _controllerEmailMedico = TextEditingController();

  Widget radioButton(bool isSelected) => Container(
        width: 16.0,
        height: 16.0,
        padding: EdgeInsets.all(2.0),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 2.0, color: Colors.black)),
        child: isSelected
            ? Container(
                width: double.infinity,
                height: double.infinity,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.black),
              )
            : Container(),
      );

  Widget horizontalLine() => Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Container(
          width: ScreenUtil.getInstance().setWidth(120),
          height: 1.0,
          color: Colors.black26.withOpacity(.2),
        ),
      );

  var _tela = 0;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1334, allowFontScaling: true);
    return new Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: Image.asset("assets/image_01.png"),
              ),
              Expanded(
                child: Container(),
              ),
              Expanded(child: Image.asset("assets/image_02.png"))
            ],
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(left: 28.0, right: 28.0, top: 50.0),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Image.asset(
                        "assets/logo2.png",
                        width: ScreenUtil.getInstance().setWidth(130),
                        height: ScreenUtil.getInstance().setHeight(130),
                      ),
                      Text("MarqueMed",
                          style: TextStyle(
                              fontFamily: "Poppins-Bold",
                              fontSize: ScreenUtil.getInstance().setSp(46),
                              letterSpacing: .6,
                              fontWeight: FontWeight.bold))
                    ],
                  ),
                  SizedBox(
                    height: ScreenUtil.getInstance().setHeight(180),
                  ),
                  Container(
                    height: 300,
                    child: SingleChildScrollView(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: ScreenUtil.getInstance().setHeight(495),
                        decoration: new BoxDecoration(
                          gradient: new LinearGradient(
                              colors: [
                                Colors.transparent,
                                Colors.transparent,
                              ],
                              begin: const FractionalOffset(0.0, 0.0),
                              end: const FractionalOffset(1.0, 1.0),
                              stops: [0.0, 1.0],
                              tileMode: TileMode.clamp),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Expanded(
                              flex: 2,
                              child: PageView(
                                scrollDirection: Axis.horizontal,
                                onPageChanged: (i) {
                                  if (i == 0) {
                                    setState(() {
                                      _tela = 0;
                                    });
                                  } else {
                                    setState(() {
                                      _tela = 1;
                                    });
                                  }
                                },
                                children: <Widget>[
                                  new Container(
                                    constraints: const BoxConstraints.expand(),
                                    child: Container(
                                      //height: ScreenUtil.getInstance().setHeight(300),
                                      padding: EdgeInsets.only(bottom: 1),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.black12,
                                                offset: Offset(0.0, 15.0),
                                                blurRadius: 15.0),
                                            BoxShadow(
                                                color: Colors.black12,
                                                offset: Offset(0.0, -10.0),
                                                blurRadius: 10.0),
                                          ]),
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            left: 16.0, right: 16.0, top: 5.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text("Paciente ",
                                                style: TextStyle(
                                                    fontSize:
                                                        ScreenUtil.getInstance()
                                                            .setSp(45),
                                                    fontFamily: "Poppins-Bold",
                                                    letterSpacing: .6)),
                                            SizedBox(
                                              height: ScreenUtil.getInstance()
                                                  .setHeight(20),
                                            ),
                                            Text("E-mail",
                                                style: TextStyle(
                                                    fontFamily:
                                                        "Poppins-Medium",
                                                    fontSize:
                                                        ScreenUtil.getInstance()
                                                            .setSp(26))),
                                            TextField(
                                              controller:
                                                  _controllerEmailPaciente,
                                              decoration: InputDecoration(
                                                  hintText: "email",
                                                  hintStyle: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 12.0)),
                                            ),
                                            SizedBox(
                                              height: ScreenUtil.getInstance()
                                                  .setHeight(20),
                                            ),
                                            Text("Senha",
                                                style: TextStyle(
                                                    fontFamily:
                                                        "Poppins-Medium",
                                                    fontSize:
                                                        ScreenUtil.getInstance()
                                                            .setSp(26))),
                                            TextField(
                                                controller:
                                                    _controllerSenhaPaciente,
                                                decoration: InputDecoration(
                                                    hintText: "senha",
                                                    hintStyle: TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 12.0))),
                                            SizedBox(
                                              height: ScreenUtil.getInstance()
                                                  .setHeight(30),
                                            ),
                                            Container(
                                              height: 40,
                                              alignment: Alignment.centerRight,
                                              // ignore: deprecated_member_use
                                              child: FlatButton(
                                                child: Text(
                                                  "Recuperar Senha",
                                                  textAlign: TextAlign.right,
                                                ),
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          ResetPassword(),
                                                    ),
                                                  );
                                                },
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    padding: EdgeInsets.all(10),
                                  ),
                                  new Container(
                                    constraints: const BoxConstraints.expand(),
                                    child: Container(
                                      width: double.infinity,
//      height: ScreenUtil.getInstance().setHeight(500),
                                      padding: EdgeInsets.only(bottom: 1),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.black12,
                                                offset: Offset(0.0, 15.0),
                                                blurRadius: 15.0),
                                            BoxShadow(
                                                color: Colors.black12,
                                                offset: Offset(0.0, -10.0),
                                                blurRadius: 10.0),
                                          ]),
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            left: 16.0, right: 16.0, top: 5.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text("Médico ",
                                                style: TextStyle(
                                                    fontSize:
                                                        ScreenUtil.getInstance()
                                                            .setSp(45),
                                                    fontFamily: "Poppins-Bold",
                                                    letterSpacing: .6)),
                                            SizedBox(
                                              height: ScreenUtil.getInstance()
                                                  .setHeight(20),
                                            ),
                                            Text("E-mail",
                                                style: TextStyle(
                                                    fontFamily:
                                                        "Poppins-Medium",
                                                    fontSize:
                                                        ScreenUtil.getInstance()
                                                            .setSp(26))),
                                            TextField(
                                              controller:
                                                  _controllerEmailMedico,
                                              decoration: InputDecoration(
                                                  hintText: "email",
                                                  hintStyle: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 12.0)),
                                            ),
                                            SizedBox(
                                              height: ScreenUtil.getInstance()
                                                  .setHeight(20),
                                            ),
                                            Text("Senha",
                                                style: TextStyle(
                                                    fontFamily:
                                                        "Poppins-Medium",
                                                    fontSize:
                                                        ScreenUtil.getInstance()
                                                            .setSp(26))),
                                            TextField(
                                              controller:
                                                  _controllerSenhaMedico,
                                              decoration: InputDecoration(
                                                  hintText: "senha",
                                                  hintStyle: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 12.0)),
                                            ),
                                            SizedBox(
                                              height: ScreenUtil.getInstance()
                                                  .setHeight(30),
                                            ),
                                            Container(
                                              height: 40,
                                              alignment: Alignment.centerRight,
                                              // ignore: deprecated_member_use
                                              child: FlatButton(
                                                child: Text(
                                                  "Recuperar Senha",
                                                  textAlign: TextAlign.right,
                                                ),
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          ResetPassword(),
                                                    ),
                                                  );
                                                },
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    padding: EdgeInsets.all(10),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: ScreenUtil.getInstance().setHeight(40)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: 12.0,
                          ),
                          GestureDetector(
                            onTap: _radio,
                            child: radioButton(_isSelected),
                          ),
                          SizedBox(
                            width: 8.0,
                          ),
                          Text("Lembrar Senha",
                              style: TextStyle(
                                  fontSize: 12, fontFamily: "Poppins-Medium"))
                        ],
                      ),
                      InkWell(
                        child: Container(
                          width: ScreenUtil.getInstance().setWidth(330),
                          height: ScreenUtil.getInstance().setHeight(100),
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
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () async {
                                if (_tela == 0) {
                                  final json =
                                      await ServicesLogin.getLoginPaciente(
                                          _controllerEmailPaciente.text,
                                          _controllerSenhaPaciente.text);
                                  if (json.verifica == true) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => MenuPagePaciente(
                                            _controllerEmailPaciente.text,
                                            _controllerSenhaPaciente.text),
                                      ),
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content: const Text(
                                                'Erro ao realizar login, verifique os dados!')));
                                  }
                                }

                                if (_tela == 1) {
                                  final json =
                                      await ServicesLogin.getLoginMedico(
                                          _controllerEmailMedico.text,
                                          _controllerSenhaMedico.text);

                                  if (json.verifica == true) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => MenuPageMedico(
                                            _controllerEmailMedico.text,
                                            _controllerSenhaMedico.text),
                                      ),
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content: const Text(
                                                'Erro ao realizar login, verifique os dados!')));
                                  }
                                }
                              },
                              child: Center(
                                child: Text("ENTRAR",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "Poppins-Bold",
                                        fontSize: 18,
                                        letterSpacing: 1.0)),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: ScreenUtil.getInstance().setHeight(40),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      horizontalLine(),
                      Text("Entrar com :",
                          style: TextStyle(
                              fontSize: 16.0, fontFamily: "Poppins-Medium")),
                      horizontalLine()
                    ],
                  ),
                  SizedBox(
                    height: ScreenUtil.getInstance().setHeight(40),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      IconButton(
                        icon: Image.asset('assets/facebook.png'),
                        iconSize: 40,
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Image.asset('assets/google.png'),
                        iconSize: 35,
                        onPressed: () {},
                      ),
                    ],
                  ),
                  SizedBox(
                    height: ScreenUtil.getInstance().setHeight(30),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Novo Usuário ? ",
                        style: TextStyle(fontFamily: "Poppins-Medium"),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CadastrarPage(),
                            ),
                          );
                        },
                        child: Text("Cadastrar",
                            style: TextStyle(
                                color: Color(0xFF5d74e3),
                                fontFamily: "Poppins-Bold")),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
