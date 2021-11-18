import 'dart:convert';

class Agenda {
  int id;
  DateTime dadosAgenda;
  String ocupadoAgenda;
  String medico;
  String clinica;

  Agenda(
      {this.id,
      this.dadosAgenda,
      this.ocupadoAgenda,
      this.medico,
      this.clinica});

  Agenda.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dadosAgenda = json["dadosAgenda"] == null
        ? null
        : DateTime.parse(json["dadosAgenda"]);
    ocupadoAgenda = json['ocupadoAgenda'];
    medico = json['medico'];
    clinica = json['clinica'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data["dadosAgenda"] =
        this.dadosAgenda == null ? null : dadosAgenda.toString();
    data['ocupadoAgenda'] = this.ocupadoAgenda;
    data['medico'] = this.medico;
    data['clinica'] = this.clinica;
    return data;
  }
}

List<Agenda> postFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<Agenda>.from(data.map((item) => Agenda.fromJson(item)));
}

String postToJson(Agenda data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}
