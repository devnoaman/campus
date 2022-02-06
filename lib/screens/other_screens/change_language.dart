import 'dart:async';

import 'package:campus/screens/home.dart';
import 'package:campus/theme/app_theme.dart';
import 'package:flutter/material.dart';

class LanguageChange extends StatefulWidget {
  const LanguageChange({Key? key}) : super(key: key);

  @override
  _LanguageChangeState createState() => _LanguageChangeState();
}

class _LanguageChangeState extends State<LanguageChange>
    with TickerProviderStateMixin {
  late final AnimationController _fcontroller;

  @override
  void initState() {
    super.initState();

    Future.delayed(
      Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => Home(),
        ),
      ),
    );
  }

  // @override
  // void initState() {
  //   super.initState();
  //   // Timer(
  //   //     const Duration(seconds: 3),
  //   //     () => Navigator.pushReplacement(
  //   //         context,
  //   //         MaterialPageRoute(
  //   //             builder: (context) => IntroScreen(
  //   //                   welcome_Screen_List: list,
  //   //                   pageRoute:
  //   //                       MaterialPageRoute(builder: (context) => Home()),
  //   //                 ))));
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 250,
              height: 250,
              // color: Colors.amber,
            ),
            //     // Image.asset(
            //     //   'assets/images/nishan logo.png',
            //     //   width: 150,
            //     // ),
          ],
        ),
      ),
    );
  }
}
