import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:practice_1/model/country_model.dart';
import 'package:http/http.dart' as http;
import 'package:practice_1/model/exchange_rate_model.dart';
import 'package:practice_1/model/rate_model.dart';

class CountryDetail extends StatefulWidget {
  const CountryDetail({super.key, required this.model});
  final CountryModel model;
  @override
  State<CountryDetail> createState() => _CountryDetailState();
}

class _CountryDetailState extends State<CountryDetail> {
  String url = 'https://open.er-api.com/v6/latest/';
  List<RateModel> rateList = [];
  late final Future<List<RateModel>> futureList;
  final rateBox = Hive.box('currencyRates');
  late final box;

  Future<List<RateModel>> getRates() async {
    final response = await http.get(Uri.parse('$url${widget.model.currencyCode!.toLowerCase()}'));
    final jsonData = jsonDecode(response.body);
    final exchangeRateModel = ExchangeRateModel.fromJson(jsonData);
    rateList = exchangeRateModel.rates!;
    //if (!rateBox.containsKey(widget.model.countryName))
    rateBox.put(widget.model.countryName, rateList);
    setState(() {});
    return rateList;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureList = getRates();
    box = rateBox.get(widget.model.countryName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: futureList,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return CustomScrollView(slivers: [sliverAppBar(), extentList()]);
            }
            if (snapshot.connectionState != ConnectionState.done) {
              return const Center(child: CircularProgressIndicator());
            }
            return CustomScrollView(slivers: [sliverAppBar(), extentList()]);
          }),
    );
  }

  SliverAppBar sliverAppBar() {
    return SliverAppBar(
      flexibleSpace: Stack(children: [
        Positioned.fill(
            child: Image.asset(
          'assets/icons/${widget.model.countryCode} - ${widget.model.countryName}.png',
          fit: BoxFit.contain,
        ))
      ]),
      title: Column(
        children: [
          Text(widget.model.countryName.toString()),
          Text(widget.model.countryCode.toString()),
          // Text(widget.model.capital.toString()),
          // Text(widget.model.currencyCode.toString()),
        ],
      ),
      expandedHeight: 200,
      pinned: true,
    );
  }

  SliverFixedExtentList extentList() {
    return SliverFixedExtentList(
      itemExtent: 50.0,
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          if (index == box.length) {
            return const SizedBox(height: 50);
          }
          return ListTile(
            title: Text(box.elementAt(index).currencyName),
            subtitle: Text(box.elementAt(index).currencyRate.toString()),
          );
        },
        childCount: box.length + 1,
      ),
    );
  }
}
