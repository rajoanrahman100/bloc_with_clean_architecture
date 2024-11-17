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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB5tUB_qf_1m5qYbgj_fzf7m3aQHtNDe7E',
    appId: '1:1070554179849:android:e0d77cefce51fc876f4bd8',
    messagingSenderId: '1070554179849',
    projectId: 'imam-development-programme',
    storageBucket: 'imam-development-programme.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBlNv_k5ixO-sgeSBxilocrC-wSaCNDBE0',
    appId: '1:1070554179849:ios:ba82ec42df0b6c616f4bd8',
    messagingSenderId: '1070554179849',
    projectId: 'imam-development-programme',
    storageBucket: 'imam-development-programme.firebasestorage.app',
    iosClientId: '1070554179849-r4fg4k1e3q6q00h7l40h2tf9m4ulc7ij.apps.googleusercontent.com',
    iosBundleId: 'com.rifat.flutterBlocCleanArchFirebase',
  );
}