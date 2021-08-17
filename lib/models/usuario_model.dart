import 'dart:convert';

List<Usuario> usuarioFromJson(String str) => List<Usuario>.from(json.decode(str).map((x) => Usuario.fromJson(x)));

String usuarioToJson(List<Usuario> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Usuario {
    Usuario({
        this.nome,
        this.data,
        this.id,
    });

    String nome;
    String data;
    int id;

    factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        nome: json["nome"],
        data: json["data"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "nome": nome,
        "data": data,
        "id": id,
    };
}
