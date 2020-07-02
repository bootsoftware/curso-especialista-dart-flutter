import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/app/controllers/new_task_controller.dart';
import 'package:todo_list/app/shareds/timer_component.dart';

class NewTaskPage extends StatefulWidget {
  static String routerName = '/new';

  @override
  _NewTaskPageState createState() => _NewTaskPageState();
}

class _NewTaskPageState extends State<NewTaskPage> {
  var _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      //   Provider.of<NewTaskController>(context, listen: false).addListener(() {});
      context.read<NewTaskController>().addListener(() {
        var _controller = context.read<NewTaskController>();

        if (_controller.error != null) {
          _scaffoldKey.currentState.showSnackBar(SnackBar(
            content: Text(_controller.error),
          ));
        }

        if (_controller.saved) {
          _scaffoldKey.currentState.showSnackBar(SnackBar(
            backgroundColor: Colors.green,
            duration: Duration(seconds: 1),
            content: Text(
              'Tarefa Cadastrada com Sucesso!',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ));
          Future.delayed(Duration(seconds: 1), () => Navigator.pop(context));
        }
      });
    });
  }

  @override
  void dispose() {
    // context.read<NewTaskController>().removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NewTaskController>(
      builder: (BuildContext context, _controller, _) {
        return Scaffold(
          key: _scaffoldKey,
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
          ),
          body: SingleChildScrollView(
            child: Form(
              key: _controller.formKey,
              child: Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'NOVA TAREFA',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Data',
                      style: TextStyle(
                        color: Colors.grey[800],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      _controller.dayFormatend,
                      style: TextStyle(
                        color: Colors.grey[800],
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Nome da Tarefa',
                      style: TextStyle(
                        color: Colors.grey[800],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      controller: _controller.nameTaskController,
                      validator: (value) => _controller.valideteNameNowTask(),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Hora',
                      style: TextStyle(
                        color: Colors.grey[800],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TimerComponent(
                        date: _controller.dateSelectend,
                        onSelectendTime: (date) {
                          _controller.dateSelectend = date;
                        }),
                    SizedBox(
                      height: 50,
                    ),
                    _buidButton(_controller),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buidButton(NewTaskController _controller) {
    return Center(
      child: InkWell(
        onTap: () => _controller.saved ? _controller.save() : null,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          curve: Curves.decelerate,
          width: _controller.saved ? 80 : MediaQuery.of(context).size.width,
          height: _controller.saved ? 80 : 40,
          decoration: BoxDecoration(
            borderRadius: _controller.saved ? BorderRadius.circular(100) : BorderRadius.circular(0),
            color: Theme.of(context).primaryColor,
            boxShadow: [
              _controller.saved
                  ? BoxShadow(
                      offset: Offset(2, 2),
                      blurRadius: 30,
                      color: Theme.of(context).primaryColor,
                    )
                  : BoxShadow(
                      offset: Offset(2, 2),
                      blurRadius: 1,
                      color: Theme.of(context).primaryColor,
                    ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: !_controller.saved ? 0 : 80,
                child: AnimatedOpacity(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInBack,
                  opacity: !_controller.saved ? 0 : 1,
                  child: Icon(
                    Icons.check,
                    color: Colors.white,
                  ),
                ),
              ),
              Visibility(
                visible: !_controller.saved,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      'Salvar',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
