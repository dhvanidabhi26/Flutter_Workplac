import 'package:flutter/material.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({super.key});

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Welcome", style: TextStyle(color: Colors.white),), backgroundColor: Colors.indigo,),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Text("Welcome", style: TextStyle(color: Colors.black, fontSize: 25),),
            ),
            ListTile(
              leading: Icon(Icons.image),
              title: Text("Gallery"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => GalleryPage()),);
              },
            ),
            ListTile(
              leading: Icon(Icons.audiotrack),
              title: Text("Audio"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => AudioPage()),);
              },
            ),
            ListTile(
              leading: Icon(Icons.play_arrow_rounded),
              title: Text("Video"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => VideoPage()),);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class GalleryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gallery"),
        backgroundColor: Colors.indigo,
      ),
      body: Center(
        child: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Image.asset("assets/module4_1.jpg"),
              title: Text("Image"),
              subtitle: Text("Description of Image "),
            );
          },
        ),
      ),
    );
  }
}

class AudioPage extends StatelessWidget {
  const AudioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Audio"), backgroundColor: Colors.indigo,),
      body: Center(
        child: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Icon(Icons.audiotrack),
              title: Text("Audio"),
              subtitle: Text("Description of Audio "),
            );
          },
        ),
      ),
    );
  }
}

class VideoPage extends StatelessWidget {
  const VideoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Video"), backgroundColor: Colors.indigo,),
      body: Center(
        child: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Icon(Icons.play_arrow_rounded),
              title: Text("Video "),
              subtitle: Text("Description of Video "),
            );
          },
        ),
      ),
    );
  }
}
