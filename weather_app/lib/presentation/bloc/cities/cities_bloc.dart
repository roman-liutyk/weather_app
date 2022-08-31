import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/data/repos/cities_repository.dart';
import 'package:weather_app/domain/entity/cities/cities.dart';
import 'package:weather_app/presentation/bloc/cities/cities_event.dart';
import 'package:weather_app/presentation/bloc/cities/cities_state.dart';

class CitiesBloc extends Bloc<CitiesEvent, CitiesState> {
  final CitiesRepository _citiesRepository;

  CitiesBloc(this._citiesRepository) : super(CitiesInitialState()) {
    on<LoadCitiesEvent>(_loadCities);
  }

  Future<void> _loadCities(event, emit) async {
    emit(CitiesLoadingState());
    try {
      final Cities cities = await _citiesRepository.getCities();
      emit(CitiesLoadedState(cities));
    } catch (e) {
      emit(CitiesErrorState(e.toString()));
    }
  }
}
