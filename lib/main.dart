// ignore_for_file: unused_local_variable

import 'package:campus/base.dart';
import 'package:campus/notifications/notifications_impl.dart';
import 'package:campus/notifications/notifications_service.dart';
import 'package:campus/providers/app_language.dart';
import 'package:campus/providers/screens_provider.dart';
import 'package:campus/screens/calender/calender.dart';
import 'package:campus/screens/discover/discover_content.dart';
import 'package:campus/screens/discover/discover_screen.dart';
import 'package:campus/screens/home.dart';
import 'package:campus/screens/login/login.dart';
import 'package:campus/screens/login/login_provider.dart';
import 'package:campus/screens/notifications/notifications.dart';
import 'package:campus/screens/other_screens/change_language.dart';
import 'package:campus/screens/splash/splash.dart';
import 'package:campus/screens/webview/webview.dart';
import 'package:campus/theme/app_theme.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' as riverpod;
import 'package:provider/provider.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

final container = riverpod.ProviderContainer();

///Receive message when app is in background solution for on message
// Future<void> backgroundHandler(RemoteMessage message) async {
//   print(message.data.toString());
//   print(message.notification!.title);
//   if (message.data["route"] == 'notifications') {
//     // Navigator.of(context).pushNamed('/notifications');
//   }
//   print(message.data["route"]);
// }

// Future<void> clickHandler(RemoteMessage message) async {
//   print(message.data["route"]);
//   print('clicked');
// }
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  // await Firebase.initializeApp();
  // NotificationServiceImpl().showNotification(message.messageId);

  print("Handling a background message: ${message.messageId}");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  final fcmToken = await FirebaseMessaging.instance.getToken();
  print(fcmToken);
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
  runApp(riverpod.UncontrolledProviderScope(
    container: container,
    child: MultiProvider(
      providers: [
        ChangeNotifierProvider<Screen>(create: (_) => Screen()),
        ChangeNotifierProvider<AppLanguage>(create: (_) => AppLanguage()),
        ChangeNotifierProvider(create: (_) => LoginProvider()),
      ],
      child: const MyApp(),
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print('main.dart rebuilded');
    return MaterialApp(
      localizationsDelegates: const [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ar', 'AE'), // OR Locale('ar', 'AE') OR Other RTL locales
        Locale('en', 'US'), // OR Locale('ar', 'AE') OR Other RTL locales
      ],
      locale: Provider.of<AppLanguage>(context).appLocal,

      initialRoute: '/splash',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        // '/': (context) => const BaseWidget(),
        '/lan': (context) => const LanguageChange(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/Notifications': (context) => const Notifactions(),
        '/discover': (context) => Discover(),
        '/web': (context) => const WebView(),
        '/discoverContent': (context) => const DiscoverContent(),
        '/calender': (context) => const Calender(),
        '/home': (context) => const BaseWidget(),
        '/splash': (context) => const Splash(),
        '/login': (context) => const Login()
      },
      title: 'Campus',
      debugShowCheckedModeBanner: false,

      theme: appTheme(),
      // home: const Home(),
    );
  }
}
