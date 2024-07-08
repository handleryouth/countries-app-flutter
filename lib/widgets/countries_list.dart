import 'package:flutter/material.dart';
import 'package:flutter_application/models/countries_model.dart';

class CountriesList extends StatelessWidget {
  final Countries countriesData;

  const CountriesList({super.key, required this.countriesData});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image.network(countriesData.flags.png),
          Text(
            countriesData.name.official,
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
          ),
          Text('Region: ${countriesData.region}'),
          Text('Population: ${countriesData.population}'),
        ],
      ),
    );
  }
}
