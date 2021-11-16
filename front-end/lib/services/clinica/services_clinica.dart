import 'package:MedAgenda/classes/clinica_class.dart';
import 'package:http/http.dart' as http;

class ServicesClinica {
  static Future<List<Clinica>> getClinica() async {
    final response = await http.get(Uri.parse("http://api-marquemed.herokuapp.com/clinica"));
    if (response.statusCode == 200) {
      return postFromJson(response.body);
    } else {
      return null;
    }
  }

  

  static Future<List<Clinica>> getPegaClinica(int id) async {
    final response =
        await http.get(Uri.parse("https://api-marquemed.herokuapp.com/clinica/$id"));
    if (response.statusCode == 200) {
      return postFromJson(response.body);
    } else {
      return null;
    }
  }

  static Future<bool> createClinica(Clinica data) async {
    final response = await http.post(
      Uri.parse("https://api-marquemed.herokuapp.com/clinica"),
      headers: {"content-type": "application/json"},
      body: postToJson(data),
    );
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> updateClinica(int id, Clinica data) async {
    final response = await http.put(
      Uri.parse("https://api-marquemed.herokuapp.com/clinica/$id"),
      headers: {"content-type": "application/json"},
      body: postToJson(data),
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> deleteClinica(int id) async {
    final response = await http.delete(
      Uri.parse("https://api-marquemed.herokuapp.com/clinica/$id"),
      headers: {"content-type": "application/json"},
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}