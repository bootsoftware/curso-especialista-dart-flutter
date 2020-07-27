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
          floatingActionButton: FloatingActionButton(onPressed: () => _controller.execultar()),
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
              _controller.titleAppBar,
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
                label: 'Finalizados',
              ),
              FFNavigationBarItem(
                iconData: Icons.indeterminate_check_box,
                label: 'Abertos',
              ),
              FFNavigationBarItem(
                iconData: Icons.view_week,
                label: 'Semanal',
              ),
              FFNavigationBarItem(
                iconData: Icons.calendar_today,
                label: 'Data',
              ),
            ],
            onSelectTab: (index) => _controller.changeSelectend(context, index),
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
              child: _controller.loading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.builder(
                      itemCount: _controller.listTodos?.keys?.length ?? 0,
                      itemBuilder: (_, index) {
                        var dateFormat = DateFormat('dd/MM/yyyy');
                        var listTodos = _controller.listTodos;
                        var dayKey = listTodos.keys.elementAt(index);
                        var day = dayKey;
                        var todos = listTodos[dayKey];
                        var today = DateTime.now();

                        if (dayKey == dateFormat.format(today.subtract(Duration(days: 1)))) {
                          day = 'ONTEM';
                        } else if (dayKey == dateFormat.format(today)) {
                          day = 'HOJE';
                        } else if (dayKey == dateFormat.format(today.add(Duration(days: 1)))) {
                          day = 'AMANHÃ';
                        }
                        if (todos.isEmpty && _controller.selectendTab == 0) {
                          return SizedBox.shrink();
                        } else if (todos.isEmpty && _controller.selectendTab == 1) {
                          return SizedBox.shrink();
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
                                    onPressed: () async {
                                      await Navigator.of(context).pushNamed(NewTaskPage.routerName, arguments: dayKey);
                                      _controller.updateList();
                                    },
                                  )
                                ],
                              ),
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: todos.length,
                              itemBuilder: (_, index) {
                                var todo = todos[index];

                                return ListTile(
                                    leading: Checkbox(
                                      activeColor: Theme.of(context).primaryColor,
                                      value: todo.finalizado,
                                      onChanged: (bool value) => _controller.checkendOrUnCheck(todo),
                                    ),
                                    title: Text(
                                      todo.descricao,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        // ignore: dead_code
                                        decoration: todo.finalizado ? TextDecoration.lineThrough : null,
                                      ),
                                    ),
                                    // onLongPress: () => _controller.delete(),
                                    trailing: // !_controller.excluir
                                        //  ?
                                        Text(
                                      '${todo.dataHora.hour.toString().padLeft(2, '0')}:${todo.dataHora.minute.toString().padLeft(2, '0')}',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        // ignore: dead_code
                                        decoration: todo.finalizado ? TextDecoration.lineThrough : null,
                                      ),
                                    )
                                    // : Container(
                                    //     width: 10,
                                    //     height: 10,
                                    //     color: Colors.red,
                                    //   ),
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
