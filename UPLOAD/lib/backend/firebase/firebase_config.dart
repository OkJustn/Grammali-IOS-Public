import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAyfr26wqaWgyo85lU8RhIaCYNfYRTYHVg",
            authDomain: "gra-mali-xccbqd.firebaseapp.com",
            projectId: "gra-mali-xccbqd",
            storageBucket: "gra-mali-xccbqd.firebasestorage.app",
            messagingSenderId: "886195292031",
            appId: "1:886195292031:web:af3bc70161ee6c81c4fc4a"));
  } else {
    await Firebase.initializeApp();
  }
}
