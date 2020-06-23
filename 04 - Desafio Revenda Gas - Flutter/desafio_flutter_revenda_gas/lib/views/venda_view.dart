import 'package:desafio_flutter_revenda_gas/models/revenda_model.dart';
import 'package:desafio_flutter_revenda_gas/shareds/functions_shared.dart';
import 'package:flutter/material.dart';

class VendaView extends StatefulWidget {
  final RevendaModel revenda;
  VendaView({
    Key key,
    this.revenda,
  }) : super(key: key);

  @override
  _VendaViewState createState() => _VendaViewState();
}

class _VendaViewState extends State<VendaView> {
  // final _controller = VendaController();
  int qtd = 1;
  String valorTotal;
  final FunctionsShared _shared = FunctionsShared();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEEEEEE),
      appBar: AppBar(
        elevation: 5,
        centerTitle: true,
        title: Text(
          'Selecionar Produtos',
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              top: 12,
              right: 12,
            ),
            child: Text(
              '?',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.start,
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            _pagamento(),
            _valores(),
            _informacaoRevenda(),
            _selecaoQtd(),
            Expanded(
              child: Container(),
            ),
            _botao(),
          ],
        ),
      ),
    );
  }

  Widget _pagamento() {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 4.0,
      ),
      child: Container(
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(25),
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(100),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 0,
                          offset: Offset(0, 1),
                          spreadRadius: 12,
                          color: Color(0xffE0E0E0),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 15,
                    top: 5,
                  ),
                  child: Text('Comprar'),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 40,
              ),
              child: Text('____________'),
            ),
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(25),
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(
                          color: Color(0xffB7B7B7),
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 15,
                    top: 5,
                  ),
                  child: Text('Pagamento'),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 40,
              ),
              child: Text('____________'),
            ),
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(25),
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(
                          color: Color(0xffB7B7B7),
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 15,
                    top: 5,
                  ),
                  child: Text('Comfirmação'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _valores() {
    //int qtd;
    return Container(
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: _shared.convertCor(widget.revenda.cor),
                borderRadius: BorderRadius.circular(100),
               
              ),
              child: Center(
                child: Text(
                  qtd.toString(),
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Text('${widget.revenda.nome} - Botijão de 13kg'),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                'R\$ ',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 8.0,
                ),
                child: Text(
                  valorTotal ?? _shared.formatCurrency(widget.revenda.preco),
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _informacaoRevenda() {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
        right: 10,
        left: 10,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Icon(
                Icons.home,
                color: Color(0xff9E9E9E),
                size: 40,
              ),
              Column(
                children: <Widget>[
                  Text(
                    widget.revenda.nome,
                  ),
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          widget.revenda.nota.toString(),
                        ),
                      ),
                      Icon(
                        Icons.star,
                        color: Color(0xffFFEB55),
                        size: 10,
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                  bottom: 0.8,
                  left: 0.8,
                  right: 8.0,
                ),
                child: Row(
                  children: <Widget>[
                    Text(
                      widget.revenda.tempoMedio,
                    ),
                    Text(
                      'min',
                      style: TextStyle(fontSize: 10),
                    ),
                  ],
                ),
              ),
              Container(
                  height: 25,
                  width: 90,
                  color: _shared.convertCor(widget.revenda.cor),
                  child: Center(
                    child: Text(
                      widget.revenda.tipo,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Widget _selecaoQtd() {
    return Padding(
      padding: const EdgeInsets.only(
        top: 2,
        right: 10,
        left: 10,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(5),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: <Widget>[
              SizedBox(
                width: 20,
              ),
              Column(
                children: <Widget>[
                  Text('Botijão 13kg'),
                  Text(
                    widget.revenda.nome,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        'R\$ ',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          right: 8.0,
                        ),
                        child: Text(
                          _shared.formatCurrency(widget.revenda.preco),
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Expanded(
                child: Container(),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    if (qtd > 1) {
                      qtd--;
                      valorTotal = valor();
                    }
                  });
                },
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Color(0xff9E9E9E),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Center(
                    child: Text(
                      '-',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
              ),
              Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 70,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/prod_icon-gas.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    width: 20,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Color(0xffFE992A),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        qtd.toString(),
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    qtd++;
                    valorTotal = valor();
                  });
                },
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Color(0xff9E9E9E),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Center(
                    child: Text(
                      '+',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
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

  Widget _botao() {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 20,
      ),
      child: GestureDetector(
        onTap: () => print('click'),
        child: Container(
          width: 200,
          height: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35),
            color: Colors.blue[700], //64B5F6 1976D2
            gradient: LinearGradient(
              colors: [_shared.convertCor('64B5F6'), _shared.convertCor('1976D2')],
            ),
          ),
          child: Center(
            child: Text(
              'IR PARA O PAGAMENTO',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ),
        ),
      ),
    );
  }

  String valor() {
    var shared = FunctionsShared();
    return shared.formatCurrency(widget.revenda.preco * qtd);
  }
}
