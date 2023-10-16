import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:traker_app/views/config/config_page.dart';
import 'package:traker_app/views/home/page/home_page.dart';
import 'package:traker_app/views/splash/providers/splash_provider.dart';
import 'package:traker_app/views/splash/splash_screem.dart';

late BuildContext contextHome;

double sizeH = 0.0;
double sizeW = 0.0;

class InitialPage extends StatefulWidget {
  const InitialPage({Key? key}) : super(key: key);

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {

    final authProvider = Provider.of<SplashProvider>(context);

    contextHome = context;

    sizeH = MediaQuery.of(context).size.height;
    sizeW = MediaQuery.of(context).size.width;

    Widget body = const SplashPage();

    if( authProvider.splashStatus == SplashStatus.config ) {
      body = const ConfigPage(isFirst: true,);
    }
    if( authProvider.splashStatus == SplashStatus.home ) {
      body = const HomePage();
    }
    return Scaffold(
      backgroundColor: Colors.white,
      body: body,
    );
  }
}