import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final Map product;

  DetailPage({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product['title'] ?? 'Product Details'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        color: Colors.grey[100], // Light grey background
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Title
            Text(
              product['title'] ?? 'No title',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 8),
            // Product Price
            Text(
              '${product['price'] ?? 'No price'} USD',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Colors.green[700],
              ),
            ),
            SizedBox(height: 8),
            // Product Rating
            Text(
              'Rating: ${product['rating'] ?? 'No rating'}',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.orange[800],
              ),
            ),
            SizedBox(height: 16),
            // Image Carousel
            Expanded(
              child: product['images'] == null
                  ? Center(
                      child: Image.network(
                        'https://via.placeholder.com/300',
                        fit: BoxFit.cover,
                      ),
                    )
                  : PageView.builder(
                      itemCount: product['images'].length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Image.network(
                            product['images'][index] ??
                                'https://via.placeholder.com/300',
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    ),
            ),
            SizedBox(height: 16),
            // Product Description
            Text(
              product['description'] ?? 'No description',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
