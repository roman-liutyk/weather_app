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
                color: Colors.black,
                image: DecorationImage(
                  image: AssetImage('assets/images/bg_weather_image.png'),
                  fit: BoxFit.cover,
                  opacity: 0.5,
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
          return RefreshIndicator(
            child: WeatherSuccesPage(
              currentWeather: currenWeather,
              weatherForecast: weatherForecast,
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
