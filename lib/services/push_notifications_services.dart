import 'dart:async';
import 'package:firebase_core/firebase_core.dart';

class PushNotificationService{
  static Future initializeApp() async {

    await Firebase.initializeApp();
  }
}