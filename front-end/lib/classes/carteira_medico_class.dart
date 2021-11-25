import 'dart:convert';

class MedicoCarteira {
  double valorConsulta;
  String chavePix;
  String paciente;

  MedicoCarteira({this.valorConsulta, this.chavePix, this.paciente});

  MedicoCarteira.fromJson(Map<String, dynamic> json) {
    valorConsulta = json['valorConsulta'];
    chavePix = json['chavePix'];
    paciente = json['paciente'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['valorConsulta'] = this.valorConsulta;
    data['chavePix'] = this.chavePix;
    data['paciente'] = this.paciente;
    return data;
  }
}

List<MedicoCarteira> postFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<MedicoCarteira>.from(
      data.map((item) => MedicoCarteira.fromJson(item)));
}

String postToJson(MedicoCarteira data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}
