import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:weather_app/common/navigation/main_navigation.dart';
import 'package:weather_app/data/datasource/key_value_datasource.dart';
import 'package:weather_app/data/datasource/remote.dart';
import 'package:weather_app/data/repos/weather_repository.dart';
import 'package:weather_app/presentation/bloc/countries/countries_bloc.dart';
import 'package:weather_app/presentation/bloc/countries/countries_event.dart';
import 'package:weather_app/presentation/bloc/weather/weather_bloc.dart';
import 'package:weather_app/presentation/bloc/weather/weather_event.dart';
import 'package:weather_app/data/repos/countries_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initializeDateFormatting();
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MainNavigation mainNavigation = MainNavigation();
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => WeatherRepository(
              RemoteDataSource(), KeyValueStorageDataSource()),
        ),
        RepositoryProvider(
          create: (BuildContext context) =>
              CitiesRepository(RemoteDataSource()),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (BuildContext context) =>
                CountriesBloc(RepositoryProvider.of<CitiesRepository>(context))
                  ..add(LoadCountriesEvent()),
          ),
          BlocProvider(
            create: (context) =>
                WeatherBloc(RepositoryProvider.of<WeatherRepository>(context))
                  ..add(InitWeatherEvent()),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: mainNavigation.routes,
          initialRoute: mainNavigation.initialRoute,
        ),
      ),
    );
  }
}
