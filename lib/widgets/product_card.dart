import 'package:flutter/material.dart';
import '../models/product_model.dart';
import '../blocs/cart_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Column(
        children: [
          Expanded(
            child: Image.network(product.image, fit: BoxFit.cover),
          ),
          Text(product.name, style: TextStyle(fontWeight: FontWeight.bold)),
          Text("Rp ${product.price}"),
          ElevatedButton(
            onPressed: () {
              context.read<CartCubit>().addToCart(product);
            },
            child: Text("Tambah"),
          )
        ],
      ),
    );
  }
}
