import 'package:database/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  ProviderHelper providerHelper = ProviderHelper();
  @override
  Widget build(BuildContext context) {
    print("Hello");
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider Example"),
      ),
      body: Center(
        child: Consumer<ProviderHelper>(
          builder: (context, providerHelper, child) {
            print("hi");
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  providerHelper.counter.toString(),
                  style: TextStyle(fontSize: 24),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    providerHelper.increment();
                  },
                  child: Text("Increment"),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
