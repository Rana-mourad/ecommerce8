import 'package:flutter/material.dart';
import "package:go_router/go_router.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GoRouter router() {
      return GoRouter(
        initialLocation: '/landing',
        routes: [
          GoRoute(
            path: '/landing',
            builder: (context, state) => const MyLanding(),
          ),
          GoRoute(
            path: '/Login',
            builder: (context, state) => const MyLogin(),
            routes: [
              GoRoute(
                path: '/Signup',
                builder: (context, state) => const MySignup(),
                routes: [
                  GoRoute(
                    path: '/HomePage',
                    builder: (context, state) => const MyHomePage(),
                    routes: [
                      GoRoute(
                        path: '/product_detail_page',
                        builder: (context, state) => const ProductDetailPage(
                            productName: 'Some product'),
                        routes: [
                          GoRoute(
                            path: 'cart',
                            builder: (context, state) => const MyCart(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      );
    }

    return MaterialApp.router(
      title: 'Provider Demo',
      theme: ThemeData.light(),
    );
  }
}

class MyLanding extends StatelessWidget {
  const MyLanding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(child: Text('Landing Page'));
  }
}

class MyLogin extends StatelessWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(child: Text('Login Page'));
  }
}

class MySignup extends StatelessWidget {
  const MySignup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(child: Text('Signup Page'));
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(child: Text('Home Page'));
  }
}

class MyCart extends StatelessWidget {
  const MyCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(child: Text('Cart Page'));
  }
}

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({Key? key, required this.productName})
      : super(key: key);

  final String productName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Detail: $productName'),
      ),
      body: Center(
        child: Text('Product Detail for $productName'),
      ),
    );
  }
}
