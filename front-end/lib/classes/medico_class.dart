import 'dart:convert';

class Doutor {
  Medico medico;
  int avaliacao;

  Doutor(
      {this.medico,
      this.avaliacao,
      String nameMedico,
      String cpfMedico,
      String telefoneMedico,
      String cepMedico,
      String cidadeMedico,
      String bairroMedico,
      String ruaMedico,
      String generoMedico,
      String especializacao3Medico,
      String especializacao1Medico,
      String idadeMedico,
      String numeroMedico,
      String especializacao2Medico,
      String emailMedico,
      String anoFormacaoMedico,
      String cidadeFormacaoMedico,
      String universidadeFormacaoMedico,
      String crmMedico});

  Doutor.fromJson(Map<String, dynamic> json) {
    medico =
        json['medico'] != null ? new Medico.fromJson(json['medico']) : null;
    avaliacao = json['avaliacao'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.medico != null) {
      data['medico'] = this.medico.toJson();
    }
    data['avaliacao'] = this.avaliacao;
    return data;
  }
}

class Medico {
  int id;
  String nameMedico;
  String cpfMedico;
  String dnMedico;
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
  String anoFormacaoMedico;
  String cidadeFormacaoMedico;
  String universidadeFormacaoMedico;
  String crmMedico;
  String telefoneMedico;
  String cepMedico;
  Clinica clinica;
  Carteira carteira;
  Agenda agenda;
  double valorConsulta;

  Medico(
      {this.id,
      this.nameMedico,
      this.cpfMedico,
      this.dnMedico,
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
      this.anoFormacaoMedico,
      this.cidadeFormacaoMedico,
      this.universidadeFormacaoMedico,
      this.crmMedico,
      this.telefoneMedico,
      this.cepMedico,
      this.clinica,
      this.carteira,
      this.agenda,
      this.valorConsulta});

  Medico.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameMedico = json['nameMedico'];
    cpfMedico = json['cpfMedico'];
    dnMedico = json['dnMedico'];
    cidadeMedico = json['cidadeMedico'];
    bairroMedico = json['bairroMedico'];
    ruaMedico = json['ruaMedico'];
    numeroMedico = json['numeroMedico'];
    idadeMedico = json['idadeMedico'];
    especializacao1Medico = json['especializacao1Medico'];
    especializacao2Medico = json['especializacao2Medico'];
    especializacao3Medico = json['especializacao3Medico'];
    generoMedico = json['generoMedico'];
    emailMedico = json['emailMedico'];
    anoFormacaoMedico = json['anoFormacaoMedico'];
    cidadeFormacaoMedico = json['cidadeFormacaoMedico'];
    universidadeFormacaoMedico = json['universidadeFormacaoMedico'];
    crmMedico = json['crmMedico'];
    telefoneMedico = json['telefoneMedico'];
    cepMedico = json['cepMedico'];
    clinica =
        json['clinica'] != null ? new Clinica.fromJson(json['clinica']) : null;
    carteira = json['carteira'] != null
        ? new Carteira.fromJson(json['carteira'])
        : null;
    agenda =
        json['agenda'] != null ? new Agenda.fromJson(json['agenda']) : null;
    valorConsulta = json['valorConsulta'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nameMedico'] = this.nameMedico;
    data['cpfMedico'] = this.cpfMedico;
    data['dnMedico'] = this.dnMedico;
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
    data['anoFormacaoMedico'] = this.anoFormacaoMedico;
    data['cidadeFormacaoMedico'] = this.cidadeFormacaoMedico;
    data['universidadeFormacaoMedico'] = this.universidadeFormacaoMedico;
    data['crmMedico'] = this.crmMedico;
    data['telefoneMedico'] = this.telefoneMedico;
    data['cepMedico'] = this.cepMedico;
    if (this.clinica != null) {
      data['clinica'] = this.clinica.toJson();
    }
    if (this.carteira != null) {
      data['carteira'] = this.carteira.toJson();
    }
    if (this.agenda != null) {
      data['agenda'] = this.agenda.toJson();
    }
    data['valorConsulta'] = this.valorConsulta;
    return data;
  }
}

class Clinica {
  int id;
  String nameClinica;
  String cnpjClinica;
  String telefoneClinica;
  String cepClinica;
  String estadoClinica;
  String cidadeClinica;
  String bairroClinica;
  String ruaClinica;
  String numeroClinica;

  Clinica(
      {this.id,
      this.nameClinica,
      this.cnpjClinica,
      this.telefoneClinica,
      this.cepClinica,
      this.estadoClinica,
      this.cidadeClinica,
      this.bairroClinica,
      this.ruaClinica,
      this.numeroClinica});

  Clinica.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameClinica = json['nameClinica'];
    cnpjClinica = json['cnpjClinica'];
    telefoneClinica = json['telefoneClinica'];
    cepClinica = json['cepClinica'];
    estadoClinica = json['estadoClinica'];
    cidadeClinica = json['cidadeClinica'];
    bairroClinica = json['bairroClinica'];
    ruaClinica = json['ruaClinica'];
    numeroClinica = json['numeroClinica'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nameClinica'] = this.nameClinica;
    data['cnpjClinica'] = this.cnpjClinica;
    data['telefoneClinica'] = this.telefoneClinica;
    data['cepClinica'] = this.cepClinica;
    data['estadoClinica'] = this.estadoClinica;
    data['cidadeClinica'] = this.cidadeClinica;
    data['bairroClinica'] = this.bairroClinica;
    data['ruaClinica'] = this.ruaClinica;
    data['numeroClinica'] = this.numeroClinica;
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

class Agenda {
  int id;
  String dadosAgenda;
  String ocupadoAgenda;

  Agenda({this.id, this.dadosAgenda, this.ocupadoAgenda});

  Agenda.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dadosAgenda = json['dadosAgenda'];
    ocupadoAgenda = json['ocupadoAgenda'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['dadosAgenda'] = this.dadosAgenda;
    data['ocupadoAgenda'] = this.ocupadoAgenda;
    return data;
  }
}

List<Doutor> postFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<Doutor>.from(data.map((item) => Doutor.fromJson(item)));
}

String postToJson(Doutor data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}
