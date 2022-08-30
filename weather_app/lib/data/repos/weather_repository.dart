import 'package:weather_app/domain/entity/weather_data/weather.dart';

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
}
