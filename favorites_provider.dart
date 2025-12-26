import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:gearup/src/data/models/product_model.dart';
import 'package:gearup/src/data/services/favorites_service.dart';

class FavoritesProvider with ChangeNotifier {
  final FavoritesService _favoritesService = FavoritesService();

  final Set<String> _favoriteProductIds = {};

  FavoritesProvider() {
    _listenToFavorites();
  }

  Set<String> get favoriteProductIds => _favoriteProductIds;

  Stream<QuerySnapshot> favoritesStream() {
    return _favoritesService.favoritesStream();
  }

  void _listenToFavorites() {
    _favoritesService.favoritesStream().listen((snapshot) {
      _favoriteProductIds.clear();
      for (var doc in snapshot.docs) {
        _favoriteProductIds.add(doc.id);
      }
      notifyListeners();
    });
  }

  bool isFavorite(String productId) {
    return _favoriteProductIds.contains(productId);
  }

  Future<void> toggleFavorite(Product product) async {
    final productId = product.id.toString();

    final productData = {
      'id': product.id,
      'title': product.title,
      'price': product.price,
      'image': product.image,
    };

    if (isFavorite(productId)) {
      await _favoritesService.removeFavorite(productId);
    } else {
      await _favoritesService.addFavorite(productData);
    }
  }
}
