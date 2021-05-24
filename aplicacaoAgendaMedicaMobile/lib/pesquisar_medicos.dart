import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

var a = 0;
class Pesquisa_medico extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Pesquisar Médicos"),
        ),
        backgroundColor: Colors.white,
        body: Container(
            padding: EdgeInsets.all(20),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: ScreenUtil.getInstance().setHeight(40),
                  ),
                  Text("Olá, como podemos ajudar ?",
                      style: TextStyle(
                          fontSize: ScreenUtil.getInstance().setSp(35),
                          fontFamily: "Poppins-Bold",
                          letterSpacing: .6)),
                  SizedBox(
                    height: ScreenUtil.getInstance().setHeight(40),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                          onPressed: () {
                            //Pesquisar os medicos
                          },
                          icon: Icon(Icons.search),
                          color: Colors.black),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.cyan.shade100, width: 1.5),
                          borderRadius: BorderRadius.circular(50)),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 1.5),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  SizedBox(
                    height: ScreenUtil.getInstance().setHeight(50),
                  ),
                ])));
  }
}
