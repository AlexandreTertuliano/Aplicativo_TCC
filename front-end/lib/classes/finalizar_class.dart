import 'dart:convert';

class Finalizar {
  Agenda agenda;
  int id;
  Paciente paciente;
  String status;

  Finalizar({this.agenda, this.id, this.paciente, this.status});

  Finalizar.fromJson(Map<String, dynamic> json) {
    agenda =
        json['agenda'] != null ? new Agenda.fromJson(json['agenda']) : null;
    id = json['id'];
    paciente = json['paciente'] != null
        ? new Paciente.fromJson(json['paciente'])
        : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.agenda != null) {
      data['agenda'] = this.agenda.toJson();
    }
    data['id'] = this.id;
    if (this.paciente != null) {
      data['paciente'] = this.paciente.toJson();
    }
    data['status'] = this.status;
    return data;
  }
}

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

List<Finalizar> postFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<Finalizar>.from(data.map((item) => Finalizar.fromJson(item)));
}

String postToJson(Finalizar data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}
