import 'dart:convert';
import 'package:flutter_application/widgets/countries_list.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_application/models/countries_model.dart';

class CountryDetailScreen extends StatefulWidget {
  final String name;
  const CountryDetailScreen({super.key, required this.name});

  @override
  State<StatefulWidget> createState() {
    return CountryDetailState();
  }
}

class CountryDetailState extends State<CountryDetailScreen> {
  late Future<List<Countries>> countriesDataState;

  List<Countries> parsedCountries(String responseBody) {
    final parsed = jsonDecode(responseBody) as List;
    parsed.cast<Map<String, dynamic>>();

    return parsed.map<Countries>((json) => Countries.fromJson(json)).toList();
  }

  Future<List<Countries>> fetchCountries() async {
    final response = await http.get(Uri.parse(
        'https://restcountries.com/v3.1/name/${widget.name}?fullText=true'));

    if (response.statusCode == 200) {
      var res = parsedCountries(response.body);

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
        title: const Text("Detail"),
      ),
      body: FutureBuilder(
          future: countriesDataState,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return CountriesList(countriesData: snapshot.data![0]);
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
