import 'package:campus/base.dart';
import 'package:campus/providers/app_language.dart';
import 'package:campus/providers/screens_provider.dart';
import 'package:campus/screens/calender/calender.dart';
import 'package:campus/screens/discover/discover_screen.dart';
import 'package:campus/screens/home.dart';
import 'package:campus/screens/notifications/notifications.dart';
import 'package:campus/screens/other_screens/change_language.dart';
import 'package:campus/screens/webview/webview.dart';
import 'package:campus/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<Screen>(create: (_) => Screen()),
      ChangeNotifierProvider<AppLanguage>(create: (_) => AppLanguage()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('main.dart rebuilded');
    return MaterialApp(
      localizationsDelegates: [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('ar', 'AE'), // OR Locale('ar', 'AE') OR Other RTL locales
        Locale('en', 'US'), // OR Locale('ar', 'AE') OR Other RTL locales
      ],
      locale: Provider.of<AppLanguage>(context).appLocal,

      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => const BaseWidget(),
        '/lan': (context) => const LanguageChange(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/Notifications': (context) => const Notifactions(),
        '/discover': (context) => const Discover(),
        '/web': (context) => const WebView(),
        '/calender': (context) => const Calender()
      },
      title: 'Campus',
      debugShowCheckedModeBanner: false,

      theme: appTheme(),
      // home: const Home(),
    );
  }
}
