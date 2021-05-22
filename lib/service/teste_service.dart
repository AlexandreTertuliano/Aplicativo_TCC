import 'dart:convert';

import 'package:MedAgenda/models/usuario_model.dart';
import 'package:http/http.dart' as http;

class TesteService {
  String baseUrl = "http://192.168.1.69:8080/usuarios";

  Future<Usuario> listUsuario() async {
    var url = Uri.https('$baseUrl', '/usuario');
    Usuario user = null;
    try {
      var response = await http.get(url);
      user = jsonDecode(response.statusCode.toString());
      return user;
    } catch (error) {}
    return user;
  }
}
