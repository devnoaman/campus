import 'package:campus/providers/app_language.dart';
import 'package:campus/providers/screens_provider.dart';
import 'package:campus/screens/drawer/drawer.dart';
import 'package:campus/screens/home.dart';
import 'package:campus/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:provider/provider.dart';

class BaseWidget extends StatelessWidget {
  const BaseWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppLanguage>(builder: (context, lang, _) {
      print('zoom drawer rebuilded');

      return ZoomDrawer(
        controller: Provider.of<Screen>(context).zoomDrawer,
        style: DrawerStyle.style3,
        menuScreen: MyDrawer(),
        mainScreen: const Home(),
        borderRadius: 24.0,
        showShadow: true,
        angle: 0.0,
        menuScreenOverlayColor: kPrimaryColor,
        menuBackgroundColor: kPrimaryColor,
        // c: kPrimaryColor,
        // backgroundColor: Colors.indigo,
        slideWidth: MediaQuery.of(context).size.width * .65,
        openCurve: Curves.fastOutSlowIn,
        closeCurve: Curves.bounceIn,
        isRtl: lang.appLocal == Locale('ar'),
      );
    });
  }
}
