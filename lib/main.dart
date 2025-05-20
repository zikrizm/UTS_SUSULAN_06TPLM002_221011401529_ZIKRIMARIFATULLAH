import 'package:flutter/material.dart';
import 'models/shoe_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<Shoe> shoes = [
    Shoe(
      name: "Nike SB Zoom Blazer Mid Premium",
      description: "",
      price: "₹8,795",
      imageUrl: "https://www.freepnglogos.com/uploads/shoes-png/shoes-wasatch-running-3.png",
      backgroundColor: Colors.purple.shade100,
    ),
    Shoe(
      name: "Nike Air Zoom Pegasus",
      description: "Men's Road Running Shoes",
      price: "₹9,995",
      imageUrl: "https://www.freepnglogos.com/uploads/shoes-png/shoes-wasatch-running-3.png",
      backgroundColor: Colors.teal.shade100,
    ),
    Shoe(
      name: "Nike ZoomX Vaporfly",
      description: "Men's Road Racing Shoe",
      price: "₹10,695",
      imageUrl: "https://www.freepnglogos.com/uploads/shoes-png/shoes-wasatch-running-3.png",
      backgroundColor: Colors.pink.shade100,
    ),
    Shoe(
      name: "Nike Air Force 1 S50",
      description: "Older Kids' Shoe\n1 Colour",
      price: "₹6,295",
      imageUrl: "https://www.freepnglogos.com/uploads/shoes-png/shoes-wasatch-running-3.png",
      backgroundColor: Colors.grey.shade200,
    ),
    Shoe(
      name: "Nike Waffle One",
      description: "Men's Shoes",
      price: "₹8,295",
      imageUrl: "https://www.freepnglogos.com/uploads/shoes-png/shoes-wasatch-running-3.png",
      backgroundColor: Colors.yellow.shade200,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shoes',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Shoes'),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 16),
              child: CircleAvatar(
                backgroundImage: NetworkImage("https://i.pravatar.cc/300"),
              ),
            ),
          ],
        ),
        body: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: shoes.length,
          itemBuilder: (context, index) {
            final shoe = shoes[index];
            return Container(
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: shoe.backgroundColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          shoe.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        if (shoe.description.isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            child: Text(
                              shoe.description,
                              style: TextStyle(color: Colors.grey.shade800),
                            ),
                          ),
                        Text(
                          shoe.price,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      shoe.imageUrl,
                      width: 100,
                      height: 100,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
