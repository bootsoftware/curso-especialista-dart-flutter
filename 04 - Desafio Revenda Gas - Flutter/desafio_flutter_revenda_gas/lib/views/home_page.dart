import 'package:desafio_flutter_revenda_gas/models/revenda_model.dart';
import 'package:desafio_flutter_revenda_gas/shareds/functions_shared.dart';
import 'package:desafio_flutter_revenda_gas/views/venda_view.dart';
import 'package:flutter/material.dart';
import 'package:desafio_flutter_revenda_gas/repository/revendas_repository.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final RevendasRepository _repository = RevendasRepository();
  final FunctionsShared _shared = FunctionsShared();
  List<RevendaModel> _revendas;
 final _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    // this._revendas = await this._repository.loadJson();
    _repository.loadJson().then((value) {
      this.setState(() {
        this._revendas = value;
      });
    });
  }

  bool nota = false;
  bool maisRapido = false;
  bool maisBarato = true;
  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: Text('Escolha uma Revenda'),
      actions: <Widget>[
        _buildPopupMenuButtonFiltro(),
        _buildPopupMenuButtonHelp(),
      ],
    );
    return Scaffold(
      backgroundColor: Color(0xffEEEEEE),
      appBar: appBar,
      body: Column(
        children: <Widget>[
          _buildContainerEndereco(),
          SizedBox(height: 5),
          Expanded(
            child: Container(
              child: ListView.builder(
                controller: _controller,
                  itemCount: _revendas?.length ?? 0,
                  itemBuilder: (_, index) {
                    return _buildRvenda(_revendas[index]);
                  }),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRvenda(RevendaModel revenda) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => VendaView(revenda: revenda),
            ),
          );
        },
        child: Row(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height / 6,
              width: MediaQuery.of(context).size.height / 20,
              decoration: BoxDecoration(
                color: _shared.convertCor(revenda.cor),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(5),
                  topLeft: Radius.circular(5),
                ),
              ),
              child: RotatedBox(
                quarterTurns: -1,
                child: Text(
                  revenda.tipo,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                  height: MediaQuery.of(context).size.height / 6,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(5),
                      topRight: Radius.circular(5),
                    ),
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 10,
                          left: 10,
                        ),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Text(revenda.nome),
                            ),
                            revenda.melhorPreco ? _buildMelhorPreco() : Container(),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            SizedBox(
                              height: 20,
                            ),
                            Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 6),
                                  child: Text(
                                    'Nota',
                                    style: TextStyle(
                                      color: Color(0xff9E9E9E),
                                    ),
                                  ),
                                ),
                                Row(
                                  children: <Widget>[
                                    Text(
                                      revenda.nota.toString(),
                                      style: TextStyle(
                                        fontSize: 23,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Color(0xffFFEB55),
                                    ),
                                  ],
                                )
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
                                    RichText(
                                      text: TextSpan(
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                        children: [
                                          TextSpan(
                                            text: revenda.tempoMedio,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                            ),
                                          ),
                                          TextSpan(
                                            text: 'min',
                                            style: TextStyle(
                                              color: Color(0xff9E9E9E),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )
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
                                Row(
                                  children: <Widget>[
                                    Text(
                                      _shared.formatCurrency(revenda.preco, 'R\$'),
                                      style: TextStyle(
                                        fontSize: 23,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMelhorPreco() {
    return Container(
      width: 100,
      height: 35,
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

  Container _buildContainerEndereco() {
    return Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Botijão de 13kg em:',
                      style: TextStyle(
                        color: Color(0xff9E9E9E),
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      'Av Paulista, 1001',
                      style: TextStyle(
                        color: Color(0xff222222),
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      'Paulista, São Paulo, SP',
                      style: TextStyle(
                        color: Color(0xff9E9E9E),
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: <Widget>[
                  Icon(
                    Icons.location_on,
                    color: Color(0xff2196F3),
                    size: 35,
                  ),
                  Text(
                    'Mudar',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.blue,
                    ),
                  )
                ],
              ),
            ],
          ),
        ));
  }

  PopupMenuButton _buildPopupMenuButtonFiltro() {
    return PopupMenuButton(
      icon: Icon(
        Icons.swap_vert,
      ),
      itemBuilder: (BuildContext context) {
        return [
          _buildPopupMenuItemNota(),
          _buildPopupMenuItemMaisRapido(),
          _buildPopupMenuItemMaisBarato(),
        ];
      },
    );
  }

  PopupMenuButton _buildPopupMenuButtonHelp() {
    return PopupMenuButton(
      child: Padding(
        padding: const EdgeInsets.only(
          top: 12,
          right: 12,
        ),
        child: Text(
          '?',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      itemBuilder: (BuildContext context) {
        return [
          _buildPopupMenuItemSuport(),
          _buildPopupMenuItemTermo(),
        ];
      },
    );
  }

  PopupMenuItem _buildPopupMenuItemTermo() {
    return PopupMenuItem(
      child: GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: Text(
          'Termo de Serviço',
          style: TextStyle(
            color: Color(0xff2196F3),
          ),
        ),
      ),
    );
  }

  PopupMenuItem _buildPopupMenuItemSuport() {
    return PopupMenuItem(
      child: GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: Text(
          'Suporte',
          style: TextStyle(
            color: Color(0xff2196F3),
          ),
        ),
      ),
    );
  }

  PopupMenuItem _buildPopupMenuItemNota() {
    return PopupMenuItem(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text('Melhor Avaliação'),
          ),
          Checkbox(
            value: nota,
            onChanged: (bool value) {
              setState(() {
                nota = value;
                maisRapido = false;
                maisBarato = false;
              });
              ordenar();
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  PopupMenuItem _buildPopupMenuItemMaisRapido() {
    return PopupMenuItem(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text('Mais Rápido'),
          ),
          Checkbox(
            value: maisRapido,
            onChanged: (bool value) {
              setState(() {
                maisRapido = value;
                nota = false;
                maisBarato = false;
              });
              ordenar();
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  PopupMenuItem _buildPopupMenuItemMaisBarato() {
    return PopupMenuItem(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text('Mais Barato'),
          ),
          Checkbox(
            value: maisBarato,
            onChanged: (bool value) {
              setState(() {
                maisBarato = value;
                nota = false;
                maisRapido = false;
              });
              ordenar();
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  void ordenar() {
    if (nota) {
      _revendas.sort((a, b) {
        return a.nota.compareTo(b.nota);
      });
    } else if (maisRapido) {
      _revendas.sort((a, b) {
        return a.tempoMedio.compareTo(b.tempoMedio);
      });
    } else {
      _revendas.sort((a, b) {
        return a.preco.compareTo(b.preco);
      });
    }
    _controller.animateTo(_controller.offset - _revendas.length , 
    curve: Curves.linear, duration: Duration(milliseconds: 500));
  }
}
