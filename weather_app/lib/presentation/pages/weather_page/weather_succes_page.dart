import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/domain/entity/weather_data/weather.dart';
import 'package:weather_app/domain/entity/weather_forecast/weather_forecast.dart';

class WeatherSuccesPage extends StatelessWidget {
  final Weather currentWeather;
  final WeatherForecast weatherForecast;
  const WeatherSuccesPage(
      {Key? key, required this.currentWeather, required this.weatherForecast})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final imagePath =
        'http://openweathermap.org/img/wn/${currentWeather.weatherDetails[0].icon}@2x.png';
    return Scaffold(
      body: Container(
        width: size.width,
        decoration: const BoxDecoration(
            color: Colors.black87,
            image: DecorationImage(
              image: AssetImage('assets/images/bg_weather_image.png'),
              fit: BoxFit.cover,
              opacity: 0.4,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black54,
                blurRadius: 10,
              ),
            ]),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            _WeatherMainInfo(imagePath: imagePath, weather: currentWeather),
            _HourlyForecastWidget(
              weatherForecast: weatherForecast,
            ),
          ],
        ),
      ),
    );
  }
}

class _WeatherMainInfo extends StatelessWidget {
  const _WeatherMainInfo({
    Key? key,
    required this.weather,
    required String imagePath,
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
  final WeatherForecast weatherForecast;
  const _HourlyForecastWidget({Key? key, required this.weatherForecast})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      clipBehavior: Clip.hardEdge,
      margin: const EdgeInsets.all(16),
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(0, 0, 0, 0.1),
        borderRadius: BorderRadius.all(
          Radius.circular(25),
        ),
      ),
      child: ListView.builder(
          itemCount: weatherForecast.list.length ~/ 5,
          padding: const EdgeInsets.only(
            left: 16,
          ),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            initializeDateFormatting();
            final date = DateFormat.Hm()
                .format(DateTime.parse(weatherForecast.list[index].dtTxt));
            return Container(
              width: 100,
              margin: const EdgeInsets.only(
                right: 16,
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 20,
              ),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    date.toString(),
                    style: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Image.network(
                    'http://openweathermap.org/img/wn/${weatherForecast.list[index].weather[0].icon}@2x.png',
                  ),
                  Text(
                    '${weatherForecast.list[index].main.temp.round()}°C',
                    style: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
