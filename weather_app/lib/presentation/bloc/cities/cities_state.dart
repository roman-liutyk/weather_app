import 'package:equatable/equatable.dart';
import 'package:weather_app/domain/entity/cities/cities.dart';

abstract class CitiesState extends Equatable {}

class CitiesInitialState extends CitiesState {
  @override
  List<Object?> get props => [];
}

class CitiesLoadingState extends CitiesState {
  @override
  List<Object?> get props => [];
}

class CitiesLoadedState extends CitiesState {
  final Cities cities;

  CitiesLoadedState(this.cities);

  @override
  List<Object?> get props => [cities];
}

class CitiesErrorState extends CitiesState {
  final String error;

  CitiesErrorState(this.error);
  @override
  List<Object?> get props => [error];
}
