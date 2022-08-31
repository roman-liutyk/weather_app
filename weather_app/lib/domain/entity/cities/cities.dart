import 'package:equatable/equatable.dart';
import 'package:weather_app/data/models/cities_data/cities_data_model.dart';

class Cities extends Equatable {
  final List<City> data;

  const Cities({required this.data});

  factory Cities.fromTableModel(CitiesDataTableModel cities) =>
      Cities(data: cities.data.map((e) => City.fromTableModel(e)).toList());

  @override
  List<Object?> get props => throw UnimplementedError();
}

class City {
  final String country;
  final List<String> cities;

  const City({
    required this.country,
    required this.cities,
  });

  factory City.fromTableModel(CityDataTableModel city) => City(
        country: city.country,
        cities: city.cities,
      );
}
