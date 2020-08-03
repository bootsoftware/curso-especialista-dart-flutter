import 'package:cuidapet/app/shareds/theme/theme_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeUtils.primaryColor,
      body: Stack(
        children: <Widget>[
          Container(
            width: ScreenUtil().,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage('lib/assets/images/login_background.png'),
            )),
          )
        ],
      ),
    );
  }
}
