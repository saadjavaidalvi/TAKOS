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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyBvHMiSqB5-Dt3xWyH2AyXb7wrLS1FE1Kw',
    appId: '1:1086666682711:web:ee7ed2231be7440fe4ce12',
    messagingSenderId: '1086666682711',
    projectId: 'takos-7179e',
    authDomain: 'takos-7179e.firebaseapp.com',
    databaseURL: 'https://takos-7179e-default-rtdb.firebaseio.com',
    storageBucket: 'takos-7179e.appspot.com',
    measurementId: 'G-S347WWD043',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA6v-uAwOV-mKEWL4eerKSC_rIBA8dLRv4',
    appId: '1:1086666682711:android:55a82906f3f2fb38e4ce12',
    messagingSenderId: '1086666682711',
    projectId: 'takos-7179e',
    databaseURL: 'https://takos-7179e-default-rtdb.firebaseio.com',
    storageBucket: 'takos-7179e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBb0It_NJ7e5FcvorNZvhrDVg6ZcyIBGkE',
    appId: '1:1086666682711:ios:feb82e70b6c87ec5e4ce12',
    messagingSenderId: '1086666682711',
    projectId: 'takos-7179e',
    databaseURL: 'https://takos-7179e-default-rtdb.firebaseio.com',
    storageBucket: 'takos-7179e.appspot.com',
    iosClientId: '1086666682711-cnllnj3pnmo6nqatv56al310ehb6tmmq.apps.googleusercontent.com',
    iosBundleId: 'com.example.takos',
  );
}
