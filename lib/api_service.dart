// api_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'product_model.dart';

class ApiService {
  static const String url = "https://dummyjson.com/products";

  static Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final List products = json.decode(response.body)['products'];
      return products.map((product) => Product.fromJson(product)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
