import 'package:flutter/material.dart';
import 'package:traker_app/services/shared_preferences_static.dart';

enum SplashStatus {
  config,
  home,
  splash,
}

class SplashProvider extends ChangeNotifier {

  SplashStatus splashStatus = SplashStatus.splash;

  SplashProvider() {
    initSplash();
  }

  Future initSplash() async {
    int login = SharedPreferencesLocal.statusLogSend;

    if(login == 0){
      splashStatus = SplashStatus.config;
    }
    if(login == 1){
      splashStatus = SplashStatus.home;
    }
    notifyListeners();
  }
}
