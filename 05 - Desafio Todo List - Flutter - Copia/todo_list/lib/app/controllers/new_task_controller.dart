import 'package:flutter/material.dart';
import 'package:todo_list/app/repositories/todos_repository.dart';

class NewTaskController extends ChangeNotifier {
  final TodosRepository repository;

  NewTaskController({@required this.repository});
}
