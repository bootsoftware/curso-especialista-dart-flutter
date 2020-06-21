import 'package:desafio_flutter_revenda_gas/models/revenda_model.dart';
import 'package:desafio_flutter_revenda_gas/service/revendas_service.dart';
import 'package:desafio_flutter_revenda_gas/shareds/functions_shared.dart';
import 'package:flutter/material.dart';

class HomeController {
  final FunctionsShared _shared = FunctionsShared();
  final _service = RevendasService();
  final List<RevendaModel> revendas = [];

  loadJson() async {
    revendas.addAll(await _service.loadJson());
  }

  String formatCurrency(double currency) {
    return _shared.formatCurrency(currency, 'R\$');
  }

  Color convertCor(String cor) {
    return _shared.convertCor(cor);
  }
}
