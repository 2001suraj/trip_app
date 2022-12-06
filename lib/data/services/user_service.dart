import 'package:shared_preferences/shared_preferences.dart';

class UserService {
  Future sett({required String name}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('name', name);
  }

  Future<String> gett() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var aa = preferences.getString('name');
    return aa!;
  }

  Future clear() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.clear();
  }
}
