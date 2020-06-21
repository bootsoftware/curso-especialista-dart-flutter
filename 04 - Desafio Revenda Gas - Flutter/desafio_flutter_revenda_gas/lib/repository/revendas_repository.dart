import 'dart:convert';

import 'package:desafio_flutter_revenda_gas/models/revenda_model.dart';
import 'package:flutter/services.dart';

class RevendasRepository {
  Future<List<RevendaModel>> loadJson() async {
    List<RevendaModel> list;
    await rootBundle.loadString('assets/dados.json').then((dados) async {
      List<dynamic> revendasDados = await jsonDecode(dados);
      list = revendasDados.map((revenda) {
        return RevendaModel.fromMap(revenda);
      }).toList();
    });
    return list;
  }
}
