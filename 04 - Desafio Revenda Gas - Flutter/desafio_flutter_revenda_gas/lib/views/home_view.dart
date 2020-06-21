
import 'package:desafio_flutter_revenda_gas/controllers/home_controller.dart';
import 'package:desafio_flutter_revenda_gas/models/revenda_model.dart';
import 'package:desafio_flutter_revenda_gas/views/venda_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _controller = HomeController();
  @override
  void initState() {
    super.initState();
    this.setState(() {
      _controller.loadJson();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEEEEEE),
      appBar: appBar,
      body: Container(
        child: Column(
          children: <Widget>[
            _endereco(),
            _listView(_controller,  context),
          ],
        ),
      ),
    );
  }
}

final appBar = AppBar(
  elevation: 5,
  actions: <Widget>[
    PopupMenuButton(
      icon: Icon(
        Icons.swap_vert,
      ),
      itemBuilder: (BuildContext context) {
        return [
          PopupMenuItem(
            child: Row(
              //  mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Expanded(
                  child: Text(
                    'Melhor Avaliação',
                    style: TextStyle(
                      color: Color(0xff2196F3),
                    ),
                  ),
                ),
                Checkbox(
                  value: false,
                  onChanged: (bool value) {},
                ),
              ],
            ),
          ),
          PopupMenuItem(
            child: Row(
              //  mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Expanded(
                  child: Text(
                    'Mais Rápido',
                    style: TextStyle(
                      color: Color(0xff2196F3),
                    ),
                  ),
                ),
                Checkbox(
                  value: false,
                  onChanged: (bool value) {},
                ),
              ],
            ),
          ),
          PopupMenuItem(
            child: Row(
              //  mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Expanded(
                  child: Text(
                    'Mais Barato',
                    style: TextStyle(
                      color: Color(0xff2196F3),
                    ),
                  ),
                ),
                Checkbox(
                  value: false,
                  onChanged: (bool value) {},
                ),
              ],
            ),
          ),
        ];
      },
    ),
    PopupMenuButton(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 12,
            right: 12,
          ),
          child: Text(
            '?',
            style: TextStyle(
              fontSize: 24,
              //  fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.start,
          ),
        ),
        itemBuilder: (BuildContext context) {
          return [
            PopupMenuItem(
              child: Text(
                'Suporte',
                style: TextStyle(
                  color: Color(0xff2196F3),
                ),
              ),
            ),
            PopupMenuItem(
              child: Text(
                'Termo de Serviço',
                style: TextStyle(
                  color: Color(0xff2196F3),
                ),
              ),
            ),
          ];
        }),
  ],
  title: Text(
    'Escolha uma Revenda',
    style: TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  ),
);

Widget _endereco() {
  return Container(
    child: Column(
      children: <Widget>[
        Container(
          color: Colors.white,
          height: 70,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Botijões de 13kg em :',
                      style: TextStyle(
                        color: Color(0xff9E9E9E),
                      ),
                    ),
                    Text(
                      'Rua Asteca, 51',
                      style: TextStyle(
                        color: Color(0xff222222),
                      ),
                    ),
                    Text(
                      'Vila Gilda, Santo André, São Paulo',
                      style: TextStyle(
                        color: Color(0xff9E9E9E),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Icon(
                      Icons.location_on,
                      color: Color(0xff2196F3),
                    ),
                    Text(
                      'Mudar',
                      style: TextStyle(
                        color: Color(0xff2196F3),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _listView(HomeController _controller ,BuildContext context) {
  return Expanded(
    child: Container(
      child: LayoutBuilder(
        builder: (_, constraints) {
          List<RevendaModel> revendas = _controller.revendas;
          return Container(
            child: ListView.builder(
              itemCount: _controller.revendas?.length ?? 0,
              itemBuilder: (_, index) {
                var revenda = revendas[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VendaView(revenda: _controller.revendas[index]),
                        ),
                      );
                      print(_controller.revendas[index].nome);
                    },
                    child: Row(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5),
                              bottomLeft: Radius.circular(5),
                            ),
                            color: _controller.convertCor(revenda.cor),
                          ),
                          alignment: Alignment.center,
                          height: constraints.maxHeight / 4.5,
                          width: constraints.maxHeight / 15,
                          child: RotatedBox(
                            quarterTurns: -1,
                            child: Text(
                              revenda.tipo,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: constraints.maxHeight / 4.5,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(5),
                                bottomRight: Radius.circular(5),
                              ),
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 8,
                                left: 8,
                                bottom: 8,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        revenda.nome,
                                      ),
                                      revenda.melhorPreco ? _melhorPreco() : Container(),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Column(
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.only(bottom: 8),
                                              child: Text(
                                                'Nota',
                                                style: TextStyle(
                                                  color: Color(0xff9E9E9E),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(left: 25),
                                              child: Row(
                                                children: <Widget>[
                                                  Text(
                                                    revenda.nota.toString(),
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 25,
                                                    ),
                                                  ),
                                                  Icon(
                                                    Icons.star,
                                                    color: Color(0xffFFEB55),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.only(bottom: 8),
                                              child: Text(
                                                'Tempo Médio',
                                                style: TextStyle(
                                                  color: Color(0xff9E9E9E),
                                                ),
                                              ),
                                            ),
                                            Row(
                                              children: <Widget>[
                                                Text(
                                                  revenda.tempoMedio,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 5),
                                                  child: Text(
                                                    'min',
                                                    style: TextStyle(
                                                      color: Color(0xff9E9E9E),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.only(bottom: 8),
                                              child: Text(
                                                'Preço',
                                                style: TextStyle(
                                                  color: Color(0xff9E9E9E),
                                                ),
                                              ),
                                            ),
                                            Text(
                                              _controller.formatCurrency(revenda.preco),
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 25,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    ),
  );
}

Widget _melhorPreco() {
  return Container(
    width: 100,
    height: 30,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(5),
        bottomLeft: Radius.circular(5),
      ),
      color: Color(0xFFFEAB4E),
    ),
    child: Row(
      children: <Widget>[
        Icon(
          Icons.label,
          color: Colors.white,
        ),
        Text(
          'Melhor Preço',
          style: TextStyle(
            fontSize: 12,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}
