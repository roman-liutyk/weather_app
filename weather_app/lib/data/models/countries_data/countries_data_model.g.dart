// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'countries_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountriesDataTableModel _$CountriesDataTableModelFromJson(
        Map<String, dynamic> json) =>
    CountriesDataTableModel(
      data: (json['data'] as List<dynamic>)
          .map((e) => CountryDataTableModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CountriesDataTableModelToJson(
        CountriesDataTableModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

CountryDataTableModel _$CountryDataTableModelFromJson(
        Map<String, dynamic> json) =>
    CountryDataTableModel(
      country: json['country'] as String,
      cities:
          (json['cities'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$CountryDataTableModelToJson(
        CountryDataTableModel instance) =>
    <String, dynamic>{
      'country': instance.country,
      'cities': instance.cities,
    };
