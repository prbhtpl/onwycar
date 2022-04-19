import 'package:shared_preferences/shared_preferences.dart';
class HelperFunctions{
  static String saveUserToken = 'open';




  static Future saveuserToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return await prefs.setString(saveUserToken, token);
  }


  static Future<String?> getuserToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return await prefs.getString(saveUserToken);
  }



}