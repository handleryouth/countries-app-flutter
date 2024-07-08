class Flags {
  final String png;
  final String svg;
  String? alt;

  Flags({
    required this.png,
    required this.svg,
    this.alt,
  });

  factory Flags.fromJson(Map<String, dynamic> json) {
    return Flags(png: json["png"], svg: json["svg"]);
  }
}

class CountriesName {
  final String common;
  final String official;

  CountriesName({required this.common, required this.official});

  factory CountriesName.fromJson(Map<String, dynamic> json) {
    return CountriesName(common: json["common"], official: json["official"]);
  }
}

class Countries {
  final CountriesName name;
  List<String>? capital;
  final int population;
  final String region;
  final Flags flags;

  Countries({
    required this.name,
    this.capital,
    required this.population,
    required this.region,
    required this.flags,
  });

  static fromJson(Map<String, dynamic> json) {
    return Countries(
        name: CountriesName.fromJson(json['name']),
        population: json["population"] as int,
        region: json["region"] as String,
        flags: Flags.fromJson(json["flags"]));
  }
}
