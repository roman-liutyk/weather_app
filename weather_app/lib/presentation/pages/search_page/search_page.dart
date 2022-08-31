import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:searchfield/searchfield.dart';
import 'package:weather_app/data/datasource/remote.dart';
import 'package:weather_app/data/repos/cities_repository.dart';
import 'package:weather_app/domain/entity/cities/cities.dart';
import 'package:weather_app/presentation/bloc/cities/cities_bloc.dart';
import 'package:weather_app/presentation/bloc/cities/cities_event.dart';
import 'package:weather_app/presentation/bloc/cities/cities_state.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (BuildContext context) => CitiesRepository(RemoteDataSource()),
      child: BlocProvider(
        create: (BuildContext context) =>
            CitiesBloc(RepositoryProvider.of<CitiesRepository>(context))
              ..add(LoadCitiesEvent()),
        child: BlocBuilder<CitiesBloc, CitiesState>(builder: (context, state) {
          if (state is CitiesLoadingState) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (state is CitiesLoadedState) {
            final List<String> cities = [];
            for (City element in state.cities.data) {
              for (String city in element.cities) {
                cities.add(city);
              }
            }
            return _SearchPageForm(cities: cities);
          }
          return Scaffold(
            body: RefreshIndicator(
              onRefresh: () async => context.read<CitiesBloc>().add(
                    LoadCitiesEvent(),
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
        }),
      ),
    );
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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SearchField(
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
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () => _searchButtonAction(_controller.text.trim()),
                child: const Text('Show Weather'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _searchButtonAction(String location) {
    if (location.isEmpty) return;
    Navigator.of(context).pushNamed('/weather', arguments: location);
  }
}
