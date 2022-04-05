import 'package:MedAgenda/classes/medico_class.dart';
import 'package:http/http.dart' as http;

class ServicesMedico {
  static Future<List<Medico>> getMedico() async {
    final response =
        await http.get(Uri.parse("https://marquemed-api.herokuapp.com/medico"));
    if (response.statusCode == 200) {
      return postFromJson(response.body);
    } else {
      return null;
    }
  }

  static Future<List<Medico>> getPegaMedico(int id) async {
    final response =
        await http.get(Uri.parse("https://marquemed-api.herokuapp.com/$id"));
    if (response.statusCode == 200) {
      return postFromJson(response.body);
    } else {
      return null;
    }
  }

  static Future<bool> createMedico(Medico data) async {
    final response = await http.post(
      Uri.parse("https://marquemed-api.herokuapp.com/medico"),
      headers: {"content-type": "application/json"},
      body: postToJson(data),
    );
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> updateMedico(int id, Medico data) async {
    final response = await http.put(
      Uri.parse("https://marquemed-api.herokuapp.com/medico/$id"),
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
      Uri.parse("https://marquemed-api.herokuapp.com/medico/$id"),
      headers: {"content-type": "application/json"},
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
