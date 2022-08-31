import 'package:json_annotation/json_annotation.dart';

part 'cities_data_model.g.dart';

@JsonSerializable()
class CitiesDataTableModel {
  final List<CityDataTableModel> data;

  const CitiesDataTableModel({required this.data});

  factory CitiesDataTableModel.fromJson(Map<String, dynamic> json) =>
      _$CitiesDataTableModelFromJson(json);
}

@JsonSerializable()
class CityDataTableModel {
  final String country;
  final List<String> cities;

  const CityDataTableModel({
    required this.country,
    required this.cities,
  });

  factory CityDataTableModel.fromJson(Map<String, dynamic> json) =>
      _$CityDataTableModelFromJson(json);
}
