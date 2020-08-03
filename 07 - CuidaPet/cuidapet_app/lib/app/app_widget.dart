import 'package:cuidapet/app/shareds/theme/thema_cuidapet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: Modular.navigatorKey,
      title: 'CuidaPet',
      debugShowCheckedModeBanner: false,
      theme: ThemeCuidaPet.theme(),
      initialRoute: '/',
      onGenerateRoute: Modular.generateRoute,
    );
  }
}
