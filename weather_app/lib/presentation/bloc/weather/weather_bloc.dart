import 'dart:async';
import 'package:weather_app/data/repos/weather_repository.dart';
import 'package:weather_app/presentation/bloc/weather/weather_event.dart';
import 'package:weather_app/presentation/bloc/weather/weather_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository _weatherRepository;

  WeatherBloc(this._weatherRepository) : super(WeatherInitialState()) {
    on<LoadWeatherEvent>(_getWeather);
  }

  Future<void> _getWeather(event, emit) async {
    emit(WeatherLoadingState());
    try {
      final weather = await _weatherRepository.getWeatherData();
      emit(WeatherLoadedState(weather));
    } catch (e) {
      emit(WeatherErrorState(e.toString()));
    }
  }
}
