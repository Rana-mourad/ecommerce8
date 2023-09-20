import 'package:ecommerce/Screens/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductDetailPage extends StatelessWidget {
  // Define the route path for this widget
  static final path = '/product/:productName';

  // Define the page builder function for this widget
  static final pageBuilder = (context, state) {
    // Get the product name from the state parameters
    final productName = state.params['productName'] ?? 'Unknown';
    return ProductDetailPage(productName: productName);
  };

  final String productName;

  const ProductDetailPage({Key? key, required this.productName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Fetch product details from an API or a database based on the product name
    // For simplicity, we'll just use a dummy function that returns a Future<Product>
    Future<Product> fetchProductDetails(String productName) async {
      // Replace this with your actual API or database call
      await Future.delayed(Duration(seconds: 2));
      return Product(
        name: productName,
        description: 'Some description for $productName',
        price: 100.0,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Product Detail'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: FutureBuilder<Product>(
            future: fetchProductDetails(productName),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                // Display the product details if the data is available
                final product = snapshot.data!;
                return ListView(
                  children: [
                    Text(
                      'Product Name: ${product.name}',
                      style: TextStyle(
                          fontSize: 24.0, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20.0),
                    Text(
                      'Product Description: ${product.description}',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.normal),
                    ),
                    const SizedBox(height: 20.0),
                    Text(
                      'Product Price: \$${product.price.toStringAsFixed(2)}',
                      style: TextStyle(fontSize: 18.0, color: Colors.green),
                    ),
                    const SizedBox(height: 20.0),
                    ElevatedButton(
                      onPressed: () {
                        // Navigate to the cart page
                        context.go('/cart');
                      },
                      child: const Text('Add to Cart'),
                    ),
                  ],
                );
              } else if (snapshot.hasError) {
                // Display an error message if something went wrong
                return Text('Error: ${snapshot.error}');
              } else {
                // Display a loading indicator while waiting for the data
                return CircularProgressIndicator();
              }
            },
          ),
        ),
      ),
    );
  }
}
