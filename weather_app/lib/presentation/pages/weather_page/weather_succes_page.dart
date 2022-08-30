import 'package:flutter/material.dart';
import 'package:weather_app/domain/entity/weather_data/weather.dart';


class WeatherSuccesPage extends StatelessWidget {
  final Weather weather;
  const WeatherSuccesPage({Key? key, required this.weather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imagePath =
        'http://openweathermap.org/img/wn/${weather.weatherDetails[0].icon}@2x.png';
    return Scaffold(
      body: Column(
        children: [
          _MainWeatherInfo(imagePath: imagePath, weather: weather),
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
    final Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      decoration: const BoxDecoration(
          color: Colors.black87,
          image: DecorationImage(
            image: AssetImage('assets/images/bg_weather_image.jpg'),
            fit: BoxFit.cover,
            opacity: 0.6,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black54,
              blurRadius: 10,
            ),
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 60,
          ),
          const Text(
            'Current weather:',
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 24,
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
          const SizedBox(
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
          const SizedBox(
            height: 16,
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                Colors.grey[200],
              ),
            ),
            child: SizedBox(
              width: size.width / 3.5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.arrow_back_rounded,
                    color: Color.fromARGB(255, 90, 167, 230),
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Text(
                    'Return',
                    style: TextStyle(
                      color: Color.fromARGB(255, 90, 167, 230),
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
