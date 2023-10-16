import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:traker_app/initial_page.dart';
import 'package:traker_app/services/push_notifications_services.dart';
import 'package:traker_app/services/shared_preferences_static.dart';
import 'package:traker_app/views/home/provider/home_provider.dart';

import 'views/splash/providers/splash_provider.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Provider.debugCheckInvalidValueType = null;
  await SharedPreferencesLocal.configurePrefs();
  await PushNotificationService.initializeApp();
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(lazy: false,create: ( _ ) => SplashProvider()),
        ChangeNotifierProvider(lazy: false,create: ( _ ) => HomeProvider()),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TrakerApp',
      theme: ThemeData.light().copyWith(
          scrollbarTheme: const ScrollbarThemeData().copyWith(
              thumbColor: MaterialStateProperty.all(
                  Colors.grey.withOpacity(0.5)
              )
          )
      ),
      home: const InitialPage(),
    );
  }
}