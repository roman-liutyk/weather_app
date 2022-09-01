import 'dart:async';
import 'package:weather_app/data/repos/weather_repository.dart';
import 'package:weather_app/domain/entity/weather_data/weather.dart';
import 'package:weather_app/domain/entity/weather_forecast/weather_forecast.dart';
import 'package:weather_app/presentation/bloc/weather/weather_event.dart';
import 'package:weather_app/presentation/bloc/weather/weather_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository _weatherRepository;

  WeatherBloc(this._weatherRepository) : super(WeatherInitialState()) {
    on<LoadWeatherEvent>(_loadWeather);
  }

  Future<void> _loadWeather(event, emit) async {
    emit(WeatherLoadingState());
    try {
      final String location = (event as LoadWeatherEvent).location;
      final Weather currentWeather =
          await _weatherRepository.getWeatherData(location);
      final WeatherForecast weatherForecast =
          await _weatherRepository.getWeatherForecast(location);
      emit(WeatherLoadedState(weatherForecast, currentWeather));
    } catch (e) {
      emit(WeatherErrorState(e.toString()));
    }
  }
}
