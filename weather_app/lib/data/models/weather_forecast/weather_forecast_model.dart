import 'package:json_annotation/json_annotation.dart';

part 'weather_forecast_model.g.dart';

@JsonSerializable()
class WeatherForecastTableModel {
  final List<WeatherListTableModel> list;
  final CityTableModel city;

  const WeatherForecastTableModel({required this.list, required this.city});

  factory WeatherForecastTableModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherForecastTableModelFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class WeatherListTableModel {
  final String dtTxt;
  final MainInfoTableModel main;
  final List<WeatherTableModel> weather;
  final WindTableModel wind;

  const WeatherListTableModel({
    required this.main,
    required this.weather,
    required this.wind,
    required this.dtTxt,
  });

  factory WeatherListTableModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherListTableModelFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class MainInfoTableModel {
  final double temp;
  final double feelsLike;
  final int humidity;

  const MainInfoTableModel({
    required this.temp,
    required this.feelsLike,
    required this.humidity,
  });

  factory MainInfoTableModel.fromJson(Map<String, dynamic> json) =>
      _$MainInfoTableModelFromJson(json);
}

@JsonSerializable()
class WeatherTableModel {
  final String main;
  final String description;
  final String icon;

  const WeatherTableModel(
      {required this.main, required this.description, required this.icon});

  factory WeatherTableModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherTableModelFromJson(json);
}

@JsonSerializable()
class WindTableModel {
  final double speed;

  const WindTableModel({required this.speed});

  factory WindTableModel.fromJson(Map<String, dynamic> json) =>
      _$WindTableModelFromJson(json);
}

@JsonSerializable()
class CityTableModel {
  final String name;
  final String country;

  const CityTableModel({
    required this.name,
    required this.country,
  });

  factory CityTableModel.fromJson(Map<String, dynamic> json) =>
      _$CityTableModelFromJson(json);
}
