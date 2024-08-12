import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartTab extends StatefulWidget {
  @override
  CartState createState() => CartState();
}

class CartState extends State<CartTab> {

  List<String> cartItems = [];
  double totalAmount = 0.0;

  @override
  void initState() {
    super.initState();
    loadCartItems();
  }

  Future<void> loadCartItems() async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(()
    {
      cartItems = prefs.getStringList('cartItems') ?? [];
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cart",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(cartItems[index]),
                  );
                },
              ),
            ),
                  ElevatedButton(
                    onPressed: () {
                      clearCart();
                    },
                    child: Text("Checkout"),
                  ),
                ],
              ),
    )
    );
  }

  Future<void> clearCart() async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('cartItems');
    setState(() {
      cartItems = [];
    });
  }


}
