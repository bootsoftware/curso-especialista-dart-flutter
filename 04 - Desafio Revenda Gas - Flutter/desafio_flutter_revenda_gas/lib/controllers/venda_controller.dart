import 'package:desafio_flutter_revenda_gas/models/revenda_model.dart';
import 'package:desafio_flutter_revenda_gas/shareds/functions_shared.dart';
import 'package:flutter/material.dart';

class VendaController {
  final FunctionsShared _shared = FunctionsShared();
  int qtd = 1;
  String valorTotal;
  double valorGas = 70;
  // double valorTotal;
  RevendaModel revenda;
  VendaController({
    this.revenda,
  });

  void valor() {
    valorTotal = _shared.formatCurrency(valorGas * qtd);
  }

  void incrementQtd() {
    qtd++;
    valor();
  }

  void decrementarQtd() {
    if (qtd > 1) {
      qtd--;
      valor();
    }
  }

  Color cor(cor) {
    return _shared.convertCor(cor);
  }
}
