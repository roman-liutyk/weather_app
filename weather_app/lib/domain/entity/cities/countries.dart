import 'package:equatable/equatable.dart';
import 'package:weather_app/data/models/cities_data/countries_data_model.dart';

class Countries extends Equatable {
  final List<Country> data;

  const Countries({required this.data});

  factory Countries.fromTableModel(CountriesDataTableModel cities) => Countries(
      data: cities.data.map((e) => Country.fromTableModel(e)).toList());

  @override
  List<Object?> get props => throw UnimplementedError();
}

class Country {
  final String country;
  final List<String> cities;

  const Country({
    required this.country,
    required this.cities,
  });

  factory Country.fromTableModel(CountryDataTableModel city) => Country(
        country: city.country,
        cities: city.cities,
      );
}
