import 'package:flutter/material.dart';

class GroceryPage extends StatelessWidget {
  final List<String> categories = ['Vegetables', 'Fruits', 'Oils & More', 'Dairy', 'Fashion'];
  final List<String> imagePaths = [
    'images/vegetable.jpg',
    'images/fruites.jpg',
    'images/oil&masalas.jpg',
    'images/dairy.jpg',
    'images/fashion.jpg',
  ];

  final List<Map<String, dynamic>> products = [
    {
      'name': 'Brinjal - Bottle Shape',
      'subtitle' : 'Fresho Brinjal - Bottle Shape',
      'image':"images/b1.jpg",
      'originalPrice': 100,
      'discountedPrice': 90,
      'quantity': '1 Kilogram'
    },
    {
      'name': 'Potato',
      'subtitle': 'Organically Grown',
      'image':"images/p1.jpg",
      'originalPrice': 25,
      'discountedPrice': 22.5,
      'quantity': '1 Kilogram'
    },
    {
      'name': 'Carrot',
      'subtitle': 'Fresh Vegetable',
      'image':"images/c1.jpg",
      'originalPrice': 100,
      'discountedPrice': 90,
      'quantity': '1 Kilogram'
    },
    {
      'name': 'Onion',
      'subtitle': 'Vegatable',
      'image':"images/o1.jpg",
      'originalPrice': 50,
      'discountedPrice': 45,
      'quantity': '1 Kilogram'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Icon(Icons.shopping_cart,size: 30,color: Colors.white,)
        ],
        backgroundColor: Colors.purple,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: _buildCategoryBar(),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return _buildProductCard(context, product);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryBar() {
    return Container(
      height: 100,
      child: ListView.builder(
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.purple[100],
                  child: ClipOval(
                    child: Image.asset(
                      imagePaths[index],
                      fit: BoxFit.cover,
                      width: 60,
                      height: 60,
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  categories[index],
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildProductCard(BuildContext context, Map<String, dynamic> product) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.asset(
              product['image'],
              height: 80,
              width: 80,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product['name'],
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    product['subtitle'],
                    style: TextStyle(fontSize: 12),
                  ),
                  DropdownButton<String>(
                    value: product['quantity'],
                    onChanged: (newValue) {},
                    items: <String>['1 Kilogram', '2 Kilogram', '3 Kilogram']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  Row(
                    children: [
                      Text(
                        '₹${product['discountedPrice']}',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 5),
                      Text(
                        '₹${product['originalPrice']}',
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
              },
              child: Text('ADD',style: TextStyle(color: Colors.white),),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
            ),
          ],
        ),
      ),
    );
  }
}
