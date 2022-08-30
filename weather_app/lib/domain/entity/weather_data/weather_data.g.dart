// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: unused_element

part of 'weather_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherData _$WeatherDataFromJson(Map<String, dynamic> json) => WeatherData(
      name: json['name'] as String,
      weatherDetails: (json['weather'] as List<dynamic>)
          .map((e) => WeatherDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
      tempDetails:
          TemperatureDetails.fromJson(json['main'] as Map<String, dynamic>),
      windDetails: WindDetails.fromJson(json['wind'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WeatherDataToJson(WeatherData instance) =>
    <String, dynamic>{
      'name': instance.name,
      'weather': instance.weatherDetails,
      'main': instance.tempDetails,
      'wind': instance.windDetails,
    };

WeatherDetails _$WeatherDetailsFromJson(Map<String, dynamic> json) =>
    WeatherDetails(
      main: json['main'] as String,
      description: json['description'] as String,
      icon: json['icon'] as String,
    );

Map<String, dynamic> _$WeatherDetailsToJson(WeatherDetails instance) =>
    <String, dynamic>{
      'main': instance.main,
      'description': instance.description,
      'icon': instance.icon,
    };

TemperatureDetails _$TemperatureDetailsFromJson(Map<String, dynamic> json) =>
    TemperatureDetails(
      temp: (json['temp'] as num).toDouble(),
      feelsLike: (json['feels_like'] as num).toDouble(),
    );

Map<String, dynamic> _$TemperatureDetailsToJson(TemperatureDetails instance) =>
    <String, dynamic>{
      'temp': instance.temp,
      'feels_like': instance.feelsLike,
    };

WindDetails _$WindDetailsFromJson(Map<String, dynamic> json) => WindDetails(
      speed: (json['speed'] as num).toDouble(),
    );

Map<String, dynamic> _$WindDetailsToJson(WindDetails instance) =>
    <String, dynamic>{
      'speed': instance.speed,
    };
