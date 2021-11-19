import 'dart:convert';

class Agenda {
  Clinica clinica;
  String dadosAgenda;
  int id;
  Medico medico;
  String ocupadoAgenda;

  Agenda(
      {this.clinica,
      this.dadosAgenda,
      this.id,
      this.medico,
      this.ocupadoAgenda});

  Agenda.fromJson(Map<String, dynamic> json) {
    clinica =
        json['clinica'] != null ? new Clinica.fromJson(json['clinica']) : null;
    dadosAgenda = json['dadosAgenda'];
    id = json['id'];
    medico =
        json['medico'] != null ? new Medico.fromJson(json['medico']) : null;
    ocupadoAgenda = json['ocupadoAgenda'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.clinica != null) {
      data['clinica'] = this.clinica.toJson();
    }
    data['dadosAgenda'] = this.dadosAgenda;
    data['id'] = this.id;
    if (this.medico != null) {
      data['medico'] = this.medico.toJson();
    }
    data['ocupadoAgenda'] = this.ocupadoAgenda;
    return data;
  }
}

class Clinica {
  String bairroClinica;
  String cepClinica;
  String cidadeClinica;
  String cnpjClinica;
  String estadoClinica;
  int id;
  String nameClinica;
  String numeroClinica;
  String ruaClinica;
  String telefoneClinica;

  Clinica(
      {this.bairroClinica,
      this.cepClinica,
      this.cidadeClinica,
      this.cnpjClinica,
      this.estadoClinica,
      this.id,
      this.nameClinica,
      this.numeroClinica,
      this.ruaClinica,
      this.telefoneClinica});

  Clinica.fromJson(Map<String, dynamic> json) {
    bairroClinica = json['bairroClinica'];
    cepClinica = json['cepClinica'];
    cidadeClinica = json['cidadeClinica'];
    cnpjClinica = json['cnpjClinica'];
    estadoClinica = json['estadoClinica'];
    id = json['id'];
    nameClinica = json['nameClinica'];
    numeroClinica = json['numeroClinica'];
    ruaClinica = json['ruaClinica'];
    telefoneClinica = json['telefoneClinica'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bairroClinica'] = this.bairroClinica;
    data['cepClinica'] = this.cepClinica;
    data['cidadeClinica'] = this.cidadeClinica;
    data['cnpjClinica'] = this.cnpjClinica;
    data['estadoClinica'] = this.estadoClinica;
    data['id'] = this.id;
    data['nameClinica'] = this.nameClinica;
    data['numeroClinica'] = this.numeroClinica;
    data['ruaClinica'] = this.ruaClinica;
    data['telefoneClinica'] = this.telefoneClinica;
    return data;
  }
}

class Medico {
  String anoFormacaoMedico;
  String bairroMedico;
  Carteira carteira;
  String cepMedico;
  String cidadeFormacaoMedico;
  String cidadeMedico;
  Clinica clinica;
  String cpfMedico;
  String crmMedico;
  String dnMedico;
  String emailMedico;
  String especializacao1Medico;
  String especializacao2Medico;
  String especializacao3Medico;
  String generoMedico;
  int id;
  String idadeMedico;
  String nameMedico;
  String numeroMedico;
  String ruaMedico;
  String senhaMedico;
  String telefoneMedico;
  String universidadeFormacaoMedico;
  int valorConsulta;

  Medico(
      {this.anoFormacaoMedico,
      this.bairroMedico,
      this.carteira,
      this.cepMedico,
      this.cidadeFormacaoMedico,
      this.cidadeMedico,
      this.clinica,
      this.cpfMedico,
      this.crmMedico,
      this.dnMedico,
      this.emailMedico,
      this.especializacao1Medico,
      this.especializacao2Medico,
      this.especializacao3Medico,
      this.generoMedico,
      this.id,
      this.idadeMedico,
      this.nameMedico,
      this.numeroMedico,
      this.ruaMedico,
      this.senhaMedico,
      this.telefoneMedico,
      this.universidadeFormacaoMedico,
      this.valorConsulta});

  Medico.fromJson(Map<String, dynamic> json) {
    anoFormacaoMedico = json['anoFormacaoMedico'];
    bairroMedico = json['bairroMedico'];
    carteira = json['carteira'] != null
        ? new Carteira.fromJson(json['carteira'])
        : null;
    cepMedico = json['cepMedico'];
    cidadeFormacaoMedico = json['cidadeFormacaoMedico'];
    cidadeMedico = json['cidadeMedico'];
    clinica =
        json['clinica'] != null ? new Clinica.fromJson(json['clinica']) : null;
    cpfMedico = json['cpfMedico'];
    crmMedico = json['crmMedico'];
    dnMedico = json['dnMedico'];
    emailMedico = json['emailMedico'];
    especializacao1Medico = json['especializacao1Medico'];
    especializacao2Medico = json['especializacao2Medico'];
    especializacao3Medico = json['especializacao3Medico'];
    generoMedico = json['generoMedico'];
    id = json['id'];
    idadeMedico = json['idadeMedico'];
    nameMedico = json['nameMedico'];
    numeroMedico = json['numeroMedico'];
    ruaMedico = json['ruaMedico'];
    senhaMedico = json['senhaMedico'];
    telefoneMedico = json['telefoneMedico'];
    universidadeFormacaoMedico = json['universidadeFormacaoMedico'];
    valorConsulta = json['valorConsulta'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['anoFormacaoMedico'] = this.anoFormacaoMedico;
    data['bairroMedico'] = this.bairroMedico;
    if (this.carteira != null) {
      data['carteira'] = this.carteira.toJson();
    }
    data['cepMedico'] = this.cepMedico;
    data['cidadeFormacaoMedico'] = this.cidadeFormacaoMedico;
    data['cidadeMedico'] = this.cidadeMedico;
    if (this.clinica != null) {
      data['clinica'] = this.clinica.toJson();
    }
    data['cpfMedico'] = this.cpfMedico;
    data['crmMedico'] = this.crmMedico;
    data['dnMedico'] = this.dnMedico;
    data['emailMedico'] = this.emailMedico;
    data['especializacao1Medico'] = this.especializacao1Medico;
    data['especializacao2Medico'] = this.especializacao2Medico;
    data['especializacao3Medico'] = this.especializacao3Medico;
    data['generoMedico'] = this.generoMedico;
    data['id'] = this.id;
    data['idadeMedico'] = this.idadeMedico;
    data['nameMedico'] = this.nameMedico;
    data['numeroMedico'] = this.numeroMedico;
    data['ruaMedico'] = this.ruaMedico;
    data['senhaMedico'] = this.senhaMedico;
    data['telefoneMedico'] = this.telefoneMedico;
    data['universidadeFormacaoMedico'] = this.universidadeFormacaoMedico;
    data['valorConsulta'] = this.valorConsulta;
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

List<Agenda> postFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<Agenda>.from(data.map((item) => Agenda.fromJson(item)));
}

String postToJson(Agenda data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}
