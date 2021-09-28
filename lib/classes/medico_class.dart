import 'dart:convert';

class Medico {
  int id;
  String nameMedico;
  String cpfMedico;
  DateTime dnMedico;
  String telefoneMedico;
  String cepMedico;
  String cidadeMedico;
  String bairroMedico;
  String ruaMedico;
  String numeroMedico;
  String idadeMedico;
  String especializacao1Medico;
  String especializacao2Medico;
  String especializacao3Medico;
  String generoMedico;
  String emailMedico;
  String anoformacaoMedico;
  String cidadeformacaoMedico;
  String universidadeformacaoMedico;
  String crmMedico;

  Medico({
    this.id,
    this.nameMedico,
    this.cpfMedico,
    this.dnMedico,
    this.telefoneMedico,
    this.cepMedico,
    this.cidadeMedico,
    this.bairroMedico,
    this.ruaMedico,
    this.numeroMedico,
    this.idadeMedico,
    this.especializacao1Medico,
    this.especializacao2Medico,
    this.especializacao3Medico,
    this.generoMedico,
    this.emailMedico,
    this.anoformacaoMedico,
    this.cidadeformacaoMedico,
    this.universidadeformacaoMedico,
    this.crmMedico,
  });

  Medico.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameMedico = json['nameMedico'];
    cpfMedico = json['cpfMedico'];
    dnMedico = json['dnMedico'];
    telefoneMedico = json['telefoneMedico'];
    cepMedico = json['cepMedico'];
    cidadeMedico = json['cidadeMedico'];
    bairroMedico = json['bairroMedico'];
    ruaMedico = json['ruaMedico'];
    numeroMedico = json['numeroMedico'];
    idadeMedico = json['idadeMedico'];
    especializacao1Medico = json['especializacao1Medico'];
    generoMedico = json['generoMedico'];
    emailMedico = json['emailMedico'];
    especializacao2Medico = json['especializacao2Medico'];
    especializacao3Medico = json['especializacao3Medico'];
    anoformacaoMedico = json['anoformacaoMedico'];
    cidadeformacaoMedico = json['cidadeformacaoMedico'];
    universidadeformacaoMedico = json['universidadeformacaoMedico'];
    crmMedico = json['crmMedico'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nameMedico'] = this.nameMedico;
    data['cpfMedico'] = this.cpfMedico;
    data['dnMedico'] = this.dnMedico;
    data['telefoneMedico'] = this.telefoneMedico;
    data['cepMedico'] = this.cepMedico;
    data['cidadeMedico'] = this.cidadeMedico;
    data['bairroMedico'] = this.bairroMedico;
    data['ruaMedico'] = this.ruaMedico;
    data['numeroMedico'] = this.numeroMedico;
    data['idadeMedico'] = this.idadeMedico;
    data['especializacao1Medico'] = this.especializacao1Medico;
    data['especializacao2Medico'] = this.especializacao2Medico;
    data['especializacao3Medico'] = this.especializacao3Medico;
    data['generoMedico'] = this.generoMedico;
    data['emailMedico'] = this.emailMedico;
    data['anoformacaoMedico'] = this.anoformacaoMedico;
    data['cidadeformacaoMedico'] = this.cidadeformacaoMedico;
    data['universidadeformacaoMedico'] = this.universidadeformacaoMedico;
    data['crmMedico'] = this.crmMedico;
    return data;
  }
}

List<Medico> postFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<Medico>.from(data.map((item) => Medico.fromJson(item)));
}

String postToJson(Medico data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}
