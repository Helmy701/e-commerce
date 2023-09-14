// ignore_for_file: depend_on_referenced_packages

import 'package:shared_preferences/shared_preferences.dart';

import '../kvalues.dart';
import 'app_data.dart';
class AppRepository {
  final KeyValueStorage store;

  AppRepository(this.store);

  AppData? loadAppData() {
    return store.getAppData();
  }

//saco
  Future setUserLang(String language) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("lang", language);
  }

  Future<String> getUserLang() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("lang") ?? 'ar';
  }
}