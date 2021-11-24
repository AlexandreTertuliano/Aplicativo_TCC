import 'dart:convert';

class FinalizaAgendaClass {
  FinalizaAgendaClass({
    this.agenda,
    this.paciente,
    this.status,
  });

  Agenda agenda;
  Paciente paciente;
  String status;

  factory FinalizaAgendaClass.fromJson(Map<String, dynamic> json) =>
      FinalizaAgendaClass(
        agenda: Agenda.fromJson(json["agenda"]),
        paciente: Paciente.fromJson(json["paciente"]),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "agenda": agenda.toJson(),
        "paciente": paciente.toJson(),
        "status": status,
      };
}

class Agenda {
  Agenda({this.id, this.nameClinica, this.dadosAgenda, this.ocupadoAgenda});

  int id;
  String nameClinica;
  String dadosAgenda;
  String ocupadoAgenda;

  factory Agenda.fromJson(Map<String, dynamic> json) => Agenda(
        id: json["id"],
        nameClinica: json["nameClinica"],
        dadosAgenda: json["dadosAgenda"],
        ocupadoAgenda: json["ocupadoAgenda"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nameClinica": nameClinica,
        "dadosAgenda": dadosAgenda,
        "ocupadoAgenda": ocupadoAgenda
      };
}

class Paciente {
  Paciente({
    this.id,
  });

  int id;

  factory Paciente.fromJson(Map<String, dynamic> json) => Paciente(
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
      };
}

List<FinalizaAgendaClass> postFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<FinalizaAgendaClass>.from(
      data.map((item) => FinalizaAgendaClass.fromJson(item)));
}

String postToJson(FinalizaAgendaClass data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}
