import 'dart:convert';

class AgendaPaciente {
  String clinica;
  String medico;
  String dataHora;
  String status;

  AgendaPaciente({this.clinica, this.medico, this.dataHora, this.status});

  AgendaPaciente.fromJson(Map<String, dynamic> json) {
    clinica = json['clinica'];
    medico = json['medico'];
    dataHora = json['dataHora'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['clinica'] = this.clinica;
    data['medico'] = this.medico;
    data['dataHora'] = this.dataHora;
    data['status'] = this.status;
    return data;
  }
}

List<AgendaPaciente> postFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<AgendaPaciente>.from(
      data.map((item) => AgendaPaciente.fromJson(item)));
}

String postToJson(AgendaPaciente data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}
