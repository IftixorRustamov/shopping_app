import 'package:shopping_app/pages/shop_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

bool isAdmin = false;

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  const HomePage({super.key });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  void isRegistered() {
    if (isAdmin == true) {
      context.push("/admin");
    } else {
      context.push("/login");
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[700],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading:IconButton(
            icon: const Icon(
              Icons.add,
              color: Colors.white,
              size: 45,
            ),
            onPressed: () => isRegistered(),
          ) ,
        centerTitle: true,
        title: const Text(
          'Home',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
        ),
      ),
      body: const ShopPage(),
      // Text('hello $username'),
    );
  }
}
