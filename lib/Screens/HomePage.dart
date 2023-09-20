import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// Define a class to represent the product data model
class Product {
  final String name;
  final String description;
  final double price;

  Product({required this.name, required this.description, required this.price});
}

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final List<Product> products = [
    Product(name: 'Product 1', description: 'Description 1', price: 50.0),
    Product(name: 'Product 2', description: 'Description 2', price: 30.0),
    // Add more products as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wicca'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Products',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20.0),
            Expanded(
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.8,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return GestureDetector(
                    onTap: () {
                      // Navigate to the product detail page with the product name as a parameter
                      context
                          .go('/product/${Uri.encodeComponent(product.name)}');
                    },
                    child: Card(
                      elevation: 3.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/product_image.png'), // Replace with your image
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product.name,
                                  style: const TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 4.0),
                                Text(
                                  '\$${product.price.toStringAsFixed(2)}',
                                  style: const TextStyle(
                                      fontSize: 14.0, color: Colors.green),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Navigate to the cart page
                context.go('/cart');
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.yellow, // Change the button color here
              ),
              child: const Text('Shop Now'),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductDetailPage extends StatelessWidget {
  ProductDetailPage({Key? key, required this.productName}) : super(key: key);
  final String productName;
  @override
  Widget build(BuildContext context) {
    // Get the product details from the route parameters
    final Product product =
        ModalRoute.of(context)?.settings.arguments as Product;
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Detail for $productName'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Product Name: ${product.name}'),
            Text('Description: ${product.description}'),
            Text('Price: \$${product.price.toStringAsFixed(2)}'),
          ],
        ),
      ),
    );
  }
}

GoRouter(
    {required GlobalKey<NavigatorState> navigatorKey,
    required String initialLocation,
    required Null Function(
            BuildContext context, GoRouterState state, Function navigator)
        navigatorBuilder,
    required List<MaterialPage> initialRoutes,
    required List routes}) {}

class GoRouterState {}
