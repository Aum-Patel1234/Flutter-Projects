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
    apiKey: 'AIzaSyBlngHaY-tgaKLuLuanegMttnJJkrk8CVo',
    appId: '1:160921869350:web:2419a3ca8318eedb0f5ae7',
    messagingSenderId: '160921869350',
    projectId: 'flutter-chat-app-151e5',
    authDomain: 'flutter-chat-app-151e5.firebaseapp.com',
    storageBucket: 'flutter-chat-app-151e5.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAsZbLkisj8BkSsrCS1HFQtSy71zrVQnik',
    appId: '1:160921869350:android:db7d28691b8f893c0f5ae7',
    messagingSenderId: '160921869350',
    projectId: 'flutter-chat-app-151e5',
    storageBucket: 'flutter-chat-app-151e5.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDNhKW1OG1GFAYNwqHBS1VRzPxMKNpOtos',
    appId: '1:160921869350:ios:09e518c5c45bebc70f5ae7',
    messagingSenderId: '160921869350',
    projectId: 'flutter-chat-app-151e5',
    storageBucket: 'flutter-chat-app-151e5.appspot.com',
    iosBundleId: 'com.aumpatelwhatsappclone.whatsappClone',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDNhKW1OG1GFAYNwqHBS1VRzPxMKNpOtos',
    appId: '1:160921869350:ios:09e518c5c45bebc70f5ae7',
    messagingSenderId: '160921869350',
    projectId: 'flutter-chat-app-151e5',
    storageBucket: 'flutter-chat-app-151e5.appspot.com',
    iosBundleId: 'com.aumpatelwhatsappclone.whatsappClone',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBlngHaY-tgaKLuLuanegMttnJJkrk8CVo',
    appId: '1:160921869350:web:211fce27b9268fd00f5ae7',
    messagingSenderId: '160921869350',
    projectId: 'flutter-chat-app-151e5',
    authDomain: 'flutter-chat-app-151e5.firebaseapp.com',
    storageBucket: 'flutter-chat-app-151e5.appspot.com',
  );
}
