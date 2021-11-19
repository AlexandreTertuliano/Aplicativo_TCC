import 'dart:convert';

class PegaAgenda {
  Medico medico;
  int avaliacao;
  List<Agenda> agenda;

  PegaAgenda({this.medico, this.avaliacao, this.agenda});

  PegaAgenda.fromJson(Map<String, dynamic> json) {
    medico =
        json['medico'] != null ? new Medico.fromJson(json['medico']) : null;
    avaliacao = json['avaliacao'];
    if (json['agenda'] != null) {
      agenda = new List<Agenda>();
      json['agenda'].forEach((v) {
        agenda.add(new Agenda.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.medico != null) {
      data['medico'] = this.medico.toJson();
    }
    data['avaliacao'] = this.avaliacao;
    if (this.agenda != null) {
      data['agenda'] = this.agenda.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Medico {
  int id;
  String nameMedico;
  Null cpfMedico;
  Null dnMedico;
  Null cidadeMedico;
  Null bairroMedico;
  Null ruaMedico;
  Null numeroMedico;
  Null idadeMedico;
  Null especializacao1Medico;
  Null especializacao2Medico;
  Null especializacao3Medico;
  Null generoMedico;
  String emailMedico;
  String senhaMedico;
  Null anoFormacaoMedico;
  Null cidadeFormacaoMedico;
  Null universidadeFormacaoMedico;
  String crmMedico;
  String telefoneMedico;
  Null cepMedico;
  Clinica clinica;
  Carteira carteira;
  int valorConsulta;

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
      this.senhaMedico,
      this.anoFormacaoMedico,
      this.cidadeFormacaoMedico,
      this.universidadeFormacaoMedico,
      this.crmMedico,
      this.telefoneMedico,
      this.cepMedico,
      this.clinica,
      this.carteira,
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
    senhaMedico = json['senhaMedico'];
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
    valorConsulta = json['valorConsulta'].toInt();
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
    data['senhaMedico'] = this.senhaMedico;
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
  Null medico;
  Clinica clinica;

  Agenda(
      {this.id,
      this.dadosAgenda,
      this.ocupadoAgenda,
      this.medico,
      this.clinica});

  Agenda.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dadosAgenda = json['dadosAgenda'];
    ocupadoAgenda = json['ocupadoAgenda'];
    medico = json['medico'];
    clinica =
        json['clinica'] != null ? new Clinica.fromJson(json['clinica']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['dadosAgenda'] = this.dadosAgenda;
    data['ocupadoAgenda'] = this.ocupadoAgenda;
    data['medico'] = this.medico;
    if (this.clinica != null) {
      data['clinica'] = this.clinica.toJson();
    }
    return data;
  }
}

List<PegaAgenda> postFromJsonPegaAgenda(String jsonData) {
  final data = json.decode(jsonData);
  return List<PegaAgenda>.from(data.map((item) => PegaAgenda.fromJson(item)));
}

String postToJsonPegaAgenda(PegaAgenda data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}
