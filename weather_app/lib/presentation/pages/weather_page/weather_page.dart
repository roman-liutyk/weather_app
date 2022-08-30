import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/domain/entity/weather_data/weather_data.dart';
import 'package:weather_app/presentation/bloc/weather/weather_bloc.dart';
import 'package:weather_app/presentation/bloc/weather/weather_event.dart';
import 'package:weather_app/presentation/bloc/weather/weather_state.dart';
import 'package:weather_app/presentation/pages/weather_page/weather_succes_page.dart';

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
        ),
      ),
    );
  }
}


