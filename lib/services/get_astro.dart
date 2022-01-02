import 'package:http/http.dart' as http;
import 'package:india_today/constants/string.dart';
import 'package:india_today/controllers/astroprovider.dart';
import 'dart:convert';
import 'package:india_today/models/talk_to_astro_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class AstroBlocService {
  Future<AstroDetails> getAstro() async {
    var client = http.Client();
    var astroModel;

    try {
      var response = await client.get(Strings.astroUrl);
      if (response.statusCode == 200) {
        astroModel = AstroDetails.fromJson(json.decode(response.body));
      }
    } catch (Exception) {
      return astroModel;
    }

    return astroModel;
  }
}

class AstroProviderService {
  fetchAstroList() async {
    List<Datum> astroDetails = [];

    final response =
        await http.get('https://www.astrotak.com/astroapi/api/agent/all');
    if (response.statusCode == 200) {
      final coursesJson = AstroDetails.fromJson(json.decode(response.body));

      for (var data in coursesJson.data) {
        astroDetails.add(Datum(
          id: data.id,
          urlSlug: data.urlSlug,
          namePrefix: data.namePrefix,
          firstName: data.firstName,
          lastName: data.lastName,
          aboutMe: data.aboutMe,
          profliePicUrl: data.profliePicUrl,
          experience: data.experience,
          languages: data.languages,
          minimumCallDuration: data.minimumCallDuration.toString(),
          minimumCallDurationCharges:
              data.minimumCallDurationCharges.toString(),
          additionalPerMinuteCharges:
              data.additionalPerMinuteCharges.toString(),
          isAvailable: data.isAvailable,
          rating: data.rating,
          skills: data.skills,
          isOnCall: data.isOnCall,
          freeMinutes: data.freeMinutes.toString(),
          additionalMinute: data.additionalMinute.toString(),
          images: data.images,
        ));
      }

      return astroDetails;
    } else {
      throw Exception('Failed to load post');
    }
  }
}
