import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:practice_1/home/exchange_rate/country_detail.dart';
import 'package:practice_1/model/country_model.dart';

class CountryList extends StatefulWidget {
  const CountryList({super.key});

  @override
  State<CountryList> createState() => _CountryListState();
}

class _CountryListState extends State<CountryList> {
  TextEditingController textController = TextEditingController();
  List<CountryModel> countryNames = [];
  List<CountryModel> searchResult = [];
  late Future<List<CountryModel>> futureCountries;
  
  Future<List<CountryModel>> iterateCountries() async {
    final response = await DefaultAssetBundle.of(context).loadString('assets/countries/countries.json');
    List data = jsonDecode(response);
    countryNames = data.map((e) => CountryModel.fromJson(e)).toList();
    setState(() {});
    return countryNames;
  }

  Future onSearchTextChanged(String text) async {
    searchResult.clear();
    if (text.isEmpty) {
      setState(() {});
      // return searchResult;
    }
    countryNames.forEach((CountryModel) {
      if (CountryModel.countryName!.toLowerCase().contains(text.toLowerCase())) searchResult.add(CountryModel);
    });
    setState(() {});
    // return searchResult;
  }

  @override
  void initState() {
    super.initState();
    FlutterNativeSplash.remove();
    futureCountries = iterateCountries();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.search),
        title: TextField(
          controller: textController,
          showCursor: true,
          decoration: InputDecoration(hintText: 'Search'),
          onChanged: onSearchTextChanged,
        ),
      ),
      // body: textController.text.isEmpty ? countryListBuilder(countryNames) : countryListBuilder(searchResult),
      body: FutureBuilder<List<CountryModel>>(
        future: futureCountries,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return Center(child: CircularProgressIndicator());
          }
          if ((textController.text.isNotEmpty || searchResult.isNotEmpty)) {
            return countryListBuilder(searchResult);
          } else {
            return countryListBuilder(countryNames);
          }
        },
      ),
    );
  }

  // ListView countryListBuilder(List<CountryModel> countryNames, AsyncSnapshot<List<CountryModel>> snapshot) {
  //   return ListView.builder(
  //       itemCount: snapshot.data!.length,
  //       itemBuilder: (context, index) {
  //         return ListTile(
  //             leading: Image.asset('assets/icons/${snapshot.data![index].countryCode} - ${snapshot.data![index].countryName}.png'),
  //             title: Text(snapshot.data![index].countryName.toString()));
  //       });
  // }

  ListView countryListBuilder(List<CountryModel> countryNames) {
    return ListView.builder(
        itemCount: countryNames.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.asset('assets/icons/${countryNames[index].countryCode} - ${countryNames[index].countryName}.png'),
            title: Text(countryNames[index].countryName.toString()),
            onTap: (() {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => CountryDetail(model: countryNames[index]),
                ),
              );
            }),
          );
        });
  }
}
