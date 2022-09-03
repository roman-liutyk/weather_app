import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/domain/entity/weather_data/weather.dart';
import 'package:weather_app/domain/entity/weather_forecast/weather_forecast.dart';

@immutable
abstract class WeatherState extends Equatable {}

class WeatherInitialState extends WeatherState {
  final String location;

  WeatherInitialState(this.location);
  @override
  List<Object?> get props => [location];
}

class WeatherLoadingState extends WeatherState {
  @override
  List<Object?> get props => [];
}

class WeatherLoadedState extends WeatherState {
  final WeatherForecast weatherForecast;
  final Weather currentWeather;
  final LinearGradient gradient;

  WeatherLoadedState(this.weatherForecast, this.currentWeather, this.gradient);

  @override
  List<Object> get props => [weatherForecast, currentWeather];
}

class WeatherErrorState extends WeatherState {
  final String error;

  WeatherErrorState(this.error);

  @override
  List<Object> get props => [error];
}
