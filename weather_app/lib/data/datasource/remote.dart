import 'dart:convert';

import 'package:weather_app/data/models/cities_data/cities_data_model.dart';

import '../models/weather_data/weather_data_model.dart';
import 'package:http/http.dart' as http;

abstract class IRemoteDataSource {
  Future<WeatherDataTableModel> getWeatherData(String location);
  Future<CitiesDataTableModel> getCities();
}

class RemoteDataSource implements IRemoteDataSource {
  static const String _apiWeatherKey = '45f632dbf7a6fdf04eae94ba4ad3fba3';
  static const String _weatherEndpoinPath = 'api.openweathermap.org';

  @override
  Future<WeatherDataTableModel> getWeatherData(String location) async {
    final Uri url = Uri.https(
      _weatherEndpoinPath,
      '/data/2.5/weather',
      {
        'q': location,
        'units': 'metric',
        'lang': 'en',
        'appid': _apiWeatherKey,
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

  @override
  Future<CitiesDataTableModel> getCities() async {
    final Uri url = Uri.parse('https://countriesnow.space/api/v0.1/countries');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(response.body);
      return CitiesDataTableModel.fromJson(json);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
