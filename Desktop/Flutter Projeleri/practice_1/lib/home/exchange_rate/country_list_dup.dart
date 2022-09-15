import 'dart:convert';

import 'package:flutter/material.dart';

import '../../model/country_model.dart';
class CountryList extends StatefulWidget {
  const CountryList({Key? key}) : super(key: key);

  @override
  State<CountryList> createState() => _CountryListState();
}

class _CountryListState extends State<CountryList> {
  late final TextEditingController textController;

  late Future<List<CountryModel>> futureCountries;
  List<CountryModel> searchList = [];
  List<CountryModel> countries = [];

  Future<List<CountryModel>> iterateCountries() async {
    final response = await DefaultAssetBundle.of(context)
        .loadString('assets/countries/countries.json');
    List data = jsonDecode(response);
    
    searchList = data.map((e) => CountryModel.fromJson(e)).toList();
    countries = List.from(searchList);
    return searchList;
  }

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
    futureCountries = iterateCountries();
    textController.addListener(() {
      if (searchList.isNotEmpty) {
        searchList = countries
            .where(
              (element) => element.countryName!.toLowerCase().contains(
                    textController.text.toLowerCase(),
                  ),
            )
            .toList();
        searchList = searchList.isEmpty ? List.from(countries) : searchList;
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.search),
        title: TextField(
          controller: textController,
          showCursor: true,
          decoration: const InputDecoration(hintText: 'Search'),
        ),
      ),
      body: FutureBuilder<List<CountryModel>>(
        future: futureCountries,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }
          return countryListBuilder();
        },
      ),
    );
  }

  ListView countryListBuilder() {
    return ListView.builder(
        itemCount: searchList.length,
        itemBuilder: (context, index) {
          return ListTile(
            // leading: Image.asset(
            //     'assets/icons/${searchResult[index].countryCode} - ${searchResult[index].countryName}.png'),
            title: Text(
              searchList[index].countryName.toString(),
            ),
            onTap: (() {}),
          );
        });
  }
}