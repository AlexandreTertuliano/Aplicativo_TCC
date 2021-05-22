class Usuario {
  Usuario({
    this.id,
    this.nome,
    this.senha,
  });

  int id;
  String nome;
  String senha;

  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        id: json["id"],
        nome: json["nome"],
        senha: json["senha"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nome": nome,
        "senha": senha,
      };
}
