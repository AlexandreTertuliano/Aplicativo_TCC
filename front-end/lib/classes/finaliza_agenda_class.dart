import 'package:MedAgenda/classes/paciente_class.dart';

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
  Agenda({
    this.id,
  });

  int id;

  factory Agenda.fromJson(Map<String, dynamic> json) => Agenda(
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
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
