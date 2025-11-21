import 'package:flutter/material.dart';
import '../models/product_model.dart';
import '../widgets/product_card.dart';

class CartGridPage extends StatelessWidget {
  CartGridPage({super.key});

  final dummyProducts = [
    ProductModel(
      id: "1",
      name: "Produk 1",
      price: 10000,
      image: "https://via.placeholder.com/150",
    ),
    ProductModel(
      id: "2",
      name: "Produk 2",
      price: 20000,
      image: "https://via.placeholder.com/150",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(10),
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: dummyProducts.length,
      itemBuilder: (context, index) {
        return ProductCard(product: dummyProducts[index]);
      },
    );
  }
}
