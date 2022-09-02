import 'package:weather_app/data/datasource/key_value_datasource.dart';
import 'package:weather_app/data/models/weather_forecast/weather_forecast_model.dart';
import 'package:weather_app/domain/entity/weather_data/weather.dart';
import 'package:weather_app/domain/entity/weather_forecast/weather_forecast.dart';

import '../datasource/remote.dart';
import '../models/weather_data/weather_data_model.dart';

class WeatherRepository {
  final IRemoteDataSource remoteDatasource;
  final IKeyValueStorageDataSource localDatasource;

  WeatherRepository(this.remoteDatasource, this.localDatasource);

  Future<Weather> getWeatherData(String location) async {
    final WeatherDataTableModel model =
        await remoteDatasource.getWeatherData(location);
    final Weather weather = Weather.fromTableModel(model);
    return weather;
  }

  Future<WeatherForecast> getWeatherForecast(String location) async {
    final WeatherForecastTableModel model =
        await remoteDatasource.getWeatherForecast(location);
    final WeatherForecast weather = WeatherForecast.fromTableModel(model);
    return weather;
  }

  Future<String> getFromSharedPreferences() async {
    final String cityName = await localDatasource.getCityNameFromSharedPref();
    return cityName;
  }

  Future<void> setToSharedPreferences(String cityName) async {
    await localDatasource.setCityNameToSharedPref(cityName);
  }
}
