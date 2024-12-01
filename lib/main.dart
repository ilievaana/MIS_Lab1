import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clothing App',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        fontFamily: 'Roboto',
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<Map<String, dynamic>> clothingItems = [
    {
      'name': 'T-Shirt',
      'image': 'assets/images/t-shirt.jpg',
      'description': 'Material: Premium 100% combed cotton.\n'
          'Available sizes: XS, S, M, L, XL, XXL.\n'
          'Colors: White, Black, Navy Blue, Olive Green.\n'
          'Features: Reinforced stitching, tag-free design.\n'
          'Care instructions: Machine washable at 40°C, tumble dry low.',
      'price': '\$25',
      'color': Colors.amber[100],
    },
    {
      'name': 'Jeans',
      'image': 'assets/images/jeans.jpg',
      'description': 'Material: 98% high-quality denim, 2% elastane.\n'
          'Fit: Slim-fit and regular-fit options.\n'
          'Available sizes: 28, 30, 32, 34, 36, 38.\n'
          'Colors: Classic Blue, Charcoal Black, Light Washed Denim.\n'
          'Features: Five-pocket design, reinforced belt loops, durable zippers.\n'
          'Care instructions: Wash inside out, avoid bleach, air dry.',
      'price': '\$40',
      'color': Colors.lightBlue[100],
    },
    {
      'name': 'Jacket',
      'image': 'assets/images/jacket.jpg',
      'description': 'Material: Windproof polyester with fleece lining.\n'
          'Available sizes: M, L, XL, XXL, XXXL.\n'
          'Colors: Jet Black, Midnight Navy, Steel Gray.\n'
          'Features: Adjustable hood, zippered pockets, ribbed cuffs.\n'
          'Care instructions: Hand wash recommended, do not iron.',
      'price': '\$140',
      'color': Colors.green[100],
    },
    {
      'name': 'Dress',
      'image': 'assets/images/dress.jpg',
      'description': 'Material: 95% premium polyester, 5% spandex.\n'
          'Available sizes: XS, S, M, L, XL.\n'
          'Colors: Ruby Red, Classic Black, Emerald Green, Royal Blue.\n'
          'Features: Flowing design, concealed back zipper, side slit.\n'
          'Care instructions: Dry clean or hand wash.',
      'price': '\$50',
      'color': Colors.pink[100],
    },
    {
      'name': 'Coat',
      'image': 'assets/images/coat.jpg',
      'description': 'Material: 80% wool, 20% synthetic blend.\n'
          'Available sizes: S, M, L, XL, XXL.\n'
          'Colors: Classic Camel, Deep Charcoal, Elegant Black.\n'
          'Features: Double-breasted design, deep inner pockets, belted waist.\n'
          'Care instructions: Dry clean only.',
      'price': '\$150',
      'color': Colors.orange[100],
    },
    {
      'name': 'Cap',
      'image': 'assets/images/cap.jpg',
      'description': 'Material: Lightweight 100% cotton.\n'
          'Available sizes: One size fits all (adjustable).\n'
          'Colors: Red, Blue, Black, Gray.\n'
          'Features: Curved brim, embroidered logo, sweat-wicking inner band.\n'
          'Care instructions: Hand wash only.',
      'price': '\$30',
      'color': Colors.yellow[100],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('212023'),
      ),
      body: ListView.builder(
        itemCount: clothingItems.length,
        itemBuilder: (context, index) {
          final item = clothingItems[index];
          return Card(
            color: item['color'],
            margin: EdgeInsets.all(12),
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: ListTile(
              contentPadding: EdgeInsets.all(16),
              leading: Image.asset(
                item['image'],
                width: 80,
                height: 80,
                fit: BoxFit.contain,
              ),
              title: Text(
                item['name'],
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
              subtitle: Text(
                item['price'],
                style: TextStyle(fontSize: 18, color: Colors.teal[700]),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsPage(item: item),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class DetailsPage extends StatelessWidget {
  final Map<String, dynamic> item;

  DetailsPage({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item['name']),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                item['image'],
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.4,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 16),
            Text(
              item['name'],
              style: TextStyle(
                  fontSize: 26, fontWeight: FontWeight.bold, color: Colors.teal),
            ),
            SizedBox(height: 16),
            Text(
              item['description'],
              style: TextStyle(fontSize: 18, height: 1.5),
            ),
            SizedBox(height: 16),
            Text(
              'Price: ${item['price']}',
              style: TextStyle(fontSize: 22, color: Colors.green[700]),
            ),
          ],
        ),
      ),
    );
  }
}






