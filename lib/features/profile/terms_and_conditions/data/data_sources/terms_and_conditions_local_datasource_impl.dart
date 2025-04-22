
import 'dart:convert';
import 'dart:developer';
import 'package:flowery/features/profile/about_us/data/Models/about_us_model.dart';
import 'package:flowery/features/profile/terms_and_conditions/data/Models/terms_and_conditions_model.dart';
import 'package:flowery/features/profile/terms_and_conditions/data/data_sources/terms_and_conditions_local_datasource.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: TermsAndConditionsLocalDataSource)
class TermsAndConditionsLocalDataSourceImpl extends TermsAndConditionsLocalDataSource{
  @override
  Future<TermsAndConditionsModel> getTermsAndConditions() async {
    try {
      // Load JSON file
      final jsonString = await rootBundle.loadString(
          'assets/jsonFiles/Flowery Terms and Conditions JSON with Arabic and English.json'
      );

      // Log raw JSON (optional for debugging)
      log("JSON Content: $jsonString");

      // Decode JSON
      final jsonMap = json.decode(jsonString) as Map<String, dynamic>;
      log("Decoded JSON: $jsonMap");

      // Parse into model
      return TermsAndConditionsModel.fromJson(jsonMap);
    } on FormatException catch (e) {
      log("JSON Format Error: $e");
      throw const FormatException("Invalid JSON format in about us content");
    }
  }
  }