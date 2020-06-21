import 'package:desafio_flutter_revenda_gas/models/revenda_model.dart';
import 'package:desafio_flutter_revenda_gas/repository/revendas_repository.dart';

class RevendasService {
  final _repository = RevendasRepository();

  Future<List<RevendaModel>> loadJson() async {
    return await _repository.loadJson();
  }
}
