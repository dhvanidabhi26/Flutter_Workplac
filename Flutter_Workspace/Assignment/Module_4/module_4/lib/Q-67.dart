
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OptionMenu extends StatefulWidget {
  const OptionMenu({super.key});

  @override
  State<OptionMenu> createState() => _OptionMenuState();
}

class _OptionMenuState extends State<OptionMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Main Page",style: TextStyle(color: Colors.white),),backgroundColor: Colors.blue,
        actions: [
          IconButton(onPressed: ()
          {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Profilepage()
            ));
          }, icon: Icon(Icons.perm_identity,color: Colors.white,)),
          IconButton(onPressed: (){SystemNavigator.pop();}, icon: Icon(Icons.logout,color: Colors.white,))
        ],
      ),
    );
  }
}
class Profilepage extends StatefulWidget {
  const Profilepage({super.key});

  @override
  State<Profilepage> createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Welcome",style: TextStyle(color: Colors.white),),backgroundColor: Colors.blue,
      actions:
      [
        IconButton(onPressed: ()
        {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>OptionMenu()));
        }, icon: Icon(Icons.logout))
      ],),

      body: Center(
        child: Text("Welcome to Profile Page",style: TextStyle(color: Colors.blue,fontSize: 22),),
      ),
    );
  }
}
