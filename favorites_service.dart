import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FavoritesService {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  String? get _uid => _auth.currentUser?.uid;

  CollectionReference? get _favoritesRef {
    if (_uid == null) return null;
    return _firestore.collection('users').doc(_uid).collection('favorites');
  }

  /// Get a stream of all favorite items
  Stream<QuerySnapshot> favoritesStream() {
    if (_favoritesRef == null) return Stream.empty();
    return _favoritesRef!.snapshots();
  }

  /// Add a product to favorites
  Future<void> addFavorite(Map<String, dynamic> productData) async {
    if (_favoritesRef == null) return;
    await _favoritesRef!.doc(productData['id'].toString()).set(productData);
  }

  /// Remove a product from favorites
  Future<void> removeFavorite(String productId) async {
    if (_favoritesRef == null) return;
    await _favoritesRef!.doc(productId).delete();
  }
}
