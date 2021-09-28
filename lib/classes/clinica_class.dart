import 'dart:convert';

class Clinica {
  int id;
  String nameClinica;
  String cnpjClinica;
  String cepClinica;
  String telefoneClinica;
  String cidadeClinica;
  String bairroClinica;
  String ruaClinica;

  Clinica({
    this.id,
    this.nameClinica,
    this.cnpjClinica,
    this.cepClinica,
    this.telefoneClinica,
    this.cidadeClinica,
    this.bairroClinica,
    this.ruaClinica,
  });

  Clinica.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameClinica = json['nameClinica'];
    cnpjClinica = json['cnpjClinica'];
    cepClinica = json['cepClinica'];
    telefoneClinica = json['telefoneClinica'];
    cidadeClinica = json['cidadeClinica'];
    bairroClinica = json['bairroClinica'];
    ruaClinica = json['ruaClinica'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nameClinica'] = this.nameClinica;
    data['cnpjClinica'] = this.cnpjClinica;
    data['cepClinica'] = this.cepClinica;
    data['telefoneClinica'] = this.telefoneClinica;
    data['cidadeClinica'] = this.cidadeClinica;
    data['bairroClinica'] = this.bairroClinica;
    data['ruaClinica'] = this.ruaClinica;

    return data;
  }
}

List<Clinica> postFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<Clinica>.from(data.map((item) => Clinica.fromJson(item)));
}

String postToJson(Clinica data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}
