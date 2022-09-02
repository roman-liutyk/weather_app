import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/common/navigation/main_navigation.dart';
import 'package:weather_app/presentation/bloc/weather/weather_bloc.dart';
import 'package:weather_app/presentation/bloc/weather/weather_state.dart';
import 'package:weather_app/presentation/pages/search_page/search_page.dart';

class SearchPageWrapper extends StatelessWidget {
  const SearchPageWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<WeatherBloc, WeatherState>(
      listener: (context, state) {
        if (state is WeatherInitialState) {
          if (state.location.isNotEmpty) {
            Navigator.of(context).pushNamed(
                MainNavigationRoutesNames.weatherPage,
                arguments: state.location);
          }
        }
      },child: const  SearchPage(),);
      
  }
}