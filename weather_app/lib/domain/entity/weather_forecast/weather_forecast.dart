import 'package:weather_app/data/models/weather_forecast/weather_forecast_model.dart';

class WeatherForecast {
  final List<WeatherList> list;
  final City city;

  const WeatherForecast({required this.list, required this.city});

  factory WeatherForecast.fromTableModel(
          WeatherForecastTableModel weatherForecast) =>
      WeatherForecast(
          list: weatherForecast.list
              .map((e) => WeatherList.fromTableModel(e))
              .toList(),
          city: City.fromTableModel(weatherForecast.city));
}

class WeatherList {
  final String dtTxt;
  final MainInfo main;
  final List<WeatherInfo> weather;
  final Wind wind;

  const WeatherList({
    required this.main,
    required this.weather,
    required this.wind,
    required this.dtTxt,
  });

  factory WeatherList.fromTableModel(WeatherListTableModel weatherList) =>
      WeatherList(
        main: MainInfo.fromTableModel(weatherList.main),
        weather: weatherList.weather
            .map((e) => WeatherInfo.fromTableModel(e))
            .toList(),
        wind: Wind.fromTableModel(weatherList.wind),
        dtTxt: weatherList.dtTxt,
      );
}

class MainInfo {
  final double temp;
  final double feelsLike;
  final int humidity;

  const MainInfo({
    required this.temp,
    required this.feelsLike,
    required this.humidity,
  });

  factory MainInfo.fromTableModel(MainInfoTableModel main) => MainInfo(
      temp: main.temp, feelsLike: main.feelsLike, humidity: main.humidity);
}

class WeatherInfo {
  final String main;
  final String description;
  final String icon;

  const WeatherInfo(
      {required this.main, required this.description, required this.icon});

  factory WeatherInfo.fromTableModel(WeatherTableModel weather) => WeatherInfo(
      main: weather.main, description: weather.description, icon: weather.icon);
}

class Wind {
  final double speed;

  const Wind({required this.speed});

  factory Wind.fromTableModel(WindTableModel wind) => Wind(speed: wind.speed);
}

class City {
  final String name;
  final String country;

  const City({
    required this.name,
    required this.country,
  });

  factory City.fromTableModel(CityTableModel city) =>
      City(name: city.name, country: city.country);
}
