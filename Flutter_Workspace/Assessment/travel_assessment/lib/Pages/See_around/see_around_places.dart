import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:travel_assessment/Pages/See_around/see_around_detailscreen.dart';
import 'package:travel_assessment/model.dart';


class PlacesToSeeAroundScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Places to See Around', style: TextStyle(color: Colors.pinkAccent
            , fontWeight: FontWeight.bold)),
      ),
      body: PlacesToSeeAroundScreenList(),
    );
  }
}

class PlacesToSeeAroundScreenList extends StatefulWidget {
  @override
  _PlacesToSeeAroundScreenListState createState() => _PlacesToSeeAroundScreenListState();
}

class _PlacesToSeeAroundScreenListState extends State<PlacesToSeeAroundScreenList> {
  Future<List<Place>> fetchPlaces() async {
    try {
      final response = await http.get(Uri.parse('https://unweeded-bracing.000webhostapp.com/Travel_guidance/around.php'));
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        return data.map((place) => Place.fromJson(place)).toList();
      } else {
        throw Exception('Failed to load places. HTTP error: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching places: $e');
      throw Exception('Failed to load places. Please try again later.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Place>>(
      future: fetchPlaces(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: Text('Loading Places ...'));
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData) {
          return Center(child: Text('No  places found'));
        } else {
          final places = snapshot.data ?? [];
          return ListView.builder(
            itemCount: places.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: places[index].imageURL.isNotEmpty
                    ? Image.network(places[index].imageURL, width: 50, height: 50, fit: BoxFit.cover)
                    : Icon(Icons.location_pin, color: Colors.pinkAccent),
                title: Text(places[index].name, style: TextStyle(color: Colors.pinkAccent)),
                trailing: Icon(Icons.arrow_forward_ios, color: Colors.pinkAccent),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PlaceDetailsScreen1(placeName: places[index].name),
                    ),
                  );
                },
              );
            },
          );
        }
      },
    );
  }
}