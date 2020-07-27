import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_list/app/models/todo_model.dart';
import 'package:todo_list/app/repositories/todos_repository.dart';
import 'package:collection/collection.dart';
import 'package:android_alarm_manager/android_alarm_manager.dart';

class HomeController extends ChangeNotifier {
  final TodosRepository repository;
  int selectendTab = 2;
  String titleAppBar = 'Atividades da Semana';
  DateTime startFilter;
  DateTime endFilter;
  DateTime daySelectend;
  DateFormat dateFormat = DateFormat('dd/MM/yyyy');
  Map<String, List<TodoModel>> listTodos;
  Map<String, List<TodoModel>> listTodoswithoutFilter;
  bool excluir = false;
  bool loading = false;

  final int helloAlarmID = 0;

  HomeController({@required this.repository}) {
    findAllForWeek();

    // repository.saveTodo(DateTime.now().subtract(Duration(days: 3)), 'DAY 3 -');
    // repository.saveTodo(DateTime.now().add(Duration(days: 3)), 'DAY 3 +');
    // repository.saveTodo(DateTime.now(), 'HOJE');
  }

  Future<void> findAllForWeek() async {
    startFilter = DateTime.now();
    daySelectend = DateTime.now();
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
    listTodoswithoutFilter = listTodos;
    notifyListeners();
  }

  findByDaySelected() async {
    var todos = await repository.findByPreriod(daySelectend, daySelectend);
    if (todos.isEmpty) {
      listTodos = {dateFormat.format(daySelectend): []};
    } else {
      listTodos = groupBy(todos, (TodoModel todo) => dateFormat.format(todo.dataHora));
    }
    listTodoswithoutFilter = listTodos;
    notifyListeners();
  }

  Future<void> changeSelectend(BuildContext context, int index) async {
    selectendTab = index;
    switch (index) {
      case 0:
        titleAppBar = 'Atividades Finalizadas';
        filterFinalizad();
        break;
      case 1:
        titleAppBar = 'Atividades Abertas';
        filterNotFinalizad();
        break;
      case 2:
        titleAppBar = 'Atividades da Semana';
        findAllForWeek();
        break;
      case 3:
        titleAppBar = 'Atividades na Data Selecionada';
        var day = await showDatePicker(
          context: context,
          initialDate: daySelectend,
          firstDate: DateTime.now().subtract(Duration(days: (360 * 3))),
          lastDate: DateTime.now().add(Duration(days: (360 * 10))),
        );
        if (day != null) {
          daySelectend = day;
          findByDaySelected();
        }
    }
    notifyListeners();
  }

  Future<void> filterFinalizad() async {
    listTodos = listTodoswithoutFilter;
    listTodos = listTodos.map((key, value) {
      var todosFinalized = value.where((t) => t.finalizado).toList();
      return MapEntry(key, todosFinalized);
    });
    notifyListeners();
  }

  Future<void> filterNotFinalizad() async {
    listTodos = listTodoswithoutFilter;
    listTodos = listTodos.map((key, value) {
      var todosFinalized = value.where((t) => !t.finalizado).toList();
      return MapEntry(key, todosFinalized);
    });
    notifyListeners();
  }

  void updateList() {
    switch (selectendTab) {

      //fazer o load
      case 0:
        filterFinalizad();
        Future.delayed(Duration(seconds: 25));
        //loading = false;
        notifyListeners();
        break;
      case 1:
        filterNotFinalizad();
        loading = false;
        notifyListeners();
        break;
      case 2:
        // findAllForWeek();
        loading = false;
        notifyListeners();
        break;
      case 3:
        // findByDaySelected();
        loading = false;
        notifyListeners();
        break;
    }
  }

  Future<void> checkendOrUnCheck(TodoModel todo) async {
    loading = true;
    todo.finalizado = !todo.finalizado;
    notifyListeners();
    updateList();
    repository.checkOrUnCheckTodo(todo);
    loading = false;
    notifyListeners();
  }

  void delete() {
    excluir = true;
    notifyListeners();
  }

  Future<void> printHello() async {
    await AndroidAlarmManager.initialize();
    final DateTime now = DateTime.now();
    final int isolateId = Isolate.current.hashCode;
    print("[$now] Hello, world! isolate=${isolateId} function='$printHello'");
  }

  Future<void> execultar() async {
    //printHello();
    await AndroidAlarmManager.periodic(const Duration(seconds: 10), helloAlarmID, printHello);
  }
}
