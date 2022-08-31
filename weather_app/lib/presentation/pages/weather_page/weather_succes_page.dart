import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/domain/entity/weather_data/weather.dart';

class WeatherSuccesPage extends StatelessWidget {
  final Weather weather;
  const WeatherSuccesPage({Key? key, required this.weather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final imagePath =
        'http://openweathermap.org/img/wn/${weather.weatherDetails[0].icon}@2x.png';
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            width: size.width,
            height: size.height,
            decoration: const BoxDecoration(
                color: Colors.black87,
                image: DecorationImage(
                  image: AssetImage('assets/images/bg_weather_image.png'),
                  fit: BoxFit.cover,
                  opacity: 0.5,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black54,
                    blurRadius: 10,
                  ),
                ]),
            child: Column(
              children: [
                _MainWeatherInfo(imagePath: imagePath, weather: weather),
                const _HourlyForecastWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MainWeatherInfo extends StatelessWidget {
  const _MainWeatherInfo({
    Key? key,
    required this.imagePath,
    required this.weather,
  }) : super(key: key);

  final String imagePath;
  final Weather weather;

  @override
  Widget build(BuildContext context) {
    return _WeatherMainInfo(weather: weather);
  }
}

class _WeatherMainInfo extends StatelessWidget {
  const _WeatherMainInfo({
    Key? key,
    required this.weather,
  }) : super(key: key);

  final Weather weather;

  TextStyle _style(double fontSize) {
    return GoogleFonts.montserrat(
      textStyle: TextStyle(
        fontSize: fontSize,
        color: Colors.white,
        fontWeight: FontWeight.w400,
        letterSpacing: 2,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 60,
        ),
        Text(
          weather.name,
          style: _style(44),
        ),
        Text(
          weather.tempDetails.temp.round().toString(),
          style: _style(100),
        ),
        Text(
          'feels like: ${weather.tempDetails.feelsLike.round()}°C',
          style: _style(18),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          weather.weatherDetails[0].main,
          style: _style(36),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          weather.weatherDetails[0].description,
          style: _style(18),
        ),
        const SizedBox(
          height: 25,
        ),
        Text(
          'Wind Speed:',
          style: _style(24),
        ),
        Text(
          '${weather.windDetails.speed} m/s',
          style: _style(20),
        ),
        const SizedBox(
          height: 10,
        ),
        IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 36,
          ),
          splashRadius: 1,
        ),
      ],
    );
  }
}

class _HourlyForecastWidget extends StatelessWidget {
  const _HourlyForecastWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      margin: const EdgeInsets.all(16),
      height: 250,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.blueGrey,
        borderRadius: BorderRadius.all(
          Radius.circular(25),
        ),
      ),
      child: ListView.builder(
        itemCount: 10,
        padding: const EdgeInsets.only(
          left: 16,
        ),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Container(
          width: 125,
          margin: const EdgeInsets.only(
            bottom: 16,
            top: 16,
            right: 16,
          ),
          decoration: const BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
        ),
      ),
    );
  }
}
