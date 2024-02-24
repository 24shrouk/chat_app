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
    apiKey: 'AIzaSyBaVpSPSEZZBo-UfyKQKSjl4Ettjb2wNzc',
    appId: '1:538189919146:web:5928056f15eac1766571d3',
    messagingSenderId: '538189919146',
    projectId: 'chat-app-f932d',
    authDomain: 'chat-app-f932d.firebaseapp.com',
    storageBucket: 'chat-app-f932d.appspot.com',
    measurementId: 'G-CRWDK8N7QC',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD8m_F4XYtO3pTF0IXrr_87laxc4eyC1mc',
    appId: '1:538189919146:android:b796dedaa27909906571d3',
    messagingSenderId: '538189919146',
    projectId: 'chat-app-f932d',
    storageBucket: 'chat-app-f932d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBV_B7Y7tw7jYaj7vMfwykUimq3j_fz-GY',
    appId: '1:538189919146:ios:f0e3579c2fb0f1666571d3',
    messagingSenderId: '538189919146',
    projectId: 'chat-app-f932d',
    storageBucket: 'chat-app-f932d.appspot.com',
    iosBundleId: 'com.example.newChatApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBV_B7Y7tw7jYaj7vMfwykUimq3j_fz-GY',
    appId: '1:538189919146:ios:b1741672702f00fd6571d3',
    messagingSenderId: '538189919146',
    projectId: 'chat-app-f932d',
    storageBucket: 'chat-app-f932d.appspot.com',
    iosBundleId: 'com.example.newChatApp.RunnerTests',
  );
}