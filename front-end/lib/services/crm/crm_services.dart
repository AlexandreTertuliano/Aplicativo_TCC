import 'dart:convert';

import 'package:MedAgenda/services/crm/class_crm.dart';

import 'package:http/http.dart' as http;

class CrmServices {
  static Future<Crm> getCrm(String crm,) async {
    final response = await http.get(Uri.parse(
        "https://www.consultacrm.com.br/api/index.php?tipo=crm&uf=MG&q=$crm&chave=4627210942&destino=json"));
    var json = jsonDecode(response.body);

    return Crm.fromJson(json);
  }
}
