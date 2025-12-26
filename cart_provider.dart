import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gearup/src/data/services/cart_service.dart';

class CartProvider with ChangeNotifier {
  final CartService _cartService = CartService();

  Stream<QuerySnapshot> cartStream() {
    return _cartService.cartStream();
  }

  Future<void> addToCart({
    required String productId,
    required String name,
    required double price,
    required String image,
    required String brand,
  }) async {
    await _cartService.addToCart(
      productId: productId,
      name: name,
      price: price,
      image: image,
      brand: brand,
    );
  }

  Future<void> removeItem(String productId) async {
    await _cartService.removeItem(productId);
  }

  Future<void> decreaseQuantity(String productId) async {
    await _cartService.decreaseQuantity(productId);
  }

  Future<void> clearCart() async {
    await _cartService.clearCart();
  }
}
