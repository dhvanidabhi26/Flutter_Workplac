import 'dart:convert';

import 'package:api_calling/api_service.dart';
import 'package:api_calling/model.dart';
import 'package:flutter/material.dart';

class ExampleTwo extends StatefulWidget {
  const ExampleTwo({Key? key}) : super(key: key);

  @override
  _ExampleTwoState createState() => _ExampleTwoState();
}

class _ExampleTwoState extends State<ExampleTwo> {
  ApiService apiService = ApiService();
  List<Map<String, dynamic>> photosList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPhotos();
  }

  void getPhotos() async {
    final data = await apiService.getPhotos();
    setState(() {
      photosList = data!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Api Course'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: photosList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(photosList[index]['title']),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
