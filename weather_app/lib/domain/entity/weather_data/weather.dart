import 'package:equatable/equatable.dart';

import '../../../data/models/weather_data/weather_data_model.dart';

class Weather extends Equatable {
  final String name;
  final List<WeatherDetails> weatherDetails;
  final TemperatureDetails tempDetails;
  final WindDetails windDetails;

  const Weather({
    required this.name,
    required this.weatherDetails,
    required this.tempDetails,
    required this.windDetails,
  });

  @override
  List<Object?> get props => [];

  factory Weather.fromTableModel(WeatherDataTableModel weather) => Weather(
      name: weather.name,
      weatherDetails: weather.weatherDetails
          .map((e) => WeatherDetails.fromTableModel(e))
          .toList(),
      tempDetails: TemperatureDetails.fromTablleModel(weather.tempDetails),
      windDetails: WindDetails.fromTableModel(weather.windDetails));
}

class WeatherDetails {
  final String main;
  final String description;
  final String icon;

  const WeatherDetails({
    required this.main,
    required this.description,
    required this.icon,
  });

  factory WeatherDetails.fromTableModel(
          WeatherDetailsTableModel weatherDetails) =>
      WeatherDetails(
          main: weatherDetails.main,
          description: weatherDetails.description,
          icon: weatherDetails.icon);
}

class TemperatureDetails {
  final double temp;
  final double feelsLike;

  const TemperatureDetails({
    required this.temp,
    required this.feelsLike,
  });

  factory TemperatureDetails.fromTablleModel(
          TemperatureDetailsTableModel tempDetails) =>
      TemperatureDetails(
          temp: tempDetails.temp, feelsLike: tempDetails.feelsLike);
}

class WindDetails {
  final double speed;

  const WindDetails({
    required this.speed,
  });

  factory WindDetails.fromTableModel(WindDetailsTableModel windDetails) =>
      WindDetails(speed: windDetails.speed);
}
