import 'dart:convert';

import 'package:MedAgenda/classes/agenda_class.dart';
import 'package:http/http.dart' as http;

class ServicesAgenda {
  static Future<List<Agenda>> getTodasAgenda() async {
    final response =
        await http.get(Uri.parse("https://senai.cck.com.br/agenda"));
    if (response.statusCode == 200) {
      return postFromJson(response.body);
    } else {
      return null;
    }
  }

  static Future<bool> createAgenda(Agenda data) async {
    final response = await http.post(
      Uri.parse("https://senai.cck.com.br/agenda"),
      headers: {"content-type": "application/json"},
      body: postToJson(data),
    );
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> updateAgenda(int id, Agenda data) async {
    final response = await http.put(
      Uri.parse("https://senai.cck.com.br/agenda/$id"),
      headers: {"content-type": "application/json"},
      body: postToJson(data),
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> deleteAgenda(int id) async {
    final response = await http.delete(
      Uri.parse("https://senai.cck.com.br/agenda/$id"),
      headers: {"content-type": "application/json"},
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
