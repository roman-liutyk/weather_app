import 'package:flutter/material.dart';
import 'package:weather_app/presentation/pages/search_page.dart';
import 'package:weather_app/presentation/pages/weather_page.dart';

void main() {
  runApp(const MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const SearchPage(),
        '/weather': (context) => const WeatherPage(),
      },
      initialRoute: '/',
    );
  }
}
