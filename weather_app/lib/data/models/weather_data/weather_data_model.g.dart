// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherDataTableModel _$WeatherDataTableModelFromJson(
        Map<String, dynamic> json) =>
    WeatherDataTableModel(
      name: json['name'] as String,
      weatherDetails: (json['weather'] as List<dynamic>)
          .map((e) =>
              WeatherDetailsTableModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      tempDetails: TemperatureDetailsTableModel.fromJson(
          json['main'] as Map<String, dynamic>),
      windDetails:
          WindDetailsTableModel.fromJson(json['wind'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WeatherDataTableModelToJson(
        WeatherDataTableModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'weather': instance.weatherDetails,
      'main': instance.tempDetails,
      'wind': instance.windDetails,
    };

WeatherDetailsTableModel _$WeatherDetailsTableModelFromJson(
        Map<String, dynamic> json) =>
    WeatherDetailsTableModel(
      main: json['main'] as String,
      description: json['description'] as String,
      icon: json['icon'] as String,
    );

Map<String, dynamic> _$WeatherDetailsTableModelToJson(
        WeatherDetailsTableModel instance) =>
    <String, dynamic>{
      'main': instance.main,
      'description': instance.description,
      'icon': instance.icon,
    };

TemperatureDetailsTableModel _$TemperatureDetailsTableModelFromJson(
        Map<String, dynamic> json) =>
    TemperatureDetailsTableModel(
      temp: (json['temp'] as num).toDouble(),
      feelsLike: (json['feels_like'] as num).toDouble(),
    );

Map<String, dynamic> _$TemperatureDetailsTableModelToJson(
        TemperatureDetailsTableModel instance) =>
    <String, dynamic>{
      'temp': instance.temp,
      'feels_like': instance.feelsLike,
    };

WindDetailsTableModel _$WindDetailsTableModelFromJson(
        Map<String, dynamic> json) =>
    WindDetailsTableModel(
      speed: (json['speed'] as num).toDouble(),
    );

Map<String, dynamic> _$WindDetailsTableModelToJson(
        WindDetailsTableModel instance) =>
    <String, dynamic>{
      'speed': instance.speed,
    };
