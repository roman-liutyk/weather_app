import 'package:equatable/equatable.dart';
import 'package:weather_app/domain/entity/countries/countries.dart';

abstract class CountriesState extends Equatable {}

class CountriesInitialState extends CountriesState {
  @override
  List<Object?> get props => [];
}

class CountriesLoadingState extends CountriesState {
  @override
  List<Object?> get props => [];
}

class CountriesLoadedState extends CountriesState {
  final Countries countries;

  CountriesLoadedState(this.countries);

  @override
  List<Object?> get props => [countries];
}

class CountriesErrorState extends CountriesState {
  final String error;

  CountriesErrorState(this.error);
  @override
  List<Object?> get props => [error];
}
