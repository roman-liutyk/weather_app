import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/domain/entity/weather_data/weather_data.dart';
import 'package:weather_app/presentation/bloc/weather/weather_bloc.dart';
import 'package:weather_app/presentation/bloc/weather/weather_event.dart';
import 'package:weather_app/presentation/bloc/weather/weather_state.dart';

import '../../../data/repos/weather_repository.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({
    Key? key,
  }) : super(key: key);

  // ..add(LoadWeatherEvent())

  @override
  Widget build(BuildContext context) {
    final String location =
        ModalRoute.of(context)!.settings.arguments as String;
    return RepositoryProvider(
      create: (context) => WeatherRepository(location),
      child: BlocProvider(
        create: (context) =>
            WeatherBloc(RepositoryProvider.of<WeatherRepository>(context))
              ..add(LoadWeatherEvent()),
        child: BlocBuilder<WeatherBloc, WeatherState>(
          builder: (context, state) {
            if (state is WeatherLoadingState) {
              return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else if (state is WeatherLoadedState) {
              final WeatherData weather = state.weather;
              return WeatherSuccesPage(weather: weather);
            }
            return const Scaffold(
              body: Center(
                child: Text('Error'),
              ),
            );
          },
        ),
      ),
    );
  }
}

class WeatherSuccesPage extends StatelessWidget {
  final WeatherData weather;
  const WeatherSuccesPage({Key? key, required this.weather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(weather.name),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(weather.name),
            Text(weather.tempDetails.temp.round().toString()),
            Text(weather.weatherDetails[0].main),
            Text(weather.weatherDetails[0].description),
          ],
        ),
      ),
    );
  }
}
