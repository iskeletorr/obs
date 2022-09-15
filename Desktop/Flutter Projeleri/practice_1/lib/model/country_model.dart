class CountryModel {
  String? countryCode;
  String? countryName;
  String? currencyCode;
  String? population;
  String? capital;
  String? continentName;

  CountryModel({this.countryCode, this.countryName, this.currencyCode, this.population, this.capital, this.continentName});

  CountryModel.fromJson(Map<String, dynamic> json) {
    countryCode = json['countryCode'];
    countryName = json['countryName'];
    currencyCode = json['currencyCode'];
    population = json['population'];
    capital = json['capital'];
    continentName = json['continentName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['countryCode'] = countryCode;
    data['countryName'] = countryName;
    data['currencyCode'] = currencyCode;
    data['population'] = population;
    data['capital'] = capital;
    data['continentName'] = continentName;
    return data;
  }
}
