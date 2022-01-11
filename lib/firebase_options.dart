// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars
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
    // ignore: missing_enum_constant_in_switch
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
    }

    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCaTWwYk8QXfP7B21d6-IcwZJYQkxndjWo',
    appId: '1:997347814254:web:6577d494b3516a046def7f',
    messagingSenderId: '997347814254',
    projectId: 'kbscss-46ab6',
    authDomain: 'kbscss-46ab6.firebaseapp.com',
    storageBucket: 'kbscss-46ab6.appspot.com',
    measurementId: 'G-XGK0XLR5JK',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCrttnDbKMEwlyrBRFjlACuC8YvHPEWFkI',
    appId: '1:997347814254:android:6423b63363d430846def7f',
    messagingSenderId: '997347814254',
    projectId: 'kbscss-46ab6',
    storageBucket: 'kbscss-46ab6.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDfsO81WM5e6Dwiuc-HuM8_LN1ghMzspMY',
    appId: '1:997347814254:ios:762c330eaa869a846def7f',
    messagingSenderId: '997347814254',
    projectId: 'kbscss-46ab6',
    storageBucket: 'kbscss-46ab6.appspot.com',
    iosClientId: '997347814254-4cb1m1uvkdchm5i6pvc9fikqru6tooet.apps.googleusercontent.com',
    iosBundleId: 'com.kbscss.app',
  );
}