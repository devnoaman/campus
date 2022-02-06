import 'package:campus/compunents/appbar.dart';
import 'package:campus/helpers/helpers.dart';
import 'package:campus/providers/app_language.dart';
import 'package:campus/providers/screens_provider.dart';
import 'package:campus/screens/home_screen/my_home_screen.dart';
import 'package:campus/screens/news/news.dart';
import 'package:campus/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

List<Widget> widgets = [MyHomeScreen(), News(), SizedBox()];

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer2<Screen, AppLanguage>(
        builder: (context, provider, lang, _) {
      return Scaffold(
        key: provider.scaffoldKey,
        // drawer: Drawer(),
        appBar: PreferredSize(
          child: const MyAppBar(),
          preferredSize: getSize(context) * 0.08,
        ),
        body: widgets[provider.activeScreen],
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.document_scanner_sharp),
              label: 'News',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.camera),
              label: 'Discover',
            ),
          ],
          currentIndex: provider.activeScreen,
          selectedItemColor: kPrimaryColor,
          onTap: (index) {
            provider.increment(index);
          },
        ),
      );
    });
  }
}
