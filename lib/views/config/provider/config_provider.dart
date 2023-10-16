import 'package:flutter/material.dart';
import 'package:traker_app/services/shared_preferences_static.dart';

class ConfigProvider extends ChangeNotifier {

  TextEditingController controller = TextEditingController();
  TextEditingController controllerPass = TextEditingController();

  ConfigProvider(){
    controller = TextEditingController(text: SharedPreferencesLocal.trakerNumber);
    controllerPass = TextEditingController(text: SharedPreferencesLocal.trakerPass);
  }

  Future save() async {
    SharedPreferencesLocal.statusLogSend = 1;
    SharedPreferencesLocal.trakerNumber = controller.text;
    SharedPreferencesLocal.trakerPass = controllerPass.text;
  }

}
