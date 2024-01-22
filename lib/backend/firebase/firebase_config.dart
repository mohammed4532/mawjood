import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDxhobrqolxpDAYsaZmkYnGzHkjHqVOHAM",
            authDomain: "mawjood-testing.firebaseapp.com",
            projectId: "mawjood-testing",
            storageBucket: "mawjood-testing.appspot.com",
            messagingSenderId: "416455333935",
            appId: "1:416455333935:web:3c55371cecb6b350f48eda",
            measurementId: "G-FSYNSZXZ5E"));
  } else {
    await Firebase.initializeApp();
  }
}
