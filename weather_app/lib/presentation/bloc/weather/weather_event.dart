import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class WeatherEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadWeatherEvent extends WeatherEvent {
  final String location;

  LoadWeatherEvent({required this.location});

  @override
  List<Object> get props => [location];
}

class SearchWeatherEvent extends WeatherEvent {
  @override
  List<Object> get props => [];
}
