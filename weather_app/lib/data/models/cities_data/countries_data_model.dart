import 'package:json_annotation/json_annotation.dart';

part 'countries_data_model.g.dart';

@JsonSerializable()
class CountriesDataTableModel {
  final List<CountryDataTableModel> data;

  const CountriesDataTableModel({required this.data});

  factory CountriesDataTableModel.fromJson(Map<String, dynamic> json) =>
      _$CountriesDataTableModelFromJson(json);
}

@JsonSerializable()
class CountryDataTableModel {
  final String country;
  final List<String> cities;

  const CountryDataTableModel({
    required this.country,
    required this.cities,
  });

  factory CountryDataTableModel.fromJson(Map<String, dynamic> json) =>
      _$CountryDataTableModelFromJson(json);
}
