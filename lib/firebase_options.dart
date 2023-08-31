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
    apiKey: 'AIzaSyC9y5G6aPeNCfZsCvDWyd5ldRPEnSAxh-s',
    appId: '1:873474480547:web:a5187b7ec1d8c4e6dda216',
    messagingSenderId: '873474480547',
    projectId: 'coffee-app-f8ae8',
    authDomain: 'coffee-app-f8ae8.firebaseapp.com',
    storageBucket: 'coffee-app-f8ae8.appspot.com',
    measurementId: 'G-48S9RD9206',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBJvrBLcAZA1Ulp6Po0PttgRPfl2tlZbyM',
    appId: '1:873474480547:android:84d08d4f88b87624dda216',
    messagingSenderId: '873474480547',
    projectId: 'coffee-app-f8ae8',
    storageBucket: 'coffee-app-f8ae8.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAAN7hSAsMEoOop9aQpfX7w6C3fw7FwCMI',
    appId: '1:873474480547:ios:b0672731db92ed49dda216',
    messagingSenderId: '873474480547',
    projectId: 'coffee-app-f8ae8',
    storageBucket: 'coffee-app-f8ae8.appspot.com',
    iosClientId: '873474480547-pmvctkagf0sm053ilhtukqtrkq1fvcei.apps.googleusercontent.com',
    iosBundleId: 'com.example.coffeeApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAAN7hSAsMEoOop9aQpfX7w6C3fw7FwCMI',
    appId: '1:873474480547:ios:5e8582bac1fea17cdda216',
    messagingSenderId: '873474480547',
    projectId: 'coffee-app-f8ae8',
    storageBucket: 'coffee-app-f8ae8.appspot.com',
    iosClientId: '873474480547-radugrt0osqgsp3ud41q10rvoqlhei64.apps.googleusercontent.com',
    iosBundleId: 'com.example.coffeeApp.RunnerTests',
  );
}