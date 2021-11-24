import 'dart:convert';

class FeedbackClass {
  int avaliacaoFeedback;
  String dateFeedback;
  String feedbackPaciente;
  int id;
  String nameMedico;
  Paciente pacienteId;

  FeedbackClass(
      {this.avaliacaoFeedback,
      this.dateFeedback,
      this.feedbackPaciente,
      this.id,
      this.nameMedico,
      this.pacienteId});

  FeedbackClass.fromJson(Map<String, dynamic> json) {
    avaliacaoFeedback = json['avaliacaoFeedback'];
    dateFeedback = json['dateFeedback'];
    feedbackPaciente = json['feedbackPaciente'];
    id = json['id'];
    nameMedico = json['nameMedico'];
    pacienteId = json['pacienteId'] != null
        ? new Paciente.fromJson(json['pacienteId'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['avaliacaoFeedback'] = this.avaliacaoFeedback;
    data['dateFeedback'] = this.dateFeedback;
    data['feedbackPaciente'] = this.feedbackPaciente;
    data['id'] = this.id;
    data['nameMedico'] = this.nameMedico;
    if (this.pacienteId != null) {
      data['pacienteId'] = this.pacienteId.toJson();
    }
    return data;
  }
}

class Paciente {
  String alturaPaciente;
  String bairroPaciente;
  Carteira carteira;
  String cepPaciente;
  String cidadePaciente;
  String cpfPaciente;
  String dnPaciente;
  String doadorPaciente;
  String emailPaciente;
  String estado;
  String generoPaciente;
  int id;
  String namePaciente;
  String numeroCasa;
  String pesoPaciente;
  String ruaPaciente;
  String senhaPaciente;
  String telefonePaciente;
  String tipoSanguePaciente;

  Paciente(
      {this.alturaPaciente,
      this.bairroPaciente,
      this.carteira,
      this.cepPaciente,
      this.cidadePaciente,
      this.cpfPaciente,
      this.dnPaciente,
      this.doadorPaciente,
      this.emailPaciente,
      this.estado,
      this.generoPaciente,
      this.id,
      this.namePaciente,
      this.numeroCasa,
      this.pesoPaciente,
      this.ruaPaciente,
      this.senhaPaciente,
      this.telefonePaciente,
      this.tipoSanguePaciente});

  Paciente.fromJson(Map<String, dynamic> json) {
    alturaPaciente = json['alturaPaciente'];
    bairroPaciente = json['bairroPaciente'];
    carteira = json['carteira'] != null
        ? new Carteira.fromJson(json['carteira'])
        : null;
    cepPaciente = json['cepPaciente'];
    cidadePaciente = json['cidadePaciente'];
    cpfPaciente = json['cpfPaciente'];
    dnPaciente = json['dnPaciente'];
    doadorPaciente = json['doadorPaciente'];
    emailPaciente = json['emailPaciente'];
    estado = json['estado'];
    generoPaciente = json['generoPaciente'];
    id = json['id'];
    namePaciente = json['namePaciente'];
    numeroCasa = json['numeroCasa'];
    pesoPaciente = json['pesoPaciente'];
    ruaPaciente = json['ruaPaciente'];
    senhaPaciente = json['senhaPaciente'];
    telefonePaciente = json['telefonePaciente'];
    tipoSanguePaciente = json['tipoSanguePaciente'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['alturaPaciente'] = this.alturaPaciente;
    data['bairroPaciente'] = this.bairroPaciente;
    if (this.carteira != null) {
      data['carteira'] = this.carteira.toJson();
    }
    data['cepPaciente'] = this.cepPaciente;
    data['cidadePaciente'] = this.cidadePaciente;
    data['cpfPaciente'] = this.cpfPaciente;
    data['dnPaciente'] = this.dnPaciente;
    data['doadorPaciente'] = this.doadorPaciente;
    data['emailPaciente'] = this.emailPaciente;
    data['estado'] = this.estado;
    data['generoPaciente'] = this.generoPaciente;
    data['id'] = this.id;
    data['namePaciente'] = this.namePaciente;
    data['numeroCasa'] = this.numeroCasa;
    data['pesoPaciente'] = this.pesoPaciente;
    data['ruaPaciente'] = this.ruaPaciente;
    data['senhaPaciente'] = this.senhaPaciente;
    data['telefonePaciente'] = this.telefonePaciente;
    data['tipoSanguePaciente'] = this.tipoSanguePaciente;
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

List<FeedbackClass> postFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<FeedbackClass>.from(
      data.map((item) => FeedbackClass.fromJson(item)));
}

String postToJson(FeedbackClass data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}
