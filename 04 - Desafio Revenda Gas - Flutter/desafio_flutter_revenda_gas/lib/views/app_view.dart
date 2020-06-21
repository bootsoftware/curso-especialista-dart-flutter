import 'package:flutter/material.dart';

import 'home_view.dart';

class AppView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,       
      ),
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}
