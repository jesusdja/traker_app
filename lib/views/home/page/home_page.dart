import 'package:flutter/material.dart';
import 'package:traker_app/config/traker_colors.dart';
import 'package:traker_app/config/traker_style.dart';
import 'package:traker_app/initial_page.dart';
import 'package:traker_app/services/shared_preferences_static.dart';
import 'package:traker_app/views/config/config_page.dart';
import 'package:traker_app/widgets_utils/button_general.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: sizeH * 0.02,),
            InkWell(
              child: Container(
                alignment: Alignment.centerRight,
                margin: EdgeInsets.only(right: sizeW * 0.1),
                child: Icon(Icons.settings,size: sizeH * 0.05,
                color: Colors.grey),
              ),
              onTap: (){
                Navigator.push(context,MaterialPageRoute<void>(
                    builder: (context) => const ConfigPage()
                ),);
              },
            ),
            SizedBox(height: sizeH * 0.02,),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  columnButton(type: 1),
                  SizedBox(height: sizeH * 0.02,),
                  columnButton(type: 2),
                  SizedBox(height: sizeH * 0.02,),
                  columnButton(type: 3),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget columnButton({required int type}){

    String title = 'Apagar';
    String action = '940${SharedPreferencesLocal.trakerPass}';
    if(type == 2){
      title = 'Encender';
      action = '941${SharedPreferencesLocal.trakerPass}';
    }
    if(type == 3){
      title = 'Ubicacion';
      action = '669${SharedPreferencesLocal.trakerPass}';
    }

    return Container(
      margin: EdgeInsets.symmetric(horizontal: sizeW * 0.1),
      child: ButtonGeneral(
        titlePadding: EdgeInsets.all(sizeH * 0.02),
        title: title,
        backgroundColor: TrakerColors.primary,
        textStyle: TrakerStyles().stylePrimary(
          size: sizeH * 0.03,
          color: Colors.white,
        ),
        onPressed: () async {
          try{

            final Uri smsLaunchUri = Uri(
              scheme: 'sms',
              path: SharedPreferencesLocal.trakerNumber,
              queryParameters: <String, String>{
                'body': Uri.encodeComponent(action),
              },
            );

            if (!await launchUrl(smsLaunchUri)) {
              throw Exception('Could not launch $smsLaunchUri');
            }
          }catch(e){
            debugPrint(e.toString());
          }
        },
      ),
    );
  }
}
