import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:searchfield/searchfield.dart';
import 'package:weather_app/domain/entity/countries/countries.dart';
import 'package:weather_app/presentation/bloc/countries/countries_bloc.dart';
import 'package:weather_app/presentation/bloc/countries/countries_event.dart';
import 'package:weather_app/presentation/bloc/countries/countries_state.dart';
import 'package:weather_app/common/navigation/main_navigation.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CountriesBloc, CountriesState>(
        builder: (context, state) {
      if (state is CountriesLoadingState) {
        return Scaffold(
          body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Color.fromARGB(255, 0, 140, 255),
                Color.fromARGB(255, 85, 201, 255),
              ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            ),
            child: const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            ),
          ),
        );
      } else if (state is CountriesLoadedState) {
        final List<String> cities = [];
        for (Country country in state.countries.data) {
          for (String city in country.cities) {
            cities.add(city);
          }
        }
        return _SearchPageForm(cities: cities);
      }
      return Scaffold(
        body: RefreshIndicator(
          onRefresh: () async => context.read<CountriesBloc>().add(
                LoadCountriesEvent(),
              ),
          child: ListView(
            children: const [
              Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  child: Text(
                    'Something went wrong!!! Check your internet connection and pull to refresh!!!',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

class _SearchPageForm extends StatefulWidget {
  final List<String> cities;
  const _SearchPageForm({
    Key? key,
    required this.cities,
  }) : super(key: key);

  @override
  State<_SearchPageForm> createState() => _SearchPageFormState();
}

class _SearchPageFormState extends State<_SearchPageForm> {
  late final List<String> cities = widget.cities;
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 0, 140, 255),
            Color.fromARGB(255, 85, 201, 255),
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
              top: 48,
              bottom: 24,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  textAlign: TextAlign.left,
                  text: TextSpan(
                    children: const [
                      TextSpan(
                        text: 'Welcome\n',
                      ),
                      TextSpan(
                        text: 'To my Weather App',
                      ),
                    ],
                    style: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 60,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  height: 50,
                  width: double.infinity,
                  child: SearchField(
                    controller: _controller,
                    suggestions: cities
                        .map((city) => SearchFieldListItem(city,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                              ),
                              child: Text(
                                city,
                                style: const TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            )))
                        .toList(),
                    autoCorrect: false,
                    searchInputDecoration: const InputDecoration(
                      hintText: 'Enter your location',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () =>
                        _searchButtonAction(_controller.text.trim()),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Colors.white,
                      ),
                      foregroundColor: MaterialStateProperty.all(
                        Colors.blue[600],
                      ),
                      padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(
                          vertical: 16,
                        ),
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                    ),
                    child: const Icon(
                      Icons.arrow_forward,
                      color: Colors.blue,
                      size: 24,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _searchButtonAction(String location) {
    if (location.isEmpty) return;
    Navigator.of(context)
        .pushNamed(MainNavigationRoutesNames.weatherPage, arguments: location);
  }
}
