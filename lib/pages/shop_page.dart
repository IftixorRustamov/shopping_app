import 'package:shopping_app/models/cart_models.dart';
import 'package:shopping_app/models/product_models.dart';
import 'package:shopping_app/product_tile.dart';
import 'package:flutter/material.dart';

bool ascending = false;
List<Product> searchResults = [];

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  void sortPriced() {
    setState(() {
      searchResults.sort((a, b) {
        int priceA = int.parse(a.price);
        int priceB = int.parse(b.price);
        return ascending ? priceA.compareTo(priceB) : priceB.compareTo(priceA);
      });
      ascending = !ascending;
    });
  }


  @override  
  void initState() {
    super.initState();
    searchResults = Cart.productSale;
  }

  void searchProduct(String searchString) {
    List<Product>? result = [];
    if (searchString.isEmpty) {
      result = Cart.productSale;
    } else {
      result = Cart.productSale
          .where((product) => product.name.toLowerCase().contains(searchString))
          .toList();
    }
    setState(() {
      searchResults = result!;
    });
  }

  void filterProducts(String selectedCategory) {
    setState(() {
      searchResults = (selectedCategory == 'All')
          ? Cart.productSale
          : searchResults = Cart.productSale
              .where((product) => product.category == selectedCategory)
              .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 25.0, right: 25),
          color: Colors.transparent,
          child: Column(
            children: [
              const SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 3,
                    child: TextField(
                        style: const TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey[200],
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(200.0),
                                borderSide: BorderSide.none),
                            hintText: 'search',
                            prefixIcon: const Icon(Icons.search),
                            prefixIconColor: Colors.black),
                        onChanged: (enteredValue) {
                          searchProduct(enteredValue);
                        }),
                  ),
                ],
              )
            ],
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.sort,
                  color: Colors.blue,
                  size: 30,
                ),
                onPressed: () => sortPriced(),
              ),
              DropdownButton<String>(
                style: const TextStyle(
                    color: Colors.blue, fontWeight: FontWeight.w900),
                dropdownColor: Colors.grey[300],
                borderRadius: BorderRadius.circular(12),
                focusColor: Colors.blue,
                autofocus: true,
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
                    filterProducts(selectedCategory);
                  });
                },
                items: [
                  'All',
                  'nike',
                  'adidas',
                  'puma'
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12.0),
        Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12.0,
                childAspectRatio: 0.7),
            scrollDirection: Axis.vertical,
            itemCount: searchResults.length,
            itemBuilder: ((context, index) {
              return ProductTile(searchResults[index]);
            }),
          ),
        ),
      ],
    );
  }
}
