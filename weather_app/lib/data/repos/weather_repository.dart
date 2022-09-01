import 'package:weather_app/data/models/weather_forecast/weather_forecast_model.dart';
import 'package:weather_app/domain/entity/weather_data/weather.dart';
import 'package:weather_app/domain/entity/weather_forecast/weather_forecast.dart';

import '../datasource/remote.dart';
import '../models/weather_data/weather_data_model.dart';

class WeatherRepository {
  final IRemoteDataSource datasource;

  WeatherRepository(this.datasource);

  Future<Weather> getWeatherData(String location) async {
    final WeatherDataTableModel model =
        await datasource.getWeatherData(location);
    final Weather weather = Weather.fromTableModel(model);
    return weather;
  }

  Future<WeatherForecast> getWeatherForecast(String location) async {
    final WeatherForecastTableModel model =
        await datasource.getWeatherForecast(location);
    final WeatherForecast weather = WeatherForecast.fromTableModel(model);
    return weather;
  }
}
