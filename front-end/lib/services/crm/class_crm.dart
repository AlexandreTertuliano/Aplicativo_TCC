// To parse this JSON data, do
//
//     final crm = crmFromJson(jsonString);

import 'dart:convert';

Crm crmFromJson(String str) => Crm.fromJson(json.decode(str));

String crmToJson(Crm data) => json.encode(data.toJson());

class Crm {
    Crm({
        this.url,
        this.total,
        this.status,
        this.mensagem,
        this.apiLimite,
        this.apiConsultas,
        this.item,
    });

    String url;
    int total;
    String status;
    String mensagem;
    String apiLimite;
    String apiConsultas;
    List<Item> item;

    factory Crm.fromJson(Map<String, dynamic> json) => Crm(
        url: json["url"],
        total: json["total"],
        status: json["status"],
        mensagem: json["mensagem"],
        apiLimite: json["api_limite"],
        apiConsultas: json["api_consultas"],
        item: List<Item>.from(json["item"].map((x) => Item.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "url": url,
        "total": total,
        "status": status,
        "mensagem": mensagem,
        "api_limite": apiLimite,
        "api_consultas": apiConsultas,
        "item": List<dynamic>.from(item.map((x) => x.toJson())),
    };
}

class Item {
    Item({
        this.tipo,
        this.nome,
        this.numero,
        this.profissao,
        this.uf,
        this.situacao,
    });

    Tipo tipo;
    String nome;
    String numero;
    String profissao;
    Uf uf;
    Situacao situacao;

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        tipo: tipoValues.map[json["tipo"]],
        nome: json["nome"],
        numero: json["numero"],
        profissao: json["profissao"],
        uf: ufValues.map[json["uf"]],
        situacao: situacaoValues.map[json["situacao"]],
    );

    Map<String, dynamic> toJson() => {
        "tipo": tipoValues.reverse[tipo],
        "nome": nome,
        "numero": numero,
        "profissao": profissao,
        "uf": ufValues.reverse[uf],
        "situacao": situacaoValues.reverse[situacao],
    };
}

enum Situacao { ATIVO, CANCELADO }

final situacaoValues = EnumValues({
    "Ativo": Situacao.ATIVO,
    "Cancelado": Situacao.CANCELADO
});

enum Tipo { CRM }

final tipoValues = EnumValues({
    "CRM": Tipo.CRM
});

enum Uf { MG }

final ufValues = EnumValues({
    "MG": Uf.MG
});

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}


List<Crm> postFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<Crm>.from(
      data.map((item) => Crm.fromJson(item)));
}

String postToJson(Crm data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}