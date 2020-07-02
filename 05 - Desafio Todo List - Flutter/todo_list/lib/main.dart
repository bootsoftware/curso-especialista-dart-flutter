import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'app/controllers/home_controller.dart';
import 'app/controllers/new_task_controller.dart';
import 'app/database/database_adm_connection.dart';
import 'app/pages/home_page.dart';
import 'app/pages/new_task_page.dart';
import 'app/repositories/todos_repository.dart';

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final _databaseAdmConnection = DatabaseAdmConnection();

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(_databaseAdmConnection);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(_databaseAdmConnection);
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [Provider(create: (_) => TodosRepository())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'TODO LIST',
        theme: ThemeData(
          primaryColor: Color(0xFFFF9129),
          buttonColor: Color(0xFFFF9129),
          colorScheme: ColorScheme.light(primary: const Color(0xFFFF9129)),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: {
          NewTaskPage.routerName: (_) => ChangeNotifierProvider(
                create: (context) {
                  var day = ModalRoute.of(_).settings.arguments;
                  return NewTaskController(
                    repository: context.read<TodosRepository>(),
                    day: day,
                  );
                },
                child: NewTaskPage(),
              ),
        },
        home: ChangeNotifierProvider(
          create: (context) => HomeController(
            repository: context.read<TodosRepository>(),
          ),
          child: HomePage(),
        ),
      ),
    );
  }
}
