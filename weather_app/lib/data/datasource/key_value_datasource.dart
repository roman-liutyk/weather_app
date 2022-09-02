import 'package:shared_preferences/shared_preferences.dart';

abstract class IKeyValueStorageDataSource {
  Future<String> getCityNameFromSharedPref();
  Future<void> setCityNameToSharedPref(String cityName);
}

class KeyValueStorageDataSource implements IKeyValueStorageDataSource {
  @override
  Future<String> getCityNameFromSharedPref() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('cityName') ?? '';
  }

  @override
  Future<void> setCityNameToSharedPref(String cityName) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('cityName', cityName);
  }
}
