import 'package:flutter/material.dart';
import 'package:india_today/bloc/fetchbloc.dart';
import 'package:india_today/models/talk_to_astro_model.dart';
import 'package:india_today/services/get_astro.dart';

class AstroProvider extends ChangeNotifier {
  List<Datum> astroDetails = [];
  bool search = false;
  List searchList = [];
  searchastro(value) {
    List result = [];
    print('woah');
    if (value.isEmpty) {
      result = astroDetails;
    } else {
      result.addAll(astroDetails
          .where((element) => element.firstName
              .toString()
              .toLowerCase()
              .contains(value.toLowerCase()))
          .toList());
    }

    searchList = result;

    notifyListeners();
  }

  setsearch() {
    if (search)
      search = false;
    else
      search = true;

    notifyListeners();
  }

  fetchAstro() async {
    astroDetails = await AstroProviderService().fetchAstroList();
    print(astroDetails);
    notifyListeners();
  }

  experHightoLow() async {
    astroDetails.sort((b, a) => a.experience.compareTo(b.experience));
    print(astroDetails);
    notifyListeners();
  }

  experLowtoHigh() async {
    astroDetails.sort((a, b) => a.experience.compareTo(b.experience));
    print(astroDetails);
    notifyListeners();
  }

  priceLowtoHigh() async {
    astroDetails.sort((a, b) =>
        a.minimumCallDurationCharges.compareTo(b.minimumCallDurationCharges));
    print(astroDetails);
    notifyListeners();
  }

  priceHightoLow() async {
    astroDetails.sort((b, a) =>
        a.minimumCallDurationCharges.compareTo(b.minimumCallDurationCharges));
    print(astroDetails);
    notifyListeners();
  }
}
