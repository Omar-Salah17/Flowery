import 'dart:convert';

import 'package:flutter/material.dart';

class CityModel {
  final String id;
  final String nameAr;
  final String nameEn;

  CityModel({required this.id, required this.nameAr, required this.nameEn});

  factory CityModel.fromJson(Map<String, dynamic> json) {
    return CityModel(
      id: json['id'],
      nameAr: json['governorate_name_ar'],
      nameEn: json['governorate_name_en'],
    );
  }
  static List<CityModel> parseCities(Map<String, dynamic> jsonData) {
    final data = jsonData["data"] as List;
    return data.map((e) => CityModel.fromJson(e)).toList();
  }

  static Future<List<CityModel>> getCitiesFromAssets(
    BuildContext context,
  ) async {
    final jsonString = await DefaultAssetBundle.of(
      context,
    ).loadString("assets/governorates/cities.json");
    final data = jsonDecode(jsonString);
    //this  jsonDecode(jsonString); Parses the JSON string and converts it into Dart objects
    return parseCities(data[2]);
  }
}
