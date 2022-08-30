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

part 'weather_data.g.dart';

@JsonSerializable()
class WeatherData {
  String name;
  @JsonKey(name: 'weather')
  List<WeatherDetails> weatherDetails;
  @JsonKey(name: 'main')
  TemperatureDetails tempDetails;
  @JsonKey(name: 'wind')
  WindDetails windDetails;

  WeatherData({
    required this.name,
    required this.weatherDetails,
    required this.tempDetails,
    required this.windDetails,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) =>
      _$WeatherDataFromJson(json);
}

@JsonSerializable()
class WeatherDetails {
  String main;
  String description;
  String icon;

  WeatherDetails({
    required this.main,
    required this.description,
    required this.icon,
  });

  factory WeatherDetails.fromJson(Map<String, dynamic> json) =>
      _$WeatherDetailsFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class TemperatureDetails {
  double temp;
  double feelsLike;

  TemperatureDetails({
    required this.temp,
    required this.feelsLike,
  });

  factory TemperatureDetails.fromJson(Map<String, dynamic> json) =>
      _$TemperatureDetailsFromJson(json);
}

@JsonSerializable()
class WindDetails {
  double speed;

  WindDetails({
    required this.speed,
  });

  factory WindDetails.fromJson(Map<String, dynamic> json) =>
      _$WindDetailsFromJson(json);
}
