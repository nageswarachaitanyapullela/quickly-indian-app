// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
        throw UnsupportedError('DefaultFirebaseOptions not set for macOS');
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError('DefaultFirebaseOptions not set for linux');
      default:
        throw UnsupportedError(
            'DefaultFirebaseOptions not set for this platform.');
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCu8fcwVySWBohG6msdmKa8rKMvaXZOfik',
    appId: '1:459614341788:web:e8474b9ebc90f8a568fb59',
    messagingSenderId: '459614341788',
    projectId: 'quickly-indianapp',
    authDomain: 'quickly-indianapp.firebaseapp.com',
    storageBucket: 'quickly-indianapp.appspot.com',
    measurementId: 'G-YTQBMNETXK',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBUquYSIWjP2li0rUBI857bGUGab4O-DQM',
    appId: '1:459614341788:android:330d99dfdd72e9af68fb59',
    messagingSenderId: '459614341788',
    projectId: 'quickly-indianapp',
    storageBucket: 'quickly-indianapp.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDKbnXSZiYBs2LxiMv3KMSkvSKf4ArJ1k4',
    appId: '1:459614341788:ios:a9276c62d3c3115668fb59',
    messagingSenderId: '459614341788',
    projectId: 'quickly-indianapp',
    storageBucket: 'quickly-indianapp.appspot.com',
    iosBundleId: 'com.example.quicklyIndian',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCu8fcwVySWBohG6msdmKa8rKMvaXZOfik',
    appId: '1:459614341788:web:e8474b9ebc90f8a568fb59',
    messagingSenderId: '459614341788',
    projectId: 'quickly-indianapp',
    authDomain: 'quickly-indianapp.firebaseapp.com',
    storageBucket: 'quickly-indianapp.appspot.com',
    measurementId: 'G-YTQBMNETXK',
  );
}
