import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyA4LhA5EBzIdwCTUeVrLgW1n6sBW-mn5Gs",
            authDomain: "socialmediaappff.firebaseapp.com",
            projectId: "socialmediaappff",
            storageBucket: "socialmediaappff.appspot.com",
            messagingSenderId: "258346240976",
            appId: "1:258346240976:web:57e1317288202b0d0387d5",
            measurementId: "G-Q13RDYSYXB"));
  } else {
    await Firebase.initializeApp();
  }
}
