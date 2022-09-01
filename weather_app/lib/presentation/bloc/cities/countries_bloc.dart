import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/data/repos/countries_repository.dart';
import 'package:weather_app/domain/entity/cities/countries.dart';
import 'package:weather_app/presentation/bloc/cities/countries_event.dart';
import 'package:weather_app/presentation/bloc/cities/countries_state.dart';

class CountriesBloc extends Bloc<CountriesEvent, CountriesState> {
  final CitiesRepository _citiesRepository;

  CountriesBloc(this._citiesRepository) : super(CountriesInitialState()) {
    on<LoadCountriesEvent>(_loadCities);
  }

  Future<void> _loadCities(event, emit) async {
    emit(CountriesLoadingState());
    try {
      final Countries countries = await _citiesRepository.getCountries();
      emit(CountriesLoadedState(countries));
    } catch (e) {
      emit(CountriesErrorState(e.toString()));
    }
  }
}
