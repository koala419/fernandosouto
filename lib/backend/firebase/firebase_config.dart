import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyAFRb93mI2NsIw4gCKbhfdJ7wtmd3xPDlA",
            authDomain: "fernando-souto-v7hvfe.firebaseapp.com",
            projectId: "fernando-souto-v7hvfe",
            storageBucket: "fernando-souto-v7hvfe.appspot.com",
            messagingSenderId: "439659424530",
            appId: "1:439659424530:web:e56b3683dafcdd188961cb"));
  } else {
    await Firebase.initializeApp();
  }
}
