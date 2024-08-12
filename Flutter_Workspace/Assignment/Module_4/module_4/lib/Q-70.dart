import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Bottompage extends StatefulWidget {
  const Bottompage({super.key});

  @override
  State<Bottompage> createState() => _BottompageState();
}

class _BottompageState extends State<Bottompage> {

  final List<Widget> _pages = [
    GalleryPage(),
    AudioPage(),
    VideoPage(),
  ];
  int selectedIndex = 0;
  void _onItemTapped(int index)
  {
    setState(()
    {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Welcome",style: TextStyle(color: Colors.white),),backgroundColor: Colors.indigo,),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.image),
              label: "Gallery",
              backgroundColor:Colors.indigo
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.audiotrack),
              label: "Audio",
              backgroundColor:Colors.indigo,
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.play_arrow_rounded),
              label: "Video",
              backgroundColor:Colors.indigo
          ),
        ],
        type: BottomNavigationBarType.shifting,
        currentIndex: selectedIndex,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
      body: _pages[selectedIndex],
    );
  }
}

class GalleryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child:GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount
            (
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 1
          ),
          itemCount: 6,
          itemBuilder: (context,index)
          {
              return GestureDetector(
                child: Image.asset("assets/module4_1.jpg"),
              );
          })
    );
  }
}

class AudioPage extends StatelessWidget {
  const AudioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
        child:ListView.builder(
            itemCount: 4,
            itemBuilder: (context,index)
            {
              return ListTile
                (
                leading: Icon(Icons.audiotrack),
                title: Text("Audio"),
                subtitle: Text("Description of Audio"),
              );
            })
    );
  }
}
class VideoPage extends StatelessWidget {
  const VideoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child:ListView.builder(
            itemCount: 4,
            itemBuilder: (context,index)
            {
              return ListTile
                (
                leading: Icon(Icons.play_arrow_rounded),
                title: Text("Video"),
                subtitle: Text("Description of Video"),
              );
            })
    );
  }
}


