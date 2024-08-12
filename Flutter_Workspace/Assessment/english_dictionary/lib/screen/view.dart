import 'package:english_dictionary/Database/Dbhelper.dart';
import 'package:english_dictionary/screen/dictionary_page.dart';
import 'package:english_dictionary/widgets/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'edit.dart';

class ViewDetails extends StatefulWidget {
  @override
  ViewDetailsState createState() => ViewDetailsState();
}

class ViewDetailsState extends State<ViewDetails> {
  TextEditingController searchController = TextEditingController();
  List<Map> slist = [];
  MyDb mydb = new MyDb();
  List<Map> _filteredSearches = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mydb.open();
    getdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: const Text("Your Word", style: TextStyle(color: Colors.white)),
        backgroundColor: kBrown,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: kLightBrown,
        child: Column(
          children: [
            // Row(
            //   children: [
            //     Expanded(
            //       child: Padding(
            //         padding: const EdgeInsets.symmetric(
            //             horizontal: 20, vertical: 10),
            //         child: DropdownSearch<int>(
            //           items: List.generate(50, (i) => i),
            //           popupProps: const PopupProps.menu(
            //             showSearchBox: true,
            //             title: Text('default fit'),
            //           ),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextField(
                controller: searchController,
                onChanged: filterTasks,
                cursorColor: kBrown,
                style: TextStyle(color: kBrown, fontWeight: FontWeight.w500),
                decoration: InputDecoration(
                  labelText: " Search by Word ",
                  labelStyle: TextStyle(
                    color: kBrown,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: kBrown, width: 2),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: kBrown, width: 2),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: kBrown,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            if (_filteredSearches.isNotEmpty)
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: _filteredSearches.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(_filteredSearches[index]['word']),
                      onTap: () {
                        setState(() {
                          searchController.text =
                          _filteredSearches[index]['word'];
                          _filteredSearches = [];
                        });
                      },
                    );
                  },
                ),
              ),
            if (_filteredSearches.isEmpty)
              Expanded(
                child: slist.length == 0
                    ? const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "No any word to show.",
                      style: TextStyle(color: kBrown),
                    ),
                  ],
                )
                    : SingleChildScrollView(
                  child: Column(
                      children: slist.map((stuone) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 5),
                          child: Card(
                            color: kBrown,
                            child: ListTile(
                              leading: const Icon(
                                Icons.library_books_rounded,
                                color: Colors.white,
                              ),
                              title: Text(
                                stuone["word"],
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: Row(
                                children: [
                                  const Text(
                                    "meaning: ",
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.white),
                                  ),
                                  Text(
                                    stuone["meaning"],
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                              trailing: Wrap(
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(builder:
                                                (BuildContext context) {
                                              return EditStudents(
                                                  word: stuone["word"]);
                                            }));
                                      },
                                      icon: Icon(Icons.edit,
                                          color: Colors.white)),
                                  IconButton(
                                      onPressed: () {
                                        mydb.db.rawDelete(
                                            "DELETE FROM students where word = ? ",
                                            [stuone["word"]]);
                                        print("Data Deleted");
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                            content:
                                            Text("Word Deleted")));
                                        getdata();
                                      },
                                      icon: Icon(Icons.delete,
                                          color: Colors.white)),
                                ],
                              ),
                            ),
                          ),
                        );
                      }).toList()),
                ),
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kBrown,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomeScreen()));
        },
        child: const Icon(
          Icons.add,
          color: kLightGrey,
        ),
      ),
    );
  }

  void getdata() {
    Future.delayed(Duration(milliseconds: 500), () async {
      slist = await mydb.db.rawQuery('SELECT * FROM students');
      setState(() {});
    });
  }

  void filterTasks(String query) {
    if (query.isEmpty) {
      setState(() {
        _filteredSearches = [];
      });
      getdata(); // If the search query is empty, show all tasks
    } else {
      List<Map> filteredList = slist!
          .where((task) =>
      task["word"]!.toLowerCase().contains(query.toLowerCase()) ||
          task["meaning"]!.toLowerCase().contains(query.toLowerCase()))
          .toList();
      setState(() {
        slist = filteredList;
      });
      setState(() {
        _filteredSearches = slist
            .where((item) =>
            item['word'].toLowerCase().contains(query.toLowerCase()))
            .toList();
      });
    }
  }
}
