import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FunctionsShared {
  String formatCurrency(double currency, [String symbol]) {
    var f = NumberFormat.currency(locale: 'pt_BR', symbol: symbol ?? '');
    return f.format(currency);
  }

  Color convertCor(String cor) {
    return Color(int.parse(cor, radix: 16) + 0xFF000000);
  }
}
