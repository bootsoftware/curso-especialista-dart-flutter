import 'package:flutter/material.dart';
import 'package:todo_list/app/database/connection.dart';

class DatabaseAdmConnection with WidgetsBindingObserver {
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    var _connection = Connection();
    switch (state) {
      case AppLifecycleState.resumed:
        break;
      case AppLifecycleState.inactive:
        _connection.closeConnection();
        break;
      case AppLifecycleState.paused:
        _connection.closeConnection();
        break;
      case AppLifecycleState.detached:
        _connection.closeConnection();
        break;
    }
    super.didChangeAppLifecycleState(state);
  }
}
