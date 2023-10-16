import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesLocal {

  static late SharedPreferences prefs;

  static Future<void> configurePrefs() async {
    prefs = await SharedPreferences.getInstance();
  }

  static int get statusLogSend => prefs.getInt("trakerLogin") ?? 0;
  static set statusLogSend(int value) => prefs.setInt("trakerLogin", value);

  static String get trakerNumber => prefs.getString("trakerNumber") ?? '+584249178826';
  static set trakerNumber(String value) => prefs.setString("trakerNumber", value);

  static String get trakerPass => prefs.getString("trakerPass") ?? '2345';
  static set trakerPass(String value) => prefs.setString("trakerPass", value);

  static String get trakerIdFirebase => prefs.getString("trakerIdFirebase") ?? '';
  static set trakerIdFirebase(String value) => prefs.setString("trakerIdFirebase", value);
}
