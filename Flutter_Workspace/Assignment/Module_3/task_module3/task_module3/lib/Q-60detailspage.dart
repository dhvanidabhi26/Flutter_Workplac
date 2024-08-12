import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:task_module3/Q-54.dart';

class detailspage extends StatefulWidget {
  String image;
  String name;

  detailspage({required this.image, required this.name});

  @override
  State<detailspage> createState() => _detailspageState();
}

class _detailspageState extends State<detailspage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            Icon(
              Icons.favorite,
              color: Colors.white,
            )
          ],
          backgroundColor: Colors.orangeAccent,
        ),
        backgroundColor: Colors.orangeAccent,
        body: Stack(
            children: [
          Container(
              height: MediaQuery.of(context).size.height - 82.0,
              width: MediaQuery.of(context).size.width,
              color: Colors.transparent),
          Positioned(
              top: 75.0,
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(45.0),
                        topRight: Radius.circular(45.0),
                      ),
                      color: Colors.white),
                  height: MediaQuery.of(context).size.height - 100.0,
                  width: MediaQuery.of(context).size.width)),
          Positioned(
              top: 30.0,
              left: (MediaQuery.of(context).size.width / 2) - 100.0,
              child: Hero(
                  tag: widget.image,
                  child: ClipOval(
                    child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(widget.image),
                                fit: BoxFit.cover)),
                        height: 200.0,
                        width: 200.0),
                  ))),
          Positioned(
            top: 260,
            left: 20.0,
            right: 20.0,
            child: Column(
              children: [
                Text(widget.name,style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Icon(
                      Icons.watch_later,
                      color: Colors.blue,
                    ),
                    Text(" 50 min"),
                    SizedBox(
                      width: 20,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                    Text(" 4.8"),
                    SizedBox(width: 20),
                    Icon(
                      Icons.local_fire_department_rounded,
                      color: Colors.red,
                    ),
                    Text(" 325 Kcal")
                  ],
                ),
              ],
            ),
          ),


          Positioned(
            top: 320,
            child: Padding(
              padding: const EdgeInsets.only(left: 110),
              child: Container(
                  height: 35,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child:
                      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "\$12",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                        child: Container(
                      height: 35,
                      decoration: BoxDecoration(
                          color: Colors.orangeAccent,
                          borderRadius: BorderRadius.circular(30)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(Icons.remove_sharp),
                          Container(
                            height: 24,
                            width: 24,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30)),
                            child: Text("1"),
                          ),
                          Icon(Icons.add),
                        ],
                      ),
                    )),
                  ])),
            ),
          ),
          Container(
              padding: const EdgeInsets.only(top: 375, left: 10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Ingradienta",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ])),
          Container(
            padding: EdgeInsets.only(bottom: 200, left: 10, right: 10),
            margin: EdgeInsets.only(top: 400, left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Column(
                    children: [
                      Image.asset(
                        "images/noodles1.jpeg",
                        height: 50,
                        width: 50,
                      ),
                      Text("Noodle")
                    ],
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Column(
                    children: [
                      Image.asset(
                        "images/shrimp.jpeg",
                        height: 50,
                        width: 50,
                      ),
                      Text("Shrimp")
                    ],
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Column(
                    children: [
                      Image.asset(
                        "images/egg.jpeg",
                        height: 50,
                        width: 50,
                      ),
                      Text("Egg")
                    ],
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Column(
                    children: [
                      Image.asset(
                        "images/scallion.jpeg",
                        height: 50,
                        width: 50,
                      ),
                      Text("Scallion")
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
              margin: EdgeInsets.only(top: 490, left: 10),
              child: Column(
                children: [
                  Text(
                    "About",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                ],
              )),
          Container(
              margin: EdgeInsets.only(top: 520, left: 10),
              child: Column(
                children: [
                  Text(
                      "A vibrant Thai sausage made with ground chicken, plus its spicy chile dip, from Chef Parnass Savang of Atlanta's Talat Market"),
                ],
              )),
          Padding(
            padding: const EdgeInsets.only(left: 250),
            child: Expanded(
              child: Container(
                  height: 35,
                  width: 70,
                  decoration: BoxDecoration(
                      color: Colors.orangeAccent,
                      borderRadius: BorderRadius.circular(30)),
                  margin: EdgeInsets.only(top: 580, left: 10),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(Icons.shopping_bag),
                        Container(
                          height: 24,
                          width: 24,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30)),
                          child: Text("1"),
                        ),
                      ])),
            ),
          )
        ]));
  }
}
