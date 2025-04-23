import 'dart:convert';

import 'package:flutter/material.dart';

class AreaModel {
  final String id;
  final String governorateId;
  final String nameAr;
  final String nameEn;

  AreaModel({
    required this.id,
    required this.governorateId,
    required this.nameAr,
    required this.nameEn,
  });

  factory AreaModel.fromJson(Map<String, dynamic> json) {
    return AreaModel(
      id: json['id'].toString(),
      governorateId: json['governorate_id'].toString(),
      nameAr: json['city_name_ar'],
      nameEn: json['city_name_en'],
    );
  }

  static List<AreaModel> parseAreas(Map<String, dynamic> jsonData) {
    final data = jsonData["data"] as List;
    return data.map((e) => AreaModel.fromJson(e)).toList();
  }

  static Future<List<AreaModel>> getAreaFromAssets(BuildContext context) async {
    final jsonString = await DefaultAssetBundle.of(
      context,
    ).loadString("assets/governorates/states.json");
    final data = jsonDecode(jsonString);
    //this  jsonDecode(jsonString); Parses the JSON string and converts it into Dart objects
    return parseAreas(data[2]);
  }
}
