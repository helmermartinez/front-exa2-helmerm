import 'dart:convert';

class Titular {
  Titular(
      {this.idtitulares,
      required this.titulo,
      required this.descripcion,
      this.id});

  String titulo;
  String descripcion;
  String? idtitulares;
  int? id;

  factory Titular.fromJson(String str) => Titular.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Titular.fromMap(Map<String, dynamic> json) => Titular(
        idtitulares: json["idtitulares"],
        titulo: json["titulo"],
        descripcion: json["descripcion"],
      );

  Map<String, dynamic> toMap() => {
        "idtitulares": idtitulares,
        "titulo": titulo,
        "descripcion": descripcion,
      };

  Titular copy() => Titular(
        titulo: this.titulo,
        descripcion: this.descripcion,
        idtitulares: this.idtitulares,
        id: this.id,
      );

  Titular set() => Titular(
        titulo: this.titulo,
        descripcion: this.descripcion,
        idtitulares: this.idtitulares,
        id: this.id,
      );

  Titular titularFromJson(String str) => Titular.fromJson(json.decode(str));
}
