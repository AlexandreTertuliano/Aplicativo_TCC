import 'package:MedAgenda/classes/paciente_class.dart';
import 'package:http/http.dart' as http;

class ServicesPaciente {
  static Future<List<Paciente>> getPaciente() async {
    final response = await http
        .get(Uri.parse("http://senai.cck.com.br/paciente"));
    if (response.statusCode == 200) {
      return postFromJson(response.body);
    } else {
      return null;
    }
  }

  static Future<List<Paciente>> getPegaPaciente(int id) async {
    final response =
        await http.get(Uri.parse("http://senai.cck.com.br/$id"));
    if (response.statusCode == 200) {
      return postFromJson(response.body);
    } else {
      return null;
    }
  }

  static Future<bool> createPaciente(Paciente data) async {
    final response = await http.post(
      Uri.parse("http://senai.cck.com.br/paciente"),
      headers: {"content-type": "application/json"},
      body: postToJson(data),
    );
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> updatePaciente(int id, Paciente data) async {
    final response = await http.put(
      Uri.parse("http://senai.cck.com.br/paciente/$id"),
      headers: {"content-type": "application/json"},
      body: postToJson(data),
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> deletePaciente(int id) async {
    final response = await http.delete(
      Uri.parse("http://senai.cck.com.br/paciente/$id"),
      headers: {"content-type": "application/json"},
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
