import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'detail_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List products = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    try {
      final response = await http.get(Uri.parse('https://dummyjson.com/products'));
      if (response.statusCode == 200) {
        setState(() {
          products = json.decode(response.body)['products'];
          isLoading = false;
        });
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      // Handle the error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to load products')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blueAccent,
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: fetchProducts,
              child: ListView.builder(
                padding: EdgeInsets.all(8.0),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return Card(
                    elevation: 5,
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.all(10.0),
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          product['thumbnail'] ?? 'https://via.placeholder.com/150',
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(
                        product['title'] ?? 'No title',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        '${product['price'] ?? 'No price'} USD',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                      trailing: Text(
                        product['brand'] ?? 'No brand',
                        style: TextStyle(color: Colors.blueGrey),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailPage(product: product),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
    );
  }
}

