import 'package:MedAgenda/classes/medico_class.dart';
import 'package:http/http.dart' as http;

class ServicesMedico {
  static Future<List<Doutor>> getMedico() async {
    final response =
        await http.get(Uri.parse("http://senai.cck.com.br/medico"));
    if (response.statusCode == 200) {
      return postFromJson(response.body);
    } else {
      return null;
    }
  }

  static Future<List<Doutor>> getPegaMedico(int id) async {
    final response =
        await http.get(Uri.parse("http://senai.cck.com.br/$id"));
    if (response.statusCode == 200) {
      return postFromJson(response.body);
    } else {
      return null;
    }
  }

  static Future<bool> createMedico(Doutor data) async {
    final response = await http.post(
      Uri.parse("http://senai.cck.com.br/medico"),
      headers: {"content-type": "application/json"},
      body: postToJson(data),
    );
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> updateMedico(int id, Doutor data) async {
    final response = await http.put(
      Uri.parse("http://senai.cck.com.br/medico/$id"),
      headers: {"content-type": "application/json"},
      body: postToJson(data),
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> deleteMedico(int id) async {
    final response = await http.delete(
      Uri.parse("http://senai.cck.com.br/medico/$id"),
      headers: {"content-type": "application/json"},
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
