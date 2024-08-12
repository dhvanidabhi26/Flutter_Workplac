import 'package:carousel_slider/carousel_slider.dart';
import 'package:english_dictionary/Database/Dbhelper.dart';
import 'package:english_dictionary/widgets/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:url_launcher/url_launcher.dart';

import 'view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final FlutterTts flutterTts = FlutterTts();
  final TextEditingController wordController = TextEditingController();
  final TextEditingController meaningController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  MyDb mydb = MyDb();

  @override
  void initState() {
    mydb.open();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title:
        const Text("Own Dictionary", style: TextStyle(color: Colors.white)),
        backgroundColor: kBrown,
      ),
      body: Container(
        padding: const EdgeInsets.all(30),
        color: kLightBrown, // Set background color of the body
        child: Form(
          key: _formKey,
          child:
          Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            SizedBox(
              height: 150,
              child: CarouselSlider(
                items: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: const DecorationImage(
                        image: AssetImage("images/images01.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: const DecorationImage(
                        image: AssetImage("images/images02.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: const DecorationImage(
                        image: AssetImage("images/images03.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: const DecorationImage(
                        image: AssetImage("images/images04.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: const DecorationImage(
                        image: AssetImage("images/images05.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: const DecorationImage(
                        image: AssetImage("images/images06.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
                options: CarouselOptions(
                  height: 150.0,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  autoPlayCurve: Curves.easeInQuad,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: Duration(milliseconds: 1000),
                ),
              ),
            ),
            const SizedBox(height: 40),
            const Text(
              "Add a Word",
              style: TextStyle(
                  color: white, fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    speak(wordController.text);
                  },
                  icon: const Icon(Icons.volume_up, color: white),
                ),
                SizedBox(
                  height: 100,
                  width: 200,
                  child: TextFormField(
                    controller: wordController,
                    decoration: const InputDecoration(
                      labelText: 'Word',
                      hintText: 'Enter a Word',
                      labelStyle: TextStyle(color: white),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: white),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: white),
                      ),
                    ),
                    cursorColor: white,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a word';
                      }
                      return null;
                    },
                  ),
                ),
                IconButton(
                  onPressed: () {
                    wordController.clear();
                  },
                  icon: const Icon(Icons.highlight_remove, color: white),
                ),
              ],
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    speak1(meaningController.text);
                  },
                  icon: const Icon(Icons.volume_up, color: white),
                ),
                SizedBox(
                  height: 100,
                  width: 200,
                  child: TextFormField(
                    controller: meaningController,
                    decoration: const InputDecoration(
                      labelText: 'Meaning',
                      labelStyle: TextStyle(color: white),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: white),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: white),
                      ),
                    ),
                    cursorColor: white,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a meaning';
                      }
                      return null;
                    },
                  ),
                ),
                IconButton(
                  onPressed: () {
                    meaningController.clear();
                  },
                  icon: const Icon(Icons.highlight_remove, color: white),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  height: 50,
                  width: 140,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        mydb.db.rawInsert(
                          "INSERT INTO STUDENTS (word, meaning) VALUES (?, ?);",
                          [wordController.text, meaningController.text],
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text("Word Added Successfully")),
                        );
                        wordController.clear();
                        meaningController.clear();
                      }
                    },
                    child: const Text("Add Word"),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: kBrown,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                SizedBox(
                  height: 50,
                  width: 140,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ViewDetails()),
                      );
                    },
                    child: Text("View Word"),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: kBrown,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20, width: 10),
            Column(
              children: [
                SizedBox(
                  height: 50,
                  width: 160,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      websitelaunch();
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: kBrown,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    icon: Icon(Icons.g_mobiledata),
                    label: Text("Google"),
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }

  void speak(String word) async {
    await flutterTts.speak(word);
  }

  void speak1(String meaning) async {
    await flutterTts.speak(meaning);
  }

  void websitelaunch() async
  {
    const url = 'https://translate.google.co.in/?sl=auto&tl=en&op=translate';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(
        Uri.parse(url),
      );
    } else {
      throw 'Could not launch $url';
    }
  }
}
