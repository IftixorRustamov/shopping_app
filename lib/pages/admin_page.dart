import 'package:shopping_app/models/cart_models.dart';
import 'package:shopping_app/models/product_models.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  final TextEditingController _productName = TextEditingController();
  final TextEditingController _productPrice = TextEditingController();
  final TextEditingController _productImage = TextEditingController();

  bool isVisible = false;

  void addCard(BuildContext context,
      {required String title, required String imgUrl, required String price}) {
    if (title.isNotEmpty && imgUrl.isNotEmpty && price.isNotEmpty) {
      Product newProduct = Product(
          name: title,
          price: price,
          imagePath: imgUrl,
          category: selectedCategory);
      Cart.productSale.insert(0, newProduct);
      context.push('/');
    } else {
      setState(() {
        isVisible = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[700],
        centerTitle: true,
        title: const Text(
          'Admin page',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w600, fontSize: 30),
        ),
      ),
      body: Container(
        color: Colors.grey[700],
        child: Padding(
          padding: const EdgeInsets.only(top: 80, left: 35, right: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Visibility(
                visible: isVisible,
                child: const Text(
                  'The title or detail is empty!',
                  style: TextStyle(color: Colors.red, fontSize: 15),
                ),
              ),
              const SizedBox(height: 30.0),
              TextField(
                cursorColor: Colors.white,
                controller: _productName,
                onSubmitted: (enteredValue) {},
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  labelText: 'name',
                  labelStyle: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(height: 20.0),
              TextField(
                controller: _productPrice,
                onSubmitted: (enteredValue) {},
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  labelText: 'price',
                  labelStyle: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(height: 20.0),
              TextField(
                controller: _productImage,
                onSubmitted: (enteredValue) {},
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  labelText: 'image link',
                  labelStyle: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(height: 20.0),
              DropdownButton<String>(
                style: const TextStyle(
                    color: Colors.blue, fontWeight: FontWeight.w900),
                dropdownColor: Colors.grey[300],
                borderRadius: BorderRadius.circular(12),
                focusColor: Colors.blue,
                elevation: 15,
                iconSize: 25,
                icon: const Icon(
                  Icons.filter_list,
                  color: Colors.blue,
                ),
                underline: Container(
                  height: 3,
                  color: Colors.white70,
                ),
                value: selectedCategory,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedCategory = newValue!;
                  });
                },
                items: [
                  'All',
                  'adidas',
                  'puma',
                  'nike'
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  height: 55,
                  textColor: Colors.white,
                  color: Colors.blue,
                  minWidth: 300.0,
                  onPressed: () {
                    addCard(context,
                        title: _productName.text,
                        imgUrl: _productImage.text,
                        price: _productPrice.text);
                  },
                  child: const Text(
                    'Submit',
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 180),
              FloatingActionButton(
                onPressed: () => context.go('/home'),
                child: const Icon(
                  Icons.home,
                  color: Colors.blue,
                  size: 35,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
