import 'dart:convert';
import 'dart:developer';

import 'package:flowery/features/profile/about_us/data/Models/About_us_model.dart';
import 'package:flowery/features/profile/about_us/data/data_sources/about_us_local_data_source.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AboutLocalDataSource)
class AboutLocalDataSourceImpl implements AboutLocalDataSource {
  @override
  Future<AboutUsModel> getLocalAboutUsContent() async {
    try {
      // Load JSON file
      final jsonString = await rootBundle.loadString(
          'assets/jsonFiles/Flowery About Section JSON with Expanded Content.json');

      // Log raw JSON (optional for debugging)
      log("JSON Content: $jsonString");

      // Decode JSON
      final jsonMap = json.decode(jsonString) as Map<String, dynamic>;
      log("Decoded JSON: $jsonMap");
      return AboutUsModel.fromJson(jsonMap);
    } on FormatException catch (e) {
      log("JSON Format Error: $e");
      throw const FormatException("Invalid JSON format in about us content");
    } on PlatformException catch (e) {
      log("File Read Error: $e");
      throw Exception("Failed to read about us content file");
    } catch (e, stackTrace) {
      log("Unknown Error", error: e, stackTrace: stackTrace);
      throw Exception("Failed to load about us content");
    }
  }
}