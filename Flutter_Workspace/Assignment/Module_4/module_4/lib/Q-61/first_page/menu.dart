import 'package:flutter/material.dart';
import 'package:module_4/Q-61/first_page/choice.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MenuTab extends StatefulWidget {
  const MenuTab({super.key});

  @override
  State<MenuTab> createState() => _MenuTabState();
}

class _MenuTabState extends State<MenuTab> {
  List<Choice> choice = [
    Choice('https://begrimed-executions.000webhostapp.com/images/g1.jpeg', 'Vegetables And ', '12.50'),
    Choice('https://begrimed-executions.000webhostapp.com/images/g2.jpeg', 'Avocado Salad', '19.28',),
    Choice('https://begrimed-executions.000webhostapp.com/images/g3.jpeg', 'Pancakes', '15.32'),
    Choice('https://begrimed-executions.000webhostapp.com/images/g4.jpeg', 'Appetizer', '12.12',),
    Choice('https://begrimed-executions.000webhostapp.com/images/g5.jpeg', 'Hot dog', '12.12',),
    Choice('https://begrimed-executions.000webhostapp.com/images/g6.jpg', 'Chicken Fajitas', '12.12',),
    Choice('https://begrimed-executions.000webhostapp.com/images/g7.jpeg', 'Burger', '12.12',),
    Choice('https://begrimed-executions.000webhostapp.com/images/g8.jpeg', 'Pizza', '12.12',),
    Choice('https://begrimed-executions.000webhostapp.com/images/g9.jpeg', 'Cold Coffee', '12.12',),
    Choice('https://begrimed-executions.000webhostapp.com/images/g10.jpg', 'Mocktail', '12.12',),
  ];



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Menu",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          elevation: 0,
      
          bottom: TabBar(
            isScrollable: true,
            unselectedLabelColor: Colors.black,
            labelColor: Colors.black,
            indicatorSize: TabBarIndicatorSize.label,
            indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(25), color: Colors.orange),
            tabs: [
              Tab(
                child: Container(
                  height: 50,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(color: Colors.orange, width: 1)),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text("Recommed"),
                  ),
                ),
              ),
              Tab(
                child: Container(
                  height: 50,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(color: Colors.orange, width: 1)),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text("Popular"),
                  ),
                ),
              ),
              Tab(
                child: Container(
                  height: 50,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(color: Colors.orange, width: 1)),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text("Noodeles"),
                  ),
                ),
              ),
              Tab(
                child: Container(
                  height: 50,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(color: Colors.orange, width: 1)),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text("Pizza"),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.only(top: 20, bottom: 10),
            child: Column(
              children: [
                Expanded(
                    child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 10.0,
                        ),
                        itemCount: choice.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                              onTap: () {},
                              child: Card(
                                elevation: 5.0,
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.network(choice[index].image,
                                          height:90),
                                      Text(
                                        choice[index].name,
                                        style: TextStyle(fontSize: 15.0),
                                      ),
                                      SizedBox(height: 5.0),
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              '\$${choice[index].price.toString()}',
                                              style: TextStyle(
                                                fontSize: 12.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(width: 25),
                                            IconButton(onPressed: ()async
                                            {
                                              await addToCart(choice[index]);
                                              }, icon: Icon(Icons.add))
                                          ])
                                    ]),
                              ));
                        }))
              ],
            ),
          ),
        ),
        backgroundColor: Colors.white,
      ),
    )
    );
  }
  Future<void> addToCart(Choice item) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();// For Storages

    List<String> cartItems = prefs.getStringList('cartItems') ?? [];

    cartItems.add('${item.name} - ${item.price}');

    await prefs.setStringList('cartItems', cartItems);

    ScaffoldMessenger.of(context).showSnackBar
      (
      SnackBar(content: Text('Added items to cart')),
    );
  }
}
