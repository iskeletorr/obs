// To parse this JSON data, do
//
//     final exchangeRate = exchangeRateFromJson(jsonString);

import 'dart:convert';

import 'package:practice_1/model/rate_model.dart';

ExchangeRateModel exchangeRateModelFromJson(String str) => ExchangeRateModel.fromJson(json.decode(str));

// String exchangeRateModelToJson(ExchangeRateModel data) => json.encode(data.toJson());

class ExchangeRateModel {
  ExchangeRateModel({
    this.result,
    this.provider,
    this.documentation,
    this.termsOfUse,
    this.timeLastUpdateUnix,
    this.timeLastUpdateUtc,
    this.timeNextUpdateUnix,
    this.timeNextUpdateUtc,
    this.timeEolUnix,
    this.baseCode,
    this.rates,
  });

  String? result;
  String? provider;
  String? documentation;
  String? termsOfUse;
  int? timeLastUpdateUnix;
  String? timeLastUpdateUtc;
  int? timeNextUpdateUnix;
  String? timeNextUpdateUtc;
  int? timeEolUnix;
  String? baseCode;
  List<RateModel>? rates;

  factory ExchangeRateModel.fromJson(Map<String, dynamic> json) => ExchangeRateModel(
      result: json["result"],
      provider: json["provider"],
      documentation: json["documentation"],
      termsOfUse: json["terms_of_use"],
      timeLastUpdateUnix: json["time_last_update_unix"],
      timeLastUpdateUtc: json["time_last_update_utc"],
      timeNextUpdateUnix: json["time_next_update_unix"],
      timeNextUpdateUtc: json["time_next_update_utc"],
      timeEolUnix: json["time_eol_unix"],
      baseCode: json["base_code"],
      rates: json["rates"].entries.map<RateModel>(
        (e) => RateModel(e.key,e.value*1.0)).toList(),);
                    // double.parse(e.value.toString())
  // Map<String, dynamic> toJson() => {
  //       "result": result,
  //       "provider": provider,
  //       "documentation": documentation,
  //       "terms_of_use": termsOfUse,
  //       "time_last_update_unix": timeLastUpdateUnix,
  //       "time_last_update_utc": timeLastUpdateUtc,
  //       "time_next_update_unix": timeNextUpdateUnix,
  //       "time_next_update_utc": timeNextUpdateUtc,
  //       "time_eol_unix": timeEolUnix,
  //       "base_code": baseCode,
  //       "rates": Map.from(rates!).map((k, v) => MapEntry<String, dynamic>(k, v)),
  //     };
}
