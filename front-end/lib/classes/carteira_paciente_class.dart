import 'dart:convert';

class PacienteCarteira {
  String medico;
  double valorConsulta;

  PacienteCarteira({this.medico, this.valorConsulta});

  PacienteCarteira.fromJson(Map<String, dynamic> json) {
    medico = json['medico'];
    valorConsulta = json['valorConsulta'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['medico'] = this.medico;
    data['valorConsulta'] = this.valorConsulta;
    return data;
  }
}

List<PacienteCarteira> postFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<PacienteCarteira>.from(
      data.map((item) => PacienteCarteira.fromJson(item)));
}

String postToJson(PacienteCarteira data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}
