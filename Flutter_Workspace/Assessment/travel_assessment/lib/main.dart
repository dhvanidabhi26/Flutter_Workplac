import 'package:flutter/material.dart';
import 'package:travel_assessment/Pages/See_around/see_around_places.dart';
import 'package:travel_assessment/Pages/historical_place/historical_place.dart';

import 'HomePage.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      primarySwatch: Colors.blue,
      fontFamily: AutofillHints.language,
    ),
    home: HomePage(),
    routes: {
      'historical_places': (context) => HistoricalPlacesScreen(),
      'places_to_see_around': (context) => PlacesToSeeAroundScreen(),

    },
    debugShowCheckedModeBanner: false,
  ));
}