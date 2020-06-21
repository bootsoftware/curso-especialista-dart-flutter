import 'dart:convert';


class RevendaModel {
  String tipo;
  String nome;
  String cor;
  double nota;
  String tempoMedio;
  bool melhorPreco;
  double preco;
  RevendaModel({
    this.tipo,
    this.nome,
    this.cor,
    this.nota,
    this.tempoMedio,
    this.melhorPreco,
    this.preco,
  });

  Map<String, dynamic> toMap() {
    return {
      'tipo': tipo,
      'nome': nome,
      'cor': cor,
      'nota': nota,
      'tempoMedio': tempoMedio,
      'melhorPreco': melhorPreco,
      'preco': preco,
    };
  }

  static RevendaModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return RevendaModel(
      tipo: map['tipo'] ?? '',
      nome: map['nome'] ?? '',
      cor: map['cor'] ?? '',
      nota: map['nota'] ?? '',
      tempoMedio: map['tempoMedio'] ?? '',
      melhorPreco: map['melhorPreco'] ?? false,
      preco: map['preco'] ?? 0.00,
    );
  }

  String toJson() => json.encode(toMap());

  static RevendaModel fromJson(String source) => fromMap(json.decode(source));
}
