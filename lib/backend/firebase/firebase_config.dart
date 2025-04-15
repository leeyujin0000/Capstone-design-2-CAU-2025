import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyB4tUbS4DAtgVRB90pO_YEcIPWgfhJcMRg",
            authDomain: "googe-maps-route-yivepc.firebaseapp.com",
            projectId: "googe-maps-route-yivepc",
            storageBucket: "googe-maps-route-yivepc.firebasestorage.app",
            messagingSenderId: "389933794947",
            appId: "1:389933794947:web:68c7669cd081895753fdb6"));
  } else {
    await Firebase.initializeApp();
  }
}
