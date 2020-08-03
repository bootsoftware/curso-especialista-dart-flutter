import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_list/app/models/todo_model.dart';
import 'package:todo_list/app/repositories/todos_repository.dart';
import 'package:collection/collection.dart';

class HomeController extends ChangeNotifier {
  final TodosRepository repository;
  int selectendTab = 1;
  DateTime startFilter;

  DateTime endFilter;
  DateFormat dateFormat = DateFormat('dd/mm/yyyy');
  Map<String, List<TodoModel>> listTodos;

  HomeController({@required this.repository}) {
    findAllForWeek();
  }

  Future<void> findAllForWeek() async {
    startFilter = DateTime.now();
    if (startFilter.weekday != DateTime.monday) {
      startFilter = startFilter.subtract(
        Duration(days: (startFilter.weekday - 1)),
      );
    }
    endFilter = startFilter.add(
      Duration(days: 6),
    );
    var todos = await repository.findByPreriod(startFilter, endFilter);
    if (todos.isEmpty) {
      listTodos = {dateFormat.format(DateTime.now()): []};
    } else {
      listTodos = groupBy(todos, (TodoModel todo) => dateFormat.format(todo.dataHora));
    }
    notifyListeners();
  }

  void changeSelectend(index) {
    selectendTab = index;
    notifyListeners();
  }
}
