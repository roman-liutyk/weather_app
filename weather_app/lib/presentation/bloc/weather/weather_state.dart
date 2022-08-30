import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/domain/entity/weather_data/weather.dart';

@immutable
abstract class WeatherState extends Equatable {}

class WeatherInitialState extends WeatherState {
  @override
  List<Object?> get props => [];
}

class WeatherLoadingState extends WeatherState {
  @override
  List<Object?> get props => [];
}

class WeatherLoadedState extends WeatherState {
  final Weather weather;

  WeatherLoadedState(this.weather);

  @override
  List<Object> get props => [weather];
}

class WeatherErrorState extends WeatherState {
  final String error;

  WeatherErrorState(this.error);

  @override
  List<Object> get props => [error];
}
