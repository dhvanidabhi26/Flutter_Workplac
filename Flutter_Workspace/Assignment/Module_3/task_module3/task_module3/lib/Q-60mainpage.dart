// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:task_module3/model.dart';
//
// class restaurant extends StatefulWidget {
//   const restaurant({super.key});
//
//   @override
//   State<restaurant> createState() => _restaurantState();
// }
//
// class _restaurantState extends State<restaurant> {
//   List<String> items = ["Recommend", "Popular", "Noodles", "Pizza"];// By default our first item will be selected
//   int selectedIndex = 0;
//
//   final List<Model> items2 =
//   [
//
//     Model(images: "images/soba soup.jpeg", title: "Soba Soup", subtitle: "No1.in sales", price: ""),
//     Model(images: "images/sei ua samun phrai.jpeg", title: "Sei Ua Samun Phrai", subtitle: "No1. in sales", price: ""),
//     Model(images: "images/ratatoullie pasta.jpeg", title: "Ratatoullie Pasta", subtitle: "No1. in sales", price: ""),
//
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Icon(
//           Icons.arrow_back,
//         ),
//         actions: [Icon(Icons.search)],
//       ),
//       body: Center(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               "Restaurant",
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//             Row(
//               children: [
//                 Card(
//                   child: Text(
//                     " 20-30 min ",
//                     style: TextStyle(color: Colors.white),
//                   ),
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(5)),
//                   color: Colors.grey,
//                 ),
//                 Text(
//                   "2.4 km  Restaurant",
//                   style: TextStyle(color: Colors.grey),
//                 ),
//                 Column(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(left: 70),
//                       child: Image.asset(
//                         "images/restaurant.jpeg",
//                         height: 50,
//                         width: 50,
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//             Row(
//               children: [
//                 Text("Orange Sandwiches is delicious"),
//                 Padding(
//                     padding: const EdgeInsets.only(left: 70),
//                     child: Image.asset(
//                       "images/star.png",
//                       height: 20,
//                       width: 20,
//                     )),
//                 Text(
//                   " 4.7",
//                   style: TextStyle(fontSize: 16),
//                 )
//               ],
//             ),
//             SizedBox(height: 10,),
//             Container(
//               width: double.infinity,
//               height: 50,
//               child: ListView.builder(
//                   itemCount: items.length,
//                   scrollDirection: Axis.horizontal,
//                   itemBuilder: (context, index) {
//                     return InkWell(
//                         onTap: () {
//                           setState(() {
//                             selectedIndex = index;
//                           });
//                         },
//                         child: Padding(
//                             padding:
//                                 const EdgeInsets.symmetric(horizontal: 8.0),
//                             child: Container(
//                                 decoration: BoxDecoration(
//                                   color: index == selectedIndex ? Colors.orangeAccent : Colors.transparent,
//                                   borderRadius: BorderRadius.circular(20),
//                                 ),
//                                 padding: EdgeInsets.all(8),
//                                 child: Center(
//                                     child: Text(
//                                   items[index],
//                                   style: TextStyle(fontSize: 16,
//                                     color: index == selectedIndex ? Colors.white : Colors.black,
//                                   ),
//                                 )
//                                 )
//                             )
//                         )
//                     );
//                   }),
//             ),
//             SizedBox(height: 10,),
//             ListView.builder(
//                   itemCount: items2.length,
//                   itemBuilder: (BuildContext context,int index)
//                   {
//                    return ListTile
//                      (
//                      leading: Image.asset(items2[index].images,width: 50,height: 50,),
//                    );
//                   }),
//
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:task_module3/model.dart';

import 'Q-60detailspage.dart';

class Restaurant extends StatefulWidget {
  const Restaurant({Key? key}) : super(key: key);

  @override
  State<Restaurant> createState() => _RestaurantState();
}

class _RestaurantState extends State<Restaurant> {
  List<String> items = ["Recommend", "Popular", "Noodles", "Pizza"];
  int selectedIndex = 0;

  List<String> image = [
    "images/soba soup.jpeg",
    "images/sei ua samun phrai.jpeg",
    "images/ratatoullie pasta.jpeg"
  ];
  List<String> name = ["Soba Soup", "Sei ua samun phrai", "Ratatoullie"];
  List<String> subtitle = ["No.1 in sales", "No.1 in sales", "No.1 in sales"];
  List<String> price = ["\$12", "\$15", "\$18"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text("Restaurant"),
        actions: [Icon(Icons.search)],
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Text(
              "Restaurant",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Card(
                  child: Text(
                    " 20-30 min ",
                    style: TextStyle(color: Colors.white),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  color: Colors.grey,
                ),
                Text(
                  "2.4 km  Restaurant",
                  style: TextStyle(color: Colors.grey),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 70),
                      child: Image.asset(
                        "images/restaurant.jpeg",
                        height: 50,
                        width: 50,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Text("Orange Sandwiches is delicious"),
                Padding(
                  padding: const EdgeInsets.only(left: 70),
                  child: Image.asset(
                    "images/star.png",
                    height: 20,
                    width: 20,
                  ),
                ),
                Text(
                  " 4.7",
                  style: TextStyle(fontSize: 16),
                )
              ],
            ),
            SizedBox(height: 10),
            Container(
              width: double.infinity,
              height: 50,
              child: ListView.builder(
                itemCount: items.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: index == selectedIndex
                              ? Colors.orangeAccent
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: EdgeInsets.all(8),
                        child: Center(
                          child: Text(
                            items[index],
                            style: TextStyle(
                              fontSize: 16,
                              color: index == selectedIndex
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 500,
              child: ListView.builder(
                itemCount: name.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      child: ListTile(
                        leading:
                            Image.asset(image[index], width: 75, height: 75),
                        title: Text(name[index]),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [Text(subtitle[index]), Text(price[index])],
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => detailspage(
                                        image: image[index],
                                        name: name[index],
                                      )));
                        },
                        trailing: Icon(Icons.chevron_right),
                      ));
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Icon(
        Icons.shopping_bag,
        size: 50,
        color: Colors.orangeAccent,
      ),
    );
  }
}
