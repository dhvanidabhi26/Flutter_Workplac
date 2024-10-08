import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
{
  List<dynamic> dataList = [];

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));

    if (response.statusCode == 200) {
      setState(() {
        dataList = jsonDecode(response.body);
      });
    } else {
      print("Failed to load data");
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("API Calling"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: dataList.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.network(dataList[index]['thumbnailUrl']),
            title: Text(dataList[index]['title']),
            subtitle: Column(children: [
              Image.network(dataList[index]["url"])
            ],),
          );
        },
      ),
    );
  }
}
