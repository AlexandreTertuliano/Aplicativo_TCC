import 'dart:convert';

import 'class_login_medico.dart';
import 'class_login_paciente.dart';
import 'package:http/http.dart' as http;

class ServicesLogin {
  static Future<LoginPaciente> getLoginPaciente(
      String email, String senha) async {
    final response = await http.get(Uri.parse(
        "https://api-marquemed.herokuapp.com/login/paciente?email=$email&senha=$senha"));
    var json = jsonDecode(response.body);

    return LoginPaciente.fromJson(json);
  }

  static Future<LoginMedico> getLoginMedico(String email, String senha) async {
    final response = await http.get(Uri.parse(
        "https://api-marquemed.herokuapp.com/login/medico?email=$email&senha=$senha"));
    var json = jsonDecode(response.body);

    return LoginMedico.fromJson(json);
  }
}
