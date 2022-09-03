import 'dart:async';
import 'package:flutter/material.dart';
import 'package:weather_app/data/repos/weather_repository.dart';
import 'package:weather_app/domain/entity/weather_data/weather.dart';
import 'package:weather_app/domain/entity/weather_forecast/weather_forecast.dart';
import 'package:weather_app/presentation/bloc/weather/weather_event.dart';
import 'package:weather_app/presentation/bloc/weather/weather_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository _weatherRepository;

  WeatherBloc(this._weatherRepository) : super(WeatherInitialState('')) {
    on<InitWeatherEvent>(_initWeather);
    on<LoadWeatherEvent>(_loadWeather);
  }

  Future<void> _initWeather(
    InitWeatherEvent event,
    Emitter<WeatherState> emit,
  ) async {
    final String location = await _weatherRepository.getFromSharedPreferences();
    emit(WeatherInitialState(location));
  }

  Future<void> _loadWeather(event, emit) async {
    emit(WeatherLoadingState());
    try {
      final String location = (event as LoadWeatherEvent).location;
      final Weather currentWeather =
          await _weatherRepository.getWeatherData(location);
      final WeatherForecast weatherForecast =
          await _weatherRepository.getWeatherForecast(location);
      await _weatherRepository.setToSharedPreferences(location);
      final LinearGradient? gradient = _checkWeatherCode(currentWeather);
      emit(WeatherLoadedState(weatherForecast, currentWeather, gradient));
    } catch (e) {
      emit(WeatherErrorState(e.toString()));
    }
  }

  LinearGradient? _checkWeatherCode(Weather currentWeather) {
    final String weatherCode = currentWeather.weatherDetails[0].icon;
    if (weatherCode.contains('01') || weatherCode.contains('02')) {
      return const LinearGradient(
        colors: [
          Color.fromARGB(255, 204, 129, 16),
          Color.fromARGB(255, 219, 67, 21),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );
    } else if (weatherCode.contains('03') || weatherCode.contains('04')) {
      return const LinearGradient(
        colors: [
          Color.fromARGB(255, 109, 109, 109),
          Colors.blueGrey,
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );
    } else if (weatherCode.contains('09') ||
        weatherCode.contains('10') ||
        weatherCode.contains('13') ||
        weatherCode.contains('50')) {
      return const LinearGradient(
        colors: [
          Color.fromARGB(255, 2, 50, 208),
          Color.fromARGB(255, 3, 1, 135),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );
    } else if (weatherCode.contains('11')) {
      return const LinearGradient(
        colors: [
          Colors.purple,
          Colors.deepPurple,
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );
    }
    return null;
  }
}
