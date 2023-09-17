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
    apiKey: 'AIzaSyClD4_ilxE5JgdoRclvsqCxBt5Gh-XxeAU',
    appId: '1:364370909646:web:c5752f6bd2bb790b1db39f',
    messagingSenderId: '364370909646',
    projectId: 'chat-app-7be19',
    authDomain: 'chat-app-7be19.firebaseapp.com',
    storageBucket: 'chat-app-7be19.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAL-IyRwAH7KHAXfHF-bmadJMT4ZvyXoPw',
    appId: '1:364370909646:android:b02ae7d9f4e523671db39f',
    messagingSenderId: '364370909646',
    projectId: 'chat-app-7be19',
    storageBucket: 'chat-app-7be19.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBb-MqbQFU1gy3Xpo4I2Zv9hB52E996OoM',
    appId: '1:364370909646:ios:b6c2829488bff5f91db39f',
    messagingSenderId: '364370909646',
    projectId: 'chat-app-7be19',
    storageBucket: 'chat-app-7be19.appspot.com',
    iosClientId: '364370909646-n0o1ujejghu6phe4kg404i7ppo2grurc.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBb-MqbQFU1gy3Xpo4I2Zv9hB52E996OoM',
    appId: '1:364370909646:ios:0065e8da343146961db39f',
    messagingSenderId: '364370909646',
    projectId: 'chat-app-7be19',
    storageBucket: 'chat-app-7be19.appspot.com',
    iosClientId: '364370909646-g835r0qe7l02icsn80lpuilqp2j61rrl.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatApp.RunnerTests',
  );
}
