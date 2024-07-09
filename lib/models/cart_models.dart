import 'package:shopping_app/models/product_models.dart';
String selectedCategory = 'All';  // category
String searchText = '';   // search bar

class Cart {
  static List<Product> productSale = [
    Product(
        name: 'nike',
        price: '999',
        imagePath: 'https://cdn-images.farfetch-contents.com/17/94/30/79/17943079_38221824_1000.jpg',
        category: 'nike'),
    Product(
        name: 'puma',
        price: '100',
        imagePath: 'https://cdn-images.farfetch-contents.com/17/94/30/79/17943079_38221824_1000.jpg',
        category: 'puma'),
    Product(
        name: 'adidas',
        price: '509',
        imagePath: 'https://cdn-images.farfetch-contents.com/17/94/30/79/17943079_38221824_1000.jpg',
        category: 'adidas'),
  ];
  

}
