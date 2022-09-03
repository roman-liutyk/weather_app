import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/data/datasource/key_value_datasource.dart';
import 'package:weather_app/domain/entity/weather_data/weather.dart';
import 'package:weather_app/domain/entity/weather_forecast/weather_forecast.dart';
import 'package:weather_app/presentation/bloc/weather/weather_bloc.dart';
import 'package:weather_app/presentation/bloc/weather/weather_event.dart';
import 'package:weather_app/presentation/bloc/weather/weather_state.dart';
import 'package:weather_app/presentation/pages/weather_page/weather_succes_page.dart';

class WeatherPage extends StatefulWidget {
  final IKeyValueStorageDataSource keyValueStorageDataSource;
  const WeatherPage({
    Key? key,
    required this.keyValueStorageDataSource,
  }) : super(key: key);

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  @override
  Widget build(BuildContext context) {
    final String location =
        ModalRoute.of(context)?.settings.arguments as String;
    final WeatherBloc weatherBloc = BlocProvider.of<WeatherBloc>(context);
    weatherBloc.add(LoadWeatherEvent(location: location));
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        if (state is WeatherLoadingState) {
          return Scaffold(
            body: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 0, 140, 255),
                    Color.fromARGB(255, 85, 201, 255),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
            ),
          );
        } else if (state is WeatherLoadedState) {
          final Weather currenWeather = state.currentWeather;
          final WeatherForecast weatherForecast = state.weatherForecast;
          final LinearGradient gradient = state.gradient;
          return RefreshIndicator(
            child: WeatherSuccesPage(
              currentWeather: currenWeather,
              weatherForecast: weatherForecast,
              gradient: gradient,
            ),
            onRefresh: () async => context.read<WeatherBloc>().add(
                  LoadWeatherEvent(location: currenWeather.name),
                ),
          );
        }
        return Scaffold(
          appBar: AppBar(
            title: const Text('Go Back'),
            centerTitle: true,
            elevation: 0,
          ),
          body: const Center(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Text(
                'Something went wrong!!! Maybee you entered the location in the wrong way!!!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        );
      },
    );
  }
}
