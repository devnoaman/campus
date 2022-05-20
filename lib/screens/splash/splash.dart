import 'dart:async';

import 'package:campus/data/save.dart';
import 'package:campus/screens/home.dart';
import 'package:campus/screens/login/login.dart';
import 'package:campus/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Splash extends StatefulWidget {
  static const String route = '/splash';
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> with TickerProviderStateMixin {
  late final AnimationController _fcontroller;
  // late RiveAnimationController _controller;

  @override
  void initState() {
    super.initState();
    // _controller = OneShotAnimation(
    //   'bounce',
    //   autoplay: true,
    //   onStop: () {
    //     print('done');
    //   },
    //   onStart: () {
    //     print('start');

    //     setState(() {});
    //   },
    // );
    Future.delayed(
      Duration(seconds: 3),
      () async {
        var name = await getFullName();
        var stat = await getWelcome();

        // if (stat == null) {
        //   Navigator.pushReplacement(
        //     context,
        //     MaterialPageRoute(
        //       builder: (_) => IntroScreen(
        //         welcome_Screen_List: list,
        //         pageRoute: MaterialPageRoute(builder: (context) => Home()),
        //       ),
        //     ),
        //   );
        // } else

        if (name == null) {
          Navigator.of(context)
              .pushNamedAndRemoveUntil(Login.route, (route) => false);
        } else {
          Navigator.of(context)
              .pushNamedAndRemoveUntil(Home.route, (route) => false);
        }
      },
    );
  }

  @override
  void dispose() {
    // _controller.dispose();
    super.dispose();
  }

  // final List<Welcome_Screen> list = [
  //   Welcome_Screen(
  //     title: "الاف من مراكز التجميل في انتضارك",
  //     content: "ابحثي ، تحققي من التقيم  واحجزي بطريقة مبسطة جداً",
  //     imageIcon: Icons.mobile_screen_share,
  //   ),
  //   Welcome_Screen(
  //     title: "اختاري الخدمة التي تحتاجينها",
  //     content:
  //         "ببساطة وبكل سلاسة ، احجزي موعدك مع مركزك المفضل واختاري من الخدمات التي يوفرها ذلك المركز",
  //     imageIcon: Icons.search,
  //   ),
  //   Welcome_Screen(
  //     title: "اختاري ما يناسبك",
  //     content:
  //         "قارني الاسعار والتقيمات لكل مركز او خدمة واختاري منها ما يناسبك ",
  //     imageIcon: Icons.shopping_cart,
  //   ),
  // ];

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
              child: SvgPicture.asset(
                'assets/svg/folder.svg',
                // animations: const ['idle', 'curves'],
                // controllers: [_controller],
                // onInit: (_) => setState(() {}),
              ),
            ),
            //     // Image.asset(
            //     //   'assets/images/nishan logo.png',
            //     //   width: 150,
            //     // ),
            Material(
              child: Text(
                'Campus',
                style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: kPrimaryColor),
              ),
            )
          ],
        ),
      ),
    );
  }
}
