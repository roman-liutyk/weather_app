import 'dart:convert';
import '../../domain/entity/weather_data/weather_data.dart';
import 'package:http/http.dart' as http;

class WeatherRepository {
  final String location;
  final _apiKey = '45f632dbf7a6fdf04eae94ba4ad3fba3';
  final _path = 'api.openweathermap.org';

  WeatherRepository(this.location);

  Future<WeatherData> getWeatherData() async {
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
      return WeatherData.fromJson(json);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
