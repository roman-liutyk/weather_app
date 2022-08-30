import 'package:flutter/material.dart';

import '../../../domain/entity/weather_data/weather_data.dart';

class WeatherSuccesPage extends StatelessWidget {
  final WeatherData weather;
  const WeatherSuccesPage({Key? key, required this.weather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imagePath =
        'http://openweathermap.org/img/wn/${weather.weatherDetails[0].icon}@2x.png';
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            _MainWeatherInfo(imagePath: imagePath, weather: weather),
          ],
        ),
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
  final WeatherData weather;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height / 2,
      decoration: const BoxDecoration(
          color: Colors.black87,
          image: DecorationImage(
            image: AssetImage('assets/images/bg_weather_image.jpg'),
            fit: BoxFit.cover,
            opacity: 0.7,
          ),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black54,
              blurRadius: 10,
            ),
          ]),
      child: Column(
        children: [
          const SizedBox(
            height: 32,
          ),
          Text(
            weather.name,
            style: const TextStyle(
              fontSize: 48,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          Image.network(
            imagePath,
            scale: 0.75,
            height: 125,
            width: 125,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            '${weather.tempDetails.temp.round()}°C',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 42,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          Text(
            'feels like: ${weather.tempDetails.feelsLike.round()}°C',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 46,
          ),
          Text(
            weather.weatherDetails[0].main,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            weather.weatherDetails[0].description,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
