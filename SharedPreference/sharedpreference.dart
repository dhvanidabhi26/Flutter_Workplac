import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {
  Future<void> saveData(String email, pass) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString('email', email);
    await sharedPreferences.setString('pass', pass);
  }

  Future<Map<String, dynamic>> getData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    String? email = sharedPreferences.getString('email');
    String? pass = sharedPreferences.getString('pass');

    return {'email': email, 'pass': pass};
  }


  Future<void> clearData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    sharedPreferences.clear();
  }
}
