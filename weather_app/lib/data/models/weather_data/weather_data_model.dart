/*

{
  "weather": [
    {
      "main": "Clear",
      "description": "clear sky",
      "icon": "01d"
    }
  ],
  "main": {
    "temp": 282.55,
    "feels_like": 281.86,
  },
  "wind": {
    "speed": 1.5,
  },
  "name": "Mountain View",
  }  

*/

import 'package:json_annotation/json_annotation.dart';

part 'weather_data_model.g.dart';

@JsonSerializable()
class WeatherDataTableModel {
  String name;
  @JsonKey(name: 'weather')
  List<WeatherDetailsTableModel> weatherDetails;
  @JsonKey(name: 'main')
  TemperatureDetailsTableModel tempDetails;
  @JsonKey(name: 'wind')
  WindDetailsTableModel windDetails;

  WeatherDataTableModel({
    required this.name,
    required this.weatherDetails,
    required this.tempDetails,
    required this.windDetails,
  });

  factory WeatherDataTableModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherDataTableModelFromJson(json);
}

@JsonSerializable()
class WeatherDetailsTableModel {
  String main;
  String description;
  String icon;

  WeatherDetailsTableModel({
    required this.main,
    required this.description,
    required this.icon,
  });

  factory WeatherDetailsTableModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherDetailsTableModelFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class TemperatureDetailsTableModel {
  double temp;
  double feelsLike;

  TemperatureDetailsTableModel({
    required this.temp,
    required this.feelsLike,
  });

  factory TemperatureDetailsTableModel.fromJson(Map<String, dynamic> json) =>
      _$TemperatureDetailsTableModelFromJson(json);
}

@JsonSerializable()
class WindDetailsTableModel {
  double speed;

  WindDetailsTableModel({
    required this.speed,
  });

  factory WindDetailsTableModel.fromJson(Map<String, dynamic> json) =>
      _$WindDetailsTableModelFromJson(json);
}