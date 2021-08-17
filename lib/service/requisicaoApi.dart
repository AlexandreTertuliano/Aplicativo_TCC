import 'dart:convert';

import 'package:MedAgenda/models/usuario_model.dart';
import 'package:http/http.dart' as http;


Future<List<Usuario>> fetchInventory() async {
  final response = await http
      .get(Uri.parse('http://192.168.1.69:8080/usuarios'));
  if (response.statusCode == 200) {
    return decodeInventory(response.body);
  } else {
    throw Exception('Unable to fetch data from the REST API');
  }
}

List<Usuario> decodeInventory(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Usuario>((json) => Usuario.fromJson(json)).toList();
}