import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application/helpers/helper_function.dart';
import 'package:flutter_application/models/countries_model.dart';
import 'package:flutter_application/widgets/countries_grid.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  late Future<List<Countries>> countriesDataState;

  List<Countries> parsedCountries(String responseBody) {
    final parsed = jsonDecode(responseBody) as List;
    parsed.cast<Map<String, dynamic>>();

    return parsed.map<Countries>((json) => Countries.fromJson(json)).toList();
  }

  Future<List<Countries>> fetchCountries() async {
    final response =
        await http.get(Uri.parse('https://restcountries.com/v3.1/all'));

    if (response.statusCode == 200) {
      var res = HelperFunctions.parsedJsonDataToList<Countries>(response.body,
          (response) {
        return Countries.fromJson(response);
      });
      return res;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  @override
  void initState() {
    super.initState();
    countriesDataState = fetchCountries();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Country List"),
          surfaceTintColor: Colors.amber,
        ),
        body: FutureBuilder<List<Countries>>(
          future: countriesDataState,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: Text('An error has occurred!'),
              );
            } else if (snapshot.hasData) {
              return CountriesGrid(
                  context: context, countriesListData: snapshot.data!);
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }
}
