// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_forecast_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherForecastTableModel _$WeatherForecastTableModelFromJson(
        Map<String, dynamic> json) =>
    WeatherForecastTableModel(
      list: (json['list'] as List<dynamic>)
          .map((e) => WeatherListTableModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      city: CityTableModel.fromJson(json['city'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WeatherForecastTableModelToJson(
        WeatherForecastTableModel instance) =>
    <String, dynamic>{
      'list': instance.list,
      'city': instance.city,
    };

WeatherListTableModel _$WeatherListTableModelFromJson(
        Map<String, dynamic> json) =>
    WeatherListTableModel(
      main: MainInfoTableModel.fromJson(json['main'] as Map<String, dynamic>),
      weather: (json['weather'] as List<dynamic>)
          .map((e) => WeatherTableModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      wind: WindTableModel.fromJson(json['wind'] as Map<String, dynamic>),
      dtTxt: json['dt_txt'] as String,
    );

Map<String, dynamic> _$WeatherListTableModelToJson(
        WeatherListTableModel instance) =>
    <String, dynamic>{
      'dt_txt': instance.dtTxt,
      'main': instance.main,
      'weather': instance.weather,
      'wind': instance.wind,
    };

MainInfoTableModel _$MainInfoTableModelFromJson(Map<String, dynamic> json) =>
    MainInfoTableModel(
      temp: (json['temp'] as num).toDouble(),
      feelsLike: (json['feels_like'] as num).toDouble(),
      humidity: json['humidity'] as int,
    );

Map<String, dynamic> _$MainInfoTableModelToJson(MainInfoTableModel instance) =>
    <String, dynamic>{
      'temp': instance.temp,
      'feels_like': instance.feelsLike,
      'humidity': instance.humidity,
    };

WeatherTableModel _$WeatherTableModelFromJson(Map<String, dynamic> json) =>
    WeatherTableModel(
      main: json['main'] as String,
      description: json['description'] as String,
      icon: json['icon'] as String,
    );

Map<String, dynamic> _$WeatherTableModelToJson(WeatherTableModel instance) =>
    <String, dynamic>{
      'main': instance.main,
      'description': instance.description,
      'icon': instance.icon,
    };

WindTableModel _$WindTableModelFromJson(Map<String, dynamic> json) =>
    WindTableModel(
      speed: (json['speed'] as num).toDouble(),
    );

Map<String, dynamic> _$WindTableModelToJson(WindTableModel instance) =>
    <String, dynamic>{
      'speed': instance.speed,
    };

CityTableModel _$CityTableModelFromJson(Map<String, dynamic> json) =>
    CityTableModel(
      name: json['name'] as String,
      country: json['country'] as String,
    );

Map<String, dynamic> _$CityTableModelToJson(CityTableModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'country': instance.country,
    };
