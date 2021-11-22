import 'dart:convert';

class PegaAgenda {
  Medico medico;
  int avaliacao;

  String status;
  List<Agenda> agenda;

  PegaAgenda({this.medico, this.avaliacao, this.status, this.agenda, paciente});

  PegaAgenda.fromJson(Map<String, dynamic> json) {
    medico =
        json['medico'] != null ? new Medico.fromJson(json['medico']) : null;
    avaliacao = json['avaliacao'];
    status = json['status'];
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
    data['status'] = this.status;
    if (this.agenda != null) {
      data['agenda'] = this.agenda.map((v) => v.toJson()).toList();
    }
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
  String senhaMedico;
  String anoFormacaoMedico;
  String cidadeFormacaoMedico;
  String universidadeFormacaoMedico;
  String crmMedico;
  String telefoneMedico;
  String cepMedico;
  Clinica clinica;
  Carteira carteira;
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
    valorConsulta = json['valorConsulta'].toDouble();
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
  String generoPaciente;
  int id;
  String namePaciente;
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
      this.generoPaciente,
      this.id,
      this.namePaciente,
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
    generoPaciente = json['generoPaciente'];
    id = json['id'];
    namePaciente = json['namePaciente'];
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
    data['generoPaciente'] = this.generoPaciente;
    data['id'] = this.id;
    data['namePaciente'] = this.namePaciente;
    data['pesoPaciente'] = this.pesoPaciente;
    data['ruaPaciente'] = this.ruaPaciente;
    data['senhaPaciente'] = this.senhaPaciente;
    data['telefonePaciente'] = this.telefonePaciente;
    data['tipoSanguePaciente'] = this.tipoSanguePaciente;
    return data;
  }
}

class Agenda {
  int id;
  String dadosAgenda;
  String ocupadoAgenda;
  String status;
  Paciente paciente;
  Medico medico;
  Clinica clinica;

  Agenda(
      {this.id,
      this.dadosAgenda,
      this.ocupadoAgenda,
      this.status,
      this.paciente,
      this.medico,
      this.clinica});

  Agenda.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dadosAgenda = json['dadosAgenda'];
    ocupadoAgenda = json['ocupadoAgenda'];
    status = json['status'];
    paciente = json['paciente'];
    medico =
        json['medico'] != null ? new Medico.fromJson(json['medico']) : null;
    clinica =
        json['clinica'] != null ? new Clinica.fromJson(json['clinica']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['dadosAgenda'] = this.dadosAgenda;
    data['ocupadoAgenda'] = this.ocupadoAgenda;
    data['status'] = this.status;
    data['paciente'] = this.paciente;
    if (this.medico != null) {
      data['medico'] = this.medico.toJson();
    }
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

List<Agenda> postFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<Agenda>.from(data.map((item) => Agenda.fromJson(item)));
}

String postToJson(Agenda data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}
