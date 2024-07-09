import 'package:shopping_app/pages/admin_page.dart';
import 'package:shopping_app/pages/home_page.dart';
import 'package:shopping_app/pages/login_page.dart';
import 'package:shopping_app/pages/shop_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return 
       MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: _router,
    );
  }
}

final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/home',
      builder: (context, state) => HomePage(
      ),
    ),
    GoRoute(
      path: '/',
      builder: (context, state) => HomePage(
      ),
    ),
    GoRoute(
      path: '/shop',
      builder: (context, state) => const ShopPage(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: '/admin',
      builder: (context, state) =>  const AdminPage(),
    ),
  ],
);
