import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/product_model.dart';

class CartState {
  final List<ProductModel> items;

  CartState(this.items);

  int get totalItems => items.length;

  int get totalPrice {
    int total = 0;
    for (var item in items) {
      total += item.price;
    }
    return total;
  }
}

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartState([]));

  void addToCart(ProductModel product) {
    final updated = List<ProductModel>.from(state.items)..add(product);
    emit(CartState(updated));
  }

  void removeFromCart(ProductModel product) {
    final updated = List<ProductModel>.from(state.items)..remove(product);
    emit(CartState(updated));
  }

  void clearCart() {
    emit(CartState([]));
  }
}
