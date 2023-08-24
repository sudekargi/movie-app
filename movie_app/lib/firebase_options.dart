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
    apiKey: 'AIzaSyCkYRPkheXlR___O_WZfx5ouHE7ZwzkQJ0',
    appId: '1:160799297490:web:471aa1481fbb00b252820b',
    messagingSenderId: '160799297490',
    projectId: 'movie-app-af2c5',
    authDomain: 'movie-app-af2c5.firebaseapp.com',
    storageBucket: 'movie-app-af2c5.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA87kI0u_26tjO1vifbsQqxAuoZSdhAqyw',
    appId: '1:160799297490:android:be5083e50ed4692252820b',
    messagingSenderId: '160799297490',
    projectId: 'movie-app-af2c5',
    storageBucket: 'movie-app-af2c5.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAzx4F9Ss5lMuY0Ls9pLgPr0rRO2BGerRc',
    appId: '1:160799297490:ios:ca30629b9d252fe352820b',
    messagingSenderId: '160799297490',
    projectId: 'movie-app-af2c5',
    storageBucket: 'movie-app-af2c5.appspot.com',
    iosClientId: '160799297490-pcpe24no4gkkvr916noi1kmip4gfbhkr.apps.googleusercontent.com',
    iosBundleId: 'com.example.movieApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAzx4F9Ss5lMuY0Ls9pLgPr0rRO2BGerRc',
    appId: '1:160799297490:ios:b0374726103598aa52820b',
    messagingSenderId: '160799297490',
    projectId: 'movie-app-af2c5',
    storageBucket: 'movie-app-af2c5.appspot.com',
    iosClientId: '160799297490-c4532mhblru358pu08i696gfbjfl76tr.apps.googleusercontent.com',
    iosBundleId: 'com.example.movieApp.RunnerTests',
  );
}
