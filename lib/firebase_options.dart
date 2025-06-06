// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyAVoFjMcz1QxcQhUgq_fD9XM59Y9n_2AI4',
    appId: '1:419889747427:web:a6bd44c4b3aa1c74bbbcd6',
    messagingSenderId: '419889747427',
    projectId: 'newportfolio-85056',
    authDomain: 'newportfolio-85056.firebaseapp.com',
    storageBucket: 'newportfolio-85056.firebasestorage.app',
    measurementId: 'G-BPBM8WEYCK',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAWyZr3QjbDm2j3akQ6q61T7g1hFH5XzRs',
    appId: '1:419889747427:android:33c670217431bbe0bbbcd6',
    messagingSenderId: '419889747427',
    projectId: 'newportfolio-85056',
    storageBucket: 'newportfolio-85056.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyApTve1xdbfxc0jzGE9zHGs7VgmEG1vGaI',
    appId: '1:419889747427:ios:d2edb68e48551fecbbbcd6',
    messagingSenderId: '419889747427',
    projectId: 'newportfolio-85056',
    storageBucket: 'newportfolio-85056.firebasestorage.app',
    iosBundleId: 'com.example.onlineProfile',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyApTve1xdbfxc0jzGE9zHGs7VgmEG1vGaI',
    appId: '1:419889747427:ios:d2edb68e48551fecbbbcd6',
    messagingSenderId: '419889747427',
    projectId: 'newportfolio-85056',
    storageBucket: 'newportfolio-85056.firebasestorage.app',
    iosBundleId: 'com.example.onlineProfile',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAVoFjMcz1QxcQhUgq_fD9XM59Y9n_2AI4',
    appId: '1:419889747427:web:d885d99fc0d950ffbbbcd6',
    messagingSenderId: '419889747427',
    projectId: 'newportfolio-85056',
    authDomain: 'newportfolio-85056.firebaseapp.com',
    storageBucket: 'newportfolio-85056.firebasestorage.app',
    measurementId: 'G-V3FLVKT1PK',
  );
}
