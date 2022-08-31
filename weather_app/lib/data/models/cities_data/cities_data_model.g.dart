// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cities_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CitiesDataTableModel _$CitiesDataTableModelFromJson(
        Map<String, dynamic> json) =>
    CitiesDataTableModel(
      data: (json['data'] as List<dynamic>)
          .map((e) => CityDataTableModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CitiesDataTableModelToJson(
        CitiesDataTableModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

CityDataTableModel _$CityDataTableModelFromJson(Map<String, dynamic> json) =>
    CityDataTableModel(
      country: json['country'] as String,
      cities:
          (json['cities'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$CityDataTableModelToJson(CityDataTableModel instance) =>
    <String, dynamic>{
      'country': instance.country,
      'cities': instance.cities,
    };
