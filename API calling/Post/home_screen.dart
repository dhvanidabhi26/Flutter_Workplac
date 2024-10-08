import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PostExampleScreen extends StatefulWidget {
  @override
  _PostExampleScreenState createState() => _PostExampleScreenState();
}

class _PostExampleScreenState extends State<PostExampleScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();

  Future<void> createPost(String title, String body) async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');

    try {
      final response = await http.post(url, body: jsonEncode({
          'title': title,
          'body': body,
          'userId': 1,
        }),
      );

      if (response.statusCode == 201)
      {
        print('Post created successfully: ${response.body}');
      } else
      {
        print('Failed to create post: ${response.statusCode}');
      }
    } catch (e) {
      print('Error occurred: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post Example'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(hintText: 'Title'),
            ),
            TextField(
              controller: bodyController,
              decoration: InputDecoration(hintText: 'Body'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                createPost(titleController.text, bodyController.text);
              },
              child: Text('Submit Post'),
            ),
          ],
        ),
      ),
    );
  }
}
