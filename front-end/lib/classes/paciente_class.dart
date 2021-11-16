import 'dart:convert';

class Paciente {
  int id;
  String namePaciente;
  String cpfPaciente;
  DateTime dnPaciente;
  String telefonePaciente;
  String cepPaciente;
  String cidadePaciente;
  String bairroPaciente;
  String ruaPaciente;
  String numeroPaciente;
  String idadePaciente;
  String tipoSanguePaciente;
  String generoPaciente;
  String emailPaciente;
  String senhaPaciente;
  String pesoPaciente;
  String alturaPaciente;
  Paciente({
    this.id,
    this.namePaciente,
    this.cpfPaciente,
    this.dnPaciente,
    this.telefonePaciente,
    this.cepPaciente,
    this.cidadePaciente,
    this.bairroPaciente,
    this.ruaPaciente,
    this.numeroPaciente,
    this.idadePaciente,
    this.tipoSanguePaciente,
    this.generoPaciente,
    this.emailPaciente,
    this.senhaPaciente,
    this.pesoPaciente,
    this.alturaPaciente,
  });

  Paciente.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    namePaciente = json['namePaciente'];
    cpfPaciente = json['cpfPaciente'];
    dnPaciente = json['dnPaciente'];
    telefonePaciente = json['telefonePaciente'];
    cepPaciente = json['cepPaciente'];
    cidadePaciente = json['cidadePaciente'];
    bairroPaciente = json['bairroPaciente'];
    ruaPaciente = json['ruaPaciente'];
    numeroPaciente = json['numeroPaciente'];
    idadePaciente = json['idadePaciente'];
    tipoSanguePaciente = json['tipoSanguePaciente'];
    generoPaciente = json['generoPaciente'];
    emailPaciente = json['emailPaciente'];
    senhaPaciente = json['senhaPaciente'];
    pesoPaciente = json['pesoPaciente'];
    alturaPaciente = json['alturaPaciente'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['namePaciente'] = this.namePaciente;
    data['cpfPaciente'] = this.cpfPaciente;
    data['dnPaciente'] = this.dnPaciente;
    data['telefonePaciente'] = this.telefonePaciente;
    data['cepPaciente'] = this.cepPaciente;
    data['cidadePaciente'] = this.cidadePaciente;
    data['bairroPaciente'] = this.bairroPaciente;
    data['ruaPaciente'] = this.ruaPaciente;
    data['numeroPaciente'] = this.numeroPaciente;
    data['idadePaciente'] = this.idadePaciente;
    data['tipoSanguePaciente'] = this.tipoSanguePaciente;
    data['generoPaciente'] = this.generoPaciente;
    data['emailPaciente'] = this.emailPaciente;
    data['senhaPaciente'] = this.senhaPaciente;
    data['pesoPaciente'] = this.pesoPaciente;
    data['alturaPaciente'] = this.alturaPaciente;
    return data;
  }
}

List<Paciente> postFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<Paciente>.from(data.map((item) => Paciente.fromJson(item)));
}

String postToJson(Paciente data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}
