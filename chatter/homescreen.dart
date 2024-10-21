import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'authicatication.dart';
import 'login.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<dynamic> _messages = [];
  String _userEmail = 'user@example.com'; // Default email

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async
  {
    try {
      var resp = await http.get(
        Uri.parse('https://darshan7842.000webhostapp.com/Messanging_app/message.php'),
      );
      if (resp.statusCode == 200) {
        print('Response body: ${resp.body}');
        try {
          var decodedData = jsonDecode(resp.body);
          if (decodedData is List) {
            setState(() {
              _messages = decodedData;
            });
          } else {
            print('Unexpected JSON format: $decodedData');
          }
        } catch (e) {
          print('Error decoding JSON: $e');
        }
      } else {
        print('Failed to load data: ${resp.statusCode}');
      }
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Chatter",
          style: TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.deepPurple),
            onPressed: () {
              // Add action here
            },
          ),
        ],
      ),
      body: Column(
        children:
        [
          _messages.isEmpty
              ? Center(child: CircularProgressIndicator())
              : Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                var alignment = (_messages[index]['messanger'] == 'Darshan')
                    ? Alignment.centerRight
                    : Alignment.centerLeft;
                return Container(
                  alignment: alignment,
                  padding: const EdgeInsets.all(12),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: _messages[index]['messanger'] == 'Darshan'
                          ? CrossAxisAlignment.end
                          : CrossAxisAlignment.start,
                      children: [
                        Text(
                          _messages[index]['messanger'],
                          style: const TextStyle(fontSize: 10, color: Colors.white),
                        ),
                        Text(_messages[index]['message']),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          _buildMessageInput(),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('Welcome'), // Replace with dynamic data if available
              accountEmail: Text('user@gmail.com'), // Dynamic user email
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  _userEmail.isNotEmpty ? _userEmail[0].toUpperCase() : '', // Placeholder initial
                  style: TextStyle(fontSize: 40.0, color: Colors.black),
                ),
              ),
            ),
            ListTile(
              title: Text('Profile'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
              },
            ),
            ListTile(
              title: Text('Chats'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ChatsPage()));
              },
            ),
            ListTile(
              title:  Text('Settings'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage()));
              },
            ),
            ListTile(
              title: Text('About'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => AboutPage()));
              },
            ),
            ListTile(
              title: Text('Logout'),
              leading: Icon(Icons.logout),
              onTap: () {
                AuthenticationService().logoutUser().whenComplete(() async {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ),
                  );
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageInput() {
    var messageController = TextEditingController();
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: messageController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: "Enter Your  Message",
                prefixIcon: Icon(Icons.message_outlined),
                suffixIcon: IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    if (messageController.text.isNotEmpty) {
                      // Send message logic
                      print("Message sent: ${messageController.text}");
                      messageController.clear();
                    }
                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Dummy Pages for navigation
class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: Center(child: Text('Profile Page')),
    );
  }
}

class ChatsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Chats')),
      body: Center(child: Text('Chats Page')),
    );
  }
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: Center(child: Text('Settings Page')),
    );
  }
}

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('About')),
      body: Center(child: Text('About Page')),
    );
  }
}