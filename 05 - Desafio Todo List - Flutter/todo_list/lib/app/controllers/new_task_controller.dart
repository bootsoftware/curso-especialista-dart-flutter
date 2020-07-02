import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_list/app/repositories/todos_repository.dart';

class NewTaskController extends ChangeNotifier {
  final TodosRepository repository;
  final formKey = GlobalKey<FormState>();
  final _dateFormat = DateFormat('dd/MM/yyyy');
  DateTime dateSelectend;
  bool saved = false;
  bool loading = false;
  String error;

  TextEditingController nameTaskController = TextEditingController();

  String get dayFormatend => _dateFormat.format(dateSelectend);

  NewTaskController({@required this.repository, String day}) {
    dateSelectend = _dateFormat.parse(day);
  }

  String valideteNameNowTask() {
    if (nameTaskController.text.isEmpty) {
      return 'Nome da Tarefa Obrigatório!';
    } else {
      return null;
    }
  }

  save() async {
    if (formKey.currentState.validate()) {
      try {
        loading = true;
        saved = false;
        //  await repository.saveTodo(dateSelectend, nameTaskController.text);
        saved = true;
        loading = false;
      } catch (e) {
        error = 'Erro ao salvar Tarefa!';
      }
      notifyListeners();
    }
  }
}
