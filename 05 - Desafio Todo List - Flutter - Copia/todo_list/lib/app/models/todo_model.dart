import 'dart:convert';

import 'package:meta/meta.dart';

class TodoModel {
  int id;
  String descricao;
  DateTime dataHora;
  bool finalizado;

  TodoModel({
    @required this.id,
    @required this.descricao,
    @required this.dataHora,
    @required this.finalizado,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'descricao': descricao,
      'dataHora': dataHora?.millisecondsSinceEpoch,
      'finalizado': finalizado,
    };
  }

  static TodoModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return TodoModel(
      id: map['id'] ?? 0,
      descricao: map['descricao'] ?? '',
      dataHora: DateTime.parse(map['data_hora']),
      finalizado: map['finalizado'] == 0 ? false : true,
    );
  }

  String toJson() => json.encode(toMap());

  static TodoModel fromJson(String source) => fromMap(json.decode(source));
}
