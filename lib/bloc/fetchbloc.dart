import 'dart:async';

import 'dart:developer';
import 'package:india_today/models/talk_to_astro_model.dart';
import 'package:india_today/services/get_astro.dart';

enum AstroAction { FetchAstro }

class AstroBloc {
  int counter;
  final _stateStreamController = StreamController<List<Datum>>();
  StreamSink<List<Datum>> get astroSink => _stateStreamController.sink;
  Stream<List<Datum>> get astroStream => _stateStreamController.stream;

  final _eventStreamController = StreamController<AstroAction>();
  StreamSink<AstroAction> get eventSink => _eventStreamController.sink;
  Stream<AstroAction> get _eventStream => _eventStreamController.stream;
  List<Datum> astroDetails = [];
  bool setsearching = false;

  AstroBloc() {
    _eventStream.listen((event) async {
      if (event == AstroAction.FetchAstro) {
        var coursesJson = await AstroBlocService().getAstro();
        astroSink.add(coursesJson.data);

        return coursesJson;
      }
    });
  }
  experLowtoHigh() async {
    var coursesJson = await AstroBlocService().getAstro();
    List<Datum> _filteredList = coursesJson.data
      ..sort((a, b) => a.experience.compareTo(b.experience));
    astroSink.add(_filteredList);
  }

  priceLowtoHigh() async {
    var coursesJson = await AstroBlocService().getAstro();
    List<Datum> _filteredList = coursesJson.data
      ..sort((a, b) =>
          a.minimumCallDurationCharges.compareTo(b.minimumCallDurationCharges));
    astroSink.add(_filteredList);
  }

  priceHightoLow() async {
    var coursesJson = await AstroBlocService().getAstro();
    List<Datum> _filteredList = coursesJson.data
      ..sort((b, a) =>
          a.minimumCallDurationCharges.compareTo(b.minimumCallDurationCharges));
    astroSink.add(_filteredList);
  }

  experHightoLow() async {
    print('wtf');
    var coursesJson = await AstroBlocService().getAstro();
    List<Datum> _filteredList = coursesJson.data
      ..sort((b, a) => a.experience.compareTo(b.experience));
    astroSink.add(_filteredList);
  }

  search(String searchQuery) async {
    var coursesJson = await AstroBlocService().getAstro();
    if (searchQuery.isEmpty) {
      coursesJson = await AstroBlocService().getAstro();
      astroSink.add(coursesJson.data);
    } else {
      List<Datum> _filteredList = coursesJson.data
          .where((Datum user) =>
              user.firstName.toLowerCase().contains(searchQuery.toLowerCase()))
          .toList();
      astroSink.add(_filteredList);
    }
  }

  void dispose() {
    _stateStreamController.close();
    _eventStreamController.close();
  }
}
