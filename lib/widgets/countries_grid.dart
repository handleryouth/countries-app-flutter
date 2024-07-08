import 'package:flutter/material.dart';
import 'package:flutter_application/models/countries_model.dart';
import 'package:flutter_application/screens/country_detail_screen.dart';

class CountriesGrid extends StatelessWidget {
  final List<Countries> countriesListData;
  final BuildContext context;

  const CountriesGrid(
      {super.key, required this.context, required this.countriesListData});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        primary: false,
        padding: const EdgeInsets.all(10),
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        crossAxisCount: 2,
        children: List.generate(countriesListData.length, (index) {
          return InkResponse(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CountryDetailScreen(
                          name: countriesListData[index].name.official)));
            },
            child: Column(
              children: [
                Expanded(
                    child: Image.network(countriesListData[index].flags.png)),
                Text(
                  countriesListData[index].name.official,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        }));
  }
}
