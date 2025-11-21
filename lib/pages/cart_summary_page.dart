import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/cart_cubit.dart';

class CartSummaryPage extends StatelessWidget {
  const CartSummaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartCubit>().state;

    return Scaffold(
      appBar: AppBar(title: Text("Keranjang")),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (context, i) {
                final item = cart.items[i];
                return ListTile(
                  title: Text(item.name),
                  subtitle: Text("Rp ${item.price}"),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      context.read<CartCubit>().removeFromCart(item);
                    },
                  ),
                );
              },
            ),
          ),
          Text("Total Item: ${cart.totalItems}"),
          Text("Total Harga: Rp ${cart.totalPrice}"),
          ElevatedButton(
            onPressed: () {
              context.read<CartCubit>().clearCart();
            },
            child: Text("Checkout"),
          ),
        ],
      ),
    );
  }
}
