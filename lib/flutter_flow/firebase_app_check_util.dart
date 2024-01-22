import 'package:firebase_app_check/firebase_app_check.dart';

Future initializeFirebaseAppCheck() => FirebaseAppCheck.instance.activate(
      webProvider:
          ReCaptchaV3Provider('6Lc_5LsnAAAAAGvCsQFkIgdkbAHMfW12D2c3xLuz'),
      androidProvider: AndroidProvider.playIntegrity,
    );
