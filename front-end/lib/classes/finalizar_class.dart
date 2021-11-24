import 'dart:convert';

class Finalizar {
  int id;
  Agenda agenda;
  Paciente paciente;
  String status;

  Finalizar({this.id, this.agenda, this.paciente, this.status});

  Finalizar.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    agenda =
        json['agenda'] != null ? new Agenda.fromJson(json['agenda']) : null;
    paciente = json['paciente'] != null
        ? new Paciente.fromJson(json['paciente'])
        : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.agenda != null) {
      data['agenda'] = this.agenda.toJson();
    }
    if (this.paciente != null) {
      data['paciente'] = this.paciente.toJson();
    }
    data['status'] = this.status;
    return data;
  }
}

class Agenda {
  int id;
  String dadosAgenda;
  String ocupadoAgenda;
  Medico medico;
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
    if (this.medico != null) {
      data['medico'] = this.medico.toJson();
    }
    if (this.clinica != null) {
      data['clinica'] = this.clinica.toJson();
    }
    return data;
  }
}

class Medico {
  int id;
  String nameMedico;
  String cpfMedico;
  Null dnMedico;
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
    data['senhaMedico'] = this.senhaMedico;
    data['anoFormacaoMedico'] = this.anoFormacaoMedico;
    data['cidadeFormacaoMedico'] = this.cidadeFormacaoMedico;
    data['universidadeFormacaoMedico'] = this.universidadeFormacaoMedico;
    data['crmMedico'] = this.crmMedico;
    data['telefoneMedico'] = this.telefoneMedico;
    data['cepMedico'] = this.cepMedico;
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

class Paciente {
  int id;
  String namePaciente;
  String cpfPaciente;
  Null dnPaciente;
  String telefonePaciente;
  String cidadePaciente;
  String bairroPaciente;
  String ruaPaciente;
  String tipoSanguePaciente;
  String generoPaciente;
  String doadorPaciente;
  String emailPaciente;
  String senhaPaciente;
  String pesoPaciente;
  String alturaPaciente;
  String cepPaciente;
  Null numeroCasa;
  Null estado;
  Null carteira;

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
      this.numeroCasa,
      this.estado,
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
    numeroCasa = json['numeroCasa'];
    estado = json['estado'];
    carteira = json['carteira'];
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
    data['numeroCasa'] = this.numeroCasa;
    data['estado'] = this.estado;
    data['carteira'] = this.carteira;
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
