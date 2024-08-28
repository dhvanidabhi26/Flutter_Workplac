import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:travel_assessment/model.dart';


class PlaceDetailsScreen1 extends StatelessWidget {
  final String placeName;

  PlaceDetailsScreen1({required this.placeName});

  Future<Place> fetchPlaceDetails() async {
    final url = 'https://unweeded-bracing.000webhostapp.com/Travel_guidance/aroundplace.php?name=$placeName';
    print('Fetching details from URL: $url');
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        print('Fetched raw data: $data');

        if (data.containsKey('error')) {
          print('Error from server: ${data['error']}');
          throw Exception('Error: ${data['error']}');
        }

        return Place.fromJson(data);
      } else {
        print('HTTP error: ${response.statusCode}');
        throw Exception('Failed to load place details. HTTP error: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching place details: $e');
      throw Exception('Failed to load place details. Please try again later.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Place Details', style: TextStyle(color: Colors.pinkAccent, fontWeight: FontWeight.bold)),
      ),
      body: FutureBuilder<Place>(
        future: fetchPlaceDetails(),
        builder: (context, snapshot)
        {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator(),);
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return Center(child: Text('No details found for this place'));
          } else {
            final place = snapshot.data!;
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  place.imageURL.isNotEmpty
                      ? Image.network(place.imageURL)
                      : Container(height: 200, color: Colors.grey),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(place.name, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(place.description),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}