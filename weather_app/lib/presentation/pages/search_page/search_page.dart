import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
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
              TextFormField(
                controller: _controller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
                onEditingComplete: () =>
                    searchButtonAction(_controller.text.trim()),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () => searchButtonAction(_controller.text.trim()),
                child: const Text('Show Weather'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void searchButtonAction(String location) {
    if (location.isEmpty) return;
    Navigator.of(context).pushNamed('/weather', arguments: location);
  }
}
