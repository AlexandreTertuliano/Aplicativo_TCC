import 'dart:convert';

import 'class_login_medico.dart';
import 'class_login_paciente.dart';
import 'package:http/http.dart' as http;

class ServicesLogin {
  static Future<Map> getLoginPaciente(String email, String senha) async {
    final response = await http.get(Uri.parse(
        "http://api-marquemed.herokuapp.com/login/paciente?email=$email&senha=$senha"));
    var json = jsonDecode(response.body);
    return json;
  }

  static Future<LoginMedico> getLoginMedico(String email, String senha) async {
    final response = await http.get(Uri.parse(
        "http://api-marquemed.herokuapp.com/login/medico?email=$email&senha=$senha"));
    var json = jsonDecode(response.body);
    print(json);
    return LoginMedico.fromJson(json);
  }
}