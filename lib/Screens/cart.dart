import 'package:ecommerce/Screens/HomePage.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: const Center(
        child: Text('Your Cart is Empty'),
      ),
    );
  }
}

void main() {
  final goRouter = GoRouter(
    navigatorKey: GlobalKey<NavigatorState>(),
    initialLocation: '/home',
    navigatorBuilder:
        (BuildContext context, GoRouterState state, Function navigator) {},
    initialRoutes: [
      MaterialPage(child: HomePage(), name: '/home'),
      MaterialPage(child: CartPage(), name: '/cart'), // Add the CartPage route
      // Add more routes for other pages as needed
    ],
    routes: [],
  );

  runApp(
    MaterialApp.router(
      routerDelegate: goRouter.routerDelegate,
      routeInformationParser: goRouter.routeInformationParser,
    ),
  );
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
