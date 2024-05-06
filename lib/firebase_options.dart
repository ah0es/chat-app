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
    apiKey: 'AIzaSyCZluM0kXeajZIgirbRCppGPI2CJX5224c',
    appId: '1:28018871315:web:e44a56db2002405ad303e6',
    messagingSenderId: '28018871315',
    projectId: 'esah-app',
    authDomain: 'esah-app.firebaseapp.com',
    storageBucket: 'esah-app.appspot.com',
    measurementId: 'G-0DBET95WK8',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBraRp6WvA3fvVga-A7vvsfK_xibzXCk4Q',
    appId: '1:28018871315:android:7511844a50403d2ad303e6',
    messagingSenderId: '28018871315',
    projectId: 'esah-app',
    storageBucket: 'esah-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAgPNK08rNRpMlt7Bnd_XjLEy2o595Wp5U',
    appId: '1:28018871315:ios:29298c0c40f232aed303e6',
    messagingSenderId: '28018871315',
    projectId: 'esah-app',
    storageBucket: 'esah-app.appspot.com',
    iosClientId: '28018871315-m991p0eergve8surlpt5tcvl0vct28qb.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAgPNK08rNRpMlt7Bnd_XjLEy2o595Wp5U',
    appId: '1:28018871315:ios:8932748c35166164d303e6',
    messagingSenderId: '28018871315',
    projectId: 'esah-app',
    storageBucket: 'esah-app.appspot.com',
    iosClientId: '28018871315-b7kth3due49693av3anliabgg1j8smim.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatApp.RunnerTests',
  );
}