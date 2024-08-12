import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class informationpage extends StatefulWidget {
  const informationpage({super.key});

  @override
  State<informationpage> createState() => _informationpageState();
}

class _informationpageState extends State<informationpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column (
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 35),
                child: Container(
                  width: 400,
                  height: 250,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("images/picnic 2.jpeg",),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
           SizedBox(height: 20,),
              Container(
                child:Padding(
                  padding: const EdgeInsets.only(left: 14),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:   
                    [
                      Column
                        (
                        crossAxisAlignment: CrossAxisAlignment.start, //For the space manage
                        children:
                          [
                             Text("Oeschinen Lake Campground",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                             Text("Kandersteg, Switzerland",style: TextStyle(color: Colors.grey),)
                          ],
                        ),
                      Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: Row(
                          children:
                          [
                            Icon(Icons.star,color: Colors.deepOrange,),
                            Text("41",style: TextStyle(fontSize: 13),)
                          ],
                        ),
                      ),
                    ],
                  ),
                ) ,
              ),
              SizedBox(height: 35),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Icon(Icons.call,color: Colors.blue,),
                          Text("CALL",style: TextStyle(color: Colors.blue),),
                        ],
                      ),
                      Column(
                        children: [
                          Icon(Icons.send_rounded,color: Colors.blue,),
                          Text("ROUTE",style: TextStyle(color: Colors.blue),),
                        ],
                      ),
                      Column(
                        children: [
                          Icon(Icons.share,color: Colors.blue,),
                          Text("SHARE",style: TextStyle(color: Colors.blue),),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Text("Lake Oeschinen lies at the foot of the Bluemlisalp in the "
                    "Bernese Alps.Situated 1,578 meters above sea level, it is one "
                    "of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a "
                    "half-hour walk through pastures and pine forest, leads you to "
                    "the lake, which warms to 20 degress Celsius in the summer.Activities "
                    "enjoyed here include rowing, and riding the summer toboggan run."),
              )
            ],
          ),
        ),
      ),
    );
  }
}
