// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDf4Oj2iijUPAuQU00nf_tI_1TvM872VrU',
    appId: '1:418908849899:web:7c321d6ee3726bf102a0ae',
    messagingSenderId: '418908849899',
    projectId: 'campus-iq-app',
    authDomain: 'campus-iq-app.firebaseapp.com',
    storageBucket: 'campus-iq-app.appspot.com',
    measurementId: 'G-2E8SNNYDST',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCSoyjA3pgDKSq8DV92Dz-_jMbDVwJYyik',
    appId: '1:418908849899:android:666c8a018f0b274702a0ae',
    messagingSenderId: '418908849899',
    projectId: 'campus-iq-app',
    storageBucket: 'campus-iq-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDBYMJlr1r2ek3vmmFXHaJLGTXEkc87PHQ',
    appId: '1:418908849899:ios:c573546821b592a402a0ae',
    messagingSenderId: '418908849899',
    projectId: 'campus-iq-app',
    storageBucket: 'campus-iq-app.appspot.com',
    iosClientId:
        '418908849899-1vaklp227vmohqa627uu75uhc49sdl20.apps.googleusercontent.com',
    iosBundleId: 'com.noonstudio.campus',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDBYMJlr1r2ek3vmmFXHaJLGTXEkc87PHQ',
    appId: '1:418908849899:ios:c573546821b592a402a0ae',
    messagingSenderId: '418908849899',
    projectId: 'campus-iq-app',
    storageBucket: 'campus-iq-app.appspot.com',
    iosClientId:
        '418908849899-1vaklp227vmohqa627uu75uhc49sdl20.apps.googleusercontent.com',
    iosBundleId: 'com.noonstudio.campus',
  );
}
