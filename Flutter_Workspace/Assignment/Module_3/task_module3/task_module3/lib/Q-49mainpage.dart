
import 'package:flutter/material.dart';

class MultiSizeBoxPage extends StatelessWidget {
  const MultiSizeBoxPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(  //you need to wrap it around the widget that you want to ensure is within the safe area.
        top: true,
        bottom: true,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 220,
                color: Colors.red,
              ),
              SizedBox(height: 10,),
              Container(
                width: double.infinity,
                child: GridView.count(
                  // childAspectRatio: 1,
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: List.generate(4, (index){
                    return Container(
                      color: Colors.blue,
                    );
                  }),
                ),
              ),
              SizedBox(height: 10,),
              Container(
                width: double.infinity,
                height: 350,
                child: GridView.builder(
                    itemCount: 9,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,  // Number of columns
                      mainAxisSpacing: 5,  // Spacing between rows
                      crossAxisSpacing: 5,  // Spacing between columns

                      childAspectRatio: 1.0, // Ratio of width to height for each child

                    ),

                    itemBuilder: (ctx,index){
                      return Container(
                        width: 50,
                        height: 50,
                        color: Colors.yellow,
                      );
                    }
                ),
              ),
              SizedBox(height: 10,),
            ],

          ),
        ),
      ),
    );
  }
}
