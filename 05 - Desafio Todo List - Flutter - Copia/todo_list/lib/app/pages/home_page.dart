import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/app/controllers/home_controller.dart';
import 'package:todo_list/app/pages/new_task_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeController>(
      builder: (BuildContext context, _controller, _) {
        return Scaffold(
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  child: Text('TODO LIST'),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                ListTile(
                  title: Text('Novo Todo'),
                  onTap: () {
                    Navigator.of(context).pushNamed(NewTaskPage.routerName);
                  },
                ),
              ],
            ),
          ),
          appBar: AppBar(
            title: Text(
              'Atividades da Semana',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
              ),
            ),
            backgroundColor: Colors.white,
          ),
          bottomNavigationBar: FFNavigationBar(
            selectedIndex: _controller.selectendTab,
            items: [
              FFNavigationBarItem(
                iconData: Icons.check_circle,
                label: 'Selecionados',
              ),
              FFNavigationBarItem(
                iconData: Icons.view_week,
                label: 'Semanal',
              ),
              FFNavigationBarItem(
                iconData: Icons.calendar_today,
                label: 'Selecionar Data',
              ),
            ],
            onSelectTab: (index) => _controller.changeSelectend(index),
            theme: FFNavigationBarTheme(
              itemWidth: 60,
              barHeight: 70,
              barBackgroundColor: Theme.of(context).primaryColor,
              unselectedItemIconColor: Colors.white,
              unselectedItemLabelColor: Colors.white,
              selectedItemBorderColor: Colors.white,
              selectedItemIconColor: Colors.white,
              selectedItemBackgroundColor: Theme.of(context).primaryColor,
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: ListView.builder(
                
                itemCount: _controller.listTodos?.keys?.length ?? 0,
                itemBuilder: (_, index) {
                  var dateFormat = DateFormat('dd/mm/yyyy');
                          var listTodos = _controller.listTodos;
                          var dayKey = listTodos.keys.elementAt(index);
                          var day = dayKey;
                          var todos = listTodos[dayKey];
                          var today = DateTime.now();

                          if (dayKey == dateFormat.format(today)) {
                            day = 'HOJE';
                          } else if (dayKey == dateFormat.format(today.add(Duration(days: 1)))) {
                            day = 'AMANHÃ';
                          }
                  return Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                          right: 20,
                          top: 20,
                        ),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                day,
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.add_circle,
                                size: 30,
                                color: Theme.of(context).primaryColor,
                              ),
                              onPressed: () {
                                Navigator.of(context).pushNamed(NewTaskPage.routerName);
                              },
                            )
                          ],
                        ),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 5,
                        itemBuilder: (_, index) {
                          

                          return ListTile(
                            leading: Checkbox(
                              value: false,
                              onChanged: (bool value) {},
                            ),
                            title: Text(
                              'Tarefa X',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                // ignore: dead_code
                                decoration: true ? TextDecoration.lineThrough : null,
                              ),
                            ),
                            trailing: Text(
                              '06:00',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                // ignore: dead_code
                                decoration: true ? TextDecoration.lineThrough : null,
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
