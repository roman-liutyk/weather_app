import 'dart:convert';

import '../models/weather_data/weather_data_model.dart';
import 'package:http/http.dart' as http;

abstract class IRemoteDataSource {
  Future<WeatherDataTableModel> getWeatherData(String location);
}

class RemoteDataSource implements IRemoteDataSource {
  static const String _apiKey = '45f632dbf7a6fdf04eae94ba4ad3fba3';
  static const String _path = 'api.openweathermap.org';

  @override
  Future<WeatherDataTableModel> getWeatherData(String location) async {
    final Uri url = Uri.https(
      _path,
      '/data/2.5/weather',
      {
        'q': location,
        'units': 'metric',
        'lang': 'en',
        'appid': _apiKey,
      },
    );
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(response.body);
      return WeatherDataTableModel.fromJson(json);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
