import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Container(
            color: Colors.white,
          ),
          Container(
            height: MediaQuery.of(context).size.height * .3,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Color.fromRGBO(0, 64, 96, 1),
                Color.fromRGBO(0, 32, 50, 1),
              ]),
            ),
            child: Center(
              child: Container(
                width: 130,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'lib/assets/inter_logo.png',
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 150,
            child: Container(
              height: MediaQuery.of(context).size.height * .29,
              width: MediaQuery.of(context).size.height * .55,
              margin: EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0XFFF6F7FB),
              ),
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: CircleAvatar(
                                backgroundColor: Color(0XFFD1D5E4),
                                radius: 30,
                                child: Text(
                                  'WR',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Operador',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey[500],
                                      fontSize: 15,
                                    ),
                                  ),
                                  Text(
                                    '1234-12',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey[500],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Spacer(),
                            Container(
                              height: 35,
                              width: 90,
                              child: Center(
                                child: Text(
                                  'TROCAR',
                                  style: TextStyle(
                                      // fontWeight: FontWeight.bold,
                                      //color: Colors.grey[500],
                                      ),
                                ),
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Color(0XFFD1D5E4),
                                ),
                                //color: Colors.red,
                              ),
                            )
                          ],
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * .10,
                          width: MediaQuery.of(context).size.height * .35,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [
                              Color.fromRGBO(0, 64, 96, 1),
                              Color.fromRGBO(0, 32, 50, 1),
                            ]),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              'ENTRAR',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 370,
            child: Container(
              height: MediaQuery.of(context).size.height * .18,
              width: MediaQuery.of(context).size.height * .55,
              margin: EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0XFFF6F7FB),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: <Widget>[
                    Image.asset('lib/assets/escudo_inter.png'),
                    Text(
                      'i-',
                      style: TextStyle(
                        color: Color(0XFF73737D),
                        fontSize: 30,
                      ),
                    ),
                    Text(
                      'Safe',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0XFF73737D),
                        fontSize: 30,
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  _buildContainerBolinha(),
                                  _buildContainerBolinha(),
                                  _buildContainerBolinha(),
                                  _buildContainerBolinha(),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Gerar',
                            style: TextStyle(
                              //  fontWeight: FontWeight.bold,
                              color: Color(0XFF73737D),
                              fontSize: 15,
                            ),
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
    );
  }

  Widget _buildContainerBolinha() {
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        border: Border.all(
          color: Color(0XFFFE6829),
          width: 3,
        ),
        borderRadius: BorderRadius.circular(100),
      ),
    );
  }
}
