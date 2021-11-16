import 'class_login_paciente.dart';
import 'package:http/http.dart' as http;

class ServicesLoginPaciente {
  static Future<List<LoginPaciente>> getLogin(
      String email, String senha) async {
    final response = await http.get(Uri.parse(
        "http://api-marquemed.herokuapp.com/login/paciente?email=$email&senha=$senha"));
    if (response.statusCode == 200) {
      return postFromJson(response.body);
    } else {
      return null;
    }
  }
}
