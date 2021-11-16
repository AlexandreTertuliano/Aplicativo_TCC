import 'dart:convert';

class LoginPaciente {
  bool verifica;
  Paciente paciente;
  Null medico;
  String mensagem;

  LoginPaciente({this.verifica, this.paciente, this.medico, this.mensagem});

  LoginPaciente.fromJson(Map<String, dynamic> json) {
    verifica = json['verifica'];
    paciente = json['paciente'] != null
        ? new Paciente.fromJson(json['paciente'])
        : null;
    medico = json['medico'];
    mensagem = json['mensagem'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['verifica'] = this.verifica;
    if (this.paciente != null) {
      data['paciente'] = this.paciente.toJson();
    }
    data['medico'] = this.medico;
    data['mensagem'] = this.mensagem;
    return data;
  }
}

class Paciente {
  int id;
  String namePaciente;
  String cpfPaciente;
  String dnPaciente;
  String telefonePaciente;
  String cidadePaciente;
  String bairroPaciente;
  String ruaPaciente;
  String tipoSanguePaciente;
  String generoPaciente;
  String doadorPaciente;
  String emailPaciente;
  String senhaPaciente;
  Null pesoPaciente;
  Null alturaPaciente;
  Null cepPaciente;
  Carteira carteira;

  Paciente(
      {this.id,
      this.namePaciente,
      this.cpfPaciente,
      this.dnPaciente,
      this.telefonePaciente,
      this.cidadePaciente,
      this.bairroPaciente,
      this.ruaPaciente,
      this.tipoSanguePaciente,
      this.generoPaciente,
      this.doadorPaciente,
      this.emailPaciente,
      this.senhaPaciente,
      this.pesoPaciente,
      this.alturaPaciente,
      this.cepPaciente,
      this.carteira});

  Paciente.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    namePaciente = json['namePaciente'];
    cpfPaciente = json['cpfPaciente'];
    dnPaciente = json['dnPaciente'];
    telefonePaciente = json['telefonePaciente'];
    cidadePaciente = json['cidadePaciente'];
    bairroPaciente = json['bairroPaciente'];
    ruaPaciente = json['ruaPaciente'];
    tipoSanguePaciente = json['tipoSanguePaciente'];
    generoPaciente = json['generoPaciente'];
    doadorPaciente = json['doadorPaciente'];
    emailPaciente = json['emailPaciente'];
    senhaPaciente = json['senhaPaciente'];
    pesoPaciente = json['pesoPaciente'];
    alturaPaciente = json['alturaPaciente'];
    cepPaciente = json['cepPaciente'];
    carteira = json['carteira'] != null
        ? new Carteira.fromJson(json['carteira'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['namePaciente'] = this.namePaciente;
    data['cpfPaciente'] = this.cpfPaciente;
    data['dnPaciente'] = this.dnPaciente;
    data['telefonePaciente'] = this.telefonePaciente;
    data['cidadePaciente'] = this.cidadePaciente;
    data['bairroPaciente'] = this.bairroPaciente;
    data['ruaPaciente'] = this.ruaPaciente;
    data['tipoSanguePaciente'] = this.tipoSanguePaciente;
    data['generoPaciente'] = this.generoPaciente;
    data['doadorPaciente'] = this.doadorPaciente;
    data['emailPaciente'] = this.emailPaciente;
    data['senhaPaciente'] = this.senhaPaciente;
    data['pesoPaciente'] = this.pesoPaciente;
    data['alturaPaciente'] = this.alturaPaciente;
    data['cepPaciente'] = this.cepPaciente;
    if (this.carteira != null) {
      data['carteira'] = this.carteira.toJson();
    }
    return data;
  }
}

class Carteira {
  int id;

  Carteira({this.id});

  Carteira.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    return data;
  }
}

List<LoginPaciente> postFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<LoginPaciente>.from(
      data.map((item) => LoginPaciente.fromJson(item)));
}

String postToJson(LoginPaciente data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}
