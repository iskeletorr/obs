// To parse this JSON data, do
//
//     final rateModel = rateModelFromJson(jsonString);

import 'package:hive/hive.dart';
part 'rate_model.g.dart';

@HiveType(typeId: 0)
class RateModel {
  @HiveField(0)
  final String currencyName;
  @HiveField(1)
  final double currencyRate;

  RateModel(this.currencyName, this.currencyRate);
}
