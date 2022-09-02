import 'package:flutter/material.dart';
import 'package:weather_app/data/datasource/key_value_datasource.dart';
import 'package:weather_app/presentation/pages/search_page/search_page_wrapper.dart';
import 'package:weather_app/presentation/pages/weather_page/weather_page.dart';

abstract class MainNavigationRoutesNames {
  static const String searchPage = 'searchPage';
  static const String weatherPage = 'weather';
}

class MainNavigation {
  final initialRoute = MainNavigationRoutesNames.searchPage;
  final Map<String, Widget Function(BuildContext)> routes = {
    MainNavigationRoutesNames.searchPage: (context) => const SearchPageWrapper(),
    MainNavigationRoutesNames.weatherPage: (context) => WeatherPage(
          keyValueStorageDataSource: KeyValueStorageDataSource(),
        ),
  };
}
